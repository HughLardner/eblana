
<%@ page import="eblana.users.SecUser"%>
<!DOCTYPE html>
<html>

<head>
<meta name="layout" content="kickstart" />
<g:set var="entityName"
	value="${message(code: 'secUser.label', default: 'SecUser')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

	<section id="show-secUser" class="first">

		<table class="table">
			<tbody>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="secUser.username.label" default="Username" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: secUserInstance, field: "username")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="secUser.username.label" default="First Name" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: secUserInstance, field: "firstName")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="secUser.username.label" default="Surname" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: secUserInstance, field: "surname")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="secUser.username.label" default="Phone Number" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: secUserInstance, field: "phoneNumber")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="secUser.username.label" default="Email" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: secUserInstance, field: "email")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="secUser.username.label" default="Emergancy Contact" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: secUserInstance, field: "emergancyContact")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="secUser.username.label" default="Emergancy Contact Number" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: secUserInstance, field: "emergancyContactNumber")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="secUser.username.label" default="Car Registration" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: secUserInstance, field: "carReg")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="secUser.username.label" default="Medical Information" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: secUserInstance, field: "medicalInformation")}
					</td>

				</tr>

			</tbody>
		</table>
		
			<g:each in="${secUserInstance?.character}" status="i"
					var="playerCharacterInstance">
					<g:if test = "${playerCharacterInstance.alive}">
					
					<div>
						<label for="chracter" class="control-label"> </label>
						<g:render template="/playerCharacter/showForm"
							model="['playerCharacterInstance': playerCharacterInstance]" />
					</div>
					</g:if>
				</g:each>
	</section>

</body>

</html>
