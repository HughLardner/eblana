package eblana.character

class CharacterFeat {

	Feat feat
	String source
	Effect effect
	Boolean open
	
	static belongsTo = [character : PlayerCharacter]
	
	String toString(){
		return feat
	}
	
	static mapping = {
		sort "feat"
	}
}
