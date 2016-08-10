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

	function checkCrafted(feat,character,downtime,div){
		var divToUpdate = '#recipe'+div
		$.ajax({ 
		    url: '${g.createLink(action:'checkCrafted' )}', 
		    type:"GET", 
		    data:{feat:feat,character:character,downtime:downtime,div:div},
		    success:function(data) {
		        $(divToUpdate).html(data);
		    }
		});
	}
</script>
	<div>
		<g:each var="recipeList" in="${recipes}" status="i">
			<div id="recipe${i}">
				<script>
				window.onload = function() {
					checkCrafted(${recipeList[0].requiredSkillToCraft.id}, ${character.id},${downtime.id},${i});
					};
				</script>
			</div>
		</g:each>
	</div>
</body>

</html>