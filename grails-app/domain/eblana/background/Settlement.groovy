package eblana.background

import eblana.character.PlayerCharacter

class Settlement {
	
	String name
	static hasMany = [playerChracter : PlayerCharacter]
}
