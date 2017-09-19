
<div class="row row-eq-height">
	<div class="col-xs-4 bordered">
		${playerCharacterInstance?.user?.firstName.encodeAsHTML()}
		${playerCharacterInstance?.user?.surname}
	</div>
	<div class="col-xs-4 bordered">
		<g:message code="playerCharacter.name.label" default="Character: " />
		${fieldValue(bean: playerCharacterInstance, field: "name")}
	</div>
	<div class="col-xs-4 bordered">
		${playerCharacterInstance?.species?.encodeAsHTML()}
	</div>
</div>
<div class="row row-eq-height">
	<div class="col-xs-3 bordered">
		<g:message code="playerCharacter.body.label" default="Body: " />
		${fieldValue(bean: playerCharacterInstance, field: "body")}
	</div>
	<div class="col-xs-3 bordered">
		<g:message code="playerCharacter.armour.label" default="Armour: " />
		${fieldValue(bean: playerCharacterInstance, field: "armour")}
	</div>
	<div class="col-xs-3 bordered">
		<g:message code="playerCharacter.mana.label" default="Mana: " />
		${fieldValue(bean: playerCharacterInstance, field: "mana")}
	</div>
	<div class="col-xs-3 bordered">
		<g:message code="playerCharacter.xp.label" default="XP: " />
		${fieldValue(bean: playerCharacterInstance, field: "xp")}</td>
	</div>
</div>
<div class="row row-eq-height">
	<div class="col-xs-2 bordered">
		<g:message code="playerCharacter.classes.label" default="Classes: " />
		<ul id="single">
			<g:each in="${playerCharacterInstance?.classes?.sort{it.id}}" var="c">
				<li>
					${c?.encodeAsHTML()}
				</li>
			</g:each>
		</ul>
	</div>
	<div class="col-xs-10 bordered">
		<g:message code="playerCharacter.feat.label" default="Feat: " />
		<ul id="triple">
			<g:each in="${playerCharacterInstance?.feat?.sort{it.feat.name}}"
				var="f">
				<li class="${(!f?.feat?.prereqClass||f?.source.equals('special')||playerCharacterInstance?.classes*.id?.contains(f?.feat?.prereqClass?.id))? '':'cantUse'}"><g:link controller="feat" action="show" id="${f?.feat?.id}">
						${f?.encodeAsHTML()}
						${f?.effect}
					</g:link></li>
			</g:each>
		</ul>
	</div>
</div>
<div class="row row-eq-height">
	<div class="col-xs-10 bordered">
		<g:message code="playerCharacter.spell.label" default="Spells: " />
		<ul id="double">
			<g:each
				in="${playerCharacterInstance?.spell?.sort{it.spell?.classes?.level}}"
				var="s">
				<li class="${playerCharacterInstance?.classes*.id?.contains(s?.spell?.classes?.id)||s?.source?.equals('Mage Born Vagabond') ? '':'cantUse'}"><g:link controller="spell" action="show"
						id="${s?.spell?.id}">
						${s?.encodeAsHTML()}
						${s?.effect1}
						${s?.effect2}
					</g:link> (Mana: ${s?.spell.classes.level })</li>
			</g:each>
		</ul>
	</div>
	<div class="col-xs-2 bordered">
		<g:message code="playerCharacter.lore.label" default="Lores: " />

		<ul id="single">
			<g:each in="${playerCharacterInstance?.lore}" var="l">
				<li>
					${l?.encodeAsHTML()}
				</li>
			</g:each>
		</ul>
	</div>
</div>