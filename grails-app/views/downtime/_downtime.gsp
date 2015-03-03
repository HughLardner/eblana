<h3>
	${fieldValue(bean: instance, field: "event")}
</h3>

<table class="frame">
	<tr>
		<td>
			<table class="body">
				<tr>
					<td><g:message code="characterEvent.research.label"
							default="Research: " /><br> ${fieldValue(bean: instance, field: "research")}
					</td>
					<td><g:message code="characterEvent.researchMethod.label"
							default="Research Method: " /><br> ${fieldValue(bean: instance, field: "researchMethod")}
					</td>

					<td><g:message code="characterEvent.researchResources.label"
							default="Research Resources: " /><br> ${fieldValue(bean: instance, field: "researchResources")}
					</td>
			</table>

			<table class="body">
				<tr>
					<td><g:message code="characterEvent.researchResults.label"
							default="Research Results: " /><br> ${fieldValue(bean: instance, field: "finalDecision")}
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
