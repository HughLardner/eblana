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

		<div class="row">
			<div class="col-xs-12">
				<g:message code="character.feat.label" default="Name of Item:" />
				<input name="name" type="text" />
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				Item Type:
				${recipe.itemType}
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				Item powers:
				${recipe.power1}
				${recipe.power2}
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				Attunement Time:
				${recipe.attunementTime}
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<g:if test="${recipe.mustKnowTheSpell}">
			Select Spell:
			<g:select optionValue="" name="spell" id="spell" from="${spells}"
						noSelection="${['null':'-Choose Spell-']}" />
				</g:if>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-2">
				<g:message code="character.cost.label" default="Cost of Item:" />
			</div>
			<div class="col-xs-6">
				<g:render template="/recipe/cost" model="['instance': recipe]" />
			</div>
		</div>
		<div class="btn-group">
			<g:submitToRemote class="btn btn-primary" action="createItem"
				name="createItem" value="Craft Item"
				onFailure="error(XMLHttpRequest.responseText)" update="recipe${div}" />
		</div>
	</form>
</g:if>
