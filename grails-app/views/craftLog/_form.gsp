<%@ page import="eblana.event.CraftLog" %>



			<div class="${hasErrors(bean: craftLogInstance, field: 'airCrystals', 'error')} ">
				<label for="airCrystals" class="control-label"><g:message code="craftLog.airCrystals.label" default="Air Crystals" /></label>
				<div>
					<g:field class="form-control" name="airCrystals" type="number" value="${craftLogInstance.airCrystals}"/>
					<span class="help-inline">${hasErrors(bean: craftLogInstance, field: 'airCrystals', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: craftLogInstance, field: 'blendedCrystals', 'error')} ">
				<label for="blendedCrystals" class="control-label"><g:message code="craftLog.blendedCrystals.label" default="Blended Crystals" /></label>
				<div>
					<g:field class="form-control" name="blendedCrystals" type="number" value="${craftLogInstance.blendedCrystals}"/>
					<span class="help-inline">${hasErrors(bean: craftLogInstance, field: 'blendedCrystals', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: craftLogInstance, field: 'downtime', 'error')} ">
				<label for="downtime" class="control-label"><g:message code="craftLog.downtime.label" default="Downtime" /></label>
				<div>
					<g:select class="form-control" id="downtime" name="downtime.id" from="${eblana.event.Downtime.list()}" optionKey="id" value="${craftLogInstance?.downtime?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: craftLogInstance, field: 'downtime', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: craftLogInstance, field: 'earthCrystals', 'error')} ">
				<label for="earthCrystals" class="control-label"><g:message code="craftLog.earthCrystals.label" default="Earth Crystals" /></label>
				<div>
					<g:field class="form-control" name="earthCrystals" type="number" value="${craftLogInstance.earthCrystals}"/>
					<span class="help-inline">${hasErrors(bean: craftLogInstance, field: 'earthCrystals', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: craftLogInstance, field: 'fireCrystals', 'error')} ">
				<label for="fireCrystals" class="control-label"><g:message code="craftLog.fireCrystals.label" default="Fire Crystals" /></label>
				<div>
					<g:field class="form-control" name="fireCrystals" type="number" value="${craftLogInstance.fireCrystals}"/>
					<span class="help-inline">${hasErrors(bean: craftLogInstance, field: 'fireCrystals', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: craftLogInstance, field: 'item', 'error')} ">
				<label for="item" class="control-label"><g:message code="craftLog.item.label" default="Item" /></label>
				<div>
					<g:select class="form-control" id="item" name="item.id" from="${eblana.items.Item.list()}" optionKey="id" value="${craftLogInstance?.item?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: craftLogInstance, field: 'item', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: craftLogInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="craftLog.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${craftLogInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: craftLogInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: craftLogInstance, field: 'recipe', 'error')} ">
				<label for="recipe" class="control-label"><g:message code="craftLog.recipe.label" default="Recipe" /></label>
				<div>
					<g:select class="form-control" id="recipe" name="recipe.id" from="${eblana.items.Recipe.list()}" optionKey="id" value="${craftLogInstance?.recipe?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: craftLogInstance, field: 'recipe', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: craftLogInstance, field: 'voidCrystals', 'error')} ">
				<label for="voidCrystals" class="control-label"><g:message code="craftLog.voidCrystals.label" default="Void Crystals" /></label>
				<div>
					<g:field class="form-control" name="voidCrystals" type="number" value="${craftLogInstance.voidCrystals}"/>
					<span class="help-inline">${hasErrors(bean: craftLogInstance, field: 'voidCrystals', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: craftLogInstance, field: 'waterCrystals', 'error')} ">
				<label for="waterCrystals" class="control-label"><g:message code="craftLog.waterCrystals.label" default="Water Crystals" /></label>
				<div>
					<g:field class="form-control" name="waterCrystals" type="number" value="${craftLogInstance.waterCrystals}"/>
					<span class="help-inline">${hasErrors(bean: craftLogInstance, field: 'waterCrystals', 'error')}</span>
				</div>
			</div>

