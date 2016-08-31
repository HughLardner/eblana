package eblana.character

import eblana.background.God
import eblana.background.Group
import eblana.background.Settlement
import eblana.event.Downtime
import eblana.event.Event
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
	//List recipe = new ArrayList<Recipe>()

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

	static mapping = { 
		sort "name" 
		//xp formula: 'COUNT() FROM Event where'
		}
	
	static transients = ['xp', 'body', 'armour', 'mana']
	
	public int getXp(){
		return Event.executeQuery('from Event e where :character in elements(e.attended)',[character: this]).size()
	}
	
	public int getBody(){
		def body =  feat.feat?.body - null
		return body.sum(1)
	}
	
	public int getArmour(){
		def armour =  feat.feat?.armour - null
		return armour.sum(0)
	}
	
	public int getMana(){
		def mana =  feat.feat?.mana - null
		return mana.sum(0)
	}
	

	
}
