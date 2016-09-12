
<%@ page import="eblana.items.Item"%>
<!DOCTYPE html>
<html>

<head>
<meta name="layout" content="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'item.label', default: 'Item')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>
	<section id="show-item" class="first">
		<g:render template="/item/showAdmin"
			model="['itemInstance': itemInstance]" />
	</section>
</body>
</html>
