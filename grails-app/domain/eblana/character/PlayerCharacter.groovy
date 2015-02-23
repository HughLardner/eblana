package eblana.character

import eblana.users.User
import eblana.background.God
import eblana.background.Group
import eblana.background.Settlement
import eblana.items.Item
import eblana.items.Recipe

class PlayerCharacter {

	String name
	Species species
	String background
	Integer body, armour, mana, xp, level
	Boolean alive
	List classes = new ArrayList<Classes>()
	List feat = new ArrayList<CharacterFeat>()
	List spell = new ArrayList<CharacterSpell>()
	List lore = new ArrayList<Lore>()
	Integer airCrystals, earthCrystals, fireCrystals, waterCrystals, blendedCrystals, voidCrystals
	List item = new ArrayList<Item>()
	List recipe = new ArrayList<Recipe>()
	
	static hasMany = [classes : Classes, feat : CharacterFeat, spell : CharacterSpell, lore : Lore, item : Item, recipe : Recipe]
	
	static belongsTo = [user : User, group : Group, settlement : Settlement, god : God]
	
	String toString(){
		return name
	}
	
	static mapping = {
		sort "name"
	}
}
