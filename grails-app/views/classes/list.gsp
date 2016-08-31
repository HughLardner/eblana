
<%@ page import="eblana.character.Classes" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'classes.label', default: 'Classes')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-classes" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="level" title="${message(code: 'classes.level.label', default: 'Level')}" />
			
				<g:sortableColumn property="name" title="${message(code: 'classes.name.label', default: 'Name')}" />
			
				<th><g:message code="classes.prerequisite.label" default="Prerequisite" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${classesInstanceList}" status="i" var="classesInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${classesInstance.id}">${fieldValue(bean: classesInstance, field: "level")}</g:link></td>
			
				<td>${fieldValue(bean: classesInstance, field: "name")}</td>
			
				<td>${fieldValue(bean: classesInstance, field: "prerequisite")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${classesInstanceCount}" />
	</div>
</section>

</body>

</html>
