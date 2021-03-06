
<%@ page import="eblana.background.Group" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'group.label', default: 'Group')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-group" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'group.name.label', default: 'Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${groupInstanceList}" status="i" var="groupInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${groupInstance.id}">${fieldValue(bean: groupInstance, field: "name")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<g:paginate total="${groupInstanceCount}" />
	</div>
</section>

</body>

</html>
