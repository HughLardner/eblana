
<%@ page import="eblana.character.Spell" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'spell.label', default: 'Spell')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-spell" class="first">

	<table class="table">
		<tbody>
		
		<tr class="prop">
				<td valign="top" class="name"><g:message code="spell.post.label" default="Name" /></td>
				
				<td valign="top" class="value"> ${fieldValue(bean: spellInstance, field: "pre")} ${spellInstance?.effect?.encodeAsHTML()} ${fieldValue(bean: spellInstance, field: "post")}</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="spell.classes.label" default="Classes" /></td>
				
				<td valign="top" class="value">${spellInstance?.classes?.encodeAsHTML()}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="spell.effect.label" default="Description" /></td>
				
				<td valign="top" class="value">${spellInstance?.effect?.description}</td>
				
			</tr>
		
			
		
		
		</tbody>
	</table>
</section>

</body>

</html>
