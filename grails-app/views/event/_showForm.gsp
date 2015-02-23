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
	
}

ul.feat {
	columns: 2;
	-webkit-columns: 2;
	-moz-columns: 2;
}
</style>



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

