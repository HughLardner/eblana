
<%@ page import="eblana.event.EventLore" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'eventLore.label', default: 'EventLore')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-eventLore" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="content" title="${message(code: 'eventLore.content.label', default: 'Content')}" />
			
				<th><g:message code="eventLore.event.label" default="Event" /></th>
			
				<th><g:message code="eventLore.lore.label" default="Lore" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${eventLoreInstanceList}" status="i" var="eventLoreInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${eventLoreInstance.id}">${fieldValue(bean: eventLoreInstance, field: "content")}</g:link></td>
			
				<td>${fieldValue(bean: eventLoreInstance, field: "event")}</td>
			
				<td>${fieldValue(bean: eventLoreInstance, field: "lore")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${eventLoreInstanceCount}" />
	</div>
</section>

</body>

</html>
