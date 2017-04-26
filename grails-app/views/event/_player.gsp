
<tr>
	<td rowspan="2"><g:checkBox class="form-control" name="printIds"
			value="${c.id}" checked="" /></td>

	<td rowspan="2">
		${c.user?.id}
	</td>
	<td rowspan="2"><g:link controller="secUser" action="show"
			id="${c.user?.id}">
			${fieldValue(bean: c, field: "user")}
		</g:link></td>
	<td rowspan="2">
		${c.id}
	</td>
	<td rowspan="2"><g:link controller="playerCharacter" action="show"
			id="${c.id}">
			${c?.encodeAsHTML()}
		</g:link></td rowspan="2">
	<td rowspan="2">
		${d?.id}
	</td>
	<td rowspan="2">
		${c.xp}
	</td>
	<td rowspan="2">
		${eventInstance.attended.contains(c)}
	</td>
	<th>Starting</th>
	<td class="air">
		${d?.airCrystals}
	</td>

	<td class="earth">
		${d?.earthCrystals}
	</td>

	<td class="fire">
		${d?.fireCrystals}
	</td>

	<td class="water">
		${d?.waterCrystals}
	</td>

	<td class="blended">
		${d?.blendedCrystals}
	</td>

	<td class="void">
		${d?.voidCrystals}
	</td>

	<td>
		<ul>
			<g:each in="${d?.item}" var="i">
				<li>
					${i.id } <g:link controller="Item" action="show" id="${i.id}">
						${i.name?:i.toString()}
					</g:link>
				</li>
			</g:each>
		</ul>
	</td>
</tr>
<tr><th>Current</th>
	<td class="air">
		${d?.airCurrent}
	</td>

	<td class="earth">
		${d?.earthCurrent}
	</td>

	<td class="fire">
		${d?.fireCurrent}
	</td>

	<td class="water">
		${d?.waterCurrent}
	</td>

	<td class="blended">
		${d?.blendedCurrent}
	</td>

	<td class="void">
		${d?.voidCurrent}
	</td>

	<td>
		<ul>
			<g:each in="${d?.itemCurrent}" var="i">
				<li>
					${i.id } <g:link controller="Item" action="show" id="${i.id}">
						${i.name?:i.toString()}
					</g:link>
				</li>
			</g:each>
		</ul>
	</td>
</tr>