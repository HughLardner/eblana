
<g:if test="${recipes}">
	<script>
	function fetchRecipeDetails(recipe,character,downtime,div){
		$.ajax({ 
		    url: '${g.createLink(action:'fetchRecipeDetails' )}', 
		    type:"GET", 
		    data:{recipe:recipe,character:character,downtime:downtime,div:div},
		    success:function(data) {
		        $(div).html(data);
		    }
		});
	}
</script>
	<form>
		<g:message code="character.recipe.label" default="Select Recipe:" />
		<g:select optionKey="id" optionValue="" name="recipe" id="recipes"
			from="${recipes}"
			onchange="fetchRecipeDetails(this.value,${character.id},${downtime.id},'${'#recipeDetails'+div }')"></g:select>
	</form>

	<div id="recipeDetails${div}">
		<g:render template="recipeDetails" />

	</div>
</g:if>
