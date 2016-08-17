
<section id="show-playerCharacter" class="first">
	<h2>Character</h2>
	<g:render template="/playerCharacter/show"
		model="['playerCharacterInstance': playerCharacterInstance]" />
</section>
<section id="recipes-playerCharacter" class="second">
	<h2>Recipes</h2>
	<g:each in="${playerCharacterInstance.feat}" var="feat">
		<g:if test="${feat.feat.type.equals("Crafting") }">
			<table
				class="table  table-striped table-hover table-bordered table-condensed">
				<tr>
					<th>Feat</th>
					<th>Item Type</th>
					<th>Power 1</th>
					<th>Power 2</th>
					<th>Attunement Time</th>
					<th>Total Cost</th>
					<th>Any Crystal</th>
					<th class="blended">Blended</th>
					<th class="air">Air</th>
					<th class="earth">Earth</th>
					<th class="fire">Fire</th>
					<th class="water">Water</th>
					<th class="void">Void</th>
				</tr>
				<tbody>
					<g:each
						in="${playerCharacterInstance?.recipe.sort{ it.requiredSkillToCraft}}"
						var="recipe">
						<g:if
							test="${recipe.requiredSkillToCraft.id.equals(feat.feat.id)}">
							<tr>
								<g:render template="/recipe/playerShow"
									model="['instance': recipe]" />
							</tr>
						</g:if>
					</g:each>
					<g:each
						in="${eblana.items.Recipe.findAllByRequiredSkillToCraftAndResearchCost(feat.feat,0)}"
						var="recipe">
						<tr>
							<g:render template="/recipe/playerShow"
								model="['instance': recipe]" />
						</tr>
					</g:each>
				</tbody>
			</table>
		</g:if>
	</g:each>
</section>
<section id="downtime-playerCharacter" class="third">
		<br>
		<h2>Downtimes</h2>
		<g:each
			in="${playerCharacterInstance?.downtime.sort{ it.event.toString()}.reverse()}"
			var="downtime">
			<h3>
				${fieldValue(bean: downtime, field: "event")}
			</h3>
			<td><g:render template="/downtime/downtime"
					model="['instance': downtime, 'event':event]" /> <br></td>

		</g:each>
</section>