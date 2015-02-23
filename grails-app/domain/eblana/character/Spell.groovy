package eblana.character

class Spell {
	String pre
	Effect effect
	String post
	Classes classes
	
	String toString(){
		return pre + " " + effect + " " + post
	}
	
	static mapping = {
		sort "effect"
	}
}
