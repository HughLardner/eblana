<%@ page import="eblana.character.CharacterFeat" %>



			<div class="${hasErrors(bean: characterFeatInstance, field: 'character', 'error')} ">
				<label for="character" class="control-label"><g:message code="characterFeat.character.label" default="Character" /></label>
				<div>
					<g:select class="form-control" id="character" name="character.id" from="${eblana.character.PlayerCharacter.list()}" optionKey="id" value="${characterFeatInstance?.character?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: characterFeatInstance, field: 'character', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterFeatInstance, field: 'effect', 'error')} ">
				<label for="effect" class="control-label"><g:message code="characterFeat.effect.label" default="Effect" /></label>
				<div>
					<g:select class="form-control" id="effect" name="effect.id" from="${eblana.character.Effect.list()}" optionKey="id" value="${characterFeatInstance?.effect?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: characterFeatInstance, field: 'effect', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterFeatInstance, field: 'feat', 'error')} ">
				<label for="feat" class="control-label"><g:message code="characterFeat.feat.label" default="Feat" /></label>
				<div>
					<g:select class="form-control" id="feat" name="feat.id" from="${eblana.character.Feat.list()}" optionKey="id" value="${characterFeatInstance?.feat?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: characterFeatInstance, field: 'feat', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterFeatInstance, field: 'open', 'error')} ">
				<label for="open" class="control-label"><g:message code="characterFeat.open.label" default="Open" /></label>
				<div>
					<g:checkBox name="open" value="${characterFeatInstance?.open}" />
					<span class="help-inline">${hasErrors(bean: characterFeatInstance, field: 'open', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: characterFeatInstance, field: 'source', 'error')} ">
				<label for="source" class="control-label"><g:message code="characterFeat.source.label" default="Source" /></label>
				<div>
					<g:textField class="form-control" name="source" value="${characterFeatInstance?.source}"/>
					<span class="help-inline">${hasErrors(bean: characterFeatInstance, field: 'source', 'error')}</span>
				</div>
			</div>

