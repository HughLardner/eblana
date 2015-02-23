<%@ page import="eblana.character.Spell" %>



			<div class="${hasErrors(bean: spellInstance, field: 'classes', 'error')} ">
				<label for="classes" class="control-label"><g:message code="spell.classes.label" default="Classes" /></label>
				<div>
					<g:select class="form-control" id="classes" name="classes.id" from="${eblana.character.Classes.list()}" optionKey="id" value="${spellInstance?.classes?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: spellInstance, field: 'classes', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: spellInstance, field: 'effect', 'error')} ">
				<label for="effect" class="control-label"><g:message code="spell.effect.label" default="Effect" /></label>
				<div>
					<g:select class="form-control" id="effect" name="effect.id" from="${eblana.character.Effect.list()}" optionKey="id" value="${spellInstance?.effect?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: spellInstance, field: 'effect', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: spellInstance, field: 'post', 'error')} ">
				<label for="post" class="control-label"><g:message code="spell.post.label" default="Post" /></label>
				<div>
					<g:textField class="form-control" name="post" value="${spellInstance?.post}"/>
					<span class="help-inline">${hasErrors(bean: spellInstance, field: 'post', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: spellInstance, field: 'pre', 'error')} ">
				<label for="pre" class="control-label"><g:message code="spell.pre.label" default="Pre" /></label>
				<div>
					<g:textField class="form-control" name="pre" value="${spellInstance?.pre}"/>
					<span class="help-inline">${hasErrors(bean: spellInstance, field: 'pre', 'error')}</span>
				</div>
			</div>

