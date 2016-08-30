
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

<g:render template="/downtime/resources" model="['instance': instance]" />

<div>
	<h2>Items</h2>
	<div class="row">
		<g:each in="${instance?.itemCurrent}" var="item" status="i">
			<div class="col-xs-4">
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

