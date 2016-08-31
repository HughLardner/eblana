
<%@ page import="eblana.event.EventLore" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'eventLore.label', default: 'EventLore')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-eventLore" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="eventLore.content.label" default="Content" /></td>
				
				<td valign="top" class="value">${raw(eventLoreInstance.content)}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="eventLore.event.label" default="Event" /></td>
				
				<td valign="top" class="value"><g:link controller="event" action="show" id="${eventLoreInstance?.event?.id}">${eventLoreInstance?.event?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="eventLore.lore.label" default="Lore" /></td>
				
				<td valign="top" class="value"><g:link controller="lore" action="show" id="${eventLoreInstance?.lore?.id}">${eventLoreInstance?.lore?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
