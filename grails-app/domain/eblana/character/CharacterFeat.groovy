package eblana.character

class CharacterFeat {

	Feat feat
	String source
	Effect effect
	Boolean open
	Classes classes
	
	static belongsTo = [character : PlayerCharacter]
	
	String toString(){
		return feat
	}
	
	static mapping = {
		sort "feat"
	}
}
