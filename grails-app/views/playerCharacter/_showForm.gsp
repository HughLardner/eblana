
<section id="show-playerCharacter" class="first">
	<h2>Character</h2>
	<g:render template="/playerCharacter/show"
		model="['playerCharacterInstance': playerCharacterInstance]" />
</section>
<section id="recipes-playerCharacter" class="second">
	<h2>Recipes</h2>
	<g:render template="/recipe/recipeList"
		model="['playerCharacterInstance': playerCharacterInstance]" />
</section>
<section id="downtime-playerCharacter" class="third">
		<br>
		<h2>Downtimes</h2>
		<g:each
			in="${playerCharacterInstance?.downtime.sort{ it.event.eventNumber}.reverse()}"
			var="downtime">
			<h3>
				${fieldValue(bean: downtime, field: "event")}
			</h3>
			<td><g:render template="/downtime/downtime"
					model="['instance': downtime, 'event':event]" /> <br></td>

		</g:each>
</section>
