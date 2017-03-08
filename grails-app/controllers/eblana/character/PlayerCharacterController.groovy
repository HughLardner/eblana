package eblana.character


import static org.springframework.http.HttpStatus.*
import eblana.event.CraftLog
import eblana.event.Downtime
import eblana.event.Event
import eblana.items.Item
import eblana.items.Recipe
import eblana.users.SecUser
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

/**
 * PlayerCharacterController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class PlayerCharacterController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def springSecurityService
	def isAuthService

	@Secured(['ROLE_ADMIN'])
	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond PlayerCharacter.list(params), model:[playerCharacterInstanceCount: PlayerCharacter.count()]
	}
	@Secured(['ROLE_ADMIN'])
	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond PlayerCharacter.list(params), model:[playerCharacterInstanceCount: PlayerCharacter.count()]
	}
	@Secured(['ROLE_ADMIN'])
	def show(PlayerCharacter playerCharacterInstance) {
		respond playerCharacterInstance
	}
	@Secured(['ROLE_ADMIN'])
	def showAll(Integer max){
		respond PlayerCharacter.findAllByAlive(true), model:[playerCharacterInstanceCount: PlayerCharacter.count()]
	}
	@Secured(['ROLE_ADMIN'])
	def create() {
		respond new PlayerCharacter(params)
	}
	@Secured(['ROLE_ADMIN'])
	@Transactional
	def save(PlayerCharacter playerCharacterInstance) {
		params.remove "_recipe"
		bindData playerCharacterInstance, params
		if (playerCharacterInstance == null) {
			notFound()
			return
		}

		if (playerCharacterInstance.hasErrors()) {
			respond playerCharacterInstance.errors, view:'create'
			return
		}

		for(int i = 0; i <playerCharacterInstance.classes.size();i++){
			playerCharacterInstance.classes.set(i, Classes.get(params.get("classes["+i+"]").classes?.id))
		}

		for(int i = 0; i <playerCharacterInstance.lore.size();i++){
			playerCharacterInstance.lore.set(i, Lore.get(params.get("lore["+i+"]").lore?.id))
		}
		playerCharacterInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'playerCharacterInstance.label', default: 'PlayerCharacter'),
					playerCharacterInstance.id
				])
				redirect playerCharacterInstance
			}
			'*' { respond playerCharacterInstance, [status: CREATED] }
		}
	}
	@Secured(['ROLE_ADMIN'])
	def edit(PlayerCharacter playerCharacterInstance) {
		respond playerCharacterInstance
	}
	@Secured(['ROLE_ADMIN'])
	@Transactional
	def update(PlayerCharacter playerCharacterInstance) {
		params.remove "_recipe"
		bindData playerCharacterInstance, params
		if (playerCharacterInstance == null) {
			notFound()
			return
		}

		if (playerCharacterInstance.hasErrors()) {
			respond playerCharacterInstance.errors, view:'edit'
			return
		}

		for(int i = 0; i <playerCharacterInstance.classes.size();i++){
			playerCharacterInstance.classes.set(i, Classes.get(params.get("classes["+i+"]").classes?.id))
		}

		for(int i = 0; i <playerCharacterInstance.lore.size();i++){
			playerCharacterInstance.lore.set(i, Lore.get(params.get("lore["+i+"]").lore?.id))
		}

		playerCharacterInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'PlayerCharacter.label', default: 'PlayerCharacter'),
					playerCharacterInstance.id
				])
				redirect playerCharacterInstance
			}
			'*'{ respond playerCharacterInstance, [status: OK] }
		}
	}
	@Secured(['ROLE_ADMIN'])
	@Transactional
	def delete(PlayerCharacter playerCharacterInstance) {

		if (playerCharacterInstance == null) {
			notFound()
			return
		}

		playerCharacterInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'PlayerCharacter.label', default: 'PlayerCharacter'),
					playerCharacterInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'playerCharacterInstance.label', default: 'PlayerCharacter'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}

	@Secured(['ROLE_ADMIN'])
	def characterAPI(PlayerCharacter playerCharacterInstance) {
		render playerCharacterInstance as JSON
	}

	def fetchRecipes(character, Feat feat, recipes){
		if(feat.prereqFeat)
			recipes.addAll(fetchRecipes(character, feat.prereqFeat, recipes))
		recipes.addAll(Recipe.findAllByRequiredSkillToCraftAndResearchCost(feat, 0) as Set)
		recipes.addAll(character.recipe.findAll{it.requiredSkillToCraft.id == feat.id})
		return recipes
	}

	def genDowntime(Downtime downtime){
		if(isAuthService.hasModifyAuth(downtime.character.user)){
			PlayerCharacter character = downtime.character
			def feat = []
			character.feat*.feat.findAll{it.type == 'Crafting'}.each {current->
				current?.itemsCrafted?.times{ feat.add(current) }
			}
			def crafted = downtime.craftLog
			crafted.each{
				if(!feat.remove(it.recipe.requiredSkillToCraft)){
					def toRemove = Feat.findByPrereqFeatAndSustainable(it.recipe.requiredSkillToCraft, false,[readOnly:true])
					if(!feat.remove(toRemove)){
						feat.remove(Feat.findByPrereqFeatAndSustainable(toRemove, false,[readOnly:true]))
					}
				}
			}
			def recipes = feat.collect{ fetchRecipes(character,it,[] as Set) }
			render(view:'genDowntime', model:[downtime:downtime, character:character, recipes:recipes, crafted:crafted])
		}else
			redirect action: 'auth', params: params
	}


	def fetchRecipeDetails={
		def recipe = Recipe.read(params.recipe)
		def character = PlayerCharacter.read(params.character)
		def spells = character.spell.findAll {it.spell.classes == recipe.spellClass  }
		def downtime = Downtime.read(params.downtime)
		def items = downtime.itemCurrent.findAll{it.level?.id == recipe?.baseItem?.id && it.created != downtime.event}
		render(template:'recipeDetails', model:[recipe:recipe, downtime:downtime, character:character.id, div:params.div, spells:spells, items:items])
	}

	def fetchRecipeDetailsAdd={
		def powerToAdd = Recipe.read(params.powerToAdd)
		def character = PlayerCharacter.read(params.character)
		def spells = character.spell.findAll {it.spell.classes == recipe.spellClass  }
		def downtime = Downtime.read(params.downtime)
		def item = Item.read(params.item)
		render (template:'/recipe/reforge', model:[itemInstance:item, powerToAdd:powerToAdd, downtime:downtime, recipe:Recipe.read(params.recipe), div:params.div])
	}

	def fetchRecipetoAdd ={
		def character = PlayerCharacter.read(params.character)
		def item = Item.read(params.item)
		def recipe = Recipe.read(params.recipe)
		def spells = character.spell.findAll {it.spell.classes == recipe.spellClass  }
		def recipes = fetchRecipes(character, recipe.featToAdd, [])
		recipes.removeAll{it.itemType.toString() != item.type}
		render(template:'/recipe/addPower', model:[powersToAdd:recipes, item:item, div:params.div])
	}


	def createItem={
		def name =  params.name
		def air = params.int('air')?:0
		def earth = params.int('earth')?:0
		def fire = params.int('fire')?:0
		def water = params.int('water')?:0
		def blended = params.int('blended')?:0
		def voidC = params.int('voidC')?:0
		def recipe = Recipe.read(params.recipe)
		def character = PlayerCharacter.read(params.character)
		def downtime = Downtime.read(params.downtime)
		if (downtime.airCurrent < recipe?.airCrystals + air)
			render(status: 400, text: 'Insuffient Air Crystals.')
		if (downtime.earthCurrent < recipe?.earthCrystals + earth)
			render(status: 400, text: 'Insuffient Earth Crystals.')
		if (downtime.fireCurrent < recipe?.fireCrystals + fire)
			render(status: 400, text: 'Insuffient Fire Crystals.')
		if (downtime.waterCurrent < recipe?.waterCrystals + water)
			render(status: 400, text: 'Insuffient Water Crystals.')
		if (downtime.blendedCurrent < recipe?.blendedCrystals + blended)
			render(status: 400, text: 'Insuffient Blended Crystals.')
		if (downtime.voidCurrent < recipe?.voidCrystals + voidC)
			render(status: 400, text: 'Insuffient Void Crystals.')
		if (air+earth+fire+water+blended+voidC != recipe?.anyCrystal)
			render(status: 400, text: 'Incorrect amount of Any Crystals specified.')

		def sustainable = sustainable(character, recipe.requiredSkillToCraft)?1:0
		def duration = 4 + sustainable
		def power2 = recipe.power2
		if(recipe.mustKnowTheSpell)
			power2 = "${params.get('spell')}"

		def item = new Item(
				name:name,power1:recipe.power1,power2:power2,
				attunementTime:recipe.attunementTime,
				type:recipe.itemType.toString(),
				duration:"Event ${downtime.event.eventNumber+duration}",
				internalNotes:"Crafted by ${character}",
				slot:recipe.slot, created:downtime.event, level:recipe.requiredSkillToCraft).save()
		def craftLog = new CraftLog(
				item:item,
				airCrystals:air+recipe.airCrystals,
				earthCrystals:earth+recipe.earthCrystals,
				fireCrystals:fire+recipe.fireCrystals,
				waterCrystals:water+recipe.waterCrystals,
				blendedCrystals:blended+recipe.blendedCrystals,
				voidCrystals:voidC+recipe.voidCrystals,
				recipe:recipe, downtime:downtime).save()
		render(template:'craftedItem', model:[item:item, craftLog:craftLog])
	}

	def reforge={
		def item = Item.read(params.long('item'))
		def recipe = Recipe.read(params.long('powerToAdd'))
		def reforgeRecipe = Recipe.read(params.long('recipe'))
		def downtime = Downtime.read(params.long('downtime'))
		def character = downtime.character
		def air = params.int('air')?:0
		def earth = params.int('earth')?:0
		def fire = params.int('fire')?:0
		def water = params.int('water')?:0
		def blended = params.int('blended')?:0
		def voidC = params.int('voidC')?:0

		if (downtime.airCurrent < reforgeRecipe?.airCrystals + recipe?.airCrystals + air)
			render(status: 400, text: 'Insuffient Air Crystals.')
		if (downtime.earthCurrent < reforgeRecipe?.earthCrystals + recipe?.earthCrystals + earth)
			render(status: 400, text: 'Insuffient Earth Crystals.')
		if (downtime.fireCurrent < reforgeRecipe?.fireCrystals + recipe?.fireCrystals + fire)
			render(status: 400, text: 'Insuffient Fire Crystals.')
		if (downtime.waterCurrent < reforgeRecipe?.waterCrystals + recipe?.waterCrystals + water)
			render(status: 400, text: 'Insuffient Water Crystals.')
		if (downtime.blendedCurrent < reforgeRecipe?.blendedCrystals + recipe?.blendedCrystals + blended)
			render(status: 400, text: 'Insuffient Blended Crystals.')
		if (downtime.voidCurrent < reforgeRecipe?.voidCrystals + recipe?.voidCrystals + voidC)
			render(status: 400, text: 'Insuffient Void Crystals.')
		if (air+earth+fire+water+blended+voidC != recipe?.anyCrystal)
			render(status: 400, text: 'Incorrect amount of Any Crystals specified.')

		def sustainable = sustainable(character, recipe.requiredSkillToCraft)?1:0
		def duration = 4 + sustainable
		def newItem = new Item(
				name:item.name,power1:"${item.power1?:''} ${recipe.power1?'<br>'+recipe.power1:''}",power2:"${item.power2?:''}${recipe.power2?'<br>'+recipe.power2:''}",
				attunementTime:attunementTime(item, recipe),
				type:item.type,
				duration:"Event ${downtime.event.eventNumber+duration}",
				internalNotes:"${item.internalNotes}<br> Reforged by ${character}",
				slot:item.slot, created:downtime.event, level:reforgeRecipe.requiredSkillToCraft).save()
		def craftLog = new CraftLog(
				item:newItem, itemReforged:item,
				airCrystals:air+recipe.airCrystals+reforgeRecipe?.airCrystals,
				earthCrystals:earth+recipe.earthCrystals+reforgeRecipe?.earthCrystals,
				fireCrystals:fire+recipe.fireCrystals+reforgeRecipe?.fireCrystals,
				waterCrystals:water+recipe.waterCrystals+reforgeRecipe?.waterCrystals,
				blendedCrystals:blended+recipe.blendedCrystals+reforgeRecipe?.blendedCrystals,
				voidCrystals:voidC+recipe.voidCrystals+reforgeRecipe?.voidCrystals,
				recipe:reforgeRecipe, downtime:downtime).save()
		render(template:'craftedItem', model:[item:item, craftLog:craftLog])
	}

	def sustainable(PlayerCharacter character, Feat feat){
		while(feat.prereqFeat){
			feat = feat.prereqFeat
		}
		return character.feat*.feat.find{
			it.sustainable == true && it.prereqFeat == feat
		}
	}

	def attunementTime(Item item, Recipe recipe){
		String time1 = item.attunementTime.toLowerCase()
		String time2 = recipe.attunementTime.toLowerCase()
		if(time1.contains('h') && !time2.contains('h'))
			return time1
		if(time2.contains('h') && !time1.contains('h'))
			return time2
		if(time1.contains('m') && !time2.contains('m'))
			return time1
		if(time2.contains('m') && !time1.contains('m'))
			return time2
		int int1 = Integer.parseInt(time1.replaceAll("[\\D]", ""))
		int int2 = Integer.parseInt(time2.replaceAll("[\\D]", ""))
		if(int1 >= int2)
			return time1
		return time2
	}
}
