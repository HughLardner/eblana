<%@ page import="eblana.event.Downtime"%>
<html>
<style>
table {
	border-collapse: collapse;
}

table, td, th {
	border: 1px solid black;
	padding: 5px;
	table-layout: fixed;
}

.frame {
	padding: 2px;
	width: 100%;
	height: 10%
}

.body {
	width: 100%;
	text-align: left;
	page-break-inside: avoid !important;
}
</style>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script language="JavaScript" type="text/javascript"
	src="/js/jquery-ui-personalized-1.5.2.packed.js"></script>
<script language="JavaScript" type="text/javascript"
	src="/js/sprinkle.js"></script>
<title>Ajax search using remoteField</title>
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