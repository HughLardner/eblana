
<%@ page import="eblana.character.CharacterFeat" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'characterFeat.label', default: 'CharacterFeat')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-characterFeat" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="characterFeat.character.label" default="Character" /></td>
				
				<td valign="top" class="value"><g:link controller="playerCharacter" action="show" id="${characterFeatInstance?.character?.id}">${characterFeatInstance?.character?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="characterFeat.effect.label" default="Effect" /></td>
				
				<td valign="top" class="value"><g:link controller="effect" action="show" id="${characterFeatInstance?.effect?.id}">${characterFeatInstance?.effect?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="characterFeat.feat.label" default="Feat" /></td>
				
				<td valign="top" class="value"><g:link controller="feat" action="show" id="${characterFeatInstance?.feat?.id}">${characterFeatInstance?.feat?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="characterFeat.open.label" default="Open" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${characterFeatInstance?.open}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="characterFeat.source.label" default="Source" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: characterFeatInstance, field: "source")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
