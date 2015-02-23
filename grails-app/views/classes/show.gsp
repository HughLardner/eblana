
<%@ page import="eblana.character.Classes" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'classes.label', default: 'Classes')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-classes" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="classes.level.label" default="Level" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: classesInstance, field: "level")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="classes.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: classesInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="classes.prerequisite.label" default="Prerequisite" /></td>
				
				<td valign="top" class="value"><g:link controller="classes" action="show" id="${classesInstance?.prerequisite?.id}">${classesInstance?.prerequisite?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
