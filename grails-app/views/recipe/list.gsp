
<%@ page import="eblana.items.Recipe" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-recipe" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="airCrystals" title="${message(code: 'recipe.airCrystals.label', default: 'Air Crystals')}" />
			
				<g:sortableColumn property="anyCrystal" title="${message(code: 'recipe.anyCrystal.label', default: 'Any Crystal')}" />
			
				<g:sortableColumn property="attunementTime" title="${message(code: 'recipe.attunementTime.label', default: 'Attunement Time')}" />
			
				<g:sortableColumn property="baseCostOfEffectToBeAddedItemToBeEnhanced" title="${message(code: 'recipe.baseCostOfEffectToBeAddedItemToBeEnhanced.label', default: 'Base Cost Of Effect To Be Added Item To Be Enhanced')}" />
			
				<g:sortableColumn property="blendedCrystals" title="${message(code: 'recipe.blendedCrystals.label', default: 'Blended Crystals')}" />
			
				<g:sortableColumn property="duration" title="${message(code: 'recipe.duration.label', default: 'Duration')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${recipeInstanceList}" status="i" var="recipeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${recipeInstance.id}">${fieldValue(bean: recipeInstance, field: "airCrystals")}</g:link></td>
			
				<td>${fieldValue(bean: recipeInstance, field: "anyCrystal")}</td>
			
				<td>${fieldValue(bean: recipeInstance, field: "attunementTime")}</td>
			
				<td><g:formatBoolean boolean="${recipeInstance.baseCostOfEffectToBeAddedItemToBeEnhanced}" /></td>
			
				<td>${fieldValue(bean: recipeInstance, field: "blendedCrystals")}</td>
			
				<td>${fieldValue(bean: recipeInstance, field: "duration")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<g:paginate total="${recipeInstanceCount}" />
	</div>
</section>

</body>

</html>
