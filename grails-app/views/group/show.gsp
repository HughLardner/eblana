
<%@ page import="eblana.background.Group" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'group.label', default: 'Group')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-group" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="group.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: groupInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="group.playerChracter.label" default="Player Chracter" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${groupInstance.playerChracter}" var="p">
						<li><g:link controller="playerCharacter" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
