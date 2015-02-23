package eblana.background


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * GodController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class GodController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond God.list(params), model:[godInstanceCount: God.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond God.list(params), model:[godInstanceCount: God.count()]
    }

    def show(God godInstance) {
        respond godInstance
    }

    def create() {
        respond new God(params)
    }

    @Transactional
    def save(God godInstance) {
        if (godInstance == null) {
            notFound()
            return
        }

        if (godInstance.hasErrors()) {
            respond godInstance.errors, view:'create'
            return
        }

        godInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'godInstance.label', default: 'God'), godInstance.id])
                redirect godInstance
            }
            '*' { respond godInstance, [status: CREATED] }
        }
    }

    def edit(God godInstance) {
        respond godInstance
    }

    @Transactional
    def update(God godInstance) {
        if (godInstance == null) {
            notFound()
            return
        }

        if (godInstance.hasErrors()) {
            respond godInstance.errors, view:'edit'
            return
        }

        godInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'God.label', default: 'God'), godInstance.id])
                redirect godInstance
            }
            '*'{ respond godInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(God godInstance) {

        if (godInstance == null) {
            notFound()
            return
        }

        godInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'God.label', default: 'God'), godInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'godInstance.label', default: 'God'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
