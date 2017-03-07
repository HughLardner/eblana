	<script>
	function fetchRecipeDetailsAdd(powerToAdd,item){
		$.ajax({ 
		    url: '${g.createLink(action:'fetchRecipeDetailsAdd' )}', 
		    type:"GET", 
		    data:{div:${div},powerToAdd:powerToAdd,character:document.getElementById('character').value,downtime:document.getElementById('downtime').value,item:item, recipe:document.getElementById('recipe').value},
		    success:function(data) {
		        $('#recipeDetailsAdd').html(data);
		    }
		});
	}
	</script>

<div id="addPower" class="row">
	<g:message code="character.recipe.label" default="Select Recipe:" />
	<g:select optionKey="id" optionValue="" name="powerToAdd" id="powerToAdd"
		from="${powersToAdd}"
		onchange="fetchRecipeDetailsAdd(this.value,${item.id })"
		noSelection="${['null':'-Choose power to add-']}" update="recipeDetailsAdd"/>
	<div id="recipeDetailsAdd">
	</div>
</div>