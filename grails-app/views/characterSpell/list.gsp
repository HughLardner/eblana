
<%@ page import="eblana.character.CharacterSpell" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'characterSpell.label', default: 'CharacterSpell')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-characterSpell" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="characterSpell.character.label" default="Character" /></th>
			
				<th><g:message code="characterSpell.effect1.label" default="Effect1" /></th>
			
				<th><g:message code="characterSpell.effect2.label" default="Effect2" /></th>
			
				<g:sortableColumn property="source" title="${message(code: 'characterSpell.source.label', default: 'Source')}" />
			
				<th><g:message code="characterSpell.spell.label" default="Spell" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${characterSpellInstanceList}" status="i" var="characterSpellInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${characterSpellInstance.id}">${fieldValue(bean: characterSpellInstance, field: "character")}</g:link></td>
			
				<td>${fieldValue(bean: characterSpellInstance, field: "effect1")}</td>
			
				<td>${fieldValue(bean: characterSpellInstance, field: "effect2")}</td>
			
				<td>${fieldValue(bean: characterSpellInstance, field: "source")}</td>
			
				<td>${fieldValue(bean: characterSpellInstance, field: "spell")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${characterSpellInstanceCount}" />
	</div>
</section>

</body>

</html>
