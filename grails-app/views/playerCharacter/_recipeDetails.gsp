<g:if test="${recipe}">

	<script>
		function error(e) {
			alert(e)
		}
	</script>
	<form>
		<g:hiddenField name="recipe" value="${recipe?.id }" />
		<g:hiddenField name="character" value="${character }" />
		<g:hiddenField name="downtime" value="${downtime }" />

		<div>
			<g:message code="character.feat.label" default="Name of Item:" />
			<input name="name" type="text" />
		</div>
		<div>
			Item Type:
			${recipe.itemType}
		</div>
		<div>
			Item powers:
			${recipe.power1}
			${recipe.power2}
		</div>
		<div>
			Attunement Time:
			${recipe.attunementTime}
		</div>
		<div>
			<g:if test="${recipe.mustKnowTheSpell}">
			Select Spell:
			<g:select optionValue="" name="spell" id="spell" from="${spells}"
					noSelection="${['null':'-Choose Spell-']}" />
			</g:if>
		</div>
		<div>
			<g:message code="character.cost.label" default="Cost of Item:" />
			<g:render template="/recipe/cost" model="['instance': recipe]" />
		</div>

		<g:submitToRemote action="createItem" name="createItem"
			value="Craft Item" onFailure="error(XMLHttpRequest.responseText)"
			update="recipe${div}" />
	</form>
</g:if>
