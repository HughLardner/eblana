package eblana.downtime

import eblana.character.PlayerCharacter
import eblana.event.Downtime
import eblana.event.Event
import eblana.event.TransferLog
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
			render (view:'_create', model:[instance : downtimeInstance])
		else
			redirect action: 'auth', params: params
	}

	@Transactional
	def save(){
		Downtime downtime = Downtime.get(params.long('downtime'))
		def event = downtime.event
		def targetCharacter = PlayerCharacter.get(params.long('target'))
		Downtime target = Downtime.findByEventAndCharacter(event, targetCharacter)
		def itemIds = params.list('items')*.toLong()
		def items = Item.findAllByIdInList(itemIds)

		def air = params.int('air')
		def earth = params.int('earth')
		def fire = params.int('fire')
		def water = params.int('water')
		def blended = params.int('blended')
		def voidC = params.int('void')

		if(downtime.airCurrent <= air ||
			downtime.earthCurrent <= earth ||
			downtime.fireCurrent <= fire ||
			downtime.waterCurrent <= water ||
			downtime.blendedCurrent <= blended ||
			downtime.voidCurrent <= voidC ||
			!items.every{downtime.itemCurrent.contains(it)}){
			render "Error - you do not have what you are trying to transfer"
		}
		if(air < 0 ||
			earth < 0 ||
			fire < 0 ||
			water < 0 ||
			blended < 0 ||
			voidC < 0
			){
			render "Error - you do may not transfer an negitive amount of crystals"
		}

		downtime.save()
		target.save()
		new TransferLog(from:downtime, to:target, item:items, air:air, earth:earth, water:water, fire:fire, blended:blended, voidC:voidC).save()
		redirect ( action: "createTransfer", id: downtime.id)
	}
}
