package eblana.event

import eblana.character.PlayerCharacter
import eblana.items.Item
import eblana.logistic.Note

class Downtime {

	String research, researchResources, researchMethod, goal
	Integer	researchScore
	String	finalDecision
	Integer airCrystals, earthCrystals, fireCrystals, waterCrystals, blendedCrystals, voidCrystals
	Integer airCurrent, earthCurrent, fireCurrent, waterCurrent, blendedCurrent, voidCurrent
	List<Note> notes = new ArrayList<>()

	static hasMany = [
		item : Item,
		notes:Note,
		itemCurrent : Item,
		from:TransferLog,
		to:TransferLog,
		craftLog:CraftLog
	]

	static belongsTo = [
		character : PlayerCharacter,
		event: Event
	]

	static mappedBy=[
		from: 'from',
		to:'to'
	]

	static mapping = {
		research type: 'text'
		researchResources type: 'text'
		researchMethod type: 'text'
		finalDecision type: 'text'
		goal type: 'text'
	}
	
	static transients = ['airCurrent', 'earthCurrent', 'fireCurrent', 'waterCurrent','blendedCurrent','voidCurrent','itemCurrent']
	
	public int getAirCurrent(){
		return airCrystals?:0 + to*.air?.sum(0) - craftLog*.airCrystals?.sum(0) - from*.air?.sum(0)
	}
	
	public int getEarthCurrent(){
		return earthCrystals?:0 + to*.earth?.sum(0) - craftLog*.earthCrystals?.sum(0) - from*.earth?.sum(0)
	}
	
	public int getFireCurrent(){
		return fireCrystals?:0 + to*.fire?.sum(0) - craftLog*.fireCrystals?.sum(0) - from*.fire?.sum(0)
	}
	
	public int getWaterCurrent(){
		return waterCrystals?:0 + to*.water?.sum(0) - craftLog*.waterCrystals?.sum(0) - from*.water?.sum(0)
	}
	
	public int getBlendedCurrent(){
		return blendedCrystals?:0 + to*.blended?.sum(0) - craftLog*.blendedCrystals?.sum(0) - from*.blended?.sum(0)
	}
	
	public int getVoidCurrent(){
		return voidCrystals?:0 + to*.voidC?.sum(0) - craftLog*.voidCrystals?.sum(0) - from*.voidC?.sum(0)
	}
	
	public Set<Item> getItemCurrent(){
		return item + to*.item.flatten() - from*.item.flatten() + craftLog*.item
	}
}
