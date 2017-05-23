package eblana.downtime

import eblana.character.PlayerCharacter
import eblana.event.Downtime
import eblana.event.TransferLog
import eblana.items.Item
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import grails.validation.ValidationException

/**
 * TransferController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class TransferController {
	def isAuthService
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def createTransfer(Downtime downtimeInstance){
		def secUserInstance = downtimeInstance.character.user
		if(isAuthService.hasModifyAuth(secUserInstance))
			render (view:'_create', model:[instance : downtimeInstance])
		else
			redirect action: 'auth', params: params
	}
	@Transactional(readOnly = false)
	def fixItems(){
		def downtimes = Downtime.list()
		downtimes.each {
			println "Starting Items: " + it.item

			it.item.addAll(it.from*.item?.flatten())
			it.item.addAll(it.craftLog*.itemReforged)
			it.item.removeAll(it.to*.item.flatten())
			it.item.removeAll(it.craftLog*.item)
			it.item = it.item -null
			it.item = it.item.unique{
				[
					equals: { delegate?.equals(it) },
					compare: { first, second ->
						first?.id <=> second?.id
					}
				] as Comparator
			}

			it.save(flush:true)
			println "finished Items: " + it.item
		}
	}
	@Transactional(readOnly = false)
	def fixItemsDowntime(Downtime downtime){
		println "Starting Items: " + downtime.item
		println "Transfered to: " + downtime.to*.item.flatten()
		println "Transfered From: " + downtime.from*.item?.flatten()
		println "Crafted Items: " + downtime.craftLog*.item
		println "reforged Items: " + downtime.craftLog*.itemReforged

		downtime.item.addAll(downtime.from*.item?.flatten())
		downtime.item.addAll(downtime.craftLog*.itemReforged)
		downtime.item.removeAll(downtime.to*.item.flatten())
		downtime.item.removeAll(downtime.craftLog*.item)
		downtime.item = downtime.item -null
		println "pre unique Items: " + downtime.item
		downtime.item = downtime.item.unique{
			[
				equals: { delegate?.equals(it) },
				compare: { first, second ->
					first?.id <=> second?.id
				}
			] as Comparator
		}

		downtime.save(flush:true)
		println "finished Items: " + downtime.item
		render downtime.item as JSON
	}
	@Transactional(readOnly = false)
	def getItems(Downtime downtime){
		def current = []
		println "Stage 1: " + current
		current.addAll(downtime.item)
		println "Stage 2: " + current
		current.addAll(downtime.craftLog.item)
		println "Stage 3: " + current
		
		current.addAll(downtime.to.item.flatten())
		println "Stage 4: " + current
		downtime.from.item.flatten().each {
			println it
			if(it)
				current.remove(it)
		}
		println "Stage 5: " + current

		println "Stage 6: " + current

		render current.collect {[it.id, it.name]} as JSON
	}

	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	@Transactional
	def save(){
		Downtime downtime = Downtime.get(params.long('downtime'))
		def secUserInstance = downtime.character.user
		if(isAuthService.hasModifyAuth(secUserInstance)){
			def event = downtime.event
			def targetCharacter = PlayerCharacter.get(params.long('target'))
			Downtime target = Downtime.findByEventAndCharacter(event, targetCharacter)
			def itemIds = params.list('items')*.toLong()
			def items = Item.findAllByIdInList(itemIds)

			def air = params.int('air')?:0
			def earth = params.int('earth')?:0
			def fire = params.int('fire')?:0
			def water = params.int('water')?:0
			def blended = params.int('blended')?:0
			def voidC = params.int('voidC')?:0

			if(downtime.airCurrent < air ||
			downtime.earthCurrent < earth ||
			downtime.fireCurrent < fire ||
			downtime.waterCurrent < water ||
			downtime.blendedCurrent < blended ||
			downtime.voidCurrent < voidC ||
			!items.every{downtime.itemCurrent.contains(it)}
			){
				throw new ValidationException("Error - you do not have what you are trying to transfer", downtime.errors)
			}
			if(air < 0 ||
			earth < 0 ||
			fire < 0 ||
			water < 0 ||
			blended < 0 ||
			voidC < 0
			){
				throw new ValidationException("Error - you do may not transfer an negitive amount of crystals", downtime.errors)
			}

			//downtime.save()
			//target.save()
			new TransferLog(from:downtime, to:target, item:items, air:air, earth:earth, water:water, fire:fire, blended:blended, voidC:voidC).save()
			redirect ( action: "createTransfer", id: downtime.id)
		}else
			redirect action: 'auth', params: params
	}
}
