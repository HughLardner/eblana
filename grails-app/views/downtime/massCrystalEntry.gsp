<%@ page import="eblana.event.Downtime"%>


<!DOCTYPE html>
<html>

<head>
<meta name="layout" content="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'characterEvent.label', default: 'Downtime')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>
	<section id="show-characterEvent" class="first">
		<g:hiddenField class="form-control" id="event" name="event"
			type="text" value="${event.id}" readonly="readonly" />

		<h2>
			Downtime returns for:
			${event }
		</h2>
		<table class="table">


			<thead>
				<tr>
					<td>Player Name</td>
					<td>Character Name</td>
					<td>Air</td>
					<td>Earth</td>
					<td>Fire</td>
					<td>Water</td>
					<td>Blended</td>
					<td>Void</td>
				</tr>
			</thead>
			<tbody>
				<g:each
					in="${eblana.character.PlayerCharacter.findAllByAlive(true)}"
					var="character">
					<g:set var="downtime"
						value="${eblana.event.Downtime.findByCharacterAndEvent(character,event)}" />

					<tr>
						<td><g:link action="show" controller="SecUser"
								id="${character.user?.id}">
								${character.user?.firstName}
								${character.user?.surname }
							</g:link></td>
						<td><g:link action="show" controller="PlayerCharacter"
								id="${character.id}">
								${fieldValue(bean: character, field: "name")}
							</g:link></td>

						<td><g:field class="form-control"
								name="${character}.airCrystals" id="${character}.airCrystals"
								type="number" value="${downtime?.airCrystals}" /> <span
							class="help-inline"> ${hasErrors(bean: downtime, field: 'airCrystals', 'error')}
						</span></td>
						<td><g:field class="form-control"
								name="${character}.earthCrystals"
								id="${character}.earthCrystals" type="number"
								value="${downtime?.earthCrystals}" /> <span class="help-inline">
								${hasErrors(bean: downtime, field: 'earthCrystals', 'error')}
						</span></td>
						<td><g:field class="form-control"
								name="${character}.fireCrystals" id="${character}.fireCrystals"
								type="number" value="${downtime?.fireCrystals}" /> <span
							class="help-inline"> ${hasErrors(bean: downtime, field: 'fireCrystals', 'error')}
						</span></td>
						<td><g:field class="form-control"
								name="${character}.waterCrystals"
								id="${character}.waterCrystals" type="number"
								value="${downtime?.waterCrystals}" /> <span class="help-inline">
								${hasErrors(bean: downtime, field: 'waterCrystals', 'error')}
						</span></td>
						<td><g:field class="form-control"
								name="${character}.blendedCrystals"
								id="${character}.blendedCrystals" type="number"
								value="${downtime?.blendedCrystals}" /> <span
							class="help-inline"> ${hasErrors(bean: downtime, field: 'blendedCrystals', 'error')}
						</span></td>
						<td><g:field class="form-control"
								name="${character}.voidCrystals" id="${character}.voidCrystals"
								type="number" value="${downtime?.voidCrystals}" /> <span
							class="help-inline"> ${hasErrors(bean: downtime, field: 'voidCrystals', 'error')}
						</span></td>
					</tr>
				</g:each>
			</tbody>
		</table>
<script type="text/javascript">
$('#refreshData').click(function(){
	var newData = ${remoteFunction(controller: 'downtime', action: 'saveReturns', params: '[string_from_form]')};
});

</script>
		<button id="refreshData">Submit</button>

		<div class="form-actions margin-top-medium">
			<g:actionSubmit class="btn btn-primary" action="saveReturns"
				value="saveReturns" />
			<button class="btn" type="reset">
				<g:message code="default.button.reset.label" default="Reset" />
			</button>
		</div>
	</section>

</body>