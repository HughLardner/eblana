<table class="table table-bordered table-condensed">
	<tr class="row">
		<th class="air col-sm-1">Air</th>
		<th class="earth col-sm-1">Earth</th>
		<th class="fire col-sm-1">Fire</th>
		<th class="water col-sm-1">Water</th>
		<th class="blended col-sm-1">Blended</th>
		<th class="void col-sm-1">Void</th>
		<g:if test="${instance.hasProperty('anyCrystal')}">
			<th class="blended col-sm-1">Any</th>
		</g:if>
	</tr>
	<tr class="row">
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
		<g:if test="${instance.hasProperty('anyCrystal')}">
			<th class="blended">
				${fieldValue(bean: instance, field: "anyCrystal")}
			</th>
		</g:if>
	</tr>
	<g:if
		test="${instance.hasProperty('anyCrystal') && recipe.anyCrystal >0}">

		<tr class="row">
			<td class="air"><input name="air" td="number" min="0"
				max="${recipe.anyCrystal }" /></td>
			<td class="earth"><input name="earth" td="number" min="0"
				max="${recipe.anyCrystal }" /></td>
			<td class="fire"><input name="fire" td="number" min="0"
				max="${recipe.anyCrystal }" /></td>
			<td class="water"><input name="water" type="number" min="0"
				max="${recipe.anyCrystal }" /></td>
			<td class="blended"><input name="blended" type="number" min="0"
				max="${recipe.anyCrystal }" /></td>
			<td class="void"><input name="voidC" type="number" min="0"
				max="${recipe.anyCrystal }" /></td>
		</tr>
	</g:if>
</table>