
<%@ page import="eblana.character.Species" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'species.label', default: 'Species')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-species" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="species.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: speciesInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="species.visiable.label" default="Visiable" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${speciesInstance?.visiable}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
