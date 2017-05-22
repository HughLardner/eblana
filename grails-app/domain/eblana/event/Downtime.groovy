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

	static transients = [
		'airCurrent',
		'earthCurrent',
		'fireCurrent',
		'waterCurrent',
		'blendedCurrent',
		'voidCurrent',
		'itemCurrent'
	]

	public int getAirCurrent(){
		return (airCrystals?:0) + to.sum(0){it?.air?:0} - craftLog.sum(0){it?.airCrystals?:0} - from.sum(0){it?.air?:0}
	}

	public int getEarthCurrent(){
		return (earthCrystals?:0) + to.sum(0){it?.earth?:0} - craftLog.sum(0){it?.earthCrystals?:0} - from.sum(0){it?.earth?:0}
	}

	public int getFireCurrent(){
		return (fireCrystals?:0) + to.sum(0){it?.fire?:0} - craftLog.sum(0){it?.fireCrystals?:0} - from.sum(0){it?.fire?:0}
	}

	public int getWaterCurrent(){
		return (waterCrystals?:0) + to.sum(0){it?.water?:0} - craftLog.sum(0){it?.waterCrystals?:0} - from.sum(0){it?.water?:0}
	}

	public int getBlendedCurrent(){
		return (blendedCrystals?:0) + to.sum(0){it?.blended?:0} - craftLog.sum(0){it?.blendedCrystals?:0} - from.sum(0){it?.blended?:0}
	}

	public int getVoidCurrent(){
		return (voidCrystals?:0) + to.sum(0){it?.voidC?:0} - craftLog.sum(0){it?.voidCrystals?:0} - from.sum(0){it?.voidC?:0}
	}

	public Set<Item> getItemCurrent(){
		/*
		 def current = item + to*.item.flatten() + craftLog*.item
		 println this.id + " Item List Start: "+ current
		 //from*.item?.flatten()?.each{ current.removeElement(it) }
		 //craftLog*.itemReforged?.each{ current.removeElement(it.id) }
		 //current.removeAll{ it.id in from*.item?.flatten()?.id}
		 //current.removeAll{it.id in craftLog*.itemReforged?.id}
		 from*.item?.flatten()?.each{current.remove(it)}
		 println this.id + " Item List first remove: "+ current
		 craftLog*.itemReforged?.each{current.remove(it)}
		 println this.id + " Item List 2nd remove: "+ current
		 current = current.unique(itemComparator)
		 println this.id + " Item List final: "+ current
		 */
		def toAdd = to*.item.flatten() + craftLog*.item - null
		println this.id + " To Add: "+ toAdd

		def toRemove = from*.item?.flatten() + craftLog*.itemReforged - null
		println this.id + " To Remove: "+ toRemove

		def current = []
		current.addAll(item)
		println this.id + " Starting Items: "+ current

		current.addAll(toAdd)
		println this.id + " After add: "+ current

		toRemove.each { current.remove(it) }
		println this.id + " After Remove: "+ current

		return current.unique(itemComparator)
	}

	//#TODO: ugly way to do this - need to work out why not treating items with the same id as the same item
	def itemComparator = [
		equals: { delegate?.equals(it) },
		compare: { first, second ->
			first?.id <=> second?.id
		}
	] as Comparator
}
