package eblana.items

import eblana.character.Feat
import eblana.character.Lore

class Recipe {
	
	Integer airCrystals, earthCrystals, fireCrystals, waterCrystals, blendedCrystals, voidCrystals, anyCrystal, researchCost
	String internalNotes
	Feat requiredSkillToCraft 
	Lore researchSkill1
	ItemType itemType 
	String itemName, power1, power2, attunementTime, duration,  researchSkill2
		
	Boolean mustKnowTheSpell, baseCostOfEffectToBeAddedItemToBeEnhanced
	
	static mapping = {
		power1 type: "text"
		power2 type: "text"
		internalNotes type: "text"
		sort "itemType"
	}
	
	String toString(){
		return requiredSkillToCraft.toString() + " - " + itemType.toString() + " - " + power1 + " - " + power2
	}
	
}
