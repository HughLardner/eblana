<%@ page import="eblana.items.Item"%>
<div class="image">
	<img class="item__image" alt=""
		src="${resource(dir:'images',file:'bg1.png')}" />
	<div id="item">
		<p class="image__content item__header">Academy of Eblana</p>
		<div class="image__content item__name">
			${fieldValue(bean: itemInstance, field: "name")}
		</div>
		<div class="image__content item__power resize">${fieldValue(bean: itemInstance, field: "power1")}<br>${fieldValue(bean: itemInstance, field: "power2")}<g:if test="${itemInstance.power2}"><br></g:if>Attunes to: ${fieldValue(bean: itemInstance, field: "slot")}</div>
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
</div>






