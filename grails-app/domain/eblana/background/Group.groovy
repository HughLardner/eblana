package eblana.background

import eblana.character.PlayerCharacter

class Group {
	String name
	
	static mapping = {
		table 'Character_Group'
	}
	static hasMany = [playerChracter : PlayerCharacter]
}
