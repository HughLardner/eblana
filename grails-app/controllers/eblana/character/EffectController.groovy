package eblana.character


import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

/**
 * EffectController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class EffectController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Effect.list(params), model:[effectInstanceCount: Effect.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Effect.list(params), model:[effectInstanceCount: Effect.count()]
    }

    def show(Effect effectInstance) {
        respond effectInstance
    }

    def create() {
        respond new Effect(params)
    }

    @Transactional
    def save(Effect effectInstance) {
        if (effectInstance == null) {
            notFound()
            return
        }

        if (effectInstance.hasErrors()) {
            respond effectInstance.errors, view:'create'
            return
        }

        effectInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'effectInstance.label', default: 'Effect'), effectInstance.id])
                redirect effectInstance
            }
            '*' { respond effectInstance, [status: CREATED] }
        }
    }

    def edit(Effect effectInstance) {
        respond effectInstance
    }

    @Transactional
    def update(Effect effectInstance) {
        if (effectInstance == null) {
            notFound()
            return
        }

        if (effectInstance.hasErrors()) {
            respond effectInstance.errors, view:'edit'
            return
        }

        effectInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Effect.label', default: 'Effect'), effectInstance.id])
                redirect effectInstance
            }
            '*'{ respond effectInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Effect effectInstance) {

        if (effectInstance == null) {
            notFound()
            return
        }

        effectInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Effect.label', default: 'Effect'), effectInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'effectInstance.label', default: 'Effect'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
