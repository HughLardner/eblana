
<%@ page import="eblana.character.Species" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'species.label', default: 'Species')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-species" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'species.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="visiable" title="${message(code: 'species.visiable.label', default: 'Visiable')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${speciesInstanceList}" status="i" var="speciesInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${speciesInstance.id}">${fieldValue(bean: speciesInstance, field: "name")}</g:link></td>
			
				<td><g:formatBoolean boolean="${speciesInstance.visiable}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<g:paginate total="${speciesInstanceCount}" />
	</div>
</section>

</body>

</html>
