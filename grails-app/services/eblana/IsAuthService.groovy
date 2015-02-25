package eblana

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.transaction.Transactional

/**
 * IsAuthService
 * A service class encapsulates the core business logic of a Grails application
 */
@Transactional
class IsAuthService {

	def springSecurityService
	def serviceMethod() {
	}

	boolean hasModifyAuth(instance) {
		if (SpringSecurityUtils.ifAnyGranted("ROLE_ADMIN")
		|| instance == springSecurityService.currentUser) {
			return true
		} else {
			return false
		}
	}
}
