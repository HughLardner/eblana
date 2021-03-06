package eblana.event


import static org.springframework.http.HttpStatus.*
import eblana.character.Lore
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
		def characters = PlayerCharacter.findAllByAliveAndUserIsNotNull(true).collect {
			[c:it, d:Downtime.findByEventAndCharacter(eventInstance, it)]
		};
		if(params.sort == "userId")
			characters.sort{ it.c.user.id}
		if(params.sort == "userName")
			characters.sort{a,b-> a.c.user.firstName.toUpperCase()<=>b.c.user.firstName.toUpperCase() }
		if(params.sort == "name")
			characters.sort{a,b-> a.c.name<=>b.c.name}
		if(params.sort == "character")
			characters.sort{ it.c.id}
		if(params.sort == "downtime")
			characters.sort{ it.d.id}
		if(params.sort == "xp")
			characters.sort{ it.c.xp}
		if(params.sort == "level")
			characters.sort{ it.c.level}

		if(params.order =="desc")
			characters = characters.reverse()


		respond eventInstance, model:[characters:characters]
	}

	def create() {
		respond new Event(params)
	}

	def printEvent(Event eventInstance){
		respond eventInstance
	}

	@Transactional
	def save(Event eventInstance) {
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
		if (params.boolean("currentDowntime")){
			def events = Downtime.findAllByCurrentDowntime(true)
			events.each{
				it.currentDowntime = false
				it.save()
			}
			eventInstance.currentDowntime = true
		}
		def downtimeParams = params.character
		def characters = PlayerCharacter.findAllByAlive(true)
		characters.each{ c->
			def param = downtimeParams.get(c.id.toString())
			if(param){
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

				def itemString = param.get('items')
				if(itemString.size() > 0){
					def itemIds = param.get('items').split(',')*.toLong()
					def items = Item.findAllByIdInList(itemIds)
					downtime.item?.clear()
					downtime.item = items
				}
				downtime.save()
			}
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
			'*'{
				respond eventInstance, [status: OK]
			}
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
		if (params.boolean("currentDowntime")){
			def events = Event.findAllByCurrentDowntime(true)
			events.each{
				it.currentDowntime = false
				it.save()
			}
			eventInstance.currentDowntime = true
		}
		def downtimeParams = params.character
		def characters = PlayerCharacter.findAllByAlive(true)
		characters.each{ c->
			def param = downtimeParams.get(c.id.toString())
			if(param){
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

				def itemString = param.get('items')
				if(itemString.size() > 0){
					def itemIds = param.get('items').split(',')*.toLong()
					def items = Item.findAllByIdInList(itemIds)
					downtime.item?.clear()
					downtime.item = items
				}
				downtime.save()
			}
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
			'*'{
				respond eventInstance, [status: OK]
			}
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

	def print(){
		def players = PlayerCharacter.findAllByIdInList(params.list("printIds")*.toLong(),[readOnly:true, sort:'user.firstName'])
		def event = Event.read(params.long("event"))
		def preEvent = Event.findByEventNumber(event.eventNumber-1,[readOnly:true])
		def fullLores = EventLore.findAllByEvent(event)
		def results =  players.collect{ player->
			def lore = fullLores.findAll{
				player.lore.id.contains(it.lore.id)
			}
			[character:player, downtime:Downtime.findByCharacterAndEvent(player, preEvent, [readOnly:true]), lore:lore]
		}
		render(view: "print", model: [players: results])
	}
	
	def printCharacter(){
		def players = PlayerCharacter.read(params.long("player"))
		def event = Event.read(params.long("event"))
		def preEvent = Event.findByEventNumber(event.eventNumber-1,[readOnly:true])
		def fullLores = EventLore.findAllByEvent(event)
		def results =  players.collect{ player->
			def lore = fullLores.findAll{
				player.lore.id.contains(it.lore.id)
			}
			[character:player, downtime:Downtime.findByCharacterAndEvent(player, preEvent, [readOnly:true]), lore:lore]
		}
		render(view: "print", model: [players: results])
	}

	def printLabels(Event event){
		def downtimes = Downtime.findAllByEvent(event,[readOnly:true])
		String results = ''
		downtimes?.each{ downtime->
			results += "${downtime?.character?.user?.id}|${downtime?.character?.user?.toString()}|${downtime?.character?.id}|${downtime?.character?.toString()}|${downtime?.airCurrent}|${downtime?.earthCurrent}|${downtime?.fireCurrent}|${downtime.waterCurrent}|${downtime?.blendedCurrent}|${downtime?.voidCurrent}|"
			downtime?.itemCurrent.sort{ it.id }.each{ item-> results+="${item.id}, " }
			results+='<br />'
		}
		render results
	}
}
