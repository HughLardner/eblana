
<%@ page import="eblana.event.CraftLog" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'craftLog.label', default: 'CraftLog')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-craftLog" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="airCrystals" title="${message(code: 'craftLog.airCrystals.label', default: 'Air Crystals')}" />
			
				<g:sortableColumn property="blendedCrystals" title="${message(code: 'craftLog.blendedCrystals.label', default: 'Blended Crystals')}" />
			
				<th><g:message code="craftLog.downtime.label" default="Downtime" /></th>
			
				<g:sortableColumn property="earthCrystals" title="${message(code: 'craftLog.earthCrystals.label', default: 'Earth Crystals')}" />
			
				<g:sortableColumn property="fireCrystals" title="${message(code: 'craftLog.fireCrystals.label', default: 'Fire Crystals')}" />
			
				<th><g:message code="craftLog.item.label" default="Item" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${craftLogInstanceList}" status="i" var="craftLogInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${craftLogInstance.id}">${fieldValue(bean: craftLogInstance, field: "airCrystals")}</g:link></td>
			
				<td>${fieldValue(bean: craftLogInstance, field: "blendedCrystals")}</td>
			
				<td>${fieldValue(bean: craftLogInstance, field: "downtime")}</td>
			
				<td>${fieldValue(bean: craftLogInstance, field: "earthCrystals")}</td>
			
				<td>${fieldValue(bean: craftLogInstance, field: "fireCrystals")}</td>
			
				<td>${fieldValue(bean: craftLogInstance, field: "item")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${craftLogInstanceCount}" />
	</div>
</section>

</body>

</html>
