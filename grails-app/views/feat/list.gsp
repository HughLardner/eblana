
<%@ page import="eblana.character.Feat" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'feat.label', default: 'Feat')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-feat" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="description" title="${message(code: 'feat.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="name" title="${message(code: 'feat.name.label', default: 'Name')}" />
			
				<th><g:message code="feat.prereqClass.label" default="Prereq Class" /></th>
			
				<th><g:message code="feat.prereqFeat.label" default="Prereq Feat" /></th>
			
				<th><g:message code="feat.prereqSpecies.label" default="Prereq Species" /></th>
			
				<g:sortableColumn property="takeMoreThenOnce" title="${message(code: 'feat.takeMoreThenOnce.label', default: 'Take More Then Once')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${featInstanceList}" status="i" var="featInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${featInstance.id}">${fieldValue(bean: featInstance, field: "description")}</g:link></td>
			
				<td>${fieldValue(bean: featInstance, field: "name")}</td>
			
				<td>${fieldValue(bean: featInstance, field: "prereqClass")}</td>
			
				<td>${fieldValue(bean: featInstance, field: "prereqFeat")}</td>
			
				<td>${fieldValue(bean: featInstance, field: "prereqSpecies")}</td>
			
				<td><g:formatBoolean boolean="${featInstance.takeMoreThenOnce}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${featInstanceCount}" />
	</div>
</section>

</body>

</html>
