package eblana.character

import eblana.background.God
import eblana.background.Group
import eblana.background.Settlement
import eblana.event.Downtime
import eblana.event.TransferLog
import eblana.items.Item
import eblana.items.Recipe
import eblana.users.SecUser

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
	List recipe = new ArrayList<Recipe>()

	static hasMany = [
		classes : Classes,
		feat : CharacterFeat,
		spell : CharacterSpell,
		lore : Lore,
		item : Item,
		recipe : Recipe,
		downtime:Downtime
	]

	static belongsTo = [
		user : SecUser,
		group : Group,
		settlement : Settlement,
		god : God
	]

	String toString(){
		return name
	}

	static mapping = { sort "name" }

	
}
