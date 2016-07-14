


			<table class="body">
				<tr>
					<td><g:message code="characterEvent.research.label"
							default="Goal: " /><br> ${raw(instance?.goal?.replaceAll('\n', '<br/>'))}

					</td>
			</table>

			<table class="body">
				<tr>
		<td><g:message code="characterEvent.research.label"
				default="Research: " /><br>
				${raw(instance?.research?.replaceAll('\n', '<br/>'))}
			
		</td>
		<td><g:message code="characterEvent.researchMethod.label"
				default="Research Method: " /><br> ${raw(instance?.researchMethod?.replaceAll('\n', '<br/>'))}

		</td>

		<td><g:message code="characterEvent.researchResources.label"
				default="Research Resources: " /><br> ${raw(instance?.researchResources?.replaceAll('\n', '<br/>'))}

		</td>
	
</table>

			<table class="body">
				<tr>
					<td><g:message code="characterEvent.researchResults.label"
							default="Research Results: " /><br> 
							<g:if test="${instance.event.downtimeDone}">
														${raw(instance?.finalDecision?.replaceAll('\n', '<br/>'))}
							
							</g:if>
					</td>
				</tr>
			</table>

