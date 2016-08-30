<div class="row row-eq-height">
	<div class="col-xs-2 bordered air">
		<g:message code="playerCharacter.airCrystals.label"
			default="Air Crystals: " />
		${fieldValue(bean: instance, field: "airCurrent")}
	</div>
	<div class="col-xs-2 bordered earth">
		<g:message code="playerCharacter.earthCrystals.label"
			default="Earth Crystals: " />
		${fieldValue(bean: instance, field: "earthCurrent")}
	</div>
	<div class="col-xs-2 bordered fire">
		<g:message code="playerCharacter.fireCrystals.label"
			default="Fire Crystals: " />
		${fieldValue(bean: instance, field: "fireCurrent")}
	</div>
	<div class="col-xs-2 bordered water">
		<g:message code="playerCharacter.waterCrystals.label"
			default="Water Crystals: " />
		${fieldValue(bean: instance, field: "waterCurrent")}
	</div>
	<div class="col-xs-2 bordered blended">
		<g:message code="playerCharacter.blendedCrystals.label"
			default="Blended Crystals: " />
		${fieldValue(bean: instance, field: "blendedCurrent")}
	</div>
	<div class="col-xs-2 bordered void">
		<g:message code="playerCharacter.voidCrystals.label"
			default="Void Crystals: " />
		${fieldValue(bean: instance, field: "voidCurrent")}
	</div>
</div>