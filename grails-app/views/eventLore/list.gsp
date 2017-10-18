
<%@ page import="eblana.event.EventLore"%>
<!DOCTYPE html>
<html>

<head>
<meta name="layout" content="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'eventLore.label', default: 'EventLore')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

	<section id="list-eventLore" class="first">

		<table class="table table-bordered margin-top-medium">
			<thead>
				<tr>

					<g:sortableColumn property="event"
						title="${message(code: 'eventLore.event.label', default: 'Event')}" />
					<g:sortableColumn property="lore"
						title="${message(code: 'eventLore.lore.label', default: 'Lore')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${eventLoreInstanceList}" status="i"
					var="eventLoreInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

						<td><g:link action="show" id="${eventLoreInstance.id}">
								${fieldValue(bean: eventLoreInstance, field: "event")}
							</g:link></td>

						<td>
							${fieldValue(bean: eventLoreInstance, field: "lore")}
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div>
			<g:paginate total="${eventLoreInstanceCount}" />
		</div>
	</section>

</body>

</html>
