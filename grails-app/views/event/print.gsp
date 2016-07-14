

<!DOCTYPE html>
<html>
<style>
table {
	border-collapse: collapse;
}

table, td, th {
	border: 1px solid black;
	padding: 15px;
	table-layout: fixed;
}

.frame {
	padding: 10px;
	width: 100%;
	height: 50%
}

.int {
	width: 5px;
}

.body {
	width: 100%;
	text-align: left;
	page-break-inside: avoid !important;
}

.craft, td.craft, th.craft{
	padding: 1px !important;
	width: 100%;
	text-align: center;
	table-layout: auto;
	page-break-inside: avoid !important;
}

.blank_row {
	height: 10px !important; /* Overwrite any previous rules */
	border: none !important;
}

div.character {
	
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
								<g:render template="/downtime/downtime"
									model="['instance': playerCharacterInstance.downtime, 'event':'']" />
							</div>

							<div class="section">
								<br>
								<h2>Lore</h2>
								<table style="width: 100%; text-align: left;">
									<g:each in="${playerCharacterInstance.lore}" var="lore">

										<tr>
											<td><g:message
													code="characterEvent.researchResults.label"
													default="${lore.lore}" /><br></td>
										</tr>
										<tr>
											<td>
												${raw(lore.content)}
											</td>
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