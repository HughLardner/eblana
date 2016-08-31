package eblana.event

import eblana.character.PlayerCharacter
import eblana.items.Item
import eblana.items.Recipe

/**
 * CraftLog
 * A domain class describes the data object and it's mapping to the database
 */
class CraftLog {

	/* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
	
	/* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated
	
	Item item
	Integer airCrystals, earthCrystals, fireCrystals, waterCrystals, blendedCrystals, voidCrystals	
	Recipe recipe
	String name
	
	static	belongsTo	= [downtime:Downtime]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static	hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 
	
    static	mapping = {
    }
    
	static	constraints = {
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
