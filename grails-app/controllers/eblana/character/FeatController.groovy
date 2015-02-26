package eblana.character


import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

/**
 * FeatController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class FeatController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Feat.list(params), model:[featInstanceCount: Feat.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Feat.list(params), model:[featInstanceCount: Feat.count()]
    }
	@Secured(['ROLE_ADMIN','ROLE_USER'])
    def show(Feat featInstance) {
        respond featInstance
    }

    def create() {
        respond new Feat(params)
    }

    @Transactional
    def save(Feat featInstance) {
        if (featInstance == null) {
            notFound()
            return
        }

        if (featInstance.hasErrors()) {
            respond featInstance.errors, view:'create'
            return
        }

        featInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'featInstance.label', default: 'Feat'), featInstance.id])
                redirect featInstance
            }
            '*' { respond featInstance, [status: CREATED] }
        }
    }

    def edit(Feat featInstance) {
        respond featInstance
    }

    @Transactional
    def update(Feat featInstance) {
        if (featInstance == null) {
            notFound()
            return
        }

        if (featInstance.hasErrors()) {
            respond featInstance.errors, view:'edit'
            return
        }

        featInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Feat.label', default: 'Feat'), featInstance.id])
                redirect featInstance
            }
            '*'{ respond featInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Feat featInstance) {

        if (featInstance == null) {
            notFound()
            return
        }

        featInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Feat.label', default: 'Feat'), featInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'featInstance.label', default: 'Feat'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
