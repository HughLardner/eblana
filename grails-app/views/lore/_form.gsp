<%@ page import="eblana.character.Lore" %>



			<div class="${hasErrors(bean: loreInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="lore.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${loreInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: loreInstance, field: 'name', 'error')}</span>
				</div>
			</div>

