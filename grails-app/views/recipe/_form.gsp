<%@ page import="eblana.items.Recipe" %>



<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'airCrystals', 'error')} ">
	<label for="airCrystals">
		<g:message code="recipe.airCrystals.label" default="Air Crystals" />
		
	</label>
	<g:field name="airCrystals" type="number" value="${recipeInstance.airCrystals}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'anyCrystal', 'error')} ">
	<label for="anyCrystal">
		<g:message code="recipe.anyCrystal.label" default="Any Crystal" />
		
	</label>
	<g:field name="anyCrystal" type="number" value="${recipeInstance.anyCrystal}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'attunementTime', 'error')} ">
	<label for="attunementTime">
		<g:message code="recipe.attunementTime.label" default="Attunement Time" />
		
	</label>
	<g:textField name="attunementTime" value="${recipeInstance?.attunementTime}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'baseCostOfEffectToBeAddedItemToBeEnhanced', 'error')} ">
	<label for="baseCostOfEffectToBeAddedItemToBeEnhanced">
		<g:message code="recipe.baseCostOfEffectToBeAddedItemToBeEnhanced.label" default="Base Cost Of Effect To Be Added Item To Be Enhanced" />
		
	</label>
	<g:checkBox name="baseCostOfEffectToBeAddedItemToBeEnhanced" value="${recipeInstance?.baseCostOfEffectToBeAddedItemToBeEnhanced}" />

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'baseItem', 'error')} ">
	<label for="baseItem">
		<g:message code="recipe.baseItem.label" default="Base Item" />
		
	</label>
	<g:select id="baseItem" name="baseItem.id" from="${eblana.character.Feat.list()}" optionKey="id" value="${recipeInstance?.baseItem?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'blendedCrystals', 'error')} ">
	<label for="blendedCrystals">
		<g:message code="recipe.blendedCrystals.label" default="Blended Crystals" />
		
	</label>
	<g:field name="blendedCrystals" type="number" value="${recipeInstance.blendedCrystals}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'duration', 'error')} ">
	<label for="duration">
		<g:message code="recipe.duration.label" default="Duration" />
		
	</label>
	<g:textField name="duration" value="${recipeInstance?.duration}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'earthCrystals', 'error')} ">
	<label for="earthCrystals">
		<g:message code="recipe.earthCrystals.label" default="Earth Crystals" />
		
	</label>
	<g:field name="earthCrystals" type="number" value="${recipeInstance.earthCrystals}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'featToAdd', 'error')} ">
	<label for="featToAdd">
		<g:message code="recipe.featToAdd.label" default="Feat To Add" />
		
	</label>
	<g:select id="featToAdd" name="featToAdd.id" from="${eblana.character.Feat.list()}" optionKey="id" value="${recipeInstance?.featToAdd?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'fireCrystals', 'error')} ">
	<label for="fireCrystals">
		<g:message code="recipe.fireCrystals.label" default="Fire Crystals" />
		
	</label>
	<g:field name="fireCrystals" type="number" value="${recipeInstance.fireCrystals}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'internalNotes', 'error')} ">
	<label for="internalNotes">
		<g:message code="recipe.internalNotes.label" default="Internal Notes" />
		
	</label>
	<g:textField name="internalNotes" value="${recipeInstance?.internalNotes}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'itemName', 'error')} ">
	<label for="itemName">
		<g:message code="recipe.itemName.label" default="Item Name" />
		
	</label>
	<g:textField name="itemName" value="${recipeInstance?.itemName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'itemType', 'error')} ">
	<label for="itemType">
		<g:message code="recipe.itemType.label" default="Item Type" />
		
	</label>
	<g:select id="itemType" name="itemType.id" from="${eblana.items.ItemType.list()}" optionKey="id" value="${recipeInstance?.itemType?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'mustKnowTheSpell', 'error')} ">
	<label for="mustKnowTheSpell">
		<g:message code="recipe.mustKnowTheSpell.label" default="Must Know The Spell" />
		
	</label>
	<g:checkBox name="mustKnowTheSpell" value="${recipeInstance?.mustKnowTheSpell}" />

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'power1', 'error')} ">
	<label for="power1">
		<g:message code="recipe.power1.label" default="Power1" />
		
	</label>
	<g:textField name="power1" value="${recipeInstance?.power1}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'power2', 'error')} ">
	<label for="power2">
		<g:message code="recipe.power2.label" default="Power2" />
		
	</label>
	<g:textField name="power2" value="${recipeInstance?.power2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'reforge', 'error')} ">
	<label for="reforge">
		<g:message code="recipe.reforge.label" default="Reforge" />
		
	</label>
	<g:checkBox name="reforge" value="${recipeInstance?.reforge}" />

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'requiredSkillToCraft', 'error')} ">
	<label for="requiredSkillToCraft">
		<g:message code="recipe.requiredSkillToCraft.label" default="Required Skill To Craft" />
		
	</label>
	<g:select id="requiredSkillToCraft" name="requiredSkillToCraft.id" from="${eblana.character.Feat.list()}" optionKey="id" value="${recipeInstance?.requiredSkillToCraft?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'researchCost', 'error')} ">
	<label for="researchCost">
		<g:message code="recipe.researchCost.label" default="Research Cost" />
		
	</label>
	<g:field name="researchCost" type="number" value="${recipeInstance.researchCost}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'researchSkill1', 'error')} ">
	<label for="researchSkill1">
		<g:message code="recipe.researchSkill1.label" default="Research Skill1" />
		
	</label>
	<g:select id="researchSkill1" name="researchSkill1.id" from="${eblana.character.Lore.list()}" optionKey="id" value="${recipeInstance?.researchSkill1?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'researchSkill2', 'error')} ">
	<label for="researchSkill2">
		<g:message code="recipe.researchSkill2.label" default="Research Skill2" />
		
	</label>
	<g:textField name="researchSkill2" value="${recipeInstance?.researchSkill2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'slot', 'error')} ">
	<label for="slot">
		<g:message code="recipe.slot.label" default="Slot" />
		
	</label>
	<g:textField name="slot" value="${recipeInstance?.slot}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'spellClass', 'error')} ">
	<label for="spellClass">
		<g:message code="recipe.spellClass.label" default="Spell Class" />
		
	</label>
	<g:select id="spellClass" name="spellClass.id" from="${eblana.character.Classes.list()}" optionKey="id" value="${recipeInstance?.spellClass?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'voidCrystals', 'error')} ">
	<label for="voidCrystals">
		<g:message code="recipe.voidCrystals.label" default="Void Crystals" />
		
	</label>
	<g:field name="voidCrystals" type="number" value="${recipeInstance.voidCrystals}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'waterCrystals', 'error')} ">
	<label for="waterCrystals">
		<g:message code="recipe.waterCrystals.label" default="Water Crystals" />
		
	</label>
	<g:field name="waterCrystals" type="number" value="${recipeInstance.waterCrystals}"/>

</div>

