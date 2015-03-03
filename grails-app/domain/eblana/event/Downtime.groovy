package eblana.event

import eblana.character.PlayerCharacter
import eblana.items.Item

class Downtime {

	Event event
	String research, researchResources, researchMethod
	Integer	researchScore
	String	headOfRulesResponse, headOfPlotResponse, headOfGameComments, finalDecision
	Integer airCrystals, earthCrystals, fireCrystals, waterCrystals, blendedCrystals, voidCrystals
	List item = new ArrayList<Item>()
	
	static hasMany = [item : Item]
	static belongsTo = [character : PlayerCharacter]
	
	static mapping = {
   research type: 'text'
   researchResources type: 'text'
   researchMethod type: 'text'
   headOfRulesResponse type: 'text'
   headOfPlotResponse type: 'text'
   headOfGameComments type: 'text'
   finalDecision type: 'text'
}
}
