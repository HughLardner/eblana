<%@ page import="eblana.event.Event"%>



	<div
		class="${hasErrors(bean: eventInstance, field: 'characterEvent', 'error')}">
		<label for="characterEvent" class="control-label">Characters: </label>
		<g:render template="/template/charEvent"
			model="['instance': eventInstance, 'div':'characterEvent', 'description': 'Add Character']" />
		
	</div>

<div class="${hasErrors(bean: eventInstance, field: 'name', 'error')} ">
	<label for="name" class="control-label"><g:message
			code="event.name.label" default="Name" /></label>
	<div>
		<g:textField class="form-control" name="name"
			value="${eventInstance?.name}" />
		<span class="help-inline">
			${hasErrors(bean: eventInstance, field: 'name', 'error')}
		</span>
	</div>
</div>

