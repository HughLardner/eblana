
<div class="row row-eq-height">
	<div class="col-xs-12 bordered">
		<g:message code="characterEvent.research.label" default="Goal: " />
		<br>
		${raw(instance?.goal?.replaceAll('\n', '<br/>'))}
	</div>
</div>
<div class="row row-eq-height">
	<div class="col-xs-4 bordered">
		<g:message code="characterEvent.research.label" default="Research: " />
		<br>
		${raw(instance?.research?.replaceAll('\n', '<br/>'))}
	</div>
	<div class="col-xs-4 bordered">
		<g:message code="characterEvent.researchMethod.label"
			default="Research Method: " />
		<br>
		${raw(instance?.researchMethod?.replaceAll('\n', '<br/>'))}
	</div>
	<div class="col-xs-4 bordered">
		<g:message code="characterEvent.researchResources.label"
			default="Research Resources: " />
		<br>
		${raw(instance?.researchResources?.replaceAll('\n', '<br/>'))}
	</div>
</div>
<div class="row row-eq-height">
	<div class="col-xs-12 bordered">
		<g:message code="characterEvent.researchResults.label"
			default="Research Results: " />
		<br>
		<g:if test="${instance.event.downtimeDone}">
			${raw(instance?.finalDecision?.replaceAll('\n', '<br/>'))}
		</g:if>
	</div>
</div>

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

<div>
	<h2>Items</h2>
	<div class="row row-eq-height">
		<g:each in="${instance?.itemCurrent}" var="item" status="i">
			<g:if test="${i%3==0 }">
			</div>
				<div class="row row-eq-height">
			</g:if>
			<div class="col-xs-4 bordered">
				<g:render template="/item/showTemplate"
					model="['itemInstance': item]" />
	</div>
	</g:each>
</div>
</div>

<div>
	<g:if test="${instance?.to.size() >0 || instance?.from.size() >0}">
		<h2>Transfers</h2>
		<table
			class="table table-striped table-hover table-bordered table-condensed">
			<tr>
				<th>From</th>
				<th>To</th>
				<th class="air">Air</th>
				<th class="earth">Earth</th>
				<th class="fire">Fire</th>
				<th class="water">Water</th>
				<th class="blended">Blended</th>
				<th class="void">Void</th>
				<th>Items</th>
			</tr>
			<g:each in="${instance?.to}" var="to">
				<g:render template="/transfer/show"
					model="['instance': to, 'event':event]" />
			</g:each>
			<g:each in="${instance?.from}" var="from">
				<g:render template="/transfer/show"
					model="['instance': from, 'event':event]" />
			</g:each>
		</table>
	</g:if>
</div>

