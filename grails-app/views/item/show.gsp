
<%@ page import="eblana.items.Item" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-item" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="item.attunementTime.label" default="Attunement Time" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: itemInstance, field: "attunementTime")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="item.convertedCrystalCost.label" default="Converted Crystal Cost" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: itemInstance, field: "convertedCrystalCost")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="item.curseCure.label" default="Curse Cure" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: itemInstance, field: "curseCure")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="item.duration.label" default="Duration" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: itemInstance, field: "duration")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="item.internalNotes.label" default="Internal Notes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: itemInstance, field: "internalNotes")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="item.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: itemInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="item.power1.label" default="Power1" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: itemInstance, field: "power1")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="item.power2.label" default="Power2" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: itemInstance, field: "power2")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="item.singleUse.label" default="Single Use" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${itemInstance?.singleUse}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="item.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${itemInstance?.status?.encodeAsHTML()}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="item.type.label" default="Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: itemInstance, field: "type")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
