<div id=transfer>
	<g:form>
		<input type="hidden" name="downtime" value="${instance.id }">
		<div>
			<label for="target" class="control-label"><g:message
					code="target.playerCharacter" default="Target Character" /></label>
			<div>
				<g:select class="form-control" id="target" name="target"
					from="${eblana.character.PlayerCharacter.findAllByAlive(true)}"
					optionKey="id" value="" class="one-to-one"
					noSelection="['null': '']" />
			</div>
		</div>
		<div>
			<div>
				<label for="air" class="control-label"><g:message
						code="playerCharacter.air.label"
						default="Air Crystals to transfer (Max: ${instance.airCurrent})" /></label>
				<div>
					<g:field class="form-control" name="air" type="number"
						max="${instance.airCurrent}" value="0" />
				</div>
			</div>

			<div>
				<label for="earth" class="control-label"><g:message
						code="playerCharacter.earth.label"
						default="Earth Crystals to transfer (Max: ${instance.earthCurrent})" /></label>
				<div>
					<g:field class="form-control" name="earth" type="number"
						max="${instance.earthCurrent}" value="0" />
				</div>
			</div>

			<div>
				<label for="fire" class="control-label"><g:message
						code="playerCharacter.fire.label"
						default="Fire Crystals to transfer (Max: ${instance.fireCurrent})" /></label>
				<div>
					<g:field class="form-control" name="fire" type="number"
						max="${instance.fireCurrent}" min="0" value="0" />
				</div>
			</div>

			<div>
				<label for="water" class="control-label"><g:message
						code="playerCharacter.water.label"
						default="Water Crystals to transfer (Max: ${instance.waterCurrent})" /></label>
				<div>
					<g:field class="form-control" name="water" type="number"
						max="${instance.waterCurrent}" min="0" value="0" />
				</div>
			</div>

			<div>
				<label for="blended" class="control-label"><g:message
						code="playerCharacter.blended.label"
						default="Blended Crystals to transfer (Max: ${instance.blendedCurrent})" /></label>
				<div>
					<g:field class="form-control" name="blended" type="number"
						max="${instance.blendedCurrent}" min="0" value="0" />
				</div>
			</div>

			<div>
				<label for="void" class="control-label"><g:message
						code="playerCharacter.void.label"
						default="Void Crystals to transfer (Max: ${instance.voidCurrent})" /></label>
				<div>
					<g:field class="form-control" name="void" type="number"
						max="${instance.voidCurrent}" min="0" value="0" />
				</div>
			</div>
		</div>

		<div>
			<br>
			<h2>Items</h2>
			<g:each in="${instance?.itemCurrent}" var="item" status="i">
				<g:if test="${item?.transferable}">
					<div class="row row-eq-height">
						<div class="col-xs-4">
							<input type="checkbox" name="items" value="${item.id }">
							<g:render template="/item/showTemplate"
								model="['itemInstance': item]" />
							<br>
						</div>
					</div>
				</g:if>
			</g:each>
		</div>
		<div class="btn-group">
			<g:submitToRemote class="btn btn-primary" update="transfers"
				action="save" controller="transfer" name="Transfer" value="Transfer"
				onFailure="error(XMLHttpRequest.responseText)" />
		</div>
	</g:form>

	<div>
		<br>
		<h2>Transfers</h2>
		<table class="table">
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
			<g:each in="${instance?.to}" var="i">

				<g:render template="/transfer/show"
					model="['instance': i, 'event':event]" />

			</g:each>
			<g:each in="${instance?.from}" var="i">

				<g:render template="/transfer/show"
					model="['instance': i, 'event':event]" />

			</g:each>
		</table>
	</div>
</div>