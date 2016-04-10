package eblana.event
import eblana.character.PlayerCharacter
class Event {
	String name
	Date date
	Integer eventNumber
	Boolean downtimeDone
	Boolean lastEvent

	
	String toString(){
		return "Event " + eventNumber + " : " + name
	}
}