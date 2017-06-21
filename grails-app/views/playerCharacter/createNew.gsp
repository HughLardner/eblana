<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="bootstrap" />
<title>Insert title here</title>
</head>
<body>
	<div class="body">
		<g:form name="myForm" action="createNewCharacter" id="1">
			<div class="row">

				<div class="col-xs-1">
					<label for="user" class="control-label"><g:message
							code="playerCharacter.user.label" default="User" /></label>
				</div>
				<div class="col-xs-3">
					<g:select class="form-control" id="user" name="user.id"
						from="${eblana.users.SecUser.findAllByEnabledAndAccountLocked(true, false).sort{it.firstName?.toLowerCase()}}"
						optionKey="id" value="${playerCharacterInstance?.user?.id}"
						class="many-to-one" noSelection="['null': '']" />
					<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'user', 'error')}
					</span>
				</div>

				<div class="col-xs-1">
					<label for="name" class="control-label"><g:message
							code="playerCharacter.name.label" default="Name" /></label>
				</div>
				<div class="col-xs-3">
					<g:textField class="form-control" name="name"
						value="${playerCharacterInstance?.name}" />
					<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'name', 'error')}
					</span>
				</div>

				<div class="col-xs-1">
					<label for="species" class="control-label"><g:message
							code="playerCharacter.species.label" default="Species" /></label>
				</div>
				<div class="col-xs-3">
					<g:select class="form-control" id="species" name="species.id"
						from="${eblana.character.Species.list()}" optionKey="id"
						value="${playerCharacterInstance?.species?.id}"
						class="many-to-one" noSelection="['null': '']" />
					<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'species', 'error')}
					</span>
				</div>

			</div>

			<div class="row">
				<div class="col-xs-1">
					<label for="class1" class="control-label"><g:message
							code="playerCharacter.class1.label" default="Class 1" /></label>
				</div>
				<div class="col-xs-3">
					<g:select class="form-control" id="class1" name="class1.id"
						from="${eblana.character.Classes.findAllByPrerequisite(null)}" optionKey="id"
						value="${playerCharacterInstance?.classes?.id}"
						class="many-to-one" noSelection="['null': '']" />
					<span class="help-inline"> ${hasErrors(bean: playerCharacterInstance, field: 'classes', 'error')}
					</span>
				</div>
			</div>
		</g:form>
	</div>
</body>
</html>