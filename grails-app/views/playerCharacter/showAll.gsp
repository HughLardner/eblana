<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="printing" />
</head>

<body>
	<g:each in="${playerCharacterInstanceList}" status="i"
		var="playerCharacterInstance">
		<div>
			<label for="chracter" class="control-label"> </label>
			<g:render template="/playerCharacter/showForm"
				model="['playerCharacterInstance': playerCharacterInstance]" />
		</div>
	</g:each>
	
</body>
</html>