<%@ page import="eblana.character.Effect" %>



			<div class="${hasErrors(bean: effectInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="effect.description.label" default="Description" /></label>
				<div>
					<g:textField class="form-control" name="description" value="${effectInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: effectInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: effectInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="effect.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${effectInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: effectInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: effectInstance, field: 'type', 'error')} ">
				<label for="type" class="control-label"><g:message code="effect.type.label" default="Type" /></label>
				<div>
					<g:textField class="form-control" name="type" value="${effectInstance?.type}"/>
					<span class="help-inline">${hasErrors(bean: effectInstance, field: 'type', 'error')}</span>
				</div>
			</div>

