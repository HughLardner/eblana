<%@ page import="eblana.event.CharacterEvent" %>



			<div class="${hasErrors(bean: characterEventInstance, field: 'airCrystals', 'error')} ">
				<label for="airCrystals" class="control-label"><g:message code="characterEvent.airCrystals.label" default="Air Crystals" /></label>
				<div>
					<g:field class="form-control" name="airCrystals" type="number" value="${characterEventInstance.airCrystals}"/>
					<span class="help-inline">${hasErrors(bean: characterEventInstance, field: 'airCrystals', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterEventInstance, field: 'blendedCrystals', 'error')} ">
				<label for="blendedCrystals" class="control-label"><g:message code="characterEvent.blendedCrystals.label" default="Blended Crystals" /></label>
				<div>
					<g:field class="form-control" name="blendedCrystals" type="number" value="${characterEventInstance.blendedCrystals}"/>
					<span class="help-inline">${hasErrors(bean: characterEventInstance, field: 'blendedCrystals', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterEventInstance, field: 'character', 'error')} ">
				<label for="character" class="control-label"><g:message code="characterEvent.character.label" default="Character" /></label>
				<div>
					<g:select class="form-control" id="character" name="character.id" from="${eblana.character.PlayerCharacter.list()}" optionKey="id" value="${characterEventInstance?.character?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: characterEventInstance, field: 'character', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterEventInstance, field: 'earthCrystals', 'error')} ">
				<label for="earthCrystals" class="control-label"><g:message code="characterEvent.earthCrystals.label" default="Earth Crystals" /></label>
				<div>
					<g:field class="form-control" name="earthCrystals" type="number" value="${characterEventInstance.earthCrystals}"/>
					<span class="help-inline">${hasErrors(bean: characterEventInstance, field: 'earthCrystals', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterEventInstance, field: 'event', 'error')} ">
				<label for="event" class="control-label"><g:message code="characterEvent.event.label" default="Event" /></label>
				<div>
					<g:select class="form-control" id="event" name="event.id" from="${eblana.event.Event.list()}" optionKey="id" value="${characterEventInstance?.event?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: characterEventInstance, field: 'event', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterEventInstance, field: 'finalDecision', 'error')} ">
				<label for="finalDecision" class="control-label"><g:message code="characterEvent.finalDecision.label" default="Final Decision" /></label>
				<div>
					<g:textField class="form-control" name="finalDecision" value="${characterEventInstance?.finalDecision}"/>
					<span class="help-inline">${hasErrors(bean: characterEventInstance, field: 'finalDecision', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterEventInstance, field: 'fireCrystals', 'error')} ">
				<label for="fireCrystals" class="control-label"><g:message code="characterEvent.fireCrystals.label" default="Fire Crystals" /></label>
				<div>
					<g:field class="form-control" name="fireCrystals" type="number" value="${characterEventInstance.fireCrystals}"/>
					<span class="help-inline">${hasErrors(bean: characterEventInstance, field: 'fireCrystals', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterEventInstance, field: 'headOfGameComments', 'error')} ">
				<label for="headOfGameComments" class="control-label"><g:message code="characterEvent.headOfGameComments.label" default="Head Of Game Comments" /></label>
				<div>
					<g:textField class="form-control" name="headOfGameComments" value="${characterEventInstance?.headOfGameComments}"/>
					<span class="help-inline">${hasErrors(bean: characterEventInstance, field: 'headOfGameComments', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterEventInstance, field: 'headOfPlotResponse', 'error')} ">
				<label for="headOfPlotResponse" class="control-label"><g:message code="characterEvent.headOfPlotResponse.label" default="Head Of Plot Response" /></label>
				<div>
					<g:textField class="form-control" name="headOfPlotResponse" value="${characterEventInstance?.headOfPlotResponse}"/>
					<span class="help-inline">${hasErrors(bean: characterEventInstance, field: 'headOfPlotResponse', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterEventInstance, field: 'headOfRulesResponse', 'error')} ">
				<label for="headOfRulesResponse" class="control-label"><g:message code="characterEvent.headOfRulesResponse.label" default="Head Of Rules Response" /></label>
				<div>
					<g:textField class="form-control" name="headOfRulesResponse" value="${characterEventInstance?.headOfRulesResponse}"/>
					<span class="help-inline">${hasErrors(bean: characterEventInstance, field: 'headOfRulesResponse', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterEventInstance, field: 'item', 'error')} ">
				<label for="item" class="control-label"><g:message code="characterEvent.item.label" default="Item" /></label>
				<div>
					<g:select class="form-control" name="item" from="${eblana.items.Item.list()}" multiple="multiple" optionKey="id" size="5" value="${characterEventInstance?.item*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: characterEventInstance, field: 'item', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterEventInstance, field: 'research', 'error')} ">
				<label for="research" class="control-label"><g:message code="characterEvent.research.label" default="Research" /></label>
				<div>
					<g:textField class="form-control" name="research" value="${characterEventInstance?.research}"/>
					<span class="help-inline">${hasErrors(bean: characterEventInstance, field: 'research', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterEventInstance, field: 'researchMethod', 'error')} ">
				<label for="researchMethod" class="control-label"><g:message code="characterEvent.researchMethod.label" default="Research Method" /></label>
				<div>
					<g:textField class="form-control" name="researchMethod" value="${characterEventInstance?.researchMethod}"/>
					<span class="help-inline">${hasErrors(bean: characterEventInstance, field: 'researchMethod', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterEventInstance, field: 'researchResources', 'error')} ">
				<label for="researchResources" class="control-label"><g:message code="characterEvent.researchResources.label" default="Research Resources" /></label>
				<div>
					<g:textField class="form-control" name="researchResources" value="${characterEventInstance?.researchResources}"/>
					<span class="help-inline">${hasErrors(bean: characterEventInstance, field: 'researchResources', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterEventInstance, field: 'researchScore', 'error')} ">
				<label for="researchScore" class="control-label"><g:message code="characterEvent.researchScore.label" default="Research Score" /></label>
				<div>
					<g:field class="form-control" name="researchScore" type="number" value="${characterEventInstance.researchScore}"/>
					<span class="help-inline">${hasErrors(bean: characterEventInstance, field: 'researchScore', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterEventInstance, field: 'voidCrystals', 'error')} ">
				<label for="voidCrystals" class="control-label"><g:message code="characterEvent.voidCrystals.label" default="Void Crystals" /></label>
				<div>
					<g:field class="form-control" name="voidCrystals" type="number" value="${characterEventInstance.voidCrystals}"/>
					<span class="help-inline">${hasErrors(bean: characterEventInstance, field: 'voidCrystals', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterEventInstance, field: 'waterCrystals', 'error')} ">
				<label for="waterCrystals" class="control-label"><g:message code="characterEvent.waterCrystals.label" default="Water Crystals" /></label>
				<div>
					<g:field class="form-control" name="waterCrystals" type="number" value="${characterEventInstance.waterCrystals}"/>
					<span class="help-inline">${hasErrors(bean: characterEventInstance, field: 'waterCrystals', 'error')}</span>
				</div>
			</div>

