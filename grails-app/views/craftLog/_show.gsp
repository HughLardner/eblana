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
					<g:render
						template="/recipe/cost"
						model="['instance': craftLogInstance]" />
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

