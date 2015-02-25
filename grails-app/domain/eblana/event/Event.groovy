package eblana.event
import eblana.character.PlayerCharacter
class Event {
	String name
	Date date
	Integer eventNumber
	List characterEvent = new ArrayList<CharacterEvent>()
	
	static hasMany = [characterEvent : CharacterEvent]
	
	String toString(){
		return "Event " + eventNumber + " : " + name
	}
}