
<%@ page import="eblana.users.SecUserSecRole" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'secUserSecRole.label', default: 'SecUserSecRole')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-secUserSecRole" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="secUserSecRole.secRole.label" default="Sec Role" /></th>
			
				<th><g:message code="secUserSecRole.secUser.label" default="Sec User" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${secUserSecRoleInstanceList}" status="i" var="secUserSecRoleInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${secUserSecRoleInstance.id}">${fieldValue(bean: secUserSecRoleInstance, field: "secRole")}</g:link></td>
			
				<td>${fieldValue(bean: secUserSecRoleInstance, field: "secUser")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<g:paginate total="${secUserSecRoleInstanceCount}" />
	</div>
</section>

</body>

</html>
