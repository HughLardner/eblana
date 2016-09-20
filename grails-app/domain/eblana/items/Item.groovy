package eblana.items

import eblana.character.Feat
import eblana.event.Event

class Item {
	String name
	Boolean singleUse
	String duration
	String type
	String power1, power2, attunementTime, curseCure, internalNotes, slot
	Integer convertedCrystalCost
	Status status
	Boolean transferable = true
	Boolean proposed
	Event created
	Feat level

	String toString(){
		return id +" : "+name+" : " + type
	}

	def consumable(){
		['Crystal','Mana Crystal','Oil','Poison','Potion'].contains(type)
	}
}

enum Status {
	OUT("Out"),MISSING("Missing"),RETURNED("Returned"),EXP("Expired"),UNUSED("Unused"),WAITING("Waiting"),REMOVED("Removed"),NPC("Plot/NPC")

	Status(String value) {
		this.value = value
	}
	private final String value
	public String value() {
		return value
	}
	public String toString() {
		return value
	}
}