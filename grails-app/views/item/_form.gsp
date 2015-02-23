<%@ page import="eblana.items.Item" %>



			<div class="${hasErrors(bean: itemInstance, field: 'duration', 'error')} ">
				<label for="duration" class="control-label"><g:message code="item.duration.label" default="Duration" /></label>
				<div>
					<g:select class="form-control" id="duration" name="duration.id" from="${eblana.event.Event.list()}" optionKey="id" value="${itemInstance?.duration?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: itemInstance, field: 'duration', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: itemInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="item.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${itemInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: itemInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: itemInstance, field: 'singleUse', 'error')} ">
				<label for="singleUse" class="control-label"><g:message code="item.singleUse.label" default="Single Use" /></label>
				<div>
					<bs:checkBox name="singleUse" value="${itemInstance?.singleUse}" />
					<span class="help-inline">${hasErrors(bean: itemInstance, field: 'singleUse', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: itemInstance, field: 'type', 'error')} ">
				<label for="type" class="control-label"><g:message code="item.type.label" default="Type" /></label>
				<div>
					<g:textField class="form-control" name="type" value="${itemInstance?.type}"/>
					<span class="help-inline">${hasErrors(bean: itemInstance, field: 'type', 'error')}</span>
				</div>
			</div>

