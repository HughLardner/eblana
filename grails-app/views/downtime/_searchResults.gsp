<div id="searchresults">
	<g:if test="${searchresults}">
		<br />
		<h3>Search Results - Total: ${count }</h3>
		<div class="list">

			<g:each in="${searchresults}" status="i" var="downtimeInstance">
					Character: <g:link controller="playerCharacter" action="show"
					id="${downtimeInstance?.character?.id}">
					${downtimeInstance?.character?.encodeAsHTML()}
				</g:link>&nbsp;&nbsp;Event: <g:link controller="event" action="show"
					id="${downtimeInstance?.event?.id}">
					${downtimeInstance?.event?.encodeAsHTML()}
				</g:link>
				<g:render template="/downtime/downtime"
					model="['instance': downtimeInstance, 'event':'']" />
					</br>
			</g:each>
		</div>
	</g:if>
</div>