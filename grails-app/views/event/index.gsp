
<%@ page import="eblana.event.Event"%>
<!DOCTYPE html>
<html>

<head>
<meta name="layout" content="kickstart" />
<g:set var="entityName"
	value="${message(code: 'event.label', default: 'Event')}" />
<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

	<section id="index-event" class="first">

		<table class="table table-bordered margin-top-medium">
			<thead>
				<tr>
					<g:sortableColumn property="eventNumber"
						title="${message(code: 'event.name.label', default: 'Number')}" />
					<g:sortableColumn property="name"
						title="${message(code: 'event.name.label', default: 'Name')}" />
					<g:sortableColumn property="date"
						title="${message(code: 'event.name.label', default: 'Date')}" />
					<g:sortableColumn property="lastEvent"
						title="${message(code: 'event.name.label', default: 'Downtime Open')}" />
					<g:sortableColumn property="currentDowntime"
						title="${message(code: 'event.name.label', default: 'Current Downtime')}" />
					<g:sortableColumn property="downtimeDone"
						title="${message(code: 'event.name.label', default: 'Downtime Done')}" />
					<td>Attendance</td>
			</thead>
			<tbody>
				<g:each in="${eventInstanceList}" status="i" var="eventInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
						<td>
							${fieldValue(bean: eventInstance, field: "eventNumber")}
						</td>
						<td><g:link action="show" id="${eventInstance.id}">
								${fieldValue(bean: eventInstance, field: "name")}
							</g:link></td>
						<td>
							${fieldValue(bean: eventInstance, field: "date")}
						</td>
						<td>
							${fieldValue(bean: eventInstance, field: "lastEvent")}
						</td>
						<td>
							${fieldValue(bean: eventInstance, field: "currentDowntime")}
						</td>
						<td>
							${fieldValue(bean: eventInstance, field: "downtimeDone")}
						</td>
						<td>
							${eventInstance.attended.size()}
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>
		<div>
			<bs:paginate total="${eventInstanceCount}" />
		</div>
	</section>

</body>

</html>
