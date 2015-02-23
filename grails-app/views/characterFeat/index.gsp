
<%@ page import="eblana.character.CharacterFeat" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'characterFeat.label', default: 'CharacterFeat')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-characterFeat" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="characterFeat.character.label" default="Character" /></th>
			
				<th><g:message code="characterFeat.effect.label" default="Effect" /></th>
			
				<th><g:message code="characterFeat.feat.label" default="Feat" /></th>
			
				<g:sortableColumn property="open" title="${message(code: 'characterFeat.open.label', default: 'Open')}" />
			
				<g:sortableColumn property="source" title="${message(code: 'characterFeat.source.label', default: 'Source')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${characterFeatInstanceList}" status="i" var="characterFeatInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${characterFeatInstance.id}">${fieldValue(bean: characterFeatInstance, field: "character")}</g:link></td>
			
				<td>${fieldValue(bean: characterFeatInstance, field: "effect")}</td>
			
				<td>${fieldValue(bean: characterFeatInstance, field: "feat")}</td>
			
				<td><g:formatBoolean boolean="${characterFeatInstance.open}" /></td>
			
				<td>${fieldValue(bean: characterFeatInstance, field: "source")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${characterFeatInstanceCount}" />
	</div>
</section>

</body>

</html>
