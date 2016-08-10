<%@ page import="eblana.event.CraftLog"%>
<section id="show-craftLog" class="first">
	<table class="table">
		<tbody>
			<tr class="prop">
				<td valign="top" class="name"><g:message
						code="craftLog.item.label" default="Item" /></td>
				<td valign="top" class="value"><g:render
						template="/item/showTemplate"
						model="['itemInstance': craftLogInstance?.item]" /></td>
			</tr>
			<tr>
				<td><g:message code="craftLog.cost.label"
						default="Cost of Item:" /></td>
				<td>
					<div id="table">
						<div class="row">
							<span class="cell">Air</span> <span class="cell">Earth</span> <span
								class="cell">Fire</span><span class="cell">Water</span><span
								class="cell">Blended</span><span class="cell">Void</span>
						</div>
						<div class="row">
							<span class="cell"> ${fieldValue(bean: craftLogInstance, field: "airCrystals")}
							</span> <span class="cell"> ${fieldValue(bean: craftLogInstance, field: "earthCrystals")}
							</span> <span class="cell"> ${fieldValue(bean: craftLogInstance, field: "fireCrystals")}
							</span><span class="cell"> ${fieldValue(bean: craftLogInstance, field: "waterCrystals")}
							</span><span class="cell"> ${fieldValue(bean: craftLogInstance, field: "blendedCrystals")}
							</span><span class="cell"> ${fieldValue(bean: craftLogInstance, field: "voidCrystals")}
							</span>
						</div>
					</div>

				</td>
			</tr>
			<tr class="prop">
				<td valign="top" class="name"><g:message
						code="craftLog.recipe.label" default="Recipe" /></td>
				<td valign="top" class="value"><g:link controller="recipe"
						action="show" id="${craftLogInstance?.recipe?.id}">
						${craftLogInstance?.recipe?.encodeAsHTML()}
					</g:link></td>
			</tr>
		</tbody>
	</table>
</section>

