<div id="${div}" class="element_list">
<g:each var="spell" in="${evaluate('instance.'+div)}" status="i">
	<g:render template="/template/spellEdit" model="['spell': spell, 'i':i]"/>
</g:each>
</div>

<input type="button" id="add${div}Button" value="${description}" onClick="addSpell('${div}')"/>