package eblana.character

class Effect {
	String name, type, description
	
	String toString(){
		return name
	}
	
	static mapping = {
		sort "name"
		description type:"text"
		
	}
}
