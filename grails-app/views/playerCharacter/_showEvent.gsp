<g:set var="eventService" bean="eventService" />
<g:set var="event" value="${eventService.lastEvent()}" />
<g:set var="downtime"
	value="${eblana.event.Downtime.findByEventAndCharacter(event,playerCharacterInstance)}" />
<style type="text/css">
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
	height: 50%;
	page-break-inside: avoid !important;
}

.int {
	width: 20px;
}

.body {
	width: 100%;
	text-align: left;
	page-break-inside: avoid !important;
}

.craft {
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

div.section{
	page-break-inside: avoid !important;
}

ul.feat {
	columns: 2;
	-webkit-columns: 2;
	-moz-columns: 2;
}

@media screen {
	div.divHeader {
		display: none;
	}
}

@media print {
	div.divHeader {
		position: fixed;
		top: 0;
	}
}

</style>
<section id="show-playerCharacter" class="section">
	<div class="character">
		<h2>Character</h2>
		<table class="frame">
			<tr>
				<td>

					<table class="body">
						<tr>
							<td>
								${playerCharacterInstance?.user?.firstName.encodeAsHTML()} ${playerCharacterInstance?.user?.surname}
							</td>
							<td><g:message code="playerCharacter.name.label"
									default="Character: " /> ${fieldValue(bean: playerCharacterInstance, field: "name")}
							</td>
							<td>
								${playerCharacterInstance?.species?.encodeAsHTML()}
							</td>
						</tr>
					</table>
					<table style="width: 100%; text-align: left;">
						<tr>
							<td><g:message code="playerCharacter.body.label"
									default="Body: " /> ${fieldValue(bean: playerCharacterInstance, field: "body")}</td>
							<td><g:message code="playerCharacter.armour.label"
									default="Armour: " /> ${fieldValue(bean: playerCharacterInstance, field: "armour")}
							</td>
							<td><g:message code="playerCharacter.mana.label"
									default="Mana: " /> ${fieldValue(bean: playerCharacterInstance, field: "mana")}</td>
							<td><g:message code="playerCharacter.xp.label"
									default="XP: " /> ${fieldValue(bean: playerCharacterInstance, field: "xp")}</td>
						</tr>
					</table>
					<table style="width: 100%; text-align: left;">
						<tr>
							<td><g:message code="playerCharacter.classes.label"
									default="Classes: " />

								<ul>
									<g:each in="${playerCharacterInstance?.classes}" var="c">
										<li>
											${c?.encodeAsHTML()}
										</li>
									</g:each>
								</ul></td>

							<td><g:message code="playerCharacter.feat.label"
									default="Feat: " />

								<ul class="feat">
									<g:each
										in="${playerCharacterInstance?.feat?.sort{it.feat.name}}"
										var="f">
										<li><g:link controller="feat" action="show"
												id="${f?.feat?.id}">
												${f?.encodeAsHTML()}
												${f?.effect}
											</g:link></li>
									</g:each>
								</ul></td>
						</tr>
					</table>
					<table style="width: 100%; text-align: left;">
						<tr>
							<td><g:message code="playerCharacter.spell.label"
									default="Spells: " />

								<ul>
									<g:each
										in="${playerCharacterInstance?.spell?.sort{it.spell?.classes?.level}}"
										var="s">
										<li><g:link controller="spell" action="show"
												id="${s?.spell?.id}">
												${s?.encodeAsHTML()}
												${s?.effect1}
												${s?.effect2}
											</g:link> (Mana: ${s?.spell.classes.level })</li>
									</g:each>
								</ul></td>
							<td><g:message code="playerCharacter.lore.label"
									default="Lores: " />

								<ul>
									<g:each in="${playerCharacterInstance?.lore}" var="l">
										<li>
											${l?.encodeAsHTML()}
										</li>
									</g:each>
								</ul></td>
						</tr>
					</table>


					<table style="width: 100%; text-align: left;">
						<tr>

							<td><g:message code="playerCharacter.airCrystals.label"
									default="Air Crystals: " /> ${fieldValue(bean: downtime, field: "airCrystals")}
							</td>
							<td><g:message code="playerCharacter.earthCrystals.label"
									default="Earth Crystals: " /> ${fieldValue(bean: downtime, field: "earthCrystals")}
							</td>
							<td><g:message code="playerCharacter.fireCrystals.label"
									default="Fire Crystals: " /> ${fieldValue(bean: downtime, field: "fireCrystals")}
							</td>
							<td><g:message code="playerCharacter.waterCrystals.label"
									default="Water Crystals: " /> ${fieldValue(bean: downtime, field: "waterCrystals")}
							</td>
							<td><g:message code="playerCharacter.blendedCrystals.label"
									default="Blended Crystals: " /> ${fieldValue(bean: downtime, field: "blendedCrystals")}
							</td>
							<td><g:message code="playerCharacter.voidCrystals.label"
									default="Void Crystals: " /> ${fieldValue(bean: downtime, field: "voidCrystals")}
							</td>

						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>

	<div class="section">

		<br>
		<h2>Recipes</h2>
		<div class="divHeader">${fieldValue(bean: playerCharacterInstance, field: "name")}</div>



		<g:each in="${playerCharacterInstance.feat}" var="feat">
		
			<g:if test="${feat.feat.type.equals("Crafting") }">
				<table class="frame">
					<tr>
					<td>
						<table class="craft">
							<tr>
								<td style="padding: 5px; width:12%">Feat</td>
								<td style="padding: 5px;width:10%">Item Type</td>
								<td style="padding: 5px;">Power 1</td>
								<td style="padding: 5px;">Power 2</td>
								<td style="padding: 5px;width:7%">Attunement Time</td>
								<td style="padding: 5px;width:5%" class="int">Total Cost</td>
								<td style="padding: 5px;width:5%" class="int">Any Crystal</td>
								<td style="padding: 5px;width:5%" class="int">Blended</td>
								<td style="padding: 5px;width:5%" class="int">Air</td>
								<td style="padding: 5px;width:5%" class="int">Earth</td>
								<td style="padding: 5px;width:5%" class="int">Fire</td>
								<td style="padding: 5px;width:5%" class="int">Water</td>
								<td style="padding: 5px;width:5%" class="int">Void</td>
							</tr>
							<g:each in="${playerCharacterInstance?.recipe.sort{ it.requiredSkillToCraft}}"
								var="i">
								<g:if test="${i.requiredSkillToCraft.id.equals(feat.feat.id)}">
								<tr>
									<g:render template="/recipe/playerShow" model="['instance': i]" />
									</tr>
								</g:if>
							</g:each>
							<g:each
								in="${eblana.items.Recipe.findAllByRequiredSkillToCraftAndResearchCost(feat.feat,0)}"
								var="i">
								<tr>
									<g:render template="/recipe/playerShow" model="['instance': i]" />
								</tr>
							</g:each>


						</table>
						</td>
					</tr>

				</table>
			</g:if>
		</g:each>

	</div>


	<div class="section">
		<br>
		<h2>Downtime</h2>
		<div class="divHeader">${fieldValue(bean: playerCharacterInstance, field: "name")}</div>

		<g:if test="${downtime}">
			<g:render template="/downtime/downtime"
				model="['instance': downtime, 'event':event]" />
		</g:if>
	</div>

</section>