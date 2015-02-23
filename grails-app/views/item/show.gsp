
<%@ page import="eblana.items.Item" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-item" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="item.duration.label" default="Duration" /></td>
				
				<td valign="top" class="value"><g:link controller="event" action="show" id="${itemInstance?.duration?.id}">${itemInstance?.duration?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="item.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: itemInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="item.singleUse.label" default="Single Use" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${itemInstance?.singleUse}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="item.type.label" default="Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: itemInstance, field: "type")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
