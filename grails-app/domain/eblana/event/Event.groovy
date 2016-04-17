package eblana.event
import eblana.character.PlayerCharacter
class Event {
	String name
	Date date
	Integer eventNumber
	Boolean downtimeDone
	Boolean lastEvent
	Boolean currentDowntime = false
	Set<PlayerCharacter> attended = new HashSet<>()
	
	static hasMany = [attended : PlayerCharacter]

	
	String toString(){
		return "Event " + eventNumber + " : " + name
	}
}