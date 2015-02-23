<%@ page import="eblana.background.Settlement" %>



			<div class="${hasErrors(bean: settlementInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="settlement.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${settlementInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: settlementInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: settlementInstance, field: 'playerChracter', 'error')} ">
				<label for="playerChracter" class="control-label"><g:message code="settlement.playerChracter.label" default="Player Chracter" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${settlementInstance?.playerChracter?}" var="p">
    <li><g:link controller="playerCharacter" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="playerCharacter" action="create" params="['settlement.id': settlementInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'playerCharacter.label', default: 'PlayerCharacter')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: settlementInstance, field: 'playerChracter', 'error')}</span>
				</div>
			</div>

