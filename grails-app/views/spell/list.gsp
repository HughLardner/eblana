
<%@ page import="eblana.character.Spell" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'spell.label', default: 'Spell')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-spell" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="spell.classes.label" default="Classes" /></th>
			
				<th><g:message code="spell.effect.label" default="Effect" /></th>
			
				<g:sortableColumn property="post" title="${message(code: 'spell.post.label', default: 'Post')}" />
			
				<g:sortableColumn property="pre" title="${message(code: 'spell.pre.label', default: 'Pre')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${spellInstanceList}" status="i" var="spellInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${spellInstance.id}">${fieldValue(bean: spellInstance, field: "classes")}</g:link></td>
			
				<td>${fieldValue(bean: spellInstance, field: "effect")}</td>
			
				<td>${fieldValue(bean: spellInstance, field: "post")}</td>
			
				<td>${fieldValue(bean: spellInstance, field: "pre")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${spellInstanceCount}" />
	</div>
</section>

</body>

</html>
