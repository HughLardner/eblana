package eblana.users


import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

/**
 * SecUserController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class SecUserController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def springSecurityService
	def isAuthService

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond SecUser.list(params), model:[secUserInstanceCount: SecUser.count()]
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond SecUser.list(params), model:[secUserInstanceCount: SecUser.count()]
	}
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def show(SecUser secUserInstance) {
		if(isAuthService.hasModifyAuth(secUserInstance))
			render (view:'show', model:[secUserInstance : secUserInstance])
		else
			redirect action: 'auth', params: params
	}

	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def showLogin() {
		redirect (action:'show', id:springSecurityService.currentUser.id)

		//respond springSecurityService.currentUser
	}

	def create() {
		respond new SecUser(params)
	}

	@Transactional
	def save(SecUser secUserInstance) {
		if (secUserInstance == null) {
			notFound()
			return
		}

		if (secUserInstance.hasErrors()) {
			respond secUserInstance.errors, view:'create'
			return
		}

		secUserInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'secUserInstance.label', default: 'SecUser'),
					secUserInstance.id
				])
				redirect secUserInstance
			}
			'*' { respond secUserInstance, [status: CREATED] }
		}
	}
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def edit(SecUser secUserInstance) {
		if(isAuthService.hasModifyAuth(secUserInstance))
			render (view:'edit', model:[secUserInstance : secUserInstance])
		else
			redirect action: 'auth', params: params
	}

	@Transactional
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def update(SecUser secUserInstance) {
		if (secUserInstance == null) {
			notFound()
			return
		}

		if (secUserInstance.hasErrors()) {
			respond secUserInstance.errors, view:'edit'
			return
		}

		secUserInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'SecUser.label', default: 'SecUser'),
					secUserInstance.id
				])
				redirect (action:'show', id:secUserInstance.id)
			}
			'*'{ respond secUserInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(SecUser secUserInstance) {

		if (secUserInstance == null) {
			notFound()
			return
		}

		secUserInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'SecUser.label', default: 'SecUser'),
					secUserInstance.id
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
					message(code: 'secUserInstance.label', default: 'SecUser'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
