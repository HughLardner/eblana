
<%@ page import="eblana.event.Event" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-event" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="event.characterEvent.label" default="Character Event" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${eventInstance.characterEvent}" var="c">
						<li><g:link controller="characterEvent" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="event.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: eventInstance, field: "name")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
