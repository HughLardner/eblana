
<%@ page import="eblana.items.Recipe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-recipe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-recipe" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="airCrystals" title="${message(code: 'recipe.airCrystals.label', default: 'Air Crystals')}" />
					
						<g:sortableColumn property="anyCrystal" title="${message(code: 'recipe.anyCrystal.label', default: 'Any Crystal')}" />
					
						<g:sortableColumn property="attunementTime" title="${message(code: 'recipe.attunementTime.label', default: 'Attunement Time')}" />
					
						<g:sortableColumn property="baseCostOfEffectToBeAddedItemToBeEnhanced" title="${message(code: 'recipe.baseCostOfEffectToBeAddedItemToBeEnhanced.label', default: 'Base Cost Of Effect To Be Added Item To Be Enhanced')}" />
					
						<th><g:message code="recipe.baseItem.label" default="Base Item" /></th>
					
						<g:sortableColumn property="blendedCrystals" title="${message(code: 'recipe.blendedCrystals.label', default: 'Blended Crystals')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${recipeInstanceList}" status="i" var="recipeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${recipeInstance.id}">${fieldValue(bean: recipeInstance, field: "airCrystals")}</g:link></td>
					
						<td>${fieldValue(bean: recipeInstance, field: "anyCrystal")}</td>
					
						<td>${fieldValue(bean: recipeInstance, field: "attunementTime")}</td>
					
						<td><g:formatBoolean boolean="${recipeInstance.baseCostOfEffectToBeAddedItemToBeEnhanced}" /></td>
					
						<td>${fieldValue(bean: recipeInstance, field: "baseItem")}</td>
					
						<td>${fieldValue(bean: recipeInstance, field: "blendedCrystals")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${recipeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
