package eblana.event
import eblana.character.PlayerCharacter
class Event {
	String name
	List characterEvent = new ArrayList<CharacterEvent>()
	
	static hasMany = [characterEvent : CharacterEvent]
}