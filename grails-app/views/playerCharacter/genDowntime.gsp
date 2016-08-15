<%@ page import="eblana.character.PlayerCharacter"%>
<%@ page import="eblana.event.Downtime"%>

<!DOCTYPE html>
<html>

<head>
<meta name="layout" content="kickstart" />
<g:set var="entityName"
	value="${message(code: 'playerCharacter.label', default: 'Downtime')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>
	<script>
	function fetchRecipeDetails(recipe,character,downtime,div){
		var divToUpdate = '#recipeDetails'+div
		$.ajax({ 
		    url: '${g.createLink(action:'fetchRecipeDetails' )}', 
		    type:"GET", 
		    data:{recipe:recipe,character:character,downtime:downtime,div:div},
		    success:function(data) {
		        $(divToUpdate).html(data);
		    }
		});
	}


</script>
	<div>
		<h2>Crafting</h2>
		<g:each var="recipeList" in="${recipes}" status="i">
			<div id="recipe${i}">
				<g:message code="character.recipe.label" default="Select Recipe:" />
				<g:select optionKey="id" optionValue="" name="recipe" id="recipes"
					from="${recipeList}"
					onchange="fetchRecipeDetails(this.value,${character.id},${downtime.id},'${i}')"
					noSelection="${['null':'-Choose item to craft for '+recipeList[0].requiredSkillToCraft+'-']}" />
				<div id="recipeDetails${i}">
					<g:render template="recipeDetails" />
				</div>
			</div>
		</g:each>
	</div>
	<div>
		<h3>Previously Crafted</h3>
		<g:each var="craft" in="${crafted}" status="i">
			<g:render template="/craftLog/show"
				model="['craftLogInstance': craft]" />
		</g:each>
	</div>
	<div id="transfers">
		<h2>Transfers</h2>
			<g:render template="/transfer/create"
				model="['instance': downtime]" />
	</div>
</body>

</html>