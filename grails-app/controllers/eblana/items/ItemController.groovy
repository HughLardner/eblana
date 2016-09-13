package eblana.items


import static org.springframework.http.HttpStatus.*
import eblana.character.Feat
import eblana.event.Event
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

/**
 * ItemController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class ItemController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def searchService
	def grailsApplication
	
	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def type = Item.executeQuery("select distinct(i.type) from Item i where i.type is not null") as Set
		def duration = Item.executeQuery("select distinct(i.duration) from Item i where i.duration is not null order by i.duration") as Set
		def events = Event.list()
		def feat = Feat.findAllByType('Crafting')
		respond Item.list(params), model:[itemInstanceCount: Item.count(), type:type, duration:duration, events:events, feat:feat]
	}

	def search(){
		def list = searchService.searchItem(params.long('id') ,params.name, params.power1, params.type ,params.duration ,params.created ,params.internal ,params.level ,params.proposed ,params.transferable , params.max, params.offset)
		render(template:'serachResults', model:[itemInstanceList:list, count:list.size()])
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Item.list(params), model:[itemInstanceCount: Item.count()]
	}

	def show(Item itemInstance) {
		respond itemInstance
	}

	def create() {
		respond new Item(params)
	}

	@Transactional
	def save(Item itemInstance) {
		if (itemInstance == null) {
			notFound()
			return
		}

		if (itemInstance.hasErrors()) {
			respond itemInstance.errors, view:'create'
			return
		}

		itemInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'itemInstance.label', default: 'Item'),
					itemInstance.id
				])
				redirect itemInstance
			}
			'*' { respond itemInstance, [status: CREATED] }
		}
	}

	def edit(Item itemInstance) {
		respond itemInstance
	}

	@Transactional
	def update(Item itemInstance) {
		if (itemInstance == null) {
			notFound()
			return
		}

		if (itemInstance.hasErrors()) {
			respond itemInstance.errors, view:'edit'
			return
		}

		itemInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Item.label', default: 'Item'),
					itemInstance.id
				])
				redirect itemInstance
			}
			'*'{ respond itemInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Item itemInstance) {

		if (itemInstance == null) {
			notFound()
			return
		}

		itemInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Item.label', default: 'Item'),
					itemInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'itemInstance.label', default: 'Item'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
	
	def printItems(){
		def ids = params.list('ids[]')*.toLong()	
		def list = Item.findAllByIdInList(ids, [readOnly:true])
		render(view:'printItems', model:[itemInstanceList:list])
		
	}
	
	def fetchItems(){
		def items = Item.executeQuery("select id from Item where created.id = ?", [params.long('event')])
		def g = grailsApplication.mainContext.getBean('org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib')
		render items as JSON
	}
}
