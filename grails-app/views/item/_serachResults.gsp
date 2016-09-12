<h3>Item Count: ${itemInstanceList.size() }</h3>

<g:each in="${itemInstanceList}" status="i" var="itemInstance">
	<div style="outline: 1px solid black;">
		<g:render template="/item/showAdmin"
			model="['itemInstance': itemInstance]" />
	</div>
</g:each>