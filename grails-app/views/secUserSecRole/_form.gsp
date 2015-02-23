<%@ page import="eblana.users.SecUserSecRole" %>



			<div class="${hasErrors(bean: secUserSecRoleInstance, field: 'secRole', 'error')} ">
				<label for="secRole" class="control-label"><g:message code="secUserSecRole.secRole.label" default="Sec Role" /></label>
				<div>
					<g:select class="form-control" id="secRole" name="secRole.id" from="${eblana.users.SecRole.list()}" optionKey="id" value="${secUserSecRoleInstance?.secRole?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: secUserSecRoleInstance, field: 'secRole', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: secUserSecRoleInstance, field: 'secUser', 'error')} ">
				<label for="secUser" class="control-label"><g:message code="secUserSecRole.secUser.label" default="Sec User" /></label>
				<div>
					<g:select class="form-control" id="secUser" name="secUser.id" from="${eblana.users.SecUser.list()}" optionKey="id" value="${secUserSecRoleInstance?.secUser?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: secUserSecRoleInstance, field: 'secUser', 'error')}</span>
				</div>
			</div>

