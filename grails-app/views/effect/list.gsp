
<%@ page import="eblana.character.Effect" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'effect.label', default: 'Effect')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-effect" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="description" title="${message(code: 'effect.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="name" title="${message(code: 'effect.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="type" title="${message(code: 'effect.type.label', default: 'Type')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${effectInstanceList}" status="i" var="effectInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${effectInstance.id}">${fieldValue(bean: effectInstance, field: "description")}</g:link></td>
			
				<td>${fieldValue(bean: effectInstance, field: "name")}</td>
			
				<td>${fieldValue(bean: effectInstance, field: "type")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<g:paginate total="${effectInstanceCount}" />
	</div>
</section>

</body>

</html>
