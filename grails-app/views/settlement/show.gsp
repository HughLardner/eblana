
<%@ page import="eblana.background.Settlement" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'settlement.label', default: 'Settlement')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-settlement" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settlement.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: settlementInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="settlement.playerChracter.label" default="Player Chracter" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${settlementInstance.playerChracter}" var="p">
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
