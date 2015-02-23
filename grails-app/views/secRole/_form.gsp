<%@ page import="eblana.users.SecRole" %>



			<div class="${hasErrors(bean: secRoleInstance, field: 'authority', 'error')} ">
				<label for="authority" class="control-label"><g:message code="secRole.authority.label" default="Authority" /></label>
				<div>
					<g:textField class="form-control" name="authority" value="${secRoleInstance?.authority}"/>
					<span class="help-inline">${hasErrors(bean: secRoleInstance, field: 'authority', 'error')}</span>
				</div>
			</div>

