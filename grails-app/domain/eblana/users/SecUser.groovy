package eblana.users

import eblana.character.PlayerCharacter

class SecUser {

	transient springSecurityService

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	
	String firstName, surname, phoneNumber, email
	String emergancyContact, emergancyContactNumber, medicalInformation, carReg
	List character = new ArrayList<PlayerCharacter>()
	
	static hasMany = [character : PlayerCharacter]

	static constraints = {
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<SecRole> getAuthorities() {
		SecUserSecRole.findAllBySecUser(this).collect { it.secRole } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
	
	String toString() {
		if(firstName || surname){
			return (firstName?firstName:'') + ' ' + (surname?surname:'')
		}
		else{
			return username 
		}
	}
}
