<%@ page import="eblana.items.Recipe"%>

<div
	class="${hasErrors(bean: recipeInstance, field: 'itemName', 'error')} ">
	<label for="itemName" class="control-label"><g:message
			code="recipe.itemName.label" default="Item Name" /></label>
	<div>
		<g:textField class="form-control" name="itemName"
			value="${recipeInstance?.itemName}" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'itemName', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'itemType', 'error')} ">
	<label for="itemType" class="control-label"><g:message
			code="recipe.itemType.label" default="Item Type" /></label>
	<div>
		<g:select class="form-control" id="itemType" name="itemType.id"
			from="${eblana.items.ItemType.list()}" optionKey="id"
			value="${recipeInstance?.itemType?.id}" class="many-to-one"
			noSelection="['null': '']" />
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
		<span class="help-inline"> ${hasErrors(bean: recipeInstance, field: 'power1', 'error')}
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
		<span class="help-inline"> ${hasErrors(bean: recipeInstance, field: 'power2', 'error')}
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
		<span class="help-inline"> ${hasErrors(bean: recipeInstance, field: 'attunementTime', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'duration', 'error')} ">
	<label for="duration" class="control-label"><g:message
			code="recipe.duration.label" default="Duration" /></label>
	<div>
		<g:textField class="form-control" name="duration"
			value="${recipeInstance?.duration}" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'duration', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'requiredSkillToCraft', 'error')} ">
	<label for="requiredSkillToCraft" class="control-label"><g:message
			code="recipe.requiredSkillToCraft.label"
			default="Required Skill To Craft" /></label>
	<div>
		<g:select class="form-control" id="requiredSkillToCraft"
			name="requiredSkillToCraft.id" from="${eblana.character.Feat.list()}"
			optionKey="id" value="${recipeInstance?.requiredSkillToCraft?.id}"
			class="many-to-one" noSelection="['null': '']" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'requiredSkillToCraft', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'researchCost', 'error')} ">
	<label for="researchCost" class="control-label"><g:message
			code="recipe.researchCost.label" default="Research Cost" /></label>
	<div>
		<g:field class="form-control" name="researchCost" type="number"
			value="${recipeInstance.researchCost}" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'researchCost', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'researchSkill1', 'error')} ">
	<label for="researchSkill1" class="control-label"><g:message
			code="recipe.researchSkill1.label" default="Research Skill1" /></label>
	<div>
		<g:select class="form-control" id="researchSkill1"
			name="researchSkill1.id" from="${eblana.character.Lore.list()}"
			optionKey="id" value="${recipeInstance?.researchSkill1?.id}"
			class="many-to-one" noSelection="['null': '']" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'researchSkill1', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'researchSkill2', 'error')} ">
	<label for="researchSkill2" class="control-label"><g:message
			code="recipe.researchSkill2.label" default="Research Skill2" /></label>
	<div>
		<g:textField class="form-control" name="researchSkill2"
			value="${recipeInstance?.researchSkill2}" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'researchSkill2', 'error')}
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
		<span class="help-inline"> ${hasErrors(bean: recipeInstance, field: 'anyCrystal', 'error')}
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
		<span class="help-inline"> ${hasErrors(bean: recipeInstance, field: 'airCrystals', 'error')}
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
		<span class="help-inline"> ${hasErrors(bean: recipeInstance, field: 'earthCrystals', 'error')}
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
		<span class="help-inline"> ${hasErrors(bean: recipeInstance, field: 'fireCrystals', 'error')}
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
		<span class="help-inline"> ${hasErrors(bean: recipeInstance, field: 'waterCrystals', 'error')}
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
		<span class="help-inline"> ${hasErrors(bean: recipeInstance, field: 'blendedCrystals', 'error')}
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
		<span class="help-inline"> ${hasErrors(bean: recipeInstance, field: 'voidCrystals', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'baseCostOfEffectToBeAddedItemToBeEnhanced', 'error')} ">
	<label for="baseCostOfEffectToBeAddedItemToBeEnhanced"
		class="control-label"><g:message
			code="recipe.baseCostOfEffectToBeAddedItemToBeEnhanced.label"
			default="Base Cost Of Effect To Be Added Item To Be Enhanced" /></label>
	<div>
		<g:checkBox name="baseCostOfEffectToBeAddedItemToBeEnhanced"
			value="${recipeInstance?.baseCostOfEffectToBeAddedItemToBeEnhanced}" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'baseCostOfEffectToBeAddedItemToBeEnhanced', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: recipeInstance, field: 'mustKnowTheSpell', 'error')} ">
	<label for="mustKnowTheSpell" class="control-label"><g:message
			code="recipe.mustKnowTheSpell.label" default="Must Know The Spell" /></label>
	<div>
		<g:checkBox name="mustKnowTheSpell"
			value="${recipeInstance?.mustKnowTheSpell}" />
		<span class="help-inline">
			${hasErrors(bean: recipeInstance, field: 'mustKnowTheSpell', 'error')}
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
		<span class="help-inline"> ${hasErrors(bean: recipeInstance, field: 'internalNotes', 'error')}
		</span>
	</div>
</div>

