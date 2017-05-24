package eblana

import eblana.items.Item
import grails.transaction.Transactional

/**
 * SearchService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
class SearchService {

	def serviceMethod() {
	}

	def String wrapSearchParm(value) {
		if(value)
			'%'+value+'%'
	}

	def searchItem(id ,name, power1, type ,duration ,created ,internal ,level ,proposed ,transferable , max=10, offset=0) {
		name = wrapSearchParm(name)
		power1 = wrapSearchParm(power1)
		internal = wrapSearchParm(internal)
		def i = Item.createCriteria()
		def list = i.list (max:max,offset:offset){
			and{
				if(id)
					eq('id',id)
				if(name){
					like('name',name)}
				if(power1){
					or{
						like('power1',power1)
						like('power2',power1)
					}
				}
				if(type)
					eq('type',type)
				if(duration)
					eq('duration',duration)
				if(created)
					eq('created.id',created)
				if(internal)
					like('internalNotes',internal)
				if(level)
					eq('level.id',level)
				if(proposed != 'null')
					eq('proposed',proposed=='True'?true:false)
				if(transferable!= 'null' ){
					eq('transferable',transferable=='True'?true:false)
				}
			}
		}
	}
}
