
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
	<section id="index-item" class="first">
		<g:form class="form-inline" action="index">
			<div class="form-group">
				<label for="id">Item ID</label> <input name="id" type="number"
					class="form-control" id="id" placeholder="ID">
			</div>
			<div class="form-group">
				<label for="name">Name</label> <input name="name"
					class="form-control" id="name" placeholder="Name">
			</div>
			<div class="form-group">
				<label for="power1">Power</label> <input name="power1" type="text"
					class="form-control" id="power1" placeholder="Power">
			</div>
			<div class="form-group">
				<label for="type">Type</label>
				<g:select name="type" class="form-control" id="type" from="${type}"
					noSelection="${['':'Select Type...']}" />
			</div>
			<div class="form-group">
				<label for="duration">Valid Until</label>
				<g:select name="duration" class="form-control" id="duration"
					from="${duration}" noSelection="${['':'Select Duration...']}" />
			</div>
			<div class="form-group">
				<label for="created">Created</label>
				<g:select name="created" class="form-control" id="created"
					from="${events}" noSelection="${['null':'Select Event...']}" optionKey="id" />
			</div>
			<div class="form-group">
				<label for="internal">Internal Notes</label> <input name="internal"
					type="text" class="form-control" id="internal" placeholder="Note">
			</div>
			<div class="form-group">
				<label for="feat">Level</label>
				<g:select name="feat" class="form-control" id="feat" from="${feat}"
					noSelection="${['null':'Select Feat...']}" optionKey="id"/>
			</div>
			<div class="form-group">
				<label for="proposed" class="col-xs-3">Proposed</label>
				<div class="col-xs-9">
					<div class="radio">
						<label class="radio-inline" for="proposed">True</label><input
							type="radio" name="proposed" class="form-control" id="proposed"
							value="True">
					</div>
					<div class="radio">
						<label class="radio-inline" for="proposed">False</label><input
							type="radio" name="proposed" class="form-control" id="proposed"
							value="False">
					</div>
					<div class="radio">
						<label class="radio-inline" for="proposed">N/A</label><input
							type="radio" name="proposed" class="form-control" id="proposed"
							value="null" checked="true">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="transferable" class="col-xs-3">Transferable</label>
				<div class="col-xs-9">
					<div class="radio">
						<label class="radio-inline" for="transferable">True</label><input
							type="radio" name="transferable" class="form-control" id="transferable"
							value="True">
					</div>
					<div class="radio">
						<label class="radio-inline" for="transferable">False</label><input
							type="radio" name="transferable" class="form-control" id="transferable"
							value="False">
					</div>
					<div class="radio">
						<label class="radio-inline" for="transferable">N/A</label><input
							type="radio" name="transferable" class="form-control" id="transferable"
							value="null" checked="true">
					</div>
				</div>
			</div>
			<g:submitToRemote class="btn btn-default" update="items"
				action="search" name="search" value="Search" onComplete="autoSizeText();"/>
		</g:form>
		<div id="items"></div>
	</section>
</body>

</html>
