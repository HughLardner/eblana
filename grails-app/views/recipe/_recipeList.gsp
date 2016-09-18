<g:each in="${playerCharacterInstance.feat}" var="feat">
		<g:if test="${feat.feat.type.equals("Crafting") }">
			<table
				class="table  table-striped table-hover table-bordered table-condensed recipe">
				<tr>
					<th>Feat</th>
					<th>Item Type</th>
					<th>Power</th>
					<th>Attune</th>
					<th>Total Cost</th>
					<th>Any</th>
					<th class="blended">B</th>
					<th class="air">A</th>
					<th class="earth">E</th>
					<th class="fire">F</th>
					<th class="water">W</th>
					<th class="void">V</th>
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