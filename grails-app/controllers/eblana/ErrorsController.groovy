package eblana

import grails.plugin.springsecurity.annotation.Secured

/**
 * ErrorsController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['permitAll'])
class ErrorsController {

	def error403() {}

	def error500() {
		render view: '/error'
	}
}
