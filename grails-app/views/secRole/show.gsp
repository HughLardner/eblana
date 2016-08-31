
<%@ page import="eblana.users.SecRole" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'secRole.label', default: 'SecRole')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-secRole" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="secRole.authority.label" default="Authority" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: secRoleInstance, field: "authority")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
