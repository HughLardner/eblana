
<%@ page import="eblana.items.Item" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-item" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="item.duration.label" default="Duration" /></th>
			
				<g:sortableColumn property="name" title="${message(code: 'item.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="singleUse" title="${message(code: 'item.singleUse.label', default: 'Single Use')}" />
			
				<g:sortableColumn property="type" title="${message(code: 'item.type.label', default: 'Type')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${itemInstanceList}" status="i" var="itemInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${itemInstance.id}">${fieldValue(bean: itemInstance, field: "duration")}</g:link></td>
			
				<td>${fieldValue(bean: itemInstance, field: "name")}</td>
			
				<td><g:formatBoolean boolean="${itemInstance.singleUse}" /></td>
			
				<td>${fieldValue(bean: itemInstance, field: "type")}</td>
			
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
