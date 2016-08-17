
<%@ page import="eblana.users.User" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-user" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.username.label" default="Username" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "username")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.password.label" default="Password" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "password")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.accountExpired.label" default="Account Expired" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.accountExpired}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.accountLocked.label" default="Account Locked" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.accountLocked}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.carReg.label" default="Car Reg" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "carReg")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.character.label" default="Character" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${userInstance.character}" var="c">
						<li><g:link controller="playerCharacter" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.emergancyContact.label" default="Emergancy Contact" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "emergancyContact")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.emergancyContactNumber.label" default="Emergancy Contact Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "emergancyContactNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.enabled.label" default="Enabled" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.enabled}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.firstName.label" default="First Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "firstName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.medicalInformation.label" default="Medical Information" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "medicalInformation")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.passwordExpired.label" default="Password Expired" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.phoneNumber.label" default="Phone Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "phoneNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.surname.label" default="Surname" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "surname")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
