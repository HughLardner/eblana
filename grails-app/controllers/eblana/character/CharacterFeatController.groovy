package eblana.character


import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

/**
 * CharacterFeatController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class CharacterFeatController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CharacterFeat.list(params), model:[characterFeatInstanceCount: CharacterFeat.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CharacterFeat.list(params), model:[characterFeatInstanceCount: CharacterFeat.count()]
    }

    def show(CharacterFeat characterFeatInstance) {
        respond characterFeatInstance
    }

    def create() {
        respond new CharacterFeat(params)
    }

    @Transactional
    def save(CharacterFeat characterFeatInstance) {
        if (characterFeatInstance == null) {
            notFound()
            return
        }

        if (characterFeatInstance.hasErrors()) {
            respond characterFeatInstance.errors, view:'create'
            return
        }

        characterFeatInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'characterFeatInstance.label', default: 'CharacterFeat'), characterFeatInstance.id])
                redirect characterFeatInstance
            }
            '*' { respond characterFeatInstance, [status: CREATED] }
        }
    }

    def edit(CharacterFeat characterFeatInstance) {
        respond characterFeatInstance
    }

    @Transactional
    def update(CharacterFeat characterFeatInstance) {
        if (characterFeatInstance == null) {
            notFound()
            return
        }

        if (characterFeatInstance.hasErrors()) {
            respond characterFeatInstance.errors, view:'edit'
            return
        }

        characterFeatInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CharacterFeat.label', default: 'CharacterFeat'), characterFeatInstance.id])
                redirect characterFeatInstance
            }
            '*'{ respond characterFeatInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CharacterFeat characterFeatInstance) {

        if (characterFeatInstance == null) {
            notFound()
            return
        }

        characterFeatInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CharacterFeat.label', default: 'CharacterFeat'), characterFeatInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'characterFeatInstance.label', default: 'CharacterFeat'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
