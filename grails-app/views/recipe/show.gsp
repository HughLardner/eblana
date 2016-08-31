
<%@ page import="eblana.items.Recipe" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
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
				<td valign="top" class="name"><g:message code="recipe.anyCrystal.label" default="Any Crystal" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "anyCrystal")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.attunementTime.label" default="Attunement Time" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "attunementTime")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.baseCostOfEffectToBeAddedItemToBeEnhanced.label" default="Base Cost Of Effect To Be Added Item To Be Enhanced" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${recipeInstance?.baseCostOfEffectToBeAddedItemToBeEnhanced}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.blendedCrystals.label" default="Blended Crystals" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "blendedCrystals")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.duration.label" default="Duration" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "duration")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.earthCrystals.label" default="Earth Crystals" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "earthCrystals")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.fireCrystals.label" default="Fire Crystals" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "fireCrystals")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.internalNotes.label" default="Internal Notes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "internalNotes")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.itemName.label" default="Item Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "itemName")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.itemType.label" default="Item Type" /></td>
				
				<td valign="top" class="value"><g:link controller="itemType" action="show" id="${recipeInstance?.itemType?.id}">${recipeInstance?.itemType?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.mustKnowTheSpell.label" default="Must Know The Spell" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${recipeInstance?.mustKnowTheSpell}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.power1.label" default="Power1" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "power1")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.power2.label" default="Power2" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "power2")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.requiredSkillToCraft.label" default="Required Skill To Craft" /></td>
				
				<td valign="top" class="value"><g:link controller="feat" action="show" id="${recipeInstance?.requiredSkillToCraft?.id}">${recipeInstance?.requiredSkillToCraft?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.researchCost.label" default="Research Cost" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "researchCost")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.researchSkill1.label" default="Research Skill1" /></td>
				
				<td valign="top" class="value"><g:link controller="lore" action="show" id="${recipeInstance?.researchSkill1?.id}">${recipeInstance?.researchSkill1?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recipe.researchSkill2.label" default="Research Skill2" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recipeInstance, field: "researchSkill2")}</td>
				
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
