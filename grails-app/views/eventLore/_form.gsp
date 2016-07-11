<%@ page import="eblana.event.EventLore" %>



			<div class="${hasErrors(bean: eventLoreInstance, field: 'content', 'error')} ">
				<label for="content" class="control-label"><g:message code="eventLore.content.label" default="Content" /></label>
				<div>
					<g:textField class="form-control" name="content" value="${eventLoreInstance?.content}"/>
					<span class="help-inline">${hasErrors(bean: eventLoreInstance, field: 'content', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: eventLoreInstance, field: 'event', 'error')} ">
				<label for="event" class="control-label"><g:message code="eventLore.event.label" default="Event" /></label>
				<div>
					<g:select class="form-control" id="event" name="event.id" from="${eblana.event.Event.list()}" optionKey="id" value="${eventLoreInstance?.event?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: eventLoreInstance, field: 'event', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: eventLoreInstance, field: 'lore', 'error')} ">
				<label for="lore" class="control-label"><g:message code="eventLore.lore.label" default="Lore" /></label>
				<div>
					<g:select class="form-control" id="lore" name="lore.id" from="${eblana.character.Lore.list()}" optionKey="id" value="${eventLoreInstance?.lore?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: eventLoreInstance, field: 'lore', 'error')}</span>
				</div>
			</div>

