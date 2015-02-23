<%@ page import="eblana.character.CharacterSpell" %>



			<div class="${hasErrors(bean: characterSpellInstance, field: 'character', 'error')} ">
				<label for="character" class="control-label"><g:message code="characterSpell.character.label" default="Character" /></label>
				<div>
					<g:select class="form-control" id="character" name="character.id" from="${eblana.character.PlayerCharacter.list()}" optionKey="id" value="${characterSpellInstance?.character?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: characterSpellInstance, field: 'character', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterSpellInstance, field: 'effect1', 'error')} ">
				<label for="effect1" class="control-label"><g:message code="characterSpell.effect1.label" default="Effect1" /></label>
				<div>
					<g:select class="form-control" id="effect1" name="effect1.id" from="${eblana.character.Effect.list()}" optionKey="id" value="${characterSpellInstance?.effect1?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: characterSpellInstance, field: 'effect1', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterSpellInstance, field: 'effect2', 'error')} ">
				<label for="effect2" class="control-label"><g:message code="characterSpell.effect2.label" default="Effect2" /></label>
				<div>
					<g:select class="form-control" id="effect2" name="effect2.id" from="${eblana.character.Effect.list()}" optionKey="id" value="${characterSpellInstance?.effect2?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: characterSpellInstance, field: 'effect2', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterSpellInstance, field: 'source', 'error')} ">
				<label for="source" class="control-label"><g:message code="characterSpell.source.label" default="Source" /></label>
				<div>
					<g:textField class="form-control" name="source" value="${characterSpellInstance?.source}"/>
					<span class="help-inline">${hasErrors(bean: characterSpellInstance, field: 'source', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterSpellInstance, field: 'spell', 'error')} ">
				<label for="spell" class="control-label"><g:message code="characterSpell.spell.label" default="Spell" /></label>
				<div>
					<g:select class="form-control" id="spell" name="spell.id" from="${eblana.character.Spell.list()}" optionKey="id" value="${characterSpellInstance?.spell?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: characterSpellInstance, field: 'spell', 'error')}</span>
				</div>
			</div>

