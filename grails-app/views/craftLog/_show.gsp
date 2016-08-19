<%@ page import="eblana.event.CraftLog"%>



<section id="show-craftLog" class="first">

	<div class="row">
		<div class="col-xs-2">
			<g:message code="craftLog.item.label" default="Item" />
		</div>

		<div class="col-xs-4">
			<g:render template="/item/showTemplate"
				model="['itemInstance': craftLogInstance?.item]" />
		</div>
	</div>
	<div class="row">
		<div class="col-xs-2">
			<g:message code="craftLog.cost.label" default="Cost of Item:" />
		</div>
		<div class="col-xs-6">
			<g:render template="/recipe/cost"
				model="['instance': craftLogInstance]" />
		</div>
	</div>
	<div class="row">
		<div class="col-xs-2">
			<g:message code="craftLog.recipe.label" default="Recipe" />
		</div>
		<div class="col-xs-4">
			<g:link condivoller="recipe" action="show"
				id="${craftLogInstance?.recipe?.id}">
				${craftLogInstance?.recipe?.encodeAsHTML()}
			</g:link>
		</div>
	</div>
</section>

