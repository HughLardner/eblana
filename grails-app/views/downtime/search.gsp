<%@ page import="eblana.event.Downtime"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="bootstrap" />
<title>Downtime Search</title>
</head>
<body>
	<div class="dialog">
		<br /> <br />
		<div id="searchSpecific">
			<g:form>
				<div>
					General Search:<input name="searchvalue" type="text" />
				</div>
				<div>
					Search Character: <input name="character" type="text" />
				</div>
				<div>
					Search Event: <input name="event" type="text" />
				</div>
				<div>
					Search Goal: <input name="goal" type="text" />
				</div>
				<div>
					Search Research: <input name="research" type="text" />
				</div>
				<div>
					Search Method: <input name="method" type="text" />
				</div>
				<div>
					Search Resources: <input name="resources" type="text" />
				</div>
				<div>
					Search Result: <input name="result" type="text" />
				</div>
				<g:submitToRemote update="searchresults" action="searchSpecific"
					name="search" value="Search" />
			</g:form>
		</div>
		<g:render template="searchResults" />
	</div>
</body>
</html>