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
				from="${eblana.users.SecUser.list()}" optionKey="id"
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


	<div class="c"></div>
</div>
