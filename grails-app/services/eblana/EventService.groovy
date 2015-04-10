package eblana

import eblana.event.Event
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
}
