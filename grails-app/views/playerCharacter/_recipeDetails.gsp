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
			<g:message code="character.cost.label" default="Cost of Item:" />
			<div id="table">
				<div class="row">
					<span class="cell">Air</span> <span class="cell">Earth</span> <span
						class="cell">Fire</span><span class="cell">Water</span><span
						class="cell">Blended</span><span class="cell">Void</span><span
						class="cell">Any</span>
				</div>
				<div class="row">
					<span class="cell"> ${recipe.airCrystals }
					</span> <span class="cell"> ${recipe.earthCrystals }
					</span> <span class="cell"> ${recipe.fireCrystals }
					</span><span class="cell"> ${recipe.waterCrystals }
					</span><span class="cell"> ${recipe.blendedCrystals }
					</span><span class="cell"> ${recipe.voidCrystals }
					</span><span class="cell"> ${recipe.anyCrystal}
					</span>
				</div>
				<g:if test="${recipe.anyCrystal >0 }">
					<div class="row">
						<span class="cell"><input name="air" type="number" min="0"
							max="${recipe.anyCrystal }" /></span> <span class="cell"><input
							name="earth" type="number" min="0" max="${recipe.anyCrystal }" /></span>
						<span class="cell"><input name="fire" type="number" min="0"
							max="${recipe.anyCrystal }" /></span><span class="cell"><input
							name="water" type="number" min="0" max="${recipe.anyCrystal }" /></span><span
							class="cell"><input name="blended" type="number" min="0"
							max="${recipe.anyCrystal }" /></span><span class="cell"><input
							name="voidC" type="number" min="0" max="${recipe.anyCrystal }" /></span>
					</div>
				</g:if>
			</div>
		</div>

		<g:submitToRemote action="createItem"
			name="createItem" value="Craft Item"
			onFailure="error(XMLHttpRequest.responseText)"
			update="recipe${div}" />
	</form>
</g:if>
