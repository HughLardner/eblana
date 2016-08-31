
<%@ page import="eblana.character.PlayerCharacter"%>
<!DOCTYPE html>
<html>

<head>
<meta name="layout" content="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'playerCharacter.label', default: 'PlayerCharacter')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

	<section id="show-playerCharacter" class="first">

		<table class="table">
			<tbody>
				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="playerCharacter.user.label" default="User" /></td>

					<td valign="top" class="value"><g:link controller="secUser"
							action="show" id="${playerCharacterInstance?.user?.id}">
							${playerCharacterInstance?.user?.firstName.encodeAsHTML()}
							${playerCharacterInstance?.user?.surname}
						</g:link></td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="playerCharacter.name.label" default="Name" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: playerCharacterInstance, field: "name")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="playerCharacter.species.label" default="Species" /></td>

					<td valign="top" class="value"><g:link controller="species"
							action="show" id="${playerCharacterInstance?.species?.id}">
							${playerCharacterInstance?.species?.encodeAsHTML()}
						</g:link></td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="playerCharacter.body.label" default="Body" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: playerCharacterInstance, field: "body")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="playerCharacter.armour.label" default="Armour" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: playerCharacterInstance, field: "armour")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="playerCharacter.mana.label" default="Mana" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: playerCharacterInstance, field: "mana")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="playerCharacter.classes.label" default="Classes" /></td>

					<td valign="top" style="text-align: left;" class="value">
						<ul>
							<g:each in="${playerCharacterInstance.classes}" var="c">
								<li><g:link controller="classes" action="show" id="${c.id}">
										${c?.encodeAsHTML()}
									</g:link></li>
							</g:each>
						</ul>
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="playerCharacter.feat.label" default="Feat" /></td>

					<td valign="top" style="text-align: left;" class="value">
						<ul>
							<g:each in="${playerCharacterInstance.feat.sort{it.feat.name}}"
								var="f">
								<li><g:link controller="feat" action="show" id="${f.id}">
										${f?.encodeAsHTML()}
										${f?.effect}
									</g:link></li>
							</g:each>
						</ul>
					</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="playerCharacter.spell.label" default="Spell" /></td>

					<td valign="top" style="text-align: left;" class="value">
						<ul>
							<g:each
								in="${playerCharacterInstance.spell.sort{it.spell.classes.level}}"
								var="s">
								<li><g:link controller="spell" action="show" id="${s.id}">
										${s?.encodeAsHTML()}
										${s?.effect1}
										${s?.effect2}
									</g:link> (Mana: ${s?.spell.classes.level })</li>
							</g:each>
						</ul>
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="playerCharacter.lore.label" default="Lore" /></td>

					<td valign="top" style="text-align: left;" class="value">
						<ul>
							<g:each in="${playerCharacterInstance.lore}" var="l">
								<li><g:link controller="lore" action="show" id="${l.id}">
										${l?.encodeAsHTML()}
									</g:link></li>
							</g:each>
						</ul>
					</td>

				</tr>


				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="playerCharacter.xp.label" default="Xp" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: playerCharacterInstance, field: "xp")}
					</td>

				</tr>
				<g:set var="downtime"
					value="${eblana.event.Event.findByCurrentDowntime(true).downtime.find{it.character == playerCharacterInstance} }"></g:set>
				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="playerCharacter.airCrystals.label" default="Air Crystals" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: downtime, field: "airCrystals")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="playerCharacter.earthCrystals.label"
							default="Earth Crystals" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: downtime, field: "earthCrystals")}
					</td>

				</tr>


				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="playerCharacter.fireCrystals.label" default="Fire Crystals" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: downtime, field: "fireCrystals")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="playerCharacter.waterCrystals.label"
							default="Water Crystals" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: downtime, field: "waterCrystals")}
					</td>

				</tr>


				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="playerCharacter.blendedCrystals.label"
							default="Blended Crystals" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: downtime, field: "blendedCrystals")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="playerCharacter.voidCrystals.label" default="Void Crystals" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: downtime, field: "voidCrystals")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="recipe"><g:message
							code="playerCharacter.recipe.label" default="Recipes" /></td>

					<td valign="top" style="text-align: left;" class="value">
						<ul>
							<g:each in="${playerCharacterInstance.recipe}" var="l">
								<li><g:link controller="recipe" action="show" id="${l.id}">
										${l?.encodeAsHTML()}
									</g:link></li>
							</g:each>
						</ul>
					</td>

				</tr>

			</tbody>
		</table>
	</section>

</body>

</html>
