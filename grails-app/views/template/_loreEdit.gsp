<div id='lore[${i}].lore.id' name='lore[${i}].lore.id' class='newhidden formField_inside'>
<b>${i+1}:</b>
		​	<g:select class="form-control" id='lore[${i}].lore.id' name="lore[${i}].lore.id"
				from="${eblana.character.Lore.list()}" optionKey="id"
				value="${lore.id}" class="many-to-one"
				noSelection="['null': '']" />

	
</div>