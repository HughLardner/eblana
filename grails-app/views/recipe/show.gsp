
<%@ page import="eblana.items.Recipe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-recipe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-recipe" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list recipe">
			
				<g:if test="${recipeInstance?.airCrystals}">
				<li class="fieldcontain">
					<span id="airCrystals-label" class="property-label"><g:message code="recipe.airCrystals.label" default="Air Crystals" /></span>
					
						<span class="property-value" aria-labelledby="airCrystals-label"><g:fieldValue bean="${recipeInstance}" field="airCrystals"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.anyCrystal}">
				<li class="fieldcontain">
					<span id="anyCrystal-label" class="property-label"><g:message code="recipe.anyCrystal.label" default="Any Crystal" /></span>
					
						<span class="property-value" aria-labelledby="anyCrystal-label"><g:fieldValue bean="${recipeInstance}" field="anyCrystal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.attunementTime}">
				<li class="fieldcontain">
					<span id="attunementTime-label" class="property-label"><g:message code="recipe.attunementTime.label" default="Attunement Time" /></span>
					
						<span class="property-value" aria-labelledby="attunementTime-label"><g:fieldValue bean="${recipeInstance}" field="attunementTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.baseCostOfEffectToBeAddedItemToBeEnhanced}">
				<li class="fieldcontain">
					<span id="baseCostOfEffectToBeAddedItemToBeEnhanced-label" class="property-label"><g:message code="recipe.baseCostOfEffectToBeAddedItemToBeEnhanced.label" default="Base Cost Of Effect To Be Added Item To Be Enhanced" /></span>
					
						<span class="property-value" aria-labelledby="baseCostOfEffectToBeAddedItemToBeEnhanced-label"><g:formatBoolean boolean="${recipeInstance?.baseCostOfEffectToBeAddedItemToBeEnhanced}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.baseItem}">
				<li class="fieldcontain">
					<span id="baseItem-label" class="property-label"><g:message code="recipe.baseItem.label" default="Base Item" /></span>
					
						<span class="property-value" aria-labelledby="baseItem-label"><g:link controller="feat" action="show" id="${recipeInstance?.baseItem?.id}">${recipeInstance?.baseItem?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.blendedCrystals}">
				<li class="fieldcontain">
					<span id="blendedCrystals-label" class="property-label"><g:message code="recipe.blendedCrystals.label" default="Blended Crystals" /></span>
					
						<span class="property-value" aria-labelledby="blendedCrystals-label"><g:fieldValue bean="${recipeInstance}" field="blendedCrystals"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.duration}">
				<li class="fieldcontain">
					<span id="duration-label" class="property-label"><g:message code="recipe.duration.label" default="Duration" /></span>
					
						<span class="property-value" aria-labelledby="duration-label"><g:fieldValue bean="${recipeInstance}" field="duration"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.earthCrystals}">
				<li class="fieldcontain">
					<span id="earthCrystals-label" class="property-label"><g:message code="recipe.earthCrystals.label" default="Earth Crystals" /></span>
					
						<span class="property-value" aria-labelledby="earthCrystals-label"><g:fieldValue bean="${recipeInstance}" field="earthCrystals"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.featToAdd}">
				<li class="fieldcontain">
					<span id="featToAdd-label" class="property-label"><g:message code="recipe.featToAdd.label" default="Feat To Add" /></span>
					
						<span class="property-value" aria-labelledby="featToAdd-label"><g:link controller="feat" action="show" id="${recipeInstance?.featToAdd?.id}">${recipeInstance?.featToAdd?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.fireCrystals}">
				<li class="fieldcontain">
					<span id="fireCrystals-label" class="property-label"><g:message code="recipe.fireCrystals.label" default="Fire Crystals" /></span>
					
						<span class="property-value" aria-labelledby="fireCrystals-label"><g:fieldValue bean="${recipeInstance}" field="fireCrystals"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.internalNotes}">
				<li class="fieldcontain">
					<span id="internalNotes-label" class="property-label"><g:message code="recipe.internalNotes.label" default="Internal Notes" /></span>
					
						<span class="property-value" aria-labelledby="internalNotes-label"><g:fieldValue bean="${recipeInstance}" field="internalNotes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.itemName}">
				<li class="fieldcontain">
					<span id="itemName-label" class="property-label"><g:message code="recipe.itemName.label" default="Item Name" /></span>
					
						<span class="property-value" aria-labelledby="itemName-label"><g:fieldValue bean="${recipeInstance}" field="itemName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.itemType}">
				<li class="fieldcontain">
					<span id="itemType-label" class="property-label"><g:message code="recipe.itemType.label" default="Item Type" /></span>
					
						<span class="property-value" aria-labelledby="itemType-label"><g:link controller="itemType" action="show" id="${recipeInstance?.itemType?.id}">${recipeInstance?.itemType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.mustKnowTheSpell}">
				<li class="fieldcontain">
					<span id="mustKnowTheSpell-label" class="property-label"><g:message code="recipe.mustKnowTheSpell.label" default="Must Know The Spell" /></span>
					
						<span class="property-value" aria-labelledby="mustKnowTheSpell-label"><g:formatBoolean boolean="${recipeInstance?.mustKnowTheSpell}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.power1}">
				<li class="fieldcontain">
					<span id="power1-label" class="property-label"><g:message code="recipe.power1.label" default="Power1" /></span>
					
						<span class="property-value" aria-labelledby="power1-label"><g:fieldValue bean="${recipeInstance}" field="power1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.power2}">
				<li class="fieldcontain">
					<span id="power2-label" class="property-label"><g:message code="recipe.power2.label" default="Power2" /></span>
					
						<span class="property-value" aria-labelledby="power2-label"><g:fieldValue bean="${recipeInstance}" field="power2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.reforge}">
				<li class="fieldcontain">
					<span id="reforge-label" class="property-label"><g:message code="recipe.reforge.label" default="Reforge" /></span>
					
						<span class="property-value" aria-labelledby="reforge-label"><g:formatBoolean boolean="${recipeInstance?.reforge}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.requiredSkillToCraft}">
				<li class="fieldcontain">
					<span id="requiredSkillToCraft-label" class="property-label"><g:message code="recipe.requiredSkillToCraft.label" default="Required Skill To Craft" /></span>
					
						<span class="property-value" aria-labelledby="requiredSkillToCraft-label"><g:link controller="feat" action="show" id="${recipeInstance?.requiredSkillToCraft?.id}">${recipeInstance?.requiredSkillToCraft?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.researchCost}">
				<li class="fieldcontain">
					<span id="researchCost-label" class="property-label"><g:message code="recipe.researchCost.label" default="Research Cost" /></span>
					
						<span class="property-value" aria-labelledby="researchCost-label"><g:fieldValue bean="${recipeInstance}" field="researchCost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.researchSkill1}">
				<li class="fieldcontain">
					<span id="researchSkill1-label" class="property-label"><g:message code="recipe.researchSkill1.label" default="Research Skill1" /></span>
					
						<span class="property-value" aria-labelledby="researchSkill1-label"><g:link controller="lore" action="show" id="${recipeInstance?.researchSkill1?.id}">${recipeInstance?.researchSkill1?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.researchSkill2}">
				<li class="fieldcontain">
					<span id="researchSkill2-label" class="property-label"><g:message code="recipe.researchSkill2.label" default="Research Skill2" /></span>
					
						<span class="property-value" aria-labelledby="researchSkill2-label"><g:fieldValue bean="${recipeInstance}" field="researchSkill2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.slot}">
				<li class="fieldcontain">
					<span id="slot-label" class="property-label"><g:message code="recipe.slot.label" default="Slot" /></span>
					
						<span class="property-value" aria-labelledby="slot-label"><g:fieldValue bean="${recipeInstance}" field="slot"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.spellClass}">
				<li class="fieldcontain">
					<span id="spellClass-label" class="property-label"><g:message code="recipe.spellClass.label" default="Spell Class" /></span>
					
						<span class="property-value" aria-labelledby="spellClass-label"><g:link controller="classes" action="show" id="${recipeInstance?.spellClass?.id}">${recipeInstance?.spellClass?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.voidCrystals}">
				<li class="fieldcontain">
					<span id="voidCrystals-label" class="property-label"><g:message code="recipe.voidCrystals.label" default="Void Crystals" /></span>
					
						<span class="property-value" aria-labelledby="voidCrystals-label"><g:fieldValue bean="${recipeInstance}" field="voidCrystals"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.waterCrystals}">
				<li class="fieldcontain">
					<span id="waterCrystals-label" class="property-label"><g:message code="recipe.waterCrystals.label" default="Water Crystals" /></span>
					
						<span class="property-value" aria-labelledby="waterCrystals-label"><g:fieldValue bean="${recipeInstance}" field="waterCrystals"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:recipeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${recipeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
