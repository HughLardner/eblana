package eblana.character

class Species {

	String name
	Boolean visiable
	
	String toString() {
		return name
	}
	
	static mapping = {
		sort "name"
	}

}
