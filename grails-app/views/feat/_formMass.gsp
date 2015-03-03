<%@ page import="eblana.character.Feat"%>



<td><g:textField class="form-control" name="description"
		value="${featInstance?.description}" /> <span class="help-inline">
		${hasErrors(bean: featInstance, field: 'description', 'error')}
</span></td>

<td><g:textField class="form-control" name="name"
		value="${featInstance?.name}" /> <span class="help-inline"> ${hasErrors(bean: featInstance, field: 'name', 'error')}
</span></td>

<td><g:select class="form-control" id="prereqClass"
		name="prereqClass.id" from="${eblana.character.Classes.list()}"
		optionKey="id" value="${featInstance?.prereqClass?.id}"
		class="many-to-one" noSelection="['null': '']" /> <span
	class="help-inline"> ${hasErrors(bean: featInstance, field: 'prereqClass', 'error')}
</span></td>

<td><g:select class="form-control" id="prereqFeat"
		name="prereqFeat.id" from="${eblana.character.Feat.list()}"
		optionKey="id" value="${featInstance?.prereqFeat?.id}"
		class="many-to-one" noSelection="['null': '']" /> <span
	class="help-inline"> ${hasErrors(bean: featInstance, field: 'prereqFeat', 'error')}
</span></td>

<td><g:select class="form-control" id="prereqSpecies"
		name="prereqSpecies.id" from="${eblana.character.Species.list()}"
		optionKey="id" value="${featInstance?.prereqSpecies?.id}"
		class="many-to-one" noSelection="['null': '']" /> <span
	class="help-inline"> ${hasErrors(bean: featInstance, field: 'prereqSpecies', 'error')}
</span></td>

<td><bs:checkBox name="takeMoreThenOnce"
		value="${featInstance?.takeMoreThenOnce}" /> <span
	class="help-inline"> ${hasErrors(bean: featInstance, field: 'takeMoreThenOnce', 'error')}
</span></td>

<td><g:textField class="form-control" name="type"
		value="${featInstance?.type}" /> <span class="help-inline"> ${hasErrors(bean: featInstance, field: 'type', 'error')}
</span></td>

<td><bs:checkBox name="visiable" value="${featInstance?.visiable}" />
	<span class="help-inline"> ${hasErrors(bean: featInstance, field: 'visiable', 'error')}
</span></td>
