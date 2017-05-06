<%@ page import="eblana.event.Event"%>
<%@ page import="eblana.character.PlayerCharacter"%>

<div
	class="${hasErrors(bean: eventInstance, field: 'eventNumber', 'error')} ">
	<label for="eventNumber" class="control-label"><g:message
			code="event.name.label" default="Number" /></label>
	<div>
		<g:field type="number" class="form-control" name="eventNumber"
			value="${eventInstance?.eventNumber}" />
		<span class="help-inline"> ${hasErrors(bean: eventInstance, field: 'eventNumber', 'error')}
		</span>
	</div>
</div>

<div class="${hasErrors(bean: eventInstance, field: 'name', 'error')} ">
	<label for="name" class="control-label"><g:message
			code="event.name.label" default="Name" /></label>
	<div>
		<g:textField class="form-control" name="name"
			value="${eventInstance?.name}" />
		<span class="help-inline"> ${hasErrors(bean: eventInstance, field: 'name', 'error')}
		</span>
	</div>
</div>

<div class="${hasErrors(bean: eventInstance, field: 'date', 'error')} ">
	<label for="date" class="control-label"><g:message
			code="event.name.label" default="Date" /></label>
	<div>
		<g:datePicker class="form-control" name="date"
			value="${eventInstance?.date}" precision="day"
			noSelection="['':'-Choose-']" relativeYears="[-2..7]" />
		<span class="help-inline"> ${hasErrors(bean: eventInstance, field: 'date', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: eventInstance, field: 'lastEvent', 'error')} ">
	<label for="lastEvent" class="control-label"><g:message
			code="event.name.label" default="Downtime Open" /></label>
	<div>
		<g:checkBox class="form-control" name="lastEvent"
			value="${eventInstance?.lastEvent}" />
		<span class="help-inline"> ${hasErrors(bean: eventInstance, field: 'lastEvent', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: eventInstance, field: 'currentDowntime', 'error')} ">
	<label for="currentDowntime" class="control-label"><g:message
			code="event.name.label" default="Current Downtime" /></label>
	<div>
		<g:checkBox class="form-control" name="currentDowntime"
			value="${eventInstance?.lastEvent}" />
		<span class="help-inline"> ${hasErrors(bean: eventInstance, field: 'currentDowntime', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: eventInstance, field: 'downtimeDone', 'error')} ">
	<label for="downtimeDone" class="control-label"><g:message
			code="event.name.label" default="Downtime Done" /></label>
	<div>
		<g:checkBox class="form-control" name="downtimeDone"
			value="${eventInstance?.downtimeDone}" />
		<span class="help-inline"> ${hasErrors(bean: eventInstance, field: 'downtimeDone', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: eventInstance, field: 'attended', 'error')} ">
	<label for="attended" class="control-label"><g:message
			code="event.name.label" default="Returns" /></label>
	<table class="table">
		<tr>
			<th>PID</th>
			<th>Player</th>
			<th>CID</th>
			<th>Character</th>
			<th>Attended</th>
			<th class="air">Air</th>
			<th class="earth">Earth</th>
			<th class="fire">Fire</th>
			<th class="water">Water</th>
			<th class="blended">Blended</th>
			<th class="void">Void</th>
			<th>Items (comma separated)</th>
		</tr>
		<g:each in="${PlayerCharacter?.findAllByAliveAndUserIsNotNull(true,[sort:"user.firstName"])}" var="c">
		<g:set var="d" value="${downtimes?.get(c?.id)}"/>
		<g:hiddenField  name="character.${c?.id}.downtimeId" value="${d?.id}"/>
				<tr>
				<td>
					 ${c?.user?.id }
				</td>
				<td><g:link controller="secUser" action="show"
						id="${c?.user?.id}">
						${c?.user?.firstName} ${c?.user?.surname}
					</g:link></td>
				<td>
					${c?.id }
				</td>
				<td><g:link controller="playerCharacter" action="show"
						id="${c?.id}">
						${c?.encodeAsHTML()}
					</g:link></td>
				<td><g:checkBox class="form-control" name="attended"
						value="${c?.id}"
						checked="${eventInstance?.attended?.contains(c)?:''}" /></td>
			<td class="air"><g:field type="number" class="form-control" name="character.${c?.id}.air"
			value="${d?.airCrystals}" /></td>
			<td class="earth"><g:field type="number" class="form-control" name="character.${c?.id}.earth"
			value="${d?.earthCrystals}" /></td>
			<td class="fire"><g:field type="number" class="form-control" name="character.${c?.id}.fire"
			value="${d?.fireCrystals}" /></td>
			<td class="water"><g:field type="number" class="form-control" name="character.${c?.id}.water"
			value="${d?.waterCrystals}" /></td>
			<td class="blended"><g:field type="number" class="form-control" name="character.${c?.id}.blended"
			value="${d?.blendedCrystals}" /></td>
			<td class="void"><g:field type="number" class="form-control" name="character.${c?.id}.void"
			value="${d?.voidCrystals}" /></td>
			<td><g:textField class="form-control" name="character.${c?.id}.items"
			value="${d?org.apache.commons.lang.StringUtils.join(d?.item*.id,','):''}" /></td>
			</tr>
		</g:each>
	</table>

</div>

