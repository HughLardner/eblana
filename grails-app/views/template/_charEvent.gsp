<div id="${div}" class="element_list">
<table>
<g:each var="characterEvent" in="${evaluate('instance.'+div)}" status="i">
<td>
	<g:render template="/template/charEventEdit" model="['characterEvent': characterEvent, 'i':i]"/>
</td>
</g:each>
</table>
</div>

<input type="button" id="add${div}Button" value="${description}" onClick="addCharEvent('${div}')"/>