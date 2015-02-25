<%@ page import="eblana.items.Item" %>



			<div class="${hasErrors(bean: itemInstance, field: 'attunementTime', 'error')} ">
				<label for="attunementTime" class="control-label"><g:message code="item.attunementTime.label" default="Attunement Time" /></label>
				<div>
					<g:textField class="form-control" name="attunementTime" value="${itemInstance?.attunementTime}"/>
					<span class="help-inline">${hasErrors(bean: itemInstance, field: 'attunementTime', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: itemInstance, field: 'convertedCrystalCost', 'error')} ">
				<label for="convertedCrystalCost" class="control-label"><g:message code="item.convertedCrystalCost.label" default="Converted Crystal Cost" /></label>
				<div>
					<g:field class="form-control" name="convertedCrystalCost" type="number" value="${itemInstance.convertedCrystalCost}"/>
					<span class="help-inline">${hasErrors(bean: itemInstance, field: 'convertedCrystalCost', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: itemInstance, field: 'curseCure', 'error')} ">
				<label for="curseCure" class="control-label"><g:message code="item.curseCure.label" default="Curse Cure" /></label>
				<div>
					<g:textField class="form-control" name="curseCure" value="${itemInstance?.curseCure}"/>
					<span class="help-inline">${hasErrors(bean: itemInstance, field: 'curseCure', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: itemInstance, field: 'duration', 'error')} ">
				<label for="duration" class="control-label"><g:message code="item.duration.label" default="Duration" /></label>
				<div>
					<g:textField class="form-control" name="duration" value="${itemInstance?.duration}"/>
					<span class="help-inline">${hasErrors(bean: itemInstance, field: 'duration', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: itemInstance, field: 'internalNotes', 'error')} ">
				<label for="internalNotes" class="control-label"><g:message code="item.internalNotes.label" default="Internal Notes" /></label>
				<div>
					<g:textField class="form-control" name="internalNotes" value="${itemInstance?.internalNotes}"/>
					<span class="help-inline">${hasErrors(bean: itemInstance, field: 'internalNotes', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: itemInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="item.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${itemInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: itemInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: itemInstance, field: 'power1', 'error')} ">
				<label for="power1" class="control-label"><g:message code="item.power1.label" default="Power1" /></label>
				<div>
					<g:textField class="form-control" name="power1" value="${itemInstance?.power1}"/>
					<span class="help-inline">${hasErrors(bean: itemInstance, field: 'power1', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: itemInstance, field: 'power2', 'error')} ">
				<label for="power2" class="control-label"><g:message code="item.power2.label" default="Power2" /></label>
				<div>
					<g:textField class="form-control" name="power2" value="${itemInstance?.power2}"/>
					<span class="help-inline">${hasErrors(bean: itemInstance, field: 'power2', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: itemInstance, field: 'singleUse', 'error')} ">
				<label for="singleUse" class="control-label"><g:message code="item.singleUse.label" default="Single Use" /></label>
				<div>
					<bs:checkBox name="singleUse" value="${itemInstance?.singleUse}" />
					<span class="help-inline">${hasErrors(bean: itemInstance, field: 'singleUse', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: itemInstance, field: 'status', 'error')} ">
				<label for="status" class="control-label"><g:message code="item.status.label" default="Status" /></label>
				<div>
					<g:select class="form-control" name="status" from="${eblana.items.Item$Status?.values()}" keys="${eblana.items.Item$Status.values()*.name()}" value="${itemInstance?.status?.name()}" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: itemInstance, field: 'status', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: itemInstance, field: 'type', 'error')} ">
				<label for="type" class="control-label"><g:message code="item.type.label" default="Type" /></label>
				<div>
					<g:textField class="form-control" name="type" value="${itemInstance?.type}"/>
					<span class="help-inline">${hasErrors(bean: itemInstance, field: 'type', 'error')}</span>
				</div>
			</div>

