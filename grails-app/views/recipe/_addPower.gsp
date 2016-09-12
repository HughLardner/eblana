	<script>
	function fetchRecipeDetailsAdd(recipe,item){
		$.ajax({ 
		    url: '${g.createLink(action:'fetchRecipeDetailsAdd' )}', 
		    type:"GET", 
		    data:{recipe:recipe,character:document.getElementById('character').value,downtime:document.getElementById('downtime').value,item:item},
		    success:function(data) {
		        $('#recipeDetailsAdd').html(data);
		    }
		});
	}
	</script>

<div id="addPower" class="row">
	<g:message code="character.recipe.label" default="Select Recipe:" />
	<g:select optionKey="id" optionValue="" name="recipe" id="recipes"
		from="${recipe}"
		onchange="fetchRecipeDetailsAdd(this.value,${item.id })"
		noSelection="${['null':'-Choose power to add-']}" update="recipeDetailsAdd"/>
	<div id="recipeDetailsAdd">
	</div>
</div>