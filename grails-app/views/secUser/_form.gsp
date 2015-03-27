<%@ page import="eblana.users.SecUser"%>

<div
	class="${hasErrors(bean: userInstance, field: 'username', 'error')} ">
	<label for="username" class="control-label"><g:message
			code="user.username.label" default="Username" /></label>
	<div>
		<g:textField class="form-control" name="username"
			value="${secUserInstance?.username}" />
		<span class="help-inline">
			${hasErrors(bean: userInstance, field: 'username', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: userInstance, field: 'email', 'error')} ">
	<label for="username" class="control-label"><g:message
			code="user.username.label" default="Email" /></label>
	<div>
		<g:textField class="form-control" name="email"
			value="${secUserInstance?.email}" />
		<span class="help-inline">
			${hasErrors(bean: userInstance, field: 'email', 'error')}
		</span>
	</div>
</div>

<g:render template="../secUser/formUser"/>

<div
	class="${hasErrors(bean: secUserInstance, field: 'character', 'error')} ">
	<label for="character" class="control-label"><g:message
			code="secUser.character.label" default="Character" /></label>
	<div>
		<g:select class="form-control" name="character"
			from="${eblana.character.PlayerCharacter.list()}" multiple="multiple"
			optionKey="id" size="5" value="${secUserInstance?.character*.id}"
			class="many-to-many" />
		<span class="help-inline">
			${hasErrors(bean: secUserInstance, field: 'character', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: secUserInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired" class="control-label"><g:message
			code="secUser.accountExpired.label" default="Account Expired" /></label>
	<div>
		<bs:checkBox name="accountExpired"
			value="${secUserInstance?.accountExpired}" />
		<span class="help-inline">
			${hasErrors(bean: secUserInstance, field: 'accountExpired', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: secUserInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked" class="control-label"><g:message
			code="secUser.accountLocked.label" default="Account Locked" /></label>
	<div>
		<bs:checkBox name="accountLocked"
			value="${secUserInstance?.accountLocked}" />
		<span class="help-inline">
			${hasErrors(bean: secUserInstance, field: 'accountLocked', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: secUserInstance, field: 'enabled', 'error')} ">
	<label for="enabled" class="control-label"><g:message
			code="secUser.enabled.label" default="Enabled" /></label>
	<div>
		<bs:checkBox name="enabled" value="${secUserInstance?.enabled}" />
		<span class="help-inline">
			${hasErrors(bean: secUserInstance, field: 'enabled', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: secUserInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired" class="control-label"><g:message
			code="secUser.passwordExpired.label" default="Password Expired" /></label>
	<div>
		<bs:checkBox name="passwordExpired"
			value="${secUserInstance?.passwordExpired}" />
		<span class="help-inline">
			${hasErrors(bean: secUserInstance, field: 'passwordExpired', 'error')}
		</span>
	</div>
</div>


