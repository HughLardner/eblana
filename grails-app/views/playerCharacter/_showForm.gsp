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
	width: 95%;
	height: 50%
}

.int {
	width: 20px;
}

.body {
	width: 100%;
	text-align: left;
}
.craft{
table-layout:auto !important;
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

<section id="show-playerCharacter" class="first">
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
							<td><g:message code="playerCharacter.blendedCrystals.label"
									default="Blended Crystals: " /> ${fieldValue(bean: playerCharacterInstance, field: "blendedCrystals")}
							</td>
							<td><g:message code="playerCharacter.voidCrystals.label"
									default="Void Crystals: " /> ${fieldValue(bean: playerCharacterInstance, field: "voidCrystals")}
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>

	<div>
		<br>
		<h2>Items</h2>
		<g:each in="${playerCharacterInstance?.item.sort{ it.duration}}"
			var="i">

			<g:render template="/item/showTemplate" model="['itemInstance': i]" />

		</g:each>
	</div>

	<div>

		<br>
		<h2>Recipes</h2>
		<table class="frame">
			<tr>
				<td>
					<table class="craft">
						<tr>
							<td>Feat</td>
							<td>Item Type</td>
							<td>Power 1</td>
							<td>Power 2</td>
							<td>Attunement Time</td>
							<td class="int">Total Cost</td>
							<td class="int">Any Crystal</td>
							<td class="int">Blended</td>
							<td class="int">Air</td>
							<td class="int">Earth</td>
							<td class="int">Fire</td>
							<td class="int">Water</td>
							<td class="int">Void</td>
						</tr>

						<tr>
							<g:each in="${playerCharacterInstance?.recipe.sort{ it.feat}}"
								var="i">
								<g:render template="/recipe/playerShow" model="['instance': i]" />
							</g:each>
							<g:each in="${playerCharacterInstance.feat}" var="feat">
								<g:if test="${feat.feat.type.equals("Crafting") }">
									<g:each
										in="${eblana.items.Recipe.findAllByRequiredSkillToCraftAndResearchCost(feat.feat,0)}"
										var="i">
										<tr>
											<g:render template="/recipe/playerShow"
												model="['instance': i]" />
										</tr>
									</g:each>
									<tr class="blank_row">
										<td colspan="13"></td>
									</tr>
								</g:if>
							</g:each>

						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>

	<div>
		<br>
		<h2>Downtimes</h2>

		<g:each
			in="${playerCharacterInstance?.downtime.sort{ it.event.toString()}.reverse()}"
			var="i">

			<g:render template="/downtime/downtime" model="['instance': i]" />
			<br>
		</g:each>
	</div>

</section>