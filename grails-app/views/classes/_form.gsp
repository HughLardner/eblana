<%@ page import="eblana.character.Classes" %>



			<div class="${hasErrors(bean: classesInstance, field: 'level', 'error')} required">
				<label for="level" class="control-label"><g:message code="classes.level.label" default="Level" /></label>
				<div>
					<g:field class="form-control" name="level" type="number" value="${classesInstance.level} " required=""/>
					<span class="help-inline">${hasErrors(bean: classesInstance, field: 'level', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: classesInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="classes.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${classesInstance?.name}" required=""/>
					<span class="help-inline">${hasErrors(bean: classesInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: classesInstance, field: 'prerequisite', 'error')} ">
				<label for="prerequisite" class="control-label"><g:message code="classes.prerequisite.label" default="Prerequisite" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="prerequisite" noSelection="${['null':'Select One...']}" name="prerequisite.id" from="${eblana.character.Classes.list()}" optionKey="id"  value="${classesInstance?.prerequisite?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: classesInstance, field: 'prerequisite', 'error')}</span>
				</div>
			</div>

