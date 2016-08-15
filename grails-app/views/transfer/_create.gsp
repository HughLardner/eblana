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
			<g:each in="${instance?.itemCurrent}" var="i">

				<g:if test="${i?.transferable}">
					<input type="checkbox" name="items" value="${i.id }">
					<g:render template="/item/showTemplate" model="['itemInstance': i]" />
					<br>
				</g:if>
			</g:each>
		</div>

		<g:submitToRemote update="transfers" action="save"
			controller="transfer" name="Transfer" value="Transfer"
			onFailure="error(XMLHttpRequest.responseText)" />
	</g:form>

	<div>
		<br>
		<h2>Transfers</h2>
		<table class="frame">
			<tr>
				<td>
					<table class="body">
						<tr>
							<td>From</td>
							<td>To</td>
							<td style="padding: 5px; width: 5%" class="int">Air</td>
							<td style="padding: 5px; width: 5%" class="int">Earth</td>
							<td style="padding: 5px; width: 5%" class="int">Fire</td>
							<td style="padding: 5px; width: 5%" class="int">Water</td>
							<td style="padding: 5px; width: 5%" class="int">Blended</td>
							<td style="padding: 5px; width: 5%" class="int">Void</td>
							<td>Items</td>
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
				</td>
			</tr>
		</table>
	</div>
</div>