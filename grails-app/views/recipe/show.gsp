
<%@ page import="eblana.items.Recipe" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-recipe" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.airCrystals.label" default="Air Crystals" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "airCrystals")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.blendedCrystals.label" default="Blended Crystals" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "blendedCrystals")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.earthCrystals.label" default="Earth Crystals" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "earthCrystals")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.feat.label" default="Feat" /></td>
				
				<td valign="top" class="value"><g:link controller="feat" action="show" id="${recipeInstance?.feat?.id}">${recipeInstance?.feat?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.fireCrystals.label" default="Fire Crystals" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "fireCrystals")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.item.label" default="Item" /></td>
				
				<td valign="top" class="value"><g:link controller="item" action="show" id="${recipeInstance?.item?.id}">${recipeInstance?.item?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.voidCrystals.label" default="Void Crystals" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "voidCrystals")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.waterCrystals.label" default="Water Crystals" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "waterCrystals")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
