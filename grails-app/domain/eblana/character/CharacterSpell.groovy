package eblana.character

class CharacterSpell {
	Spell spell
	String source
	Effect effect1, effect2
	
	static belongsTo = [character : PlayerCharacter]
	
	String toString (){
		return spell.toString()
	}
	
	static mapping = {
		sort "spell"
	}
}
