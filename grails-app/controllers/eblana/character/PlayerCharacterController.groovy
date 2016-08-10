package eblana.character


import static org.springframework.http.HttpStatus.*
import eblana.event.CraftLog
import eblana.event.Downtime
import eblana.event.Event
import eblana.items.Item
import eblana.items.Recipe
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

/**
 * PlayerCharacterController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class PlayerCharacterController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def springSecurityService

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond PlayerCharacter.list(params), model:[playerCharacterInstanceCount: PlayerCharacter.count()]
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond PlayerCharacter.list(params), model:[playerCharacterInstanceCount: PlayerCharacter.count()]
	}
	@Secured(['ROLE_ADMIN'])
	def show(PlayerCharacter playerCharacterInstance) {
		respond playerCharacterInstance
	}

	def showAll(Integer max){
		respond PlayerCharacter.findAllByAlive(true), model:[playerCharacterInstanceCount: PlayerCharacter.count()]
	}

	def create() {
		respond new PlayerCharacter(params)
	}

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
		def event = Event.findByCurrentDowntime(true)
		Downtime downtime = event.downtime.find{it.character == playerCharacterInstance}
		if(!downtime){
			downtime = new Downtime(character:playerCharacterInstance, event:event)
			downtime.item = [] as Set
			downtime.itemCurrent = [] as Set
		}
		downtime.airCrystals = params.int("airCrystals")
		downtime.earthCrystals = params.int("earthCrystals")
		downtime.fireCrystals = params.int("fireCrystals")
		downtime.waterCrystals = params.int("waterCrystals")
		downtime.blendedCrystals = params.int("blendedCrystals")
		downtime.voidCrystals = params.int("voidCrystals")
		if(params.containsKey("item")){
			downtime.item.addAll(Item.findAllByIdInList(params.get("item")?.list('id')*.toLong()))
		}
		downtime.save()
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

	def edit(PlayerCharacter playerCharacterInstance) {
		respond playerCharacterInstance
	}

	@Transactional
	def update(PlayerCharacter playerCharacterInstance) {
		println params
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
		def event = Event.findByCurrentDowntime(true)
		Downtime downtime = event.downtime.find{it.character == playerCharacterInstance}
		if(!downtime){
			downtime = new Downtime(character:playerCharacterInstance, event:event)
			downtime.item = [] as Set
			downtime.itemCurrent = [] as Set
		}
		downtime.airCrystals = params.int("airCrystals")
		downtime.earthCrystals = params.int("earthCrystals")
		downtime.fireCrystals = params.int("fireCrystals")
		downtime.waterCrystals = params.int("waterCrystals")
		downtime.blendedCrystals = params.int("blendedCrystals")
		downtime.voidCrystals = params.int("voidCrystals")
		if(params.containsKey("item")){
			downtime.item.addAll(Item.findAllByIdInList(params.get("item")?.list('id')*.toLong()))
		}
		downtime.save()
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


	def characterAPI(PlayerCharacter playerCharacterInstance) {
		render playerCharacterInstance as JSON
	}

	def fetchRecipes(){
		def character = PlayerCharacter.read(params.character)
		def feat = Feat.read(params.feat)
		def recipes = Recipe.findAllByRequiredSkillToCraftAndResearchCost(feat, 0) as Set
		recipes.addAll(character.recipe.findAll{it.requiredSkillToCraft == feat})
		render(template:'recipes', model:[recipes:recipes, downtime:params.downtime, character:params.character])
	}
	
	def fetchRecipesCont(character, feat){
		def recipes = Recipe.findAllByRequiredSkillToCraftAndResearchCost(feat, 0) as Set
		recipes.addAll(character.recipe.findAll{it.requiredSkillToCraft == feat})
		return recipes
	}

	def genDowntime(PlayerCharacter character){
		def downtime = character.downtime.find(){
			it.event.currentDowntime == true
		}
		def feat = character.feat*.feat.findAll{it.type == 'Crafting'}
		def crafted = downtime.craftLog
		//crafted.addAll(feat.findAll {it.r})
	
		def recipes = feat.collect{
			fetchRecipesCont(character,it)
		}
		render(view:'genDowntime', model:[downtime:downtime, character:character, feat:feat, recipes:recipes])
	}

	def fetchRecipeDetails={

		
		def recipe = Recipe.read(params.recipe)
		render(template:'recipeDetails', model:[recipe:recipe, downtime:params.downtime, character:params.character, div:params.div])
	}
	
	def checkCrafted={
		println params
		def character = PlayerCharacter.read(params.character)
		def downtime = Downtime.read(params.downtime)
		def feat = Feat.read(params.feat)
		def crafted = downtime.craftLog.findAll {
			it.recipe.requiredSkillToCraft == feat
		}
		println crafted
		def craftedCollection = crafted.collect{
			render(template:'craftedItem', model:[item:it.item, craftLog:it])
		}
		render(template:'craftedItemList', model:[craftedCollection:craftedCollection])
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
		def duration = 4
		def item = new Item(
				name:name,power1:recipe.power1,power2:recipe.power2,
				attunmentTime:recipe.attunementTime,
				type:recipe.itemType.toString(),
				duration:"Event ${downtime.event.eventNumber+duration}",
				internalNotes:"Crafted by ${character}",
				slot:recipe.slot).save()
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
}
