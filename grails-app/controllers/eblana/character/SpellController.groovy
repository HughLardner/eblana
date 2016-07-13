package eblana.character


import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

/**
 * SpellController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class SpellController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Spell.list(params), model:[spellInstanceCount: Spell.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Spell.list(params), model:[spellInstanceCount: Spell.count()]
    }
	@Secured(['ROLE_ADMIN','ROLE_USER'])
    def show(Spell spellInstance) {
        respond spellInstance
    }

    def create() {
        respond new Spell(params)
    }

    @Transactional
    def save(Spell spellInstance) {
        if (spellInstance == null) {
            notFound()
            return
        }

        if (spellInstance.hasErrors()) {
            respond spellInstance.errors, view:'create'
            return
        }

        spellInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'spellInstance.label', default: 'Spell'), spellInstance.id])
                redirect spellInstance
            }
            '*' { respond spellInstance, [status: CREATED] }
        }
    }

    def edit(Spell spellInstance) {
        respond spellInstance
    }

    @Transactional
    def update(Spell spellInstance) {
        if (spellInstance == null) {
            notFound()
            return
        }

        if (spellInstance.hasErrors()) {
            respond spellInstance.errors, view:'edit'
            return
        }

        spellInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Spell.label', default: 'Spell'), spellInstance.id])
                redirect spellInstance
            }
            '*'{ respond spellInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Spell spellInstance) {

        if (spellInstance == null) {
            notFound()
            return
        }

        spellInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Spell.label', default: 'Spell'), spellInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'spellInstance.label', default: 'Spell'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
