<!DOCTYPE html>
<html>
<style>
@media screen {
	div.divHeader {
		display: none;
	}
}

@media print {
	div.divHeader {
		position: fixed;
		top: 0;
	}
}
</style>
<head>
<meta name="layout" content="printing" />
</head>

<body>
	<g:each in="${playerCharacterInstanceList}" status="i"
		var="playerCharacterInstance">
		
		<div>
			<g:if test="${playerCharacterInstance.alive}">
				<label for="chracter" class="control-label"> </label>
				<g:render template="/playerCharacter/showEvent"
					model="['playerCharacterInstance': playerCharacterInstance]" />
			</g:if>
		</div>
		<p style="page-break-after: always;"></p>
	</g:each>

</body>
</html>