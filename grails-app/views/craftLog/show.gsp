
<%@ page import="eblana.event.CraftLog" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'craftLog.label', default: 'CraftLog')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-craftLog" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="craftLog.airCrystals.label" default="Air Crystals" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: craftLogInstance, field: "airCrystals")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="craftLog.blendedCrystals.label" default="Blended Crystals" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: craftLogInstance, field: "blendedCrystals")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="craftLog.downtime.label" default="Downtime" /></td>
				
				<td valign="top" class="value"><g:link controller="downtime" action="show" id="${craftLogInstance?.downtime?.id}">${craftLogInstance?.downtime?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="craftLog.earthCrystals.label" default="Earth Crystals" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: craftLogInstance, field: "earthCrystals")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="craftLog.fireCrystals.label" default="Fire Crystals" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: craftLogInstance, field: "fireCrystals")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="craftLog.item.label" default="Item" /></td>
				
				<td valign="top" class="value"><g:link controller="item" action="show" id="${craftLogInstance?.item?.id}">${craftLogInstance?.item?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="craftLog.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: craftLogInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="craftLog.recipe.label" default="Recipe" /></td>
				
				<td valign="top" class="value"><g:link controller="recipe" action="show" id="${craftLogInstance?.recipe?.id}">${craftLogInstance?.recipe?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="craftLog.voidCrystals.label" default="Void Crystals" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: craftLogInstance, field: "voidCrystals")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="craftLog.waterCrystals.label" default="Water Crystals" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: craftLogInstance, field: "waterCrystals")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
