<%@ page import="eblana.character.PlayerCharacter"%>
<%@ page import="org.codehaus.groovy.grails.commons.ConfigurationHolder"%>

<g:javascript src="codeGenerator.js" />

<g:render template="/template/jsmethod"
	model="['instance': playerCharacterInstance, 'properties':['lore','spell','classes', 'feat']]" />

<div class="formtoright" id="gridDIV">
	<!-- standard display information for a form -->

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'user', 'error')} formField">
		<label for="user" class="control-label"><g:message
				code="playerCharacter.user.label" default="User" /></label>
		<div>
			<g:select class="form-control" id="user" name="user.id"
				from="${eblana.users.User.list()}" optionKey="id"
				value="${playerCharacterInstance?.user?.id}" class="many-to-one"
				noSelection="['null': '']" />
			<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'user', 'error')}
			</span>
		</div>
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'name', 'error')} formField">
		<label for="name" class="control-label"><g:message
				code="playerCharacter.name.label" default="Name" /></label>
		<div>
			<g:textField class="form-control" name="name"
				value="${playerCharacterInstance?.name}" />
			<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'name', 'error')}
			</span>
		</div>
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'xp', 'error')} formField">
		<label for="xp" class="control-label"><g:message
				code="playerCharacter.xp.label" default="Xp" /></label>
		<div>
			<g:field class="form-control" name="xp" type="number"
				value="${playerCharacterInstance.xp}" />
			<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'xp', 'error')}
			</span>
		</div>
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'armour', 'error')} formField">
		<label for="armour" class="control-label"><g:message
				code="playerCharacter.armour.label" default="Armour" /></label>
		<div>
			<g:field class="form-control" name="armour" type="number"
				value="${playerCharacterInstance.armour}" />
			<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'armour', 'error')}
			</span>
		</div>
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'body', 'error')} formField">
		<label for="body" class="control-label"><g:message
				code="playerCharacter.body.label" default="Body" /></label>
		<div>
			<g:field class="form-control" name="body" type="number"
				value="${playerCharacterInstance.body}" />
			<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'body', 'error')}
			</span>
		</div>
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'mana', 'error')} formField">
		<label for="mana" class="control-label"><g:message
				code="playerCharacter.mana.label" default="Mana" /></label>
		<div>
			<g:field class="form-control" name="mana" type="number"
				value="${playerCharacterInstance.mana}" />
			<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'mana', 'error')}
			</span>
		</div>
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'alive', 'error')} formField">
		<label for="alive" class="control-label"><g:message
				code="playerCharacter.alive.label" default="Alive" /></label>
		<div>
			<bs:checkBox name="alive" value="${playerCharacterInstance?.alive}" />
			<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'alive', 'error')}
			</span>
		</div>
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'species', 'error')} formField">
		<label for="species" class="control-label"><g:message
				code="playerCharacter.species.label" default="Species" /></label>
		<div>
			<g:select class="form-control" id="species" name="species.id"
				from="${eblana.character.Species.list()}" optionKey="id"
				value="${playerCharacterInstance?.species?.id}" class="many-to-one"
				noSelection="['null': '']" />
			<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'species', 'error')}
			</span>
		</div>
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'classes', 'error')} formField">
		<label for="classes" class="control-label">Class</label>
		<g:render template="/template/classes"
			model="['instance': playerCharacterInstance, 'div':'classes', 'description': 'Add Class']" />
		
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'feat', 'error')} formField">
		<label for="feat" class="control-label">Feat</label>
		<g:render template="/template/feat"
			model="['instance': playerCharacterInstance, 'div':'feat', 'description': 'Add Feat']" />

	</div>


	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'spell', 'error')} formField">
		<label for="spell" class="control-label">Spell</label>
		<g:render template="/template/spell"
			model="['instance': playerCharacterInstance, 'div':'spell', 'description': 'Add Spell']" />
		
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'lore', 'error')} formField">
		<label for="lore" class="control-label">Lore</label>
		<g:render template="/template/lore"
			model="['instance': playerCharacterInstance, 'div':'lore', 'description': 'Add Lore']" />
		
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'god', 'error')} formField">
		<label for="god" class="control-label"><g:message
				code="playerCharacter.god.label" default="God" /></label>
		<div>
			<g:select class="form-control" id="god" name="god.id"
				from="${eblana.background.God.list()}" optionKey="id"
				value="${playerCharacterInstance?.god?.id}" class="many-to-one"
				noSelection="['null': '']" />
			<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'god', 'error')}
			</span>
		</div>
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'group', 'error')} formField">
		<label for="group" class="control-label"><g:message
				code="playerCharacter.group.label" default="Group" /></label>
		<div>
			<g:select class="form-control" id="group" name="group.id"
				from="${eblana.background.Group.list()}" optionKey="id"
				value="${playerCharacterInstance?.group?.id}" class="many-to-one"
				noSelection="['null': '']" />
			<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'group', 'error')}
			</span>
		</div>
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'settlement', 'error')} formField">
		<label for="settlement" class="control-label"><g:message
				code="playerCharacter.settlement.label" default="Settlement" /></label>
		<div>
			<g:select class="form-control" id="settlement" name="settlement.id"
				from="${eblana.background.Settlement.list()}" optionKey="id"
				value="${playerCharacterInstance?.settlement?.id}"
				class="many-to-one" noSelection="['null': '']" />
			<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'settlement', 'error')}
			</span>
		</div>
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'background', 'error')} formField">
		<label for="background" class="control-label"><g:message
				code="playerCharacter.background.label" default="Background" /></label>
		<div>
			<g:textField class="form-control" name="background"
				value="${playerCharacterInstance?.background}" />
			<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'background', 'error')}
			</span>
		</div>
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'recipe', 'error')} formField">
		<label for="recipe" class="control-label"><g:message
				code="playerCharacter.recipe.label" default="Recipe" /></label>
		<div>
			<g:select class="form-control" name="recipe"
				from="${eblana.items.Recipe.list()}" multiple="multiple"
				optionKey="id" size="5"
				value="${playerCharacterInstance?.recipe*.id}" class="many-to-many" />
			<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'recipe', 'error')}
			</span>
		</div>
	</div>







	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'airCrystals', 'error')} formField">
		<label for="airCrystals" class="control-label"><g:message
				code="playerCharacter.airCrystals.label" default="Air Crystals" /></label>
		<div>
			<g:field class="form-control" name="airCrystals" type="number"
				value="${playerCharacterInstance.airCrystals}" />
			<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'airCrystals', 'error')}
			</span>
		</div>
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'earthCrystals', 'error')} formField">
		<label for="earthCrystals" class="control-label"><g:message
				code="playerCharacter.earthCrystals.label" default="Earth Crystals" /></label>
		<div>
			<g:field class="form-control" name="earthCrystals" type="number"
				value="${playerCharacterInstance.earthCrystals}" />
			<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'earthCrystals', 'error')}
			</span>
		</div>
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'fireCrystals', 'error')} formField">
		<label for="fireCrystals" class="control-label"><g:message
				code="playerCharacter.fireCrystals.label" default="Fire Crystals" /></label>
		<div>
			<g:field class="form-control" name="fireCrystals" type="number"
				value="${playerCharacterInstance.fireCrystals}" />
			<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'fireCrystals', 'error')}
			</span>
		</div>
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'waterCrystals', 'error')} formField">
		<label for="waterCrystals" class="control-label"><g:message
				code="playerCharacter.waterCrystals.label" default="Water Crystals" /></label>
		<div>
			<g:field class="form-control" name="waterCrystals" type="number"
				value="${playerCharacterInstance.waterCrystals}" />
			<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'waterCrystals', 'error')}
			</span>
		</div>
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'blendedCrystals', 'error')} formField">
		<label for="blendedCrystals" class="control-label"><g:message
				code="playerCharacter.blendedCrystals.label"
				default="Blended Crystals" /></label>
		<div>
			<g:field class="form-control" name="blendedCrystals" type="number"
				value="${playerCharacterInstance.blendedCrystals}" />
			<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'blendedCrystals', 'error')}
			</span>
		</div>
	</div>

	<div
		class="${hasErrors(bean: playerCharacterInstance, field: 'voidCrystals', 'error')} formField">
		<label for="voidCrystals" class="control-label"><g:message
				code="playerCharacter.voidCrystals.label" default="Void Crystals" /></label>
		<div>
			<g:field class="form-control" name="voidCrystals" type="number"
				value="${playerCharacterInstance.voidCrystals}" />
			<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'voidCrystals', 'error')}
			</span>
		</div>
	</div>
	<div class="c"></div>
</div>
