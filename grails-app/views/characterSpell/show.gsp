
<%@ page import="eblana.character.CharacterSpell" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'characterSpell.label', default: 'CharacterSpell')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-characterSpell" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="characterSpell.character.label" default="Character" /></td>
				
				<td valign="top" class="value"><g:link controller="playerCharacter" action="show" id="${characterSpellInstance?.character?.id}">${characterSpellInstance?.character?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="characterSpell.effect1.label" default="Effect1" /></td>
				
				<td valign="top" class="value"><g:link controller="effect" action="show" id="${characterSpellInstance?.effect1?.id}">${characterSpellInstance?.effect1?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="characterSpell.effect2.label" default="Effect2" /></td>
				
				<td valign="top" class="value"><g:link controller="effect" action="show" id="${characterSpellInstance?.effect2?.id}">${characterSpellInstance?.effect2?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="characterSpell.source.label" default="Source" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: characterSpellInstance, field: "source")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="characterSpell.spell.label" default="Spell" /></td>
				
				<td valign="top" class="value"><g:link controller="spell" action="show" id="${characterSpellInstance?.spell?.id}">${characterSpellInstance?.spell?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
