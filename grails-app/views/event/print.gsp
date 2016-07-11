

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



<body>
	<section id="show-playerCharacter" class="first">
		<g:each in="${players}" status="i" var="playerCharacterInstance">
			<div style="page-break-after: always">
				<table class="frame" style="width: 100%; height: 50%">
					<tr>
						<td><g:render template="/event/showForm"
								model="['playerCharacterInstance': playerCharacterInstance.character]" />

							<div class="section">

								<br>
								<h2>Downtime</h2>

								<table style="width: 100%; text-align: left;">
									<tr>
										<td><g:message code="playerCharacter.airCrystals.label"
												default="Air Crystals: " /> ${playerCharacterInstance.downtime.airCrystals}
										</td>
										<td><g:message code="playerCharacter.earthCrystals.label"
												default="Earth Crystals: " /> ${playerCharacterInstance.downtime.earthCrystals}
										</td>
										<td><g:message code="playerCharacter.fireCrystals.label"
												default="Fire Crystals: " /> ${playerCharacterInstance.downtime.fireCrystals}
										</td>
										<td><g:message code="playerCharacter.waterCrystals.label"
												default="Water Crystals: " /> ${playerCharacterInstance.waterCrystals}
										</td>
										<td><g:message
												code="playerCharacter.blendedCrystals.label"
												default="Blended Crystals: " /> ${playerCharacterInstance.downtime.blendedCrystals}
										</td>
										<td><g:message code="playerCharacter.voidCrystals.label"
												default="Void Crystals: " /> ${playerCharacterInstance.downtime.voidCrystals}
										</td>
									</tr>
								</table>

								<table style="width: 100%; text-align: left;">
									<tr>
										<td>Lammies: <g:each
												in="${playerCharacterInstance.downtime.item}" var="item">
												${item.name?"${item.id}: ${item.name}":item.toString()},
											</g:each>
										</td>
									</tr>
								</table>

								<table style="width: 100%; text-align: left;">
									<tr>
										<td><g:message code="characterEvent.research.label"
												default="Research: " /><br> ${raw(playerCharacterInstance.downtime.research)}
										</td>
										<td><g:message code="characterEvent.researchMethod.label"
												default="Research Method: " /><br> ${raw(playerCharacterInstance.downtime.researchMethod)}
										</td>

										<td><g:message
												code="characterEvent.researchResources.label"
												default="Research Resources: " /><br> ${raw(playerCharacterInstance.downtime.researchResources)}
										</td>
								</table>

								<table style="width: 100%; text-align: left;">
									<tr>
										<td><g:message
												code="characterEvent.researchResults.label"
												default="Research Results: " /><br> ${raw(playerCharacterInstance.downtime.finalDecision)}
										</td>
									</tr>
								</table>

							</div>

							<div class="section">
								<br>
								<h2>Lore</h2>
								<table style="width: 100%; text-align: left;">
									<g:each in="${playerCharacterInstance.lore}"
										var="lore">
										
										<tr>
											<td><g:message
													code="characterEvent.researchResults.label"
													default="${lore.lore}" /><br></td>
										</tr>
										<tr>
											<td>${lore.content}</td>
										</tr>
									</g:each>
								</table>
							</div></td>
					</tr>
				</table>
			</div>
		</g:each>
	</section>
</body>
</html>