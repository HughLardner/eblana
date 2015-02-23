package eblana.event


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * CharacterEventController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class CharacterEventController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CharacterEvent.list(params), model:[characterEventInstanceCount: CharacterEvent.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CharacterEvent.list(params), model:[characterEventInstanceCount: CharacterEvent.count()]
    }

    def show(CharacterEvent characterEventInstance) {
        respond characterEventInstance
    }

    def create() {
        respond new CharacterEvent(params)
    }

    @Transactional
    def save(CharacterEvent characterEventInstance) {
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
                flash.message = message(code: 'default.created.message', args: [message(code: 'characterEventInstance.label', default: 'CharacterEvent'), characterEventInstance.id])
                redirect characterEventInstance
            }
            '*' { respond characterEventInstance, [status: CREATED] }
        }
    }

    def edit(CharacterEvent characterEventInstance) {
        respond characterEventInstance
    }

    @Transactional
    def update(CharacterEvent characterEventInstance) {
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
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CharacterEvent.label', default: 'CharacterEvent'), characterEventInstance.id])
                redirect characterEventInstance
            }
            '*'{ respond characterEventInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CharacterEvent characterEventInstance) {

        if (characterEventInstance == null) {
            notFound()
            return
        }

        characterEventInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CharacterEvent.label', default: 'CharacterEvent'), characterEventInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'characterEventInstance.label', default: 'CharacterEvent'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
