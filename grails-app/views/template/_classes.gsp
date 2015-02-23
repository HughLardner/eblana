<div id="${div}" class="element_list">
<g:each var="classes" in="${evaluate('instance.'+div)}" status="i">
	<g:render template="/template/classesEdit" model="['classes': classes, 'i':i]"/>
</g:each>
</div>

<input type="button" id="add${div}Button" value="${description}" onClick="addClass('${div}')"/>