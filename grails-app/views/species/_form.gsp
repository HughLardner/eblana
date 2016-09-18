<%@ page import="eblana.character.Species" %>



			<div class="${hasErrors(bean: speciesInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="species.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${speciesInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: speciesInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: speciesInstance, field: 'visiable', 'error')} ">
				<label for="visiable" class="control-label"><g:message code="species.visiable.label" default="Visiable" /></label>
				<div>
					<g:checkBox name="visiable" value="${speciesInstance?.visiable}" />
					<span class="help-inline">${hasErrors(bean: speciesInstance, field: 'visiable', 'error')}</span>
				</div>
			</div>

