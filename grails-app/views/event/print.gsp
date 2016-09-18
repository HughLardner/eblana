

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'event.label', default: 'Event')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<style>
</style>



<body>
	<g:each in="${players}" status="i" var="playerCharacterInstance">

		<div class="character">

			<div class="">
				<g:render template="/playerCharacter/show"
					model="['playerCharacterInstance': playerCharacterInstance.character]" />
			</div>

			<div class="">
				<h2>Recipes</h2>
				<g:render template="/recipe/recipeList"
					model="['playerCharacterInstance': playerCharacterInstance.character]" />
			</div>

			<div class="">
				<br>
				<h2>Downtime</h2>
				<g:render template="/downtime/downtime"
					model="['instance': playerCharacterInstance.downtime, 'event':'']" />
			</div>
			<div class="row">
				<div class="col-xs-12 bordered avoid-break">
					<g:message code="playerCharacter.feat.label" default="Lammies: " />
					<ul id="quad">
						<g:each
							in="${playerCharacterInstance?.downtime?.item?.sort{it.name}}"
							var="item">
							<li>
								${item?.id }: ${item?.name}
							</li>
						</g:each>
					</ul>
				</div>
			</div>

			<div class="">
				<br>
				<h2>Lore</h2>
				<g:each in="${playerCharacterInstance.lore}" var="lore">
					<div class="row row-eq-height bordered avoid-break">
						<div class="col-xs-2 bordered">
							<h5>
								${lore.lore}
							</h5>
						</div>
						<div class="col-xs-10">
							${raw(lore.content)}
						</div>
					</div>
				</g:each>
			</div>

		</div>
	</g:each>
</body>
</html>