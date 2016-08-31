
<%@ page import="eblana.character.PlayerCharacter" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'playerCharacter.label', default: 'PlayerCharacter')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-playerCharacter" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'playerCharacter.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="alive" title="${message(code: 'playerCharacter.alive.label', default: 'Alive')}" />
			
				<g:sortableColumn property="armour" title="${message(code: 'playerCharacter.armour.label', default: 'Armour')}" />
			
				<g:sortableColumn property="background" title="${message(code: 'playerCharacter.background.label', default: 'Background')}" />
						
				<g:sortableColumn property="body" title="${message(code: 'playerCharacter.body.label', default: 'Body')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${playerCharacterInstanceList}" status="i" var="playerCharacterInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${playerCharacterInstance.id}">${fieldValue(bean: playerCharacterInstance, field: "name")}</g:link></td>
			
				<td><g:formatBoolean boolean="${playerCharacterInstance.alive}" /></td>
			
				<td>${fieldValue(bean: playerCharacterInstance, field: "armour")}</td>
			
				<td>${fieldValue(bean: playerCharacterInstance, field: "background")}</td>
					
				<td>${fieldValue(bean: playerCharacterInstance, field: "body")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${playerCharacterInstanceCount}" />
	</div>
</section>

</body>

</html>
