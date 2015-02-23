package eblana.character


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * SpeciesController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class SpeciesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Species.list(params), model:[speciesInstanceCount: Species.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Species.list(params), model:[speciesInstanceCount: Species.count()]
    }

    def show(Species speciesInstance) {
        respond speciesInstance
    }

    def create() {
        respond new Species(params)
    }

    @Transactional
    def save(Species speciesInstance) {
        if (speciesInstance == null) {
            notFound()
            return
        }

        if (speciesInstance.hasErrors()) {
            respond speciesInstance.errors, view:'create'
            return
        }

        speciesInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'speciesInstance.label', default: 'Species'), speciesInstance.id])
                redirect speciesInstance
            }
            '*' { respond speciesInstance, [status: CREATED] }
        }
    }

    def edit(Species speciesInstance) {
        respond speciesInstance
    }

    @Transactional
    def update(Species speciesInstance) {
        if (speciesInstance == null) {
            notFound()
            return
        }

        if (speciesInstance.hasErrors()) {
            respond speciesInstance.errors, view:'edit'
            return
        }

        speciesInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Species.label', default: 'Species'), speciesInstance.id])
                redirect speciesInstance
            }
            '*'{ respond speciesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Species speciesInstance) {

        if (speciesInstance == null) {
            notFound()
            return
        }

        speciesInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Species.label', default: 'Species'), speciesInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'speciesInstance.label', default: 'Species'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
