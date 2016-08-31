
<%@ page import="eblana.event.Downtime" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'characterEvent.label', default: 'Downtime')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-characterEvent" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="airCrystals" title="${message(code: 'characterEvent.airCrystals.label', default: 'Air Crystals')}" />
			
				<g:sortableColumn property="blendedCrystals" title="${message(code: 'characterEvent.blendedCrystals.label', default: 'Blended Crystals')}" />
			
				<th><g:message code="characterEvent.character.label" default="Character" /></th>
			
				<g:sortableColumn property="earthCrystals" title="${message(code: 'characterEvent.earthCrystals.label', default: 'Earth Crystals')}" />
			
				<th><g:message code="characterEvent.event.label" default="Event" /></th>
			
				<g:sortableColumn property="finalDecision" title="${message(code: 'characterEvent.finalDecision.label', default: 'Final Decision')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${characterEventInstanceList}" status="i" var="characterEventInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${characterEventInstance.id}">${fieldValue(bean: characterEventInstance, field: "airCrystals")}</g:link></td>
			
				<td>${fieldValue(bean: characterEventInstance, field: "blendedCrystals")}</td>
			
				<td>${fieldValue(bean: characterEventInstance, field: "character")}</td>
			
				<td>${fieldValue(bean: characterEventInstance, field: "earthCrystals")}</td>
			
				<td>${fieldValue(bean: characterEventInstance, field: "event")}</td>
			
				<td>${fieldValue(bean: characterEventInstance, field: "finalDecision")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${characterEventInstanceCount}" />
	</div>
</section>

</body>

</html>
