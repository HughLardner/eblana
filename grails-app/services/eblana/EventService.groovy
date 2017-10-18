package eblana

import eblana.character.PlayerCharacter
import eblana.event.Downtime
import eblana.event.Event
import eblana.event.EventLore
import grails.transaction.Transactional

/**
 * EventService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
class EventService {

	def serviceMethod() {
	}

	def lastEvent(){
		def events = Event.findAllByDowntimeDone(true)
		def lastEvent = events.get(0)
		for(def event :events){
			if(event.eventNumber > lastEvent.eventNumber){
				lastEvent = event
			}
		}
		return lastEvent
	}

	def attended(Downtime downtime){
		if(downtime.event.getAttended().contains(downtime.character))
			return true
		return false
	}

	def attended(Event event, PlayerCharacter pc){
		if(event?.getAttended()?.contains(pc))
			return true
		return false
	}

	def eventLore(Downtime downtime){
		if(attended(downtime)&&EventLore.countByEventAndLoreInList(downtime.event,downtime.character.lore)>0)
			return true
		return false
	}
}
