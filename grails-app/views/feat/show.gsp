
<%@ page import="eblana.character.Feat" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'feat.label', default: 'Feat')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-feat" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="feat.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: featInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="feat.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: featInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="feat.prereqClass.label" default="Prereq Class" /></td>
				
				<td valign="top" class="value"><g:link controller="classes" action="show" id="${featInstance?.prereqClass?.id}">${featInstance?.prereqClass?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="feat.prereqFeat.label" default="Prereq Feat" /></td>
				
				<td valign="top" class="value"><g:link controller="feat" action="show" id="${featInstance?.prereqFeat?.id}">${featInstance?.prereqFeat?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="feat.prereqSpecies.label" default="Prereq Species" /></td>
				
				<td valign="top" class="value"><g:link controller="species" action="show" id="${featInstance?.prereqSpecies?.id}">${featInstance?.prereqSpecies?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="feat.takeMoreThenOnce.label" default="Take More Then Once" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${featInstance?.takeMoreThenOnce}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="feat.type.label" default="Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: featInstance, field: "type")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="feat.visiable.label" default="Visiable" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${featInstance?.visiable}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
