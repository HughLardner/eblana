
<%@ page import="eblana.users.SecUser"%>
<!DOCTYPE html>
<html>

<head>
<meta name="layout" content="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'secUser.label', default: 'SecUser')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

	<section id="list-secUser" class="first">

		<table class="table table-bordered margin-top-medium">
			<thead>
				<tr>
					<g:sortableColumn property="id"
						title="${message(code: 'secUser.username.label', default: 'Id')}"
						params="[max:200]" />
					<g:sortableColumn property="username"
						title="${message(code: 'secUser.username.label', default: 'Username')}"
						params="[max:200]" />
					<g:sortableColumn property="firstName"
						title="${message(code: 'secUser.password.label', default: 'First Name')}" />
					<g:sortableColumn property="surname"
						title="${message(code: 'secUser.accountExpired.label', default: 'Surname')}" />
					<g:sortableColumn property="email"
						title="${message(code: 'secUser.accountExpired.label', default: 'Email')}" />
					<g:sortableColumn property="phoneNumber"
						title="${message(code: 'secUser.accountLocked.label', default: 'Phone Number')}" />
					<g:sortableColumn property="emergancyContact"
						title="${message(code: 'secUser.enabled.label', default: 'Emergancy Contact')}" />
					<g:sortableColumn property="emergancyContactNumber"
						title="${message(code: 'secUser.passwordExpired.label', default: 'Emergency Contact Number')}" />
					<g:sortableColumn property="medicalInformation"
						title="${message(code: 'secUser.passwordExpired.label', default: 'Medical Information')}" />
					<g:sortableColumn property="carReg"
						title="${message(code: 'secUser.passwordExpired.label', default: 'Car Registertion')}" />
					<th>${message(code: 'secUser.passwordExpired.label', default: 'Character')}" </th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${secUserInstanceList}" status="i" var="secUserInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
						<td>
							${fieldValue(bean: secUserInstance, field: "id")}
						</td>
						<td><g:link action="show" id="${secUserInstance.id}">
								${fieldValue(bean: secUserInstance, field: "username")}
							</g:link></td>
						<td>
							${fieldValue(bean: secUserInstance, field: "firstName")}
						</td>
						<td>
							${fieldValue(bean: secUserInstance, field: "surname")}
						</td>
						<td>
							${fieldValue(bean: secUserInstance, field: "email")}
						</td>
						<td>
							${fieldValue(bean: secUserInstance, field: "phoneNumber")}
						</td>
						<td>
							${fieldValue(bean: secUserInstance, field: "emergancyContact")}
						</td>
						<td>
							${fieldValue(bean: secUserInstance, field: "emergancyContactNumber")}
						</td>
						<td>
							${fieldValue(bean: secUserInstance, field: "medicalInformation")}
						</td>
						<td>
							${fieldValue(bean: secUserInstance, field: "carReg")}
						</td>
						<td><g:each in="${secUserInstance.character}" status="j"
								var="character">
								<g:if test="${character.alive}">
									<g:link action="show" id="${character.id}">
										${character}
									</g:link>
								</g:if>
							</g:each></td>
					</tr>
				</g:each>
			</tbody>
		</table>
		<div>
			<g:paginate total="${secUserInstanceCount}" />
		</div>
	</section>

</body>

</html>
