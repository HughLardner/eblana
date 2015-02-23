package eblana.users

import eblana.character.PlayerCharacter

class User extends SecUser{
	
	String firstName, surname, phoneNumber, email
	String emergancyContact, emergancyContactNumber, medicalInformation, carReg
	List character = new ArrayList<PlayerCharacter>()
	
	static hasMany = [character : PlayerCharacter]
	
	static mapping = {
		table 'Eblana_Users'
	}
	 


}
