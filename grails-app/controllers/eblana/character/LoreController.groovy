package eblana.character


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * LoreController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class LoreController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Lore.list(params), model:[loreInstanceCount: Lore.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Lore.list(params), model:[loreInstanceCount: Lore.count()]
    }

    def show(Lore loreInstance) {
        respond loreInstance
    }

    def create() {
        respond new Lore(params)
    }

    @Transactional
    def save(Lore loreInstance) {
        if (loreInstance == null) {
            notFound()
            return
        }

        if (loreInstance.hasErrors()) {
            respond loreInstance.errors, view:'create'
            return
        }

        loreInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'loreInstance.label', default: 'Lore'), loreInstance.id])
                redirect loreInstance
            }
            '*' { respond loreInstance, [status: CREATED] }
        }
    }

    def edit(Lore loreInstance) {
        respond loreInstance
    }

    @Transactional
    def update(Lore loreInstance) {
        if (loreInstance == null) {
            notFound()
            return
        }

        if (loreInstance.hasErrors()) {
            respond loreInstance.errors, view:'edit'
            return
        }

        loreInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Lore.label', default: 'Lore'), loreInstance.id])
                redirect loreInstance
            }
            '*'{ respond loreInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Lore loreInstance) {

        if (loreInstance == null) {
            notFound()
            return
        }

        loreInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Lore.label', default: 'Lore'), loreInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'loreInstance.label', default: 'Lore'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
