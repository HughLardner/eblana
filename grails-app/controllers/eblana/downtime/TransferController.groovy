package eblana.downtime

import eblana.character.PlayerCharacter
import eblana.event.Downtime
import eblana.event.Event
import eblana.items.Item
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

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
		render (view:'create', model:[instance : downtimeInstance])
	else
		redirect action: 'auth', params: params
	}
	
	@Transactional
	def save(){
		Downtime downtime = Downtime.get(params.long('downtime'))
		def event = Event.findByLastEvent(true)
		def targetCharacter = PlayerCharacter.get(params.long('target'))
		Downtime target = Downtime.findByEventAndCharacter(event, targetCharacter)
		def itemIds = params.list('items')*.toLong()
		def items = Item.findAllByIdInList(itemIds)
		
		downtime.airCurrent =-params.int('air')
		downtime.earthCurrent =-params.int('earth')
		downtime.fireCurrent =-params.int('fire')
		downtime.waterCurrent =-params.int('water')
		downtime.blendedCurrent =-params.int('blended')
		downtime.voidCurrent =-params.int('void')
		downtime.item.removeAll(items)

		target.airCurrent =+params.int('air')
		target.earthCurrent =+params.int('earth')
		target.fireCurrent =+params.int('fire')
		target.waterCurrent =+params.int('water')
		target.blendedCurrent =+params.int('blended')
		target.voidCurrent =+params.int('void')
		target.item.addAll(items)
		downtime.save()
		target.save()
		render  params 
	}
}
