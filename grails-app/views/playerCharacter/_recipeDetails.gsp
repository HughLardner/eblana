<g:if test="${recipe}">

	<script>
		function error(e) {
			alert(e)
		}
		function fetchAddable(item, character, recipe) {
			$.ajax({ 
			    url: '${g.createLink(action:'fetchRecipetoAdd' )}', 
			    type:"GET", 
			    data:{recipe:recipe,character:character, item:item},
			    success:function(data) {
			        $('#reforgeDetails').html(data);
			    }
			});
		}
	</script>
	<form>
		<g:hiddenField name="recipe" value="${recipe?.id }" />
		<g:hiddenField name="character" value="${character }" />
		<g:hiddenField name="downtime" value="${downtime?.id }" />
		<g:if test="${recipe.reforge }">
			<div class="form-group">
				<g:message code="character.feat.label"
					default="Select Item to reforge:" />
				<div class="row">
					<g:each in="${items}" var="item" status="i">
						<div class="col-md-4">
							<div class="checkbox" id="form">
								<label class="btn btn-primary"> <input type="checkbox"
									onclick="fetchAddable(this.value, ${character }, ${recipe?.id })"
									name="items" value="${item.id }" hidden="true">
									<div class="img-check">
										<g:render template="/item/showTemplate"
											model="['itemInstance': item, 'downtime':downtime]" />
									</div>
								</label>

							</div>
						</div>
					</g:each>
				</div>
				<div id="reforgeDetails"></div>
			</div>
		</g:if>
		<g:else>
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
					<g:render template="/recipe/cost"
						model="['instance': recipe, 'downtime':downtime]" />
				</div>
			</div>
			<div class="btn-group">
				<g:submitToRemote class="btn btn-primary" action="createItem"
					name="createItem" value="Craft Item"
					before="if (!confirm('Confirm Craft?')) {return false;}"
					onFailure="error(XMLHttpRequest.responseText)"
					update="recipe${div}" onSuccess="fetchResources()"/>
			</div>
		</g:else>
	</form>
</g:if>
