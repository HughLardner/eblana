<%@ page import="eblana.character.CharacterFeat"%>




<div class="${hasErrors(bean: feat, field: 'effect', 'error')} formField">

	<label for="feat" class="control-label"><g:message
			code="characterFeat.feat.label" default="Feat" /><b> ${i+1}:</b></label>

	<g:select class="form-control" id="feat[${i}].feat" name="feat[${i}].feat.id"
		from="${eblana.character.Feat.list()}" optionKey="id"
		value="${feat?.feat?.id}" class="many-to-one"
		noSelection="['null': '']" />
	<span class="help-inline"> ${hasErrors(bean: feat, field: 'feat', 'error')}
	</span> <label for="effect" class="control-label"><g:message
			code="characterFeat.effect.label" default="Effect" /></label>

	<g:select class="form-control" id="feat[${i}].effect" name="feat[${i}].effect.id"
		from="${eblana.character.Effect.list()}" optionKey="id"
		value="${feat?.effect?.id}" class="many-to-one"
		noSelection="['null': '']" />
	<span class="help-inline"> ${hasErrors(bean: feat, field: 'effect', 'error')}
	</span> <label for="open" class="control-label"><g:message
			code="characterFeat.open.label" default="Open" /></label>

	<bs:checkBox name="feat[${i}].open" value="${feat?.open}" />
	<span class="help-inline"> ${hasErrors(bean: feat, field: 'open', 'error')}
	</span> <label for="source" class="control-label"><g:message
			code="characterFeat.source.label" default="Source" /></label>

	<g:textField class="form-control" name="feat[${i}].source" value="${feat?.source}" style="width: 150px;" />
	<span class="help-inline"> ${hasErrors(bean: feat, field: 'source', 'error')}
	</span>

</div>

