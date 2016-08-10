<g:each var="tmp"
				in="${1..recipeList[0].requiredSkillToCraft.itemsCrafted}"
				status="j">
				<g:set var="div" value="${''+i+j}" />
				<div id="recipe${div}">
					<g:message code="character.recipe.label" default="Select Recipe:" />
					<g:select optionKey="id" optionValue="" name="recipe" id="recipes"
						from="${recipeList}"
						onchange="fetchRecipeDetails(this.value,${character.id},${downtime.id},'${div}')"
						noSelection="${['null':'-Choose item to craft for '+recipeList[0].requiredSkillToCraft+'-']}" />
					<div id="recipeDetails${div}">
						<g:render template="recipeDetails" />
					</div>
				</div>
			</g:each>