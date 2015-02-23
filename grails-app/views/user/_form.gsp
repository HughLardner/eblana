<%@ page import="eblana.users.User" %>



			<div class="${hasErrors(bean: userInstance, field: 'username', 'error')} ">
				<label for="username" class="control-label"><g:message code="user.username.label" default="Username" /></label>
				<div>
					<g:textField class="form-control" name="username" value="${userInstance?.username}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'username', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'password', 'error')} ">
				<label for="password" class="control-label"><g:message code="user.password.label" default="Password" /></label>
				<div>
					<g:textField class="form-control" name="password" value="${userInstance?.password}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'password', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
				<label for="accountExpired" class="control-label"><g:message code="user.accountExpired.label" default="Account Expired" /></label>
				<div>
					<bs:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'accountExpired', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
				<label for="accountLocked" class="control-label"><g:message code="user.accountLocked.label" default="Account Locked" /></label>
				<div>
					<bs:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'accountLocked', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'carReg', 'error')} ">
				<label for="carReg" class="control-label"><g:message code="user.carReg.label" default="Car Reg" /></label>
				<div>
					<g:textField class="form-control" name="carReg" value="${userInstance?.carReg}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'carReg', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'character', 'error')} ">
				<label for="character" class="control-label"><g:message code="user.character.label" default="Character" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${userInstance?.character?}" var="c">
    <li><g:link controller="playerCharacter" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="playerCharacter" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'playerCharacter.label', default: 'PlayerCharacter')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: userInstance, field: 'character', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'email', 'error')} ">
				<label for="email" class="control-label"><g:message code="user.email.label" default="Email" /></label>
				<div>
					<g:textField class="form-control" name="email" value="${userInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'email', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'emergancyContact', 'error')} ">
				<label for="emergancyContact" class="control-label"><g:message code="user.emergancyContact.label" default="Emergancy Contact" /></label>
				<div>
					<g:textField class="form-control" name="emergancyContact" value="${userInstance?.emergancyContact}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'emergancyContact', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'emergancyContactNumber', 'error')} ">
				<label for="emergancyContactNumber" class="control-label"><g:message code="user.emergancyContactNumber.label" default="Emergancy Contact Number" /></label>
				<div>
					<g:textField class="form-control" name="emergancyContactNumber" value="${userInstance?.emergancyContactNumber}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'emergancyContactNumber', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
				<label for="enabled" class="control-label"><g:message code="user.enabled.label" default="Enabled" /></label>
				<div>
					<bs:checkBox name="enabled" value="${userInstance?.enabled}" />
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'enabled', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'firstName', 'error')} ">
				<label for="firstName" class="control-label"><g:message code="user.firstName.label" default="First Name" /></label>
				<div>
					<g:textField class="form-control" name="firstName" value="${userInstance?.firstName}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'firstName', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'medicalInformation', 'error')} ">
				<label for="medicalInformation" class="control-label"><g:message code="user.medicalInformation.label" default="Medical Information" /></label>
				<div>
					<g:textField class="form-control" name="medicalInformation" value="${userInstance?.medicalInformation}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'medicalInformation', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
				<label for="passwordExpired" class="control-label"><g:message code="user.passwordExpired.label" default="Password Expired" /></label>
				<div>
					<bs:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'phoneNumber', 'error')} ">
				<label for="phoneNumber" class="control-label"><g:message code="user.phoneNumber.label" default="Phone Number" /></label>
				<div>
					<g:textField class="form-control" name="phoneNumber" value="${userInstance?.phoneNumber}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'phoneNumber', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'surname', 'error')} ">
				<label for="surname" class="control-label"><g:message code="user.surname.label" default="Surname" /></label>
				<div>
					<g:textField class="form-control" name="surname" value="${userInstance?.surname}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'surname', 'error')}</span>
				</div>
			</div>

