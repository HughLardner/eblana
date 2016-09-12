package eblana.items

import eblana.character.Classes
import eblana.character.Feat
import eblana.character.Lore

class Recipe {
	
	Integer airCrystals, earthCrystals, fireCrystals, waterCrystals, blendedCrystals, voidCrystals, anyCrystal, researchCost
	String internalNotes
	Feat requiredSkillToCraft, baseItem, featToAdd 
	Lore researchSkill1
	ItemType itemType 
	String itemName, power1, power2, attunementTime, duration,  researchSkill2, slot
	Classes spellClass
	Boolean reforge
		
	Boolean mustKnowTheSpell, baseCostOfEffectToBeAddedItemToBeEnhanced
	
	static mapping = {
		power1 type: "text"
		power2 type: "text"
		internalNotes type: "text"
		sort "requiredSkillToCraft"
	}
	
	String toString(){
		return requiredSkillToCraft.toString() + " - " + itemType.toString() + " - " + power1 + " - " + power2
	}
	
}
