package eblana.character

class Feat {
	String name, description
	Species prereqSpecies 
	Feat prereqFeat 
	Classes prereqClass 
	Boolean takeMoreThenOnce, visiable
	String type
	Integer level, body, armour, mana
	
	String toString(){
		return name
	}
	
	static mapping = {
		sort "name"
		description type:"text"
	}
	
}
