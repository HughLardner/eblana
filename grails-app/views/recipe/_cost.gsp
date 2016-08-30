<table class="table table-condensed">
	<tr class="row">
		<th class="col-sm-3"></th>
		<th class="air col-sm-1">Air</th>
		<th class="earth col-sm-1">Earth</th>
		<th class="fire col-sm-1">Fire</th>
		<th class="water col-sm-1">Water</th>
		<th class="blended col-sm-1">Blended</th>
		<th class="void col-sm-1">Void</th>
	</tr>
	<tr class="row">
		<th>Fixed Cost</th>
		<td class="air">
			${fieldValue(bean: instance, field: "airCrystals")}
		</td>
		<td class="earth">
			${fieldValue(bean: instance, field: "earthCrystals")}
		</td>
		<td class="fire">
			${fieldValue(bean: instance, field: "fireCrystals")}
		</td>
		<td class="water">
			${fieldValue(bean: instance, field: "waterCrystals")}
		</td>
		<td class="blended">
			${fieldValue(bean: instance, field: "blendedCrystals")}
		</td>
		<td class="void">
			${fieldValue(bean: instance, field: "voidCrystals")}
		</td>
	</tr>
	<g:if
		test="${instance.hasProperty('anyCrystal') && recipe.anyCrystal >0}">
		<tr class="row">
			<th>Any Cost (Total: ${fieldValue(bean: instance, field: "anyCrystal")})
			</th>
			<td class="air"><input name="air" type="number" min="0" class="input-crystal"
				max="${downtime.airCurrent }" /></td>
			<td class="earth"><input name="earth" type="number" min="0" class="input-crystal"
				max="${downtime.earthCurrent }" /></td>
			<td class="fire"><input name="fire" type="number" min="0" class="input-crystal"
				max="${downtime.fireCurrent }" /></td>
			<td class="water"><input name="water" type="number" min="0" class="input-crystal"
				max="${downtime.waterCurrent }" /></td>
			<td class="blended"><input name="blended" type="number" min="0" class="input-crystal"
				max="${downtime.blendedCurrent }" /></td>
			<td class="void"><input name="voidC" type="number" min="0" class="input-crystal"
				max="${downtime.voidCurrent }" /></td>
			<td></td>
		</tr>
	</g:if>
</table>