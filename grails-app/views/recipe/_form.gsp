<%@ page import="eblana.items.Recipe" %>



			<div class="${hasErrors(bean: recipeInstance, field: 'airCrystals', 'error')} ">
				<label for="airCrystals" class="control-label"><g:message code="recipe.airCrystals.label" default="Air Crystals" /></label>
				<div>
					<g:field class="form-control" name="airCrystals" type="number" value="${recipeInstance.airCrystals}"/>
					<span class="help-inline">${hasErrors(bean: recipeInstance, field: 'airCrystals', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: recipeInstance, field: 'blendedCrystals', 'error')} ">
				<label for="blendedCrystals" class="control-label"><g:message code="recipe.blendedCrystals.label" default="Blended Crystals" /></label>
				<div>
					<g:field class="form-control" name="blendedCrystals" type="number" value="${recipeInstance.blendedCrystals}"/>
					<span class="help-inline">${hasErrors(bean: recipeInstance, field: 'blendedCrystals', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: recipeInstance, field: 'earthCrystals', 'error')} ">
				<label for="earthCrystals" class="control-label"><g:message code="recipe.earthCrystals.label" default="Earth Crystals" /></label>
				<div>
					<g:field class="form-control" name="earthCrystals" type="number" value="${recipeInstance.earthCrystals}"/>
					<span class="help-inline">${hasErrors(bean: recipeInstance, field: 'earthCrystals', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: recipeInstance, field: 'feat', 'error')} ">
				<label for="feat" class="control-label"><g:message code="recipe.feat.label" default="Feat" /></label>
				<div>
					<g:select class="form-control" id="feat" name="feat.id" from="${eblana.character.Feat.list()}" optionKey="id" value="${recipeInstance?.feat?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: recipeInstance, field: 'feat', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: recipeInstance, field: 'fireCrystals', 'error')} ">
				<label for="fireCrystals" class="control-label"><g:message code="recipe.fireCrystals.label" default="Fire Crystals" /></label>
				<div>
					<g:field class="form-control" name="fireCrystals" type="number" value="${recipeInstance.fireCrystals}"/>
					<span class="help-inline">${hasErrors(bean: recipeInstance, field: 'fireCrystals', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: recipeInstance, field: 'item', 'error')} ">
				<label for="item" class="control-label"><g:message code="recipe.item.label" default="Item" /></label>
				<div>
					<g:select class="form-control" id="item" name="item.id" from="${eblana.items.Item.list()}" optionKey="id" value="${recipeInstance?.item?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: recipeInstance, field: 'item', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: recipeInstance, field: 'voidCrystals', 'error')} ">
				<label for="voidCrystals" class="control-label"><g:message code="recipe.voidCrystals.label" default="Void Crystals" /></label>
				<div>
					<g:field class="form-control" name="voidCrystals" type="number" value="${recipeInstance.voidCrystals}"/>
					<span class="help-inline">${hasErrors(bean: recipeInstance, field: 'voidCrystals', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: recipeInstance, field: 'waterCrystals', 'error')} ">
				<label for="waterCrystals" class="control-label"><g:message code="recipe.waterCrystals.label" default="Water Crystals" /></label>
				<div>
					<g:field class="form-control" name="waterCrystals" type="number" value="${recipeInstance.waterCrystals}"/>
					<span class="help-inline">${hasErrors(bean: recipeInstance, field: 'waterCrystals', 'error')}</span>
				</div>
			</div>

