package eblana.items

import eblana.character.Feat
import eblana.character.Lore

class Recipe {
	
	Integer airCrystals, earthCrystals, fireCrystals, waterCrystals, blendedCrystals, voidCrystals, anyCrystal, researchCost
	String internalNotes
	Feat requiredSkillToCraft 
	Lore researchSkill1
	String itemName, itemType, power1, power2, attunementTime, duration,  researchSkill2
		
	Boolean mustKnowTheSpell, baseCostOfEffectToBeAddedItemToBeEnhanced
	
	static mapping = {
		power1 type: "text"
		power2 type: "text"
		internalNotes type: "text"
	}
	
}
