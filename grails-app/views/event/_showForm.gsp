

<table style="width: 100%; text-align: left;">
	<tr>
		<td><g:message code="playerCharacter.user.label"
				default="Player: " /> <g:link controller="user" action="show"
				id="${playerCharacterInstance?.user?.id}">
				${playerCharacterInstance?.user?.firstName.encodeAsHTML()}
				${playerCharacterInstance?.user?.surname}
			</g:link></td>
		<td><g:message code="playerCharacter.name.label"
				default="Character: " /> ${fieldValue(bean: playerCharacterInstance, field: "name")}
		</td>
		<td><g:message code="playerCharacter.species.label"
				default="Species: " /> <g:link controller="species" action="show"
				id="${playerCharacterInstance?.species?.id}">
				${playerCharacterInstance?.species?.encodeAsHTML()}
			</g:link></td>
	</tr>
</table>
<table style="width: 100%; text-align: left;">
	<tr>
		<td><g:message code="playerCharacter.body.label" default="Body: " />
			${fieldValue(bean: playerCharacterInstance, field: "body")}</td>
		<td><g:message code="playerCharacter.armour.label"
				default="Armour: " /> ${fieldValue(bean: playerCharacterInstance, field: "armour")}
		</td>
		<td><g:message code="playerCharacter.mana.label" default="Mana: " />
			${fieldValue(bean: playerCharacterInstance, field: "mana")}</td>
		<td><g:message code="playerCharacter.xp.label" default="XP: " />
			${fieldValue(bean: playerCharacterInstance, field: "xp")}</td>
	</tr>
</table>
<table style="width: 100%; text-align: left;">
	<tr>
		<td><g:message code="playerCharacter.classes.label"
				default="Classes: " />

			<ul>
				<g:each in="${playerCharacterInstance.classes}" var="c">
					<li><g:link controller="classes" action="show" id="${c?.id}">
							${c?.encodeAsHTML()}
						</g:link></li>
				</g:each>
			</ul></td>

		<td><g:message code="playerCharacter.feat.label" default="Feat: " />

			<ul class="feat">
				<g:each in="${playerCharacterInstance.feat.sort{it.feat.name}}"
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
					in="${playerCharacterInstance.spell.sort{it.spell.classes.level}}"
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
				<g:each in="${playerCharacterInstance.lore}" var="l">
					<li><g:link controller="lore" action="show" id="${l?.id}">
							${l?.encodeAsHTML()}
						</g:link></li>
				</g:each>
			</ul></td>
	</tr>
</table>

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
								<td style="padding: 2px; width:10%; font-size:11px">Feat</td>
								<td style="padding: 2px; width:8%; font-size:11px">Item Type</td>
								<td style="padding: 2px; font-size:11px">Power 1</td>
								<td style="padding: 2px; font-size:11px">Power 2</td>
								<td style="padding: 2px;width:4%; font-size:11px">Attunement Time</td>
								<td style="padding: 2px;width:2%; font-size:11px" class="int">Total Cost</td>
								<td style="padding: 2px;width:2%; font-size:11px" class="int">Any Crystal</td>
								<td style="padding: 2px;width:2%; font-size:11px" class="int">Blended</td>
								<td style="padding: 2px;width:2%; font-size:11px" class="int">Air</td>
								<td style="padding: 2px;width:2%; font-size:11px" class="int">Earth</td>
								<td style="padding: 2px;width:2%; font-size:11px" class="int">Fire</td>
								<td style="padding: 2px;width:2%; font-size:11px" class="int">Water</td>
								<td style="padding: 2px;width:2%; font-size:11px" class="int">Void</td>
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

