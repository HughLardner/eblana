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
			<g:if test="${itemInstance.consumable()}">
				<div class="consumable" style="outline: 1px solid black;">
					<div class="rotateObj">
						<div class="content">
							<g:render template="/item/showTemplate"
								model="['itemInstance': itemInstance]" />
						</div>
						<h3>
							<span>Tear on use</span>
						</h3>
					</div>
				</div>
				<div class="consumable-clear"></div>
			</g:if>
			<g:elseif test="${itemInstance.type=='Scroll' }">
				<div class="item-scroll" style="outline: 1px solid black;">
					<g:render template="/item/showTemplate"
						model="['itemInstance': itemInstance]" />
				</div>
			</g:elseif>
			<g:else>
				<div class="item-print" style="outline: 1px solid black;">
					<g:render template="/item/showTemplate"
						model="['itemInstance': itemInstance]" />
				</div>
			</g:else>
		</g:each>
	</div>
</body>
</html>