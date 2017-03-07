<div id=transfer>
	<g:form class="form-group">
		<input type="hidden" name="downtime" value="${instance.id }">
		<div class="row">
			<div class="col-sm-3 form-group">
				<label for="target" class="control-label"><g:message
						code="target.playerCharacter" default="Target Character" /></label>
				<div>
					<g:select class="form-control" id="target" name="target"
						from="${eblana.character.PlayerCharacter.findAllByAlive(true)}"
						optionKey="id" value="" class="one-to-one"
						noSelection="['null': '']" />
				</div>
			</div>
			<div class="col-sm-6 form-group">
				<table class="table table-bordered table-condensed">
					<tr class="row">
						<th class="air col-sm-2">Air</th>
						<th class="earth col-sm-2">Earth</th>
						<th class="fire col-sm-2">Fire</th>
						<th class="water col-sm-2">Water</th>
						<th class="blended col-sm-2">Blended</th>
						<th class="void col-sm-2">Void</th>
					</tr>
					<tr class="row">
						<td class="air"><input name="air" type="number" min="0"
							class="input-crystal" max="${instance.airCurrent}" /></td>
						<td class="earth"><input name="earth" type="number" min="0"
							class="input-crystal" max="${instance.earthCurrent }" /></td>
						<td class="fire"><input name="fire" type="number" min="0"
							class="input-crystal" max="${instance.fireCurrent }" /></td>
						<td class="water"><input name="water" type="number" min="0"
							class="input-crystal" max="${instance.waterCurrent }" /></td>
						<td class="blended"><input name="blended" type="number"
							class="input-crystal" min="0" max="${instance.blendedCurrent }" /></td>
						<td class="void"><input name="voidC" type="number" min="0"
							class="input-crystal" max="${instance.voidCurrent }" /></td>
					</tr>
				</table>

			</div>
		</div>

		<div>
			<br>
			<h2>Items</h2>
			<div class="row">

				<g:each in="${instance?.itemCurrent}" var="item" status="i">

					<g:if test="${item?.transferable}">
						<div class="col-md-4">
							<div class="checkbox">
								<label class="btn btn-primary"> <input type="checkbox"
									name="items" value="${item?.id }" hidden="true">
									<div class="img-check">
										<g:render template="/item/showTemplate"
											model="['itemInstance': item, 'downtime':instance]" />
									</div>
								</label>

							</div>
						</div>
					</g:if>
				</g:each>
			</div>
		</div>
		<div class="btn-group">
			<g:submitToRemote class="btn btn-primary" update="transfers"
				action="save" controller="transfer" name="Transfer" value="Transfer"
				onFailure="error(XMLHttpRequest.responseText)"
				before="if (!confirm('Confirm Transfer?')) {return false;}"
				onComplete="autoSizeText();"
				onSuccess="fetchResources()" />
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