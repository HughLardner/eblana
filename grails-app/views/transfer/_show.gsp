<tr>
	<td>
		${instance.from.character }
	</td>
	<td>
		${instance.to.character }
	</td>
	<td>
		${instance.air }
	</td>
	<td>
		${instance.earth }
	</td>
	<td>
		${instance.fire }
	</td>
	<td>
		${instance.water }
	</td>
	<td>
		${instance.blended }
	</td>
	<td>
		${instance.voidC }
	</td>
	<td>
		<ul>
			<g:each in="${instance.item}" var="i">
				<li><g:link controller="Item" action="show" id="${i.id}">
						${i.name?i.name:i.toString()}
					</g:link></li>
			</g:each>
		</ul>
	</td>
</tr>