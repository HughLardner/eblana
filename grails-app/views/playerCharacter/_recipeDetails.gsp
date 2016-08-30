<g:if test="${recipe}">

	<script>
		function error(e) {
			alert(e)
		}
	</script>
	<form>
		<g:hiddenField name="recipe" value="${recipe?.id }" />
		<g:hiddenField name="character" value="${character }" />
		<g:hiddenField name="downtime" value="${downtime.id }" />

		<div class="form-group">
				<g:message code="character.feat.label" default="Name of Item:" />
				<input name="name" type="text" />
			
		</div>
		<div class="form-group">
				Item Type:
				${recipe.itemType}
		</div>
		<div class="form-group">
				Item powers:
				${recipe.power1}
				${recipe.power2}
		</div>
		<div class="form-group">
				Attunement Time:
				${recipe.attunementTime}
		</div>
		<div class="form-group">
				<g:if test="${recipe.mustKnowTheSpell}">
			Select Spell:
			<g:select optionValue="" name="spell" id="spell" from="${spells}"
						noSelection="${['null':'-Choose Spell-']}" />
				</g:if>
		</div>
		<div class="form-group">
			<div class="col-xs-2">
				<g:message code="character.cost.label" default="Cost of Item:" />
			</div>
			<div class="col-xs-10">
				<g:render template="/recipe/cost" model="['instance': recipe, 'downtime':downtime]" />
			</div>
		</div>
		<div class="btn-group">
			<g:submitToRemote class="btn btn-primary" action="createItem"
				name="createItem" value="Craft Item"
				onFailure="error(XMLHttpRequest.responseText)" update="recipe${div}" />
		</div>
	</form>
</g:if>
