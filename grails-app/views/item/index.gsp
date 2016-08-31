
<%@ page import="eblana.items.Item" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-item" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="attunementTime" title="${message(code: 'item.attunementTime.label', default: 'Attunement Time')}" />
			
				<g:sortableColumn property="convertedCrystalCost" title="${message(code: 'item.convertedCrystalCost.label', default: 'Converted Crystal Cost')}" />
			
				<g:sortableColumn property="curseCure" title="${message(code: 'item.curseCure.label', default: 'Curse Cure')}" />
			
				<g:sortableColumn property="duration" title="${message(code: 'item.duration.label', default: 'Duration')}" />
			
				<g:sortableColumn property="internalNotes" title="${message(code: 'item.internalNotes.label', default: 'Internal Notes')}" />
			
				<g:sortableColumn property="name" title="${message(code: 'item.name.label', default: 'Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${itemInstanceList}" status="i" var="itemInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${itemInstance.id}">${fieldValue(bean: itemInstance, field: "attunementTime")}</g:link></td>
			
				<td>${fieldValue(bean: itemInstance, field: "convertedCrystalCost")}</td>
			
				<td>${fieldValue(bean: itemInstance, field: "curseCure")}</td>
			
				<td>${fieldValue(bean: itemInstance, field: "duration")}</td>
			
				<td>${fieldValue(bean: itemInstance, field: "internalNotes")}</td>
			
				<td>${fieldValue(bean: itemInstance, field: "name")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${itemInstanceCount}" />
	</div>
</section>

</body>

</html>
