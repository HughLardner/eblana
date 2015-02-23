package eblana.users.register

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class RegisterController extends grails.plugin.springsecurity.ui.RegisterController {
}
