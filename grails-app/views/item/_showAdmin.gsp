<div class="row">
	<div class="col-md-4">
		<g:render template="/item/showTemplate"
			model="['itemInstance': itemInstance]" />
	</div>
	<div class="col-md-8">
		<div class="row">
			<div class="col-md-2">
				<g:message code="item.created.label" default="Created" />
			</div>
			<div class="col-md-10">
				<g:link controller="event" action="show"
					id="${itemInstance?.created?.id}">
					${itemInstance?.created?.encodeAsHTML()}
				</g:link>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<g:message code="item.convertedCrystalCost.label"
					default="Converted Crystal Cost" />
			</div>
			<div class="col-md-10">
				${fieldValue(bean: itemInstance, field: "convertedCrystalCost")}
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<g:message code="item.curseCure.label" default="Curse Cure" />
			</div>
			<div class="col-md-10">
				${fieldValue(bean: itemInstance, field: "curseCure")}
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<g:message code="item.internalNotes.label" default="Internal Notes" />
			</div>
			<div class="col-md-10">
				${fieldValue(bean: itemInstance, field: "internalNotes")}
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<g:message code="item.level.label" default="Level" />
			</div>
			<div class="col-md-10">
				<g:link controller="feat" action="show"
					id="${itemInstance?.level?.id}">
					${itemInstance?.level?.encodeAsHTML()}
				</g:link>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<g:message code="item.proposed.label" default="Proposed" />
			</div>
			<div class="col-md-10">
				<g:formatBoolean boolean="${itemInstance?.proposed}" />
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<g:message code="item.status.label" default="Status" />
			</div>
			<div class="col-md-10">
				${itemInstance?.status?.encodeAsHTML()}
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<g:message code="item.transferable.label" default="Transferable" />
			</div>
			<div class="col-md-10">
				<g:formatBoolean boolean="${itemInstance?.transferable}" />
			</div>
		</div>
	</div>
</div>