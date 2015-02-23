package eblana.character


import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

/**
 * CharacterSpellController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class CharacterSpellController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CharacterSpell.list(params), model:[characterSpellInstanceCount: CharacterSpell.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CharacterSpell.list(params), model:[characterSpellInstanceCount: CharacterSpell.count()]
    }

    def show(CharacterSpell characterSpellInstance) {
        respond characterSpellInstance
    }

    def create() {
        respond new CharacterSpell(params)
    }

    @Transactional
    def save(CharacterSpell characterSpellInstance) {
        if (characterSpellInstance == null) {
            notFound()
            return
        }

        if (characterSpellInstance.hasErrors()) {
            respond characterSpellInstance.errors, view:'create'
            return
        }

        characterSpellInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'characterSpellInstance.label', default: 'CharacterSpell'), characterSpellInstance.id])
                redirect characterSpellInstance
            }
            '*' { respond characterSpellInstance, [status: CREATED] }
        }
    }

    def edit(CharacterSpell characterSpellInstance) {
        respond characterSpellInstance
    }

    @Transactional
    def update(CharacterSpell characterSpellInstance) {
        if (characterSpellInstance == null) {
            notFound()
            return
        }

        if (characterSpellInstance.hasErrors()) {
            respond characterSpellInstance.errors, view:'edit'
            return
        }

        characterSpellInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CharacterSpell.label', default: 'CharacterSpell'), characterSpellInstance.id])
                redirect characterSpellInstance
            }
            '*'{ respond characterSpellInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CharacterSpell characterSpellInstance) {

        if (characterSpellInstance == null) {
            notFound()
            return
        }

        characterSpellInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CharacterSpell.label', default: 'CharacterSpell'), characterSpellInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'characterSpellInstance.label', default: 'CharacterSpell'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
