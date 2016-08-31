
<%@ page import="eblana.character.Effect" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'effect.label', default: 'Effect')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-effect" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="effect.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: effectInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="effect.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: effectInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="effect.type.label" default="Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: effectInstance, field: "type")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
