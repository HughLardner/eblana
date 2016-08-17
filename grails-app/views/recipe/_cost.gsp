<table class="table table-bordered table-condensed">
	<tr class="row">
		<th class="air">Air</th>
		<th class="earth">Earth</th>
		<th class="fire">Fire</th>
		<th class="water">Water</th>
		<th class="blended">Blended</th>
		<th class="void">Void</th>
		<g:if test="${instance.hasProperty('anyCrystal')}">
			<th class="blended">Any</th>
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
		<style>
input {
	display: block !important;
	padding: 0 !important;
	margin: 0 !important;
	border: 0 !important;
	width: 100% !important;
	border-radius: 0 !important;
	line-height: 1 !important;
}

td {
	margin: 0 !important;
	padding: 0 !important;
}
</style>
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