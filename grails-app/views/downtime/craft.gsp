<html>
<g:javascript/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Ajax search using remoteField</title>
</head>
<body>
	<div class="dialog">
		<br /> <br />
		<div id="searchbox">
			Title Search:
			<g:remoteField name="search" update="../playerCharacter/recipes"
				paramName="downtime"
				url="[controller:'PlayerCharacter', action:'fetchRecipes']"
				onLoading="showSpinner(true);" onComplete="showSpinner(false);">
			</g:remoteField><br>
			<select onchange="${remoteFunction(controller:'PlayerCharacter', action:'fetchRecipes',
                       update: [success: 'great', failure: 'ohno'],
                       params: downtime.character)}">
    <option>first</option>
    <option>second</option>
</select>
		</div>
		<g:render template="../playerCharacter/recipes" />
	</div>
</body>
</html>

${downtime.character.recipe }