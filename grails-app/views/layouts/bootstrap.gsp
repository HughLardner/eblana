<!DOCTYPE html>
<html lang="en">
<head>
<title><g:layoutTitle default="${meta(name:'app.name')}" /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<r:require modules="jquery" />
<!--// OPTIONAL & CONDITIONAL CSS FILES //-->

<link rel="stylesheet"
	href="${resource(dir:'css',file:'bootstrap.css')}">
<link rel="stylesheet"
	href="${resource(dir:'css',file:'bootstrap-responsive.css')}">
<link rel="stylesheet"
	href="${resource(dir:'css',file:'stylesheet.css')}" type="text/css" />
<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}"
	type="text/css" />

<r:layoutResources />
<g:layoutHead />
<!-- Fav and touch icons -->

<link rel="shortcut icon"
	href="${resource(dir:'images',file:'favicon.ico')}">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-static-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="brand" href="#">Eblana</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<g:set var="entityName"
						value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />
					<sec:ifAllGranted roles="ROLE_ADMIN">
						<li class="${ params.action == "list" ? 'active' : '' }"><g:link
								action="list">
								<i class="glyphicon glyphicon-th-list"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link></li>
						<li class="${ params.action == "create" ? 'active' : '' }"><g:link
								action="create">
								<i class="glyphicon glyphicon-plus"></i>
								<g:message code="default.new.label" args="[entityName]" />
							</g:link></li>
						<li><g:link controller="user">Admin</g:link></li>
						<li><g:link controller="event">Event</g:link></li>
						<li><g:link controller="item">Items</g:link></li>
						<li><g:link controller="Recipe">Recipe</g:link></li>
						<li><g:link controller="Spell">Spell</g:link></li>
						<li><g:link controller="feat">Feat</g:link></li>
						<li><g:render template="/_common/modals/deleteTextLink" />
						<li class=""><g:link controller="playerCharacter"
								action="genDowntime" id="${params.id }">Downtime</g:link></li>
					</sec:ifAllGranted>
					<g:if
						test="${ params.action == 'show' || params.action == 'edit' || params.action == 'showLogin'}">
						<!-- the item is an object (not a list) -->
						<li><g:link action="edit" id="${params.id}">
								<i class="glyphicon glyphicon-pencil"></i>
								<g:message code="default.edit.label" args="[entityName]" />
							</g:link></li>
					</g:if>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><g:link controller="logout" action="index" method="post">
							<span class="glyphicon glyphicon-log-in"></span>
							Logout</g:link></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<!-- main content -->
	<div class="container" id="page-content">
		<g:layoutBody />
	</div>
	<!-- end main content -->

	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="${resource(dir:'js',file:'bootstrap.js')}"></script>
	<script src="${resource(dir:'js',file:'styling.js')}"></script>
</body>
</html>