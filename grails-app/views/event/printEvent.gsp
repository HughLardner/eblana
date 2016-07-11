

<!DOCTYPE html>
<html>
<style>
table {
	border-collapse: collapse;
}

table, td, th {
	border: 1px solid black;
	padding: 15px;
}

.frame {
	padding: 0px;
}

div.character {
	page-break-after: always;
}

ul.feat {
	columns: 2;
	-webkit-columns: 2;
	-moz-columns: 2;
}
</style>

<head>
<meta name="layout" content="printing" />
</head>

<body>
	<section id="show-playerCharacter" class="first">

		<g:each in="${eventInstance.characterEvent}" status="i"
			var="playerCharacterInstance">
			<div style="page-break-after: always">
				<table class="frame" style="width: 100%; height: 50%">
					<tr>
						<td><g:render template="/event/showForm"
								model="['playerCharacterInstance': playerCharacterInstance.character]" />
							<div class="section">

								<table style="width: 100%; text-align: left;">
									<tr>
										<td><g:message code="playerCharacter.airCrystals.label"
												default="Air Crystals: " /> ${fieldValue(bean: playerCharacterInstance, field: "airCrystals")}
										</td>
										<td><g:message code="playerCharacter.earthCrystals.label"
												default="Earth Crystals: " /> ${fieldValue(bean: playerCharacterInstance, field: "earthCrystals")}
										</td>
										<td><g:message code="playerCharacter.fireCrystals.label"
												default="Fire Crystals: " /> ${fieldValue(bean: playerCharacterInstance, field: "fireCrystals")}
										</td>
										<td><g:message code="playerCharacter.waterCrystals.label"
												default="Water Crystals: " /> ${fieldValue(bean: playerCharacterInstance, field: "waterCrystals")}
										</td>
										<td><g:message
												code="playerCharacter.blendedCrystals.label"
												default="Blended Crystals: " /> ${fieldValue(bean: playerCharacterInstance, field: "blendedCrystals")}
										</td>
										<td><g:message code="playerCharacter.voidCrystals.label"
												default="Void Crystals: " /> ${fieldValue(bean: playerCharacterInstance, field: "voidCrystals")}
										</td>
									</tr>
								</table>

								<table style="width: 100%; text-align: left;">
									<tr>
										<td><g:message code="characterEvent.research.label"
												default="Research: " /><br> ${fieldValue(bean: playerCharacterInstance, field: "research")}
										</td>
										<td><g:message code="characterEvent.researchMethod.label"
												default="Research Method: " /><br> ${fieldValue(bean: playerCharacterInstance, field: "researchMethod")}
										</td>

										<td><g:message
												code="characterEvent.researchResources.label"
												default="Research Resources: " /><br> ${fieldValue(bean: playerCharacterInstance, field: "researchResources")}
										</td>
								</table>

								<table style="width: 100%; text-align: left;">
									<tr>
										<td><g:message
												code="characterEvent.researchResults.label"
												default="Research Results: " /><br> ${fieldValue(bean: playerCharacterInstance, field: "finalDecision")}
										</td>
									</tr>
								</table>
							</div></td>
					</tr>
				</table>
			</div>
		</g:each>
	</section>
</body>
</html>