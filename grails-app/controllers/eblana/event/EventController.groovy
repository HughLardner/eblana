package eblana.event


import static org.springframework.http.HttpStatus.*
import eblana.character.PlayerCharacter
import eblana.items.Item
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

/**
 * EventController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class EventController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(int max) {
		params.max = Math.min(max ?: 10, 100)
		respond Event.list(params), model:[eventInstanceCount: Event.count()]
	}

	def list(int max) {
		params.max = Math.min(max ?: 10, 100)
		respond Event.list(params), model:[eventInstanceCount: Event.count()]
	}

	def show(Event eventInstance) {
		def downtimes = [:]
		def charDowntimes = Downtime.findAllByEvent(eventInstance)
		charDowntimes.each{
			downtimes.put(it.character.id, it)
		}
		respond eventInstance, model:[downtimes:downtimes]
	}

	def create() {
		respond new Event(params)
	}

	def printEvent(Event eventInstance){
		respond eventInstance
	}

	@Transactional
	def save(Event eventInstance) {
		if (eventInstance == null) {
			notFound()
			return
		}

		if (eventInstance.hasErrors()) {
			respond eventInstance.errors, view:'create'
			return
		}

		def c = PlayerCharacter.findAllByAlive(true)
		for (int i = 0; i < c.size(); i++){
			def ce = new Downtime()
			ce.character = c[i]
			eventInstance.characterEvent.add(ce)
		}
		eventInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'eventInstance.label', default: 'Event'),
					eventInstance.id
				])
				redirect eventInstance
			}
			'*' { respond eventInstance, [status: CREATED] }
		}
	}

	def edit(Event eventInstance) {
		def downtimes = [:]
		def charDowntimes = Downtime.findAllByEvent(eventInstance)
		charDowntimes.each{
			downtimes.put(it.character.id, it)
		}
		respond eventInstance, model:[downtimes:downtimes]
	}

	@Transactional
	def update(Event eventInstance) {
		params.remove "_attended"
		bindData eventInstance, params
		if (eventInstance == null) {
			notFound()
			return
		}

		if (eventInstance.hasErrors()) {
			respond eventInstance.errors, view:'edit'
			return
		}

		def downtimeParams = params.character
		def characters = PlayerCharacter.findAllByAlive(true)
		characters.each{c->
			def param = downtimeParams.get(c.id.toString())
			def downtimeId = param.long("downtimeId")
			def downtime
			if(downtimeId)
				downtime = Downtime.get(downtimeId)
			else
				downtime = new Downtime(event:eventInstance, character:c)
			downtime.airCrystals = param.int("air")
			downtime.earthCrystals = param.int("earth")
			downtime.fireCrystals = param.int("fire")
			downtime.waterCrystals = param.int("water")
			downtime.blendedCrystals = param.int("blended")
			downtime.voidCrystals = param.int("void")

			downtime.airCurrent = param.int("air")
			downtime.earthCurrent = param.int("earth")
			downtime.fireCurrent = param.int("fire")
			downtime.waterCurrent = param.int("water")
			downtime.blendedCurrent = param.int("blended")
			downtime.voidCurrent = param.int("void")

			def itemString = param.get('items')
			if(itemString.size() > 0){
				def itemIds = param.get('items').split(',')*.toLong()
				def items = Item.findAllByIdInList(itemIds)
				downtime.item?.clear()
				downtime.item = items
				downtime.itemCurrent?.clear()
				downtime.itemCurrent = items
			}
			downtime.save()
		}
		eventInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Event.label', default: 'Event'),
					eventInstance.id
				])
				redirect eventInstance
			}
			'*'{ respond eventInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Event eventInstance) {

		if (eventInstance == null) {
			notFound()
			return
		}

		eventInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Event.label', default: 'Event'),
					eventInstance.id
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
					message(code: 'eventInstance.label', default: 'Event'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
