
<%@ page import="eblana.items.Recipe" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-recipe" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="airCrystals" title="${message(code: 'recipe.airCrystals.label', default: 'Air Crystals')}" />
			
				<g:sortableColumn property="blendedCrystals" title="${message(code: 'recipe.blendedCrystals.label', default: 'Blended Crystals')}" />
			
				<g:sortableColumn property="earthCrystals" title="${message(code: 'recipe.earthCrystals.label', default: 'Earth Crystals')}" />
			
				<th><g:message code="recipe.feat.label" default="Feat" /></th>
			
				<g:sortableColumn property="fireCrystals" title="${message(code: 'recipe.fireCrystals.label', default: 'Fire Crystals')}" />
			
				<th><g:message code="recipe.item.label" default="Item" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${recipeInstanceList}" status="i" var="recipeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${recipeInstance.id}">${fieldValue(bean: recipeInstance, field: "airCrystals")}</g:link></td>
			
				<td>${fieldValue(bean: recipeInstance, field: "blendedCrystals")}</td>
			
				<td>${fieldValue(bean: recipeInstance, field: "earthCrystals")}</td>
			
				<td>${fieldValue(bean: recipeInstance, field: "feat")}</td>
			
				<td>${fieldValue(bean: recipeInstance, field: "fireCrystals")}</td>
			
				<td>${fieldValue(bean: recipeInstance, field: "item")}</td>
			
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
