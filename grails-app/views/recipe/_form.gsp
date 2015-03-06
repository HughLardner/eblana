<%@ page import="eblana.items.Recipe"%>

<div
	class="${hasErrors(bean: recipeInstance, field: 'itemType', 'error')} ">
	<label for="itemType" class="control-label"><g:message
			code="recipe.itemType.label" default="Item Type" /></label>
	<div>
		<g:textField class="form-control" name="itemType"
			value="${recipeInstance?.itemType}" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'itemType', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'power1', 'error')} ">
	<label for="power1" class="control-label"><g:message
			code="recipe.power1.label" default="Power1" /></label>
	<div>
		<g:textField class="form-control" name="power1"
			value="${recipeInstance?.power1}" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'power1', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'power2', 'error')} ">
	<label for="power2" class="control-label"><g:message
			code="recipe.power2.label" default="Power2" /></label>
	<div>
		<g:textField class="form-control" name="power2"
			value="${recipeInstance?.power2}" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'power2', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'anyCrystal', 'error')} ">
	<label for="anyCrystal" class="control-label"><g:message
			code="recipe.anyCrystal.label" default="Any Crystal" /></label>
	<div>
		<g:field class="form-control" name="anyCrystal" type="number"
			value="${recipeInstance.anyCrystal}" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'anyCrystal', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'airCrystals', 'error')} ">
	<label for="airCrystals" class="control-label"><g:message
			code="recipe.airCrystals.label" default="Air Crystals" /></label>
	<div>
		<g:field class="form-control" name="airCrystals" type="number"
			value="${recipeInstance.airCrystals}" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'airCrystals', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'earthCrystals', 'error')} ">
	<label for="earthCrystals" class="control-label"><g:message
			code="recipe.earthCrystals.label" default="Earth Crystals" /></label>
	<div>
		<g:field class="form-control" name="earthCrystals" type="number"
			value="${recipeInstance.earthCrystals}" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'earthCrystals', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'fireCrystals', 'error')} ">
	<label for="fireCrystals" class="control-label"><g:message
			code="recipe.fireCrystals.label" default="Fire Crystals" /></label>
	<div>
		<g:field class="form-control" name="fireCrystals" type="number"
			value="${recipeInstance.fireCrystals}" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'fireCrystals', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'waterCrystals', 'error')} ">
	<label for="waterCrystals" class="control-label"><g:message
			code="recipe.waterCrystals.label" default="Water Crystals" /></label>
	<div>
		<g:field class="form-control" name="waterCrystals" type="number"
			value="${recipeInstance.waterCrystals}" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'waterCrystals', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'blendedCrystals', 'error')} ">
	<label for="blendedCrystals" class="control-label"><g:message
			code="recipe.blendedCrystals.label" default="Blended Crystals" /></label>
	<div>
		<g:field class="form-control" name="blendedCrystals" type="number"
			value="${recipeInstance.blendedCrystals}" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'blendedCrystals', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'voidCrystals', 'error')} ">
	<label for="voidCrystals" class="control-label"><g:message
			code="recipe.voidCrystals.label" default="Void Crystals" /></label>
	<div>
		<g:field class="form-control" name="voidCrystals" type="number"
			value="${recipeInstance.voidCrystals}" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'voidCrystals', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'attunementTime', 'error')} ">
	<label for="attunementTime" class="control-label"><g:message
			code="recipe.attunementTime.label" default="Attunement Time" /></label>
	<div>
		<g:textField class="form-control" name="attunementTime"
			value="${recipeInstance?.attunementTime}" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'attunementTime', 'error')}
		</span>
	</div>
</div>

<div class="${hasErrors(bean: recipeInstance, field: 'feat', 'error')} ">
	<label for="feat" class="control-label"><g:message
			code="recipe.feat.label" default="Feat" /></label>
	<div>
		<g:select class="form-control" id="feat" name="feat.id"
			from="${eblana.character.Feat.findAllByType("Crafting")}"
			optionKey="id" value="${recipeInstance?.feat?.id}"
			class="many-to-one" noSelection="['null': '']" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'feat', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'internalNotes', 'error')} ">
	<label for="internalNotes" class="control-label"><g:message
			code="recipe.internalNotes.label" default="Internal Notes" /></label>
	<div>
		<g:textField class="form-control" name="internalNotes"
			value="${recipeInstance?.internalNotes}" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'internalNotes', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'core', 'error')} formField">
	<label for="core" class="control-label"><g:message
			code="playerCharacter.core.label" default="Core" /></label>
	<div>
		<bs:checkBox name="core" value="${recipeInstance?.core}" />
		<span class="help-inline"> ${hasErrors(bean: recipeInstance, field: 'core', 'error')}
		</span>
	</div>
</div>

