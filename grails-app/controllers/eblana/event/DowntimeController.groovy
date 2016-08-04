package eblana.event


import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

/**
 * DowntimeController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class DowntimeController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Downtime.list(params), model:[characterEventInstanceCount: Downtime.count()]
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Downtime.list(params), model:[characterEventInstanceCount: Downtime.count()]
	}

	def show(Downtime characterEventInstance) {
		println characterEventInstance
		respond characterEventInstance
	}

	def create() {
		respond new Downtime(params)
	}

	def massCrystalEntry() {
		def event = Event.get(Long.parseLong(params.get("event")))
		println event
		render(view : "massCrystalEntry", model:[event:event]);
	}
	@Transactional
	def saveReturns(){
		println "HERE"
		println params as JSON
	}

	@Transactional
	def save(Downtime characterEventInstance) {
		if (characterEventInstance == null) {
			notFound()
			return
		}

		if (characterEventInstance.hasErrors()) {
			respond characterEventInstance.errors, view:'create'
			return
		}

		characterEventInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'characterEventInstance.label', default: 'Downtime'),
					characterEventInstance.id
				])
				redirect characterEventInstance
			}
			'*' { respond characterEventInstance, [status: CREATED] }
		}
	}

	def edit(Downtime characterEventInstance) {
		respond characterEventInstance
	}

	@Transactional
	def update(Downtime characterEventInstance) {
		if (characterEventInstance == null) {
			notFound()
			return
		}

		if (characterEventInstance.hasErrors()) {
			respond characterEventInstance.errors, view:'edit'
			return
		}

		characterEventInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Downtime.label', default: 'Downtime'),
					characterEventInstance.id
				])
				redirect characterEventInstance
			}
			'*'{ respond characterEventInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Downtime characterEventInstance) {

		if (characterEventInstance == null) {
			notFound()
			return
		}

		characterEventInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Downtime.label', default: 'Downtime'),
					characterEventInstance.id
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
					message(code: 'characterEventInstance.label', default: 'Downtime'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}

	def craft(Downtime downtime){
		println downtime
		render(view : "craft", model:[downtime:downtime]);
	}

	def search(){
		render(view:'search')
	}

	def String wrapSearchParm(value) {
		'%'+value+'%'
	}

	def searchTitle={
		println 'test'
		def list = Downtime.findAllByFinalDecisionIlike(wrapSearchParm(params.searchvalue))
		render(template:'searchResults', model:[searchresults:list])
	}

	def searchGeneral={
		def term = wrapSearchParm(params.searchvalue)
		def d = Downtime.createCriteria()
		def list = d.list (max:10,offset:0){
			or{
				like('research',term)
				like('researchResources',term)
				like('researchMethod',term)
				like('goal',term)
				like('finalDecision',term)
				character{ like('name',term) }
				event{ like('name',term) }
			}
		}
		render(template:'searchResults', model:[searchresults:list])
	}

	def searchSpecific={
		def term = wrapSearchParm(params.searchvalue)
		def d = Downtime.createCriteria()
		def list = d.list (){
			and{
				or{
					like('research',term)
					like('researchResources',term)
					like('researchMethod',term)
					like('goal',term)
					like('finalDecision',term)
					character{ like('name',term) }
					event{ like('name',term) }
				}
				or{
					isNull("research")
					like('research',wrapSearchParm(params.research))
				}
				or{
					isNull("researchResources")
					like('researchResources',wrapSearchParm(params.resources))
				}
				or{
					isNull("researchMethod")
					like('researchMethod',wrapSearchParm(params.method))
				}
				or{
					isNull("goal")
					like('goal',wrapSearchParm(params.goal))
				}
				or{
					isNull("finalDecision")
					like('finalDecision',wrapSearchParm(params.result))
				}
				character{ like('name',wrapSearchParm(params.character)) }
				event{
					or{
						like('name',wrapSearchParm(params.event))
						eq('eventNumber',params.int('event'))
					}
				}
			}
		}
		render(template:'searchResults', model:[searchresults:list, count:list.size()])
	}
}
