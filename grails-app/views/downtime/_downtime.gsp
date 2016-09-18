
<div class="row row-eq-height bordered avoid-break">
	<div class="col-xs-2 bordered">
		<h5>Goal:</h5>
	</div>
	<div class="col-xs-10">
		${raw(instance?.goal?.replaceAll('\n', '<br/>'))}
	</div>
</div>
<div class="row row-eq-height bordered avoid-break">
	<div class="col-xs-2 bordered">
		<h5>Research:</h5>
	</div>
	<div class="col-xs-10">
		${raw(instance?.research?.replaceAll('\n', '<br/>'))}
	</div>
</div>
<div class="row row-eq-height bordered avoid-break">
	<div class="col-xs-2 bordered">
		<h5>Research Method:</h5>
	</div>
	<div class="col-xs-10">
		${raw(instance?.researchMethod?.replaceAll('\n', '<br/>'))}
	</div>
</div>
<div class="row row-eq-height bordered avoid-break">
	<div class="col-xs-2 bordered">
		<h5>Research Resources: </h5>
	</div>
	<div class="col-xs-10">
		${raw(instance?.researchResources?.replaceAll('\n', '<br/>'))}
	</div>
</div>
<div class="row row-eq-height bordered avoid-break">
	<div class="col-xs-2 bordered">
		<h5>Research Results:</h5>
	</div>
	<div class="col-xs-10">
		<g:if test="${instance.event.downtimeDone}">
			${raw(instance?.finalDecision?.replaceAll('\n', '<br/>'))}
		</g:if>
	</div>
</div>

<g:render template="/downtime/resources" model="['instance': instance]" />

<div class="item-downtime">
	<h2>Items</h2>
	<div class="row">
		<g:each in="${instance?.itemCurrent}" var="item" status="i">
			<div class="span3">
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

