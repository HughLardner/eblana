<div id="${div}" class="element_list">
<g:each var="lore" in="${evaluate('instance.'+div)}" status="i">
	<g:render template="/template/loreEdit" model="['lore': lore, 'i':i]"/>
</g:each>
</div>

<input type="button" id="add${div}Button" value="${description}" onClick="addLore('${div}')"/>