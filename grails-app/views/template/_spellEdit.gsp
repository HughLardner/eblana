<%@ page import="eblana.character.CharacterSpell"%>



<div class="${hasErrors(bean: spell, field: 'character', 'error')} ">
	<label for="spell" class="control-label"><g:message
			code="characterSpell.spell.label" default="Spell" /><b> ${i+1}:
	</b></label>
	<g:select class="form-control" id="spell[${i}].spell"
		name="spell[${i}].spell.id" from="${eblana.character.Spell.list()}"
		optionKey="id" value="${spell?.spell?.id}" class="many-to-one"
		noSelection="['null': '']" />
	<span class="help-inline"> ${hasErrors(bean: spell, field: 'spell', 'error')}
	</span> <label for="effect1" class="control-label"><g:message
			code="characterSpell.effect1.label" default="Effect1" /></label>

	<g:select class="form-control" id="spell[${i}].effect1"
		name="spell[${i}].effect1.id" from="${eblana.character.Effect.list()}"
		optionKey="id" value="${spell?.effect1?.id}" class="many-to-one"
		noSelection="['null': '']" />
	<span class="help-inline"> ${hasErrors(bean: spell, field: 'effect1', 'error')}
	</span> <label for="effect2" class="control-label"><g:message
			code="characterSpell.effect2.label" default="Effect2" /></label>

	<g:select class="form-control" id="spell[${i}].effect2"
		name="spell[${i}].effect2.id" from="${eblana.character.Effect.list()}"
		optionKey="id" value="${spell?.effect2?.id}" class="many-to-one"
		noSelection="['null': '']" />
	<span class="help-inline"> ${hasErrors(bean: spell, field: 'effect2', 'error')}
	</span> <label for="source" class="control-label"><g:message
			code="characterSpell.source.label" default="Source" /></label>

	<g:textField class="form-control" name="spell[${i}].source"
		value="${spell?.source}" style="width: 150px;" />
	<span class="help-inline"> ${hasErrors(bean: spell, field: 'source', 'error')}
	</span>





</div>

