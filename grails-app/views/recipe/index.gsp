
<%@ page import="eblana.items.Recipe"%>
<!DOCTYPE html>
<html>

<head>
<meta name="layout" content="kickstart" />
<g:set var="entityName"
	value="${message(code: 'recipe.label', default: 'Recipe')}" />
<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

	<section id="index-recipe" class="first">

		<table class="table table-bordered margin-top-medium">
			<thead>
				<tr>

<g:sortableColumn property="item name" title="${message(code: 'recipe.item name.label', default: 'Item Name')}" />

<g:sortableColumn property="itemType" title="${message(code: 'recipe.ItemType.Label', default: 'item Type')}" />

<g:sortableColumn property="power1" title="${message(code: 'recipe.Power1.Label', default: 'power 1')}" />

<g:sortableColumn property="power2" title="${message(code: 'recipe.Power2.Label', default: 'power 2')}" />

<g:sortableColumn property="attunementTime" title="${message(code: 'recipe.AttunementTime.Label', default: 'attunement Time')}" />

<g:sortableColumn property="duration" title="${message(code: 'recipe.Duration.Label', default: 'duration')}" />

<g:sortableColumn property="requiredSkillToCraft" title="${message(code: 'recipe.RequiredSkillToCraft.Label', default: 'required Skill To Craft')}" />

<g:sortableColumn property="researchCost" title="${message(code: 'recipe.ResearchCost.Label', default: 'research Cost')}" />

<g:sortableColumn property="researchSkill1 " title="${message(code: 'recipe.ResearchSkill1 .Label', default: 'research Skill 1')}" />

<g:sortableColumn property="researchSkill2" title="${message(code: 'recipe.ResearchSkill2.Label', default: 'research Skill 2')}" />

<g:sortableColumn property="anyCrystal" title="${message(code: 'recipe.AnyCrystal.Label', default: 'any Crystals')}" />

<g:sortableColumn property="blendedCrystals" title="${message(code: 'recipe.BlendedCrystals.Label', default: 'blended Crystals')}" />

<g:sortableColumn property="fireCrystals" title="${message(code: 'recipe.FireCrystals.Label', default: 'fire Crystals')}" />

<g:sortableColumn property="airCrystals" title="${message(code: 'recipe.Aircrystals.Label', default: 'air Crystals')}" />

<g:sortableColumn property="earthCrystals" title="${message(code: 'recipe.EarthCrystals.Label', default: 'earth Crystals')}" />

<g:sortableColumn property="waterCrystals" title="${message(code: 'recipe.WaterCrystals.Label', default: 'water Crystals')}" />

<g:sortableColumn property="voCrystals" title="${message(code: 'recipe.VoCrystals.Label', default: 'void Crystals')}" />

<g:sortableColumn property="baseCostOfEffectToBeAddedItemToBeEnhanced" title="${message(code: 'recipe.BaseCostOfEffectToBeAddedItemToBeEnhanced.Label', default: 'base Cost Of Effect To Be Added Item To Be Enhanced')}" />

<g:sortableColumn property="mustKnowTheSpell" title="${message(code: 'recipe.MustKnowTheSpell.Label', default: 'must Know The Spell')}" />



				</tr>
			</thead>
			<tbody>
				<g:each in="${recipeInstanceList}" status="i" var="recipeInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

						<td>${fieldValue(bean: recipeInstance, field: "itemName")}</td>
<td>${fieldValue(bean: recipeInstance, field: "itemType")}</td>
<td><g:link Action="show" id="${recipeInstance.id}">${fieldValue(bean: recipeInstance, field: "power1")}</g:link></td>
<td>${fieldValue(bean: recipeInstance, field: "power2")}</td>
<td>${fieldValue(bean: recipeInstance, field: "attunementTime")}</td>
<td>${fieldValue(bean: recipeInstance, field: "duration")}</td>
<td>${fieldValue(bean: recipeInstance, field: "requiredSkillToCraft")}</td>
<td>${fieldValue(bean: recipeInstance, field: "researchCost")}</td>
<td>${fieldValue(bean: recipeInstance, field: "researchSkill1")}</td>
<td>${fieldValue(bean: recipeInstance, field: "researchSkill2")}</td>
<td>${fieldValue(bean: recipeInstance, field: "anyCrystal")}</td>
<td>${fieldValue(bean: recipeInstance, field: "blendedCrystals")}</td>
<td>${fieldValue(bean: recipeInstance, field: "fireCrystals")}</td>
<td>${fieldValue(bean: recipeInstance, field: "airCrystals")}</td>
<td>${fieldValue(bean: recipeInstance, field: "earthCrystals")}</td>
<td>${fieldValue(bean: recipeInstance, field: "waterCrystals")}</td>
<td>${fieldValue(bean: recipeInstance, field: "voidCrystals")}</td>
<td>${fieldValue(bean: recipeInstance, field: "baseCostOfEffectToBeAddedItemToBeEnhanced")}</td>
<td>${fieldValue(bean: recipeInstance, field: "mustKnowTheSpell")}</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div>
			<bs:paginate total="${recipeInstanceCount}" />
		</div>
	</section>

</body>

</html>
