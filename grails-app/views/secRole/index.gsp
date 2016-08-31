
<%@ page import="eblana.users.SecRole" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'secRole.label', default: 'SecRole')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-secRole" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="authority" title="${message(code: 'secRole.authority.label', default: 'Authority')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${secRoleInstanceList}" status="i" var="secRoleInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${secRoleInstance.id}">${fieldValue(bean: secRoleInstance, field: "authority")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${secRoleInstanceCount}" />
	</div>
</section>

</body>

</html>
