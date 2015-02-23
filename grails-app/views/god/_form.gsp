<%@ page import="eblana.background.God" %>



			<div class="${hasErrors(bean: godInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="god.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${godInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: godInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: godInstance, field: 'playerChracter', 'error')} ">
				<label for="playerChracter" class="control-label"><g:message code="god.playerChracter.label" default="Player Chracter" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${godInstance?.playerChracter?}" var="p">
    <li><g:link controller="playerCharacter" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="playerCharacter" action="create" params="['god.id': godInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'playerCharacter.label', default: 'PlayerCharacter')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: godInstance, field: 'playerChracter', 'error')}</span>
				</div>
			</div>

