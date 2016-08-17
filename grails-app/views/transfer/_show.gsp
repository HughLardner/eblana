<tr>
	<td>
		${instance.from.character }
	</td>
	<td>
		${instance.to.character }
	</td>
	<td class="air">
		${instance.air }
	</td>
	<td class="earth">
		${instance.earth }
	</td>
	<td class="fire">
		${instance.fire }
	</td>
	<td class="water">
		${instance.water }
	</td>
	<td class="blended">
		${instance.blended }
	</td>
	<td class="void">
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