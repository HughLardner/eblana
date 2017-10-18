package eblana.event


import static org.springframework.http.HttpStatus.*

import eblana.character.PlayerCharacter
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

/**
 * EventLoreController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class EventLoreController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond EventLore.list(params), model:[eventLoreInstanceCount: EventLore.count()]
	}

	def list(Integer max) {
		params.max = max?:10000
		respond EventLore.list(params), model:[eventLoreInstanceCount: EventLore.count()]
	}

	def show(EventLore eventLoreInstance) {
		respond eventLoreInstance
	}

	def create() {
		respond new EventLore(params)
	}

	@Transactional
	def save(EventLore eventLoreInstance) {
		if (eventLoreInstance == null) {
			notFound()
			return
		}

		if (eventLoreInstance.hasErrors()) {
			respond eventLoreInstance.errors, view:'create'
			return
		}

		eventLoreInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'eventLoreInstance.label', default: 'EventLore'),
					eventLoreInstance.id
				])
				redirect eventLoreInstance
			}
			'*' { respond eventLoreInstance, [status: CREATED] }
		}
	}

	def edit(EventLore eventLoreInstance) {
		respond eventLoreInstance
	}

	@Transactional
	def update(EventLore eventLoreInstance) {
		if (eventLoreInstance == null) {
			notFound()
			return
		}

		if (eventLoreInstance.hasErrors()) {
			respond eventLoreInstance.errors, view:'edit'
			return
		}

		eventLoreInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'EventLore.label', default: 'EventLore'),
					eventLoreInstance.id
				])
				redirect eventLoreInstance
			}
			'*'{ respond eventLoreInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(EventLore eventLoreInstance) {

		if (eventLoreInstance == null) {
			notFound()
			return
		}

		eventLoreInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'EventLore.label', default: 'EventLore'),
					eventLoreInstance.id
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
					message(code: 'eventLoreInstance.label', default: 'EventLore'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
	
	def springSecurityService
	def isAuthService
	def eventService
	
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def fetchCharacterEventLore(){
		def pc = PlayerCharacter.read(params.long('playerCharacter'))
		def event = Event.read(params.long('event'))
		def roles = springSecurityService.getPrincipal().getAuthorities()*.getAuthority()
		if(isAuthService.hasModifyAuth(pc.user) &&(roles.contains('ROLE_ADMIN')||eventService.attended(event, pc))){
			def lores = EventLore.findAllByEventAndLoreInList(event, pc?.lore,[sort:'lore'])
			render(view: "fetchCharacterEventLore", model:[lores:lores, event:event])
		}
	}
}
