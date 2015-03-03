<%@ page import="eblana.event.Downtime"%>





<div
	class="${hasErrors(bean: characterEvent, field: 'character', 'error')} ">
	<label for="character" class="control-label"><g:message
			code="characterEvent.character.label" default="Character" /></label>
	<div>
		<g:select class="form-control" id="character" name="character.id"
			from="${eblana.character.PlayerCharacter.list()}" optionKey="id"
			value="${characterEvent?.character?.id}" class="many-to-one"
			noSelection="['null': '']" />
		<span class="help-inline">
			${hasErrors(bean: characterEvent, field: 'character', 'error')}
		</span>
	</div>
</div>


<div
	class="${hasErrors(bean: characterEvent, field: 'research', 'error')} ">
	<label for="research" class="control-label"><g:message
			code="characterEvent.research.label" default="Research" /></label>
	<div>
		<g:textField class="form-control" name="research"
			value="${characterEvent?.research}" />
		<span class="help-inline">
			${hasErrors(bean: characterEvent, field: 'research', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: characterEvent, field: 'researchMethod', 'error')} ">
	<label for="researchMethod" class="control-label"><g:message
			code="characterEvent.researchMethod.label" default="Research Method" /></label>
	<div>
		<g:textField class="form-control" name="researchMethod"
			value="${characterEvent?.researchMethod}" />
		<span class="help-inline">
			${hasErrors(bean: characterEvent, field: 'researchMethod', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: characterEvent, field: 'researchResources', 'error')} ">
	<label for="researchResources" class="control-label"><g:message
			code="characterEvent.researchResources.label"
			default="Research Resources" /></label>
	<div>
		<g:textField class="form-control" name="researchResources"
			value="${characterEvent?.researchResources}" />
		<span class="help-inline">
			${hasErrors(bean: characterEvent, field: 'researchResources', 'error')}
		</span>
	</div>
</div>



<div
	class="${hasErrors(bean: characterEvent, field: 'headOfPlotResponse', 'error')} ">
	<label for="headOfPlotResponse" class="control-label"><g:message
			code="characterEvent.headOfPlotResponse.label"
			default="Head Of Plot Response" /></label>
	<div>
		<g:textField class="form-control" name="headOfPlotResponse"
			value="${characterEvent?.headOfPlotResponse}" />
		<span class="help-inline">
			${hasErrors(bean: characterEvent, field: 'headOfPlotResponse', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: characterEvent, field: 'headOfRulesResponse', 'error')} ">
	<label for="headOfRulesResponse" class="control-label"><g:message
			code="characterEvent.headOfRulesResponse.label"
			default="Head Of Rules Response" /></label>
	<div>
		<g:textField class="form-control" name="headOfRulesResponse"
			value="${characterEvent?.headOfRulesResponse}" />
		<span class="help-inline">
			${hasErrors(bean: characterEvent, field: 'headOfRulesResponse', 'error')}
		</span>
	</div>
</div>





<div
	class="${hasErrors(bean: characterEvent, field: 'headOfGameComments', 'error')} ">
	<label for="headOfGameComments" class="control-label"><g:message
			code="characterEvent.headOfGameComments.label"
			default="Head Of Game Comments" /></label>
	<div>
		<g:textField class="form-control" name="headOfGameComments"
			value="${characterEvent?.headOfGameComments}" />
		<span class="help-inline">
			${hasErrors(bean: characterEvent, field: 'headOfGameComments', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: characterEvent, field: 'finalDecision', 'error')} ">
	<label for="finalDecision" class="control-label"><g:message
			code="characterEvent.finalDecision.label" default="Final Decision" /></label>
	<div>
		<g:textField class="form-control" name="finalDecision"
			value="${characterEvent?.finalDecision}" />
		<span class="help-inline">
			${hasErrors(bean: characterEvent, field: 'finalDecision', 'error')}
		</span>
	</div>
</div>




<div
	class="${hasErrors(bean: characterEvent, field: 'airCrystals', 'error')} ">
	<label for="airCrystals" class="control-label"><g:message
			code="characterEvent.airCrystals.label" default="Air Crystals" /></label>
	<div>
		<g:field class="form-control" name="airCrystals" type="number"
			value="${characterEvent?.airCrystals}" />
		<span class="help-inline">
			${hasErrors(bean: characterEvent, field: 'airCrystals', 'error')}
		</span>
	</div>
</div>



<div
	class="${hasErrors(bean: characterEvent, field: 'earthCrystals', 'error')} ">
	<label for="earthCrystals" class="control-label"><g:message
			code="characterEvent.earthCrystals.label" default="Earth Crystals" /></label>
	<div>
		<g:field class="form-control" name="earthCrystals" type="number"
			value="${characterEvent?.earthCrystals}" />
		<span class="help-inline">
			${hasErrors(bean: characterEvent, field: 'earthCrystals', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: characterEvent, field: 'fireCrystals', 'error')} ">
	<label for="fireCrystals" class="control-label"><g:message
			code="characterEvent.fireCrystals.label" default="Fire Crystals" /></label>
	<div>
		<g:field class="form-control" name="fireCrystals" type="number"
			value="${characterEvent.fireCrystals}" />
		<span class="help-inline">
			${hasErrors(bean: characterEvent, field: 'fireCrystals', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: characterEvent, field: 'waterCrystals', 'error')} ">
	<label for="waterCrystals" class="control-label"><g:message
			code="characterEvent.waterCrystals.label" default="Water Crystals" /></label>
	<div>
		<g:field class="form-control" name="waterCrystals" type="number"
			value="${characterEvent.waterCrystals}" />
		<span class="help-inline">
			${hasErrors(bean: characterEvent, field: 'waterCrystals', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: characterEvent, field: 'blendedCrystals', 'error')} ">
	<label for="blendedCrystals" class="control-label"><g:message
			code="characterEvent.blendedCrystals.label"
			default="Blended Crystals" /></label>
	<div>
		<g:field class="form-control" name="blendedCrystals" type="number"
			value="${characterEvent.blendedCrystals}" />
		<span class="help-inline">
			${hasErrors(bean: characterEvent, field: 'blendedCrystals', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: characterEvent, field: 'voidCrystals', 'error')} ">
	<label for="voidCrystals" class="control-label"><g:message
			code="characterEvent.voidCrystals.label" default="Void Crystals" /></label>
	<div>
		<g:field class="form-control" name="voidCrystals" type="number"
			value="${characterEvent.voidCrystals}" />
		<span class="help-inline">
			${hasErrors(bean: characterEvent, field: 'voidCrystals', 'error')}
		</span>
	</div>
</div>

