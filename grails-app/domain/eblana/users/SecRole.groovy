package eblana.users

class SecRole {

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
	
	public String toString(){
		return this.authority ?: 'Role without authority'
	}
}
