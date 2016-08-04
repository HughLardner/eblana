
<%@ page import="eblana.event.Downtime"%>
<!DOCTYPE html>
<html>

<head>
<meta name="layout" content="kickstart" />
<g:set var="entityName"
	value="${message(code: 'characterEvent.label', default: 'Downtime')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

	<section id="show-characterEvent" class="first">

		<table class="table">
			<tbody>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="characterEvent.airCrystals.label" default="Air Crystals" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: characterEventInstance, field: "airCrystals")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="characterEvent.blendedCrystals.label"
							default="Blended Crystals" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: characterEventInstance, field: "blendedCrystals")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="characterEvent.character.label" default="Character" /></td>

					<td valign="top" class="value"><g:link
							controller="playerCharacter" action="show"
							id="${characterEventInstance?.character?.id}">
							${characterEventInstance?.character?.encodeAsHTML()}
						</g:link></td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="characterEvent.earthCrystals.label"
							default="Earth Crystals" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: characterEventInstance, field: "earthCrystals")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="characterEvent.event.label" default="Event" /></td>

					<td valign="top" class="value"><g:link controller="event"
							action="show" id="${characterEventInstance?.event?.id}">
							${characterEventInstance?.event?.encodeAsHTML()}
						</g:link></td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="characterEvent.finalDecision.label"
							default="Final Decision" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: characterEventInstance, field: "finalDecision")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="characterEvent.fireCrystals.label" default="Fire Crystals" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: characterEventInstance, field: "fireCrystals")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="characterEvent.headOfGameComments.label"
							default="Head Of Game Comments" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: characterEventInstance, field: "headOfGameComments")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="characterEvent.headOfPlotResponse.label"
							default="Head Of Plot Response" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: characterEventInstance, field: "headOfPlotResponse")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="characterEvent.headOfRulesResponse.label"
							default="Head Of Rules Response" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: characterEventInstance, field: "headOfRulesResponse")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="characterEvent.item.label" default="Item" /></td>

					<td valign="top" style="text-align: left;" class="value">
						<ul>
							<g:each in="${characterEventInstance?.item}" var="i">
								<li><g:link controller="item" action="show" id="${i.id}">
										${i?.encodeAsHTML()}
									</g:link></li>
							</g:each>
						</ul>
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="characterEvent.research.label" default="Research" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: characterEventInstance, field: "research")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="characterEvent.researchMethod.label"
							default="Research Method" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: characterEventInstance, field: "researchMethod")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="characterEvent.researchResources.label"
							default="Research Resources" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: characterEventInstance, field: "researchResources")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="characterEvent.researchScore.label"
							default="Research Score" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: characterEventInstance, field: "researchScore")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="characterEvent.voidCrystals.label" default="Void Crystals" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: characterEventInstance, field: "voidCrystals")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="characterEvent.waterCrystals.label"
							default="Water Crystals" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: characterEventInstance, field: "waterCrystals")}
					</td>

				</tr>

			</tbody>
		</table>
	</section>

</body>

</html>
