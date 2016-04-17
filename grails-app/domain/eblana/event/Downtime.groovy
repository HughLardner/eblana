package eblana.event

import eblana.character.PlayerCharacter
import eblana.items.Item
import eblana.logistic.Note

class Downtime {

	String research, researchResources, researchMethod, goal
	Integer	researchScore
	String	finalDecision
	Integer airCrystals, earthCrystals, fireCrystals, waterCrystals, blendedCrystals, voidCrystals
	Integer airCurrent, earthCurrent, fireCurrent, waterCurrent, blendedCurrent, voidCurrent
	List<Note> notes = new ArrayList<>()
	
	static hasMany = [item : Item, notes:Note, itemCurrent : Item]
	static belongsTo = [character : PlayerCharacter, event: Event]
	
	static mapping = {
   research type: 'text'
   researchResources type: 'text'
   researchMethod type: 'text'
   finalDecision type: 'text'
   goal type: 'text'
}
}
