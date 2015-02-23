<div id="${div}" class="element_list">
<g:each var="feat" in="${evaluate('instance.'+div)}" status="i">
	<g:render template="/template/featEdit" model="['feat': feat, 'i':i]"/>
</g:each>
</div>

<input type="button" id="add${div}Button" value="${description}" onClick="addFeat('${div}')"/>