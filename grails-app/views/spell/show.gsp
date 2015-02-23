
<%@ page import="eblana.character.Spell" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'spell.label', default: 'Spell')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-spell" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="spell.classes.label" default="Classes" /></td>
				
				<td valign="top" class="value"><g:link controller="classes" action="show" id="${spellInstance?.classes?.id}">${spellInstance?.classes?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="spell.effect.label" default="Effect" /></td>
				
				<td valign="top" class="value"><g:link controller="effect" action="show" id="${spellInstance?.effect?.id}">${spellInstance?.effect?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="spell.post.label" default="Post" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: spellInstance, field: "post")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="spell.pre.label" default="Pre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: spellInstance, field: "pre")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
