<%@ page import="eblana.character.Feat"%>



<div
	class="${hasErrors(bean: featInstance, field: 'description', 'error')} ">
	<label for="description" class="control-label"><g:message
			code="feat.description.label" default="Description" /></label>
	<div>
		<g:textField class="form-control" name="description"
			value="${featInstance?.description}" />
		<span class="help-inline">
			${hasErrors(bean: featInstance, field: 'description', 'error')}
		</span>
	</div>
</div>

<div class="${hasErrors(bean: featInstance, field: 'name', 'error')} ">
	<label for="name" class="control-label"><g:message
			code="feat.name.label" default="Name" /></label>
	<div>
		<g:textField class="form-control" name="name"
			value="${featInstance?.name}" />
		<span class="help-inline">
			${hasErrors(bean: featInstance, field: 'name', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: featInstance, field: 'prereqClass', 'error')} ">
	<label for="prereqClass" class="control-label"><g:message
			code="feat.prereqClass.label" default="Prereq Class" /></label>
	<div>
		<g:select class="form-control" id="prereqClass" name="prereqClass.id"
			from="${eblana.character.Classes.list()}" optionKey="id"
			value="${featInstance?.prereqClass?.id}" class="many-to-one"
			noSelection="['null': '']" />
		<span class="help-inline">
			${hasErrors(bean: featInstance, field: 'prereqClass', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: featInstance, field: 'prereqFeat', 'error')}">
	<label for="prereqFeat" class="control-label"><g:message
			code="feat.prereqFeat.label" default="Prereq Feat" /><span
		class="required-indicator">*</span></label>
	<div>
		<g:select class="form-control" id="prereqFeat" name="prereqFeat.id"
			from="${eblana.character.Feat.list()}" optionKey="id" 
			value="${featInstance?.prereqFeat?.id}" class="many-to-one" noSelection="['null': '']"/>
		<span class="help-inline">
			${hasErrors(bean: featInstance, field: 'prereqFeat', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: featInstance, field: 'prereqSpecies', 'error')} ">
	<label for="prereqSpecies" class="control-label"><g:message
			code="feat.prereqSpecies.label" default="Prereq Species" /></label>
	<div>
		<g:select class="form-control" id="prereqSpecies"
			name="prereqSpecies.id" from="${eblana.character.Species.list()}"
			optionKey="id" value="${featInstance?.prereqSpecies?.id}"
			class="many-to-one" noSelection="['null': '']" />
		<span class="help-inline">
			${hasErrors(bean: featInstance, field: 'prereqSpecies', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: featInstance, field: 'takeMoreThenOnce', 'error')} ">
	<label for="takeMoreThenOnce" class="control-label"><g:message
			code="feat.takeMoreThenOnce.label" default="Take More Then Once" /></label>
	<div>
		<bs:checkBox name="takeMoreThenOnce"
			value="${featInstance?.takeMoreThenOnce}" />
		<span class="help-inline">
			${hasErrors(bean: featInstance, field: 'takeMoreThenOnce', 'error')}
		</span>
	</div>
</div>

<div class="${hasErrors(bean: featInstance, field: 'type', 'error')} ">
	<label for="type" class="control-label"><g:message
			code="feat.type.label" default="Type" /></label>
	<div>
		<g:textField class="form-control" name="type"
			value="${featInstance?.type}" />
		<span class="help-inline">
			${hasErrors(bean: featInstance, field: 'type', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: featInstance, field: 'visiable', 'error')} ">
	<label for="visiable" class="control-label"><g:message
			code="feat.visiable.label" default="Visiable" /></label>
	<div>
		<bs:checkBox name="visiable" value="${featInstance?.visiable}" />
		<span class="help-inline">
			${hasErrors(bean: featInstance, field: 'visiable', 'error')}
		</span>
	</div>
</div>

