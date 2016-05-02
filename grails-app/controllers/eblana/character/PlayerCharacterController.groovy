package eblana.character


import static org.springframework.http.HttpStatus.*
import eblana.event.Downtime
import eblana.event.Event
import eblana.items.Item
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
			downtime.airCurrent = params.int("airCrystals")
			downtime.earthCurrent = params.int("earthCrystals")
			downtime.fireCurrent = params.int("fireCrystals")
			downtime.waterCurrent = params.int("waterCrystals")
			downtime.blendedCurrent = params.int("blendedCrystals")
			downtime.voidCurrent = params.int("voidCrystals")	
			downtime.item = [] as Set
			downtime.itemCurrent = [] as Set
			downtime.itemCurrent.addAll(Item.findAllByIdInList(params.get("item").list('id')*.toLong()))
		}
		downtime.airCrystals = params.int("airCrystals")
		downtime.earthCrystals = params.int("earthCrystals")
		downtime.fireCrystals = params.int("fireCrystals")
		downtime.waterCrystals = params.int("waterCrystals")
		downtime.blendedCrystals = params.int("blendedCrystals")
		downtime.voidCrystals = params.int("voidCrystals")
		downtime.item.addAll(Item.findAllByIdInList(params.get("item").list('id')*.toLong()))
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
			downtime.airCurrent = params.int("airCrystals")
			downtime.earthCurrent = params.int("earthCrystals")
			downtime.fireCurrent = params.int("fireCrystals")
			downtime.waterCurrent = params.int("waterCrystals")
			downtime.blendedCurrent = params.int("blendedCrystals")
			downtime.voidCurrent = params.int("voidCrystals")
			downtime.item = [] as Set
			downtime.itemCurrent = [] as Set
			downtime.itemCurrent.addAll(Item.findAllByIdInList(params.get("item").list('id')*.toLong()))
		}
		downtime.airCrystals = params.int("airCrystals")
		downtime.earthCrystals = params.int("earthCrystals")
		downtime.fireCrystals = params.int("fireCrystals")
		downtime.waterCrystals = params.int("waterCrystals")
		downtime.blendedCrystals = params.int("blendedCrystals")
		downtime.voidCrystals = params.int("voidCrystals")
		downtime.item.addAll(Item.findAllByIdInList(params.get("item").list('id')*.toLong()))
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
}
