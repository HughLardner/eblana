
<%@page import="java.awt.Event"%>
<%@ page import="eblana.event.EventLore" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="bootstrap" />
	<g:set var="entityName" value="${message(code: 'eventLore.label', default: 'EventLores')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>
  <div class="body">
  <h2>${event.toString() }</h2>
  <g:each in="${lores}"
			var="lore"> <h3>${lore.lore.name }</h3>
			<p>${raw(lore.content)}</p>
			</g:each>
  </div>
</body>
</html>