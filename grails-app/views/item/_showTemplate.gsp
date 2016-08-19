<%@ page import="eblana.items.Item"%>

<div class="image">
	<img class="item__image" alt="" src="${resource(dir:'images',file:'bg1.png')}" />
	<div id="item"></div>
	<p class="image__content item__header">Academy of Eblana</p>
	<div class="image__content item__name">
		${fieldValue(bean: itemInstance, field: "name")}
	</div>
	<div class="image__content item__power resize">
		<p>${fieldValue(bean: itemInstance, field: "power1")}<br>
		${fieldValue(bean: itemInstance, field: "power2")}</p>
	</div>
	
	<div class="image__content item__slot">
		Attunes to:
		${fieldValue(bean: itemInstance, field: "slot")}
	</div>
	<div class="image__content item__attunementTime">
		Attunement Time:
		${fieldValue(bean: itemInstance, field: "attunementTime")}
	</div>
	<div class="image__content item__duration">
		Valid Until End:
		${fieldValue(bean: itemInstance, field: "duration")}
	</div>
	<div class="image__content item__type">
		Type:
		${fieldValue(bean: itemInstance, field: "type")}
	</div>
	<div class="image__content item__id">
		Item ID :
		${fieldValue(bean: itemInstance, field: "id")}
	</div>
</div>







