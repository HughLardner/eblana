
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
					<g:message code="character.cost.label" default="Cost of to Add Power:" />
				</div>
				<div class="col-xs-10">
					<g:render template="/recipe/cost"
						model="['instance': recipe, 'downtime':downtime]" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-2">
					<g:message code="character.cost.label" default="Cost of Power Added:" />
				</div>
				<div class="col-xs-10">
					<g:render template="/recipe/cost"
						model="['instance': recipe, 'downtime':downtime]" />
				</div>
			</div>
			<div class="btn-group">
			<!--<g:submitToRemote class="btn btn-primary" action="createItem"
					name="createItem" value="Craft Item"
					before="if (!confirm('Confirm Craft?')) {return false;}"
					onFailure="error(XMLHttpRequest.responseText)"
					update="recipe${div}" onSuccess="fetchResources()"/> -->
			</div>