<%@ page import="eblana.items.Item"%>
<%@ page import="eblana.event.Event"%>
<!DOCTYPE html>
<html>

<head>
<meta name="layout" content="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'item.label', default: 'Item')}" />
<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>
<div class="row">
<g:each in="${itemInstanceList}" status="i" var="itemInstance">
	<div class="item-print" style="outline: 1px solid black;">
		<g:render template="/item/showTemplate"
			model="['itemInstance': itemInstance]" />
	</div>
</g:each>
</div>
</body>
</html>