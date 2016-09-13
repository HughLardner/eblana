
<%@ page import="eblana.event.Event"%>
<%@ page import="eblana.character.PlayerCharacter"%>
<%@ page import="eblana.items.Item"%>

<!DOCTYPE html>
<html>

<head>
<meta name="layout" content="bootstrap" />
<g:set var="entityName"
	value="${message(code: 'event.label', default: 'Event')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>

</head>

<body>
<jq:plugin name="redirect"/>
	<script>
function printItems(){
	$.ajax({ 
	    url: '${g.createLink(action:'fetchItems', controller:'item' )}', 
	    type:"GET", 
	    data:{event:document.getElementById('event').value},
	    success:function(data) {
		    $.redirect('${g.createLink(controller:"item", action:"printItems")}', {'ids': data});
	    }
	});
}
</script>
	<section id="show-event" class="first">
		<button onclick="printItems()">Print Items</button>
		<g:form action="print" class="form-horizontal" role="form">
			<g:hiddenField name="event" value="${eventInstance.id}" />
			<table class="table">
				<tbody>
					<tr class="prop">
						<td valign="top" class="name"><g:message
								code="event.name.label" default="Number" /></td>

						<td valign="top" class="value">
							${fieldValue(bean: eventInstance, field: "eventNumber")}
						</td>

					</tr>
					<tr class="prop">
						<td valign="top" class="name"><g:message
								code="event.name.label" default="Name" /></td>
						<td valign="top" class="value">
							${fieldValue(bean: eventInstance, field: "name")}
						</td>
					</tr>
					<tr class="prop">
						<td valign="top" class="name"><g:message
								code="event.name.label" default="Date" /></td>
						<td valign="top" class="value">
							${fieldValue(bean: eventInstance, field: "date")}
						</td>
					</tr>
					<tr class="prop">
						<td valign="top" class="name"><g:message
								code="event.name.label" default="Downtime Open" /></td>
						<td valign="top" class="value">
							${fieldValue(bean: eventInstance, field: "lastEvent")}
						</td>
					</tr>
					<tr class="prop">
						<td valign="top" class="name"><g:message
								code="event.name.label" default="Current Downtime" /></td>
						<td valign="top" class="value">
							${fieldValue(bean: eventInstance, field: "currentDowntime")}
						</td>
					</tr>
					<tr class="prop">
						<td valign="top" class="name"><g:message
								code="event.name.label" default="Downtime Done" /></td>
						<td valign="top" class="value">
							${fieldValue(bean: eventInstance, field: "downtimeDone")}
						</td>
					</tr>
					<tr class="prop">
						<td valign="top" class="name"><g:message
								code="event.characterEvent.label" default="Attended" /></td>
					<tr>
						<td>Print</td>
						<td>Player Id</td>
						<td>Player Name</td>
						<td>Character Id</td>
						<td>Character Name</td>
						<td>XP</td>
						<td>Attended</td>
						<td>Air Crystals</td>
						<td>Earth Crystals</td>
						<td>Fire Crystals</td>
						<td>Water Crystals</td>
						<td>Blended Crystals</td>
						<td>Void Crystals</td>
						<td>Items</td>
					</tr>
					<g:each
						in="${PlayerCharacter.findAllByAlive(true,[sort:'user.firstName'])}"
						var="c">
						<g:set var="d" value="${downtimes.get(c.id)}" />
						<tr>
							<td><g:checkBox class="form-control" name="printIds"
									value="${c.id}" checked="" /></td>
							<td>
								${c.user?.id}
							</td>
							<td><g:link controller="secUser" action="show"
									id="${c.user?.id}">
									${fieldValue(bean: c, field: "user")}
								</g:link></td>
							<td>
								${c.id}
							</td>
							<td><g:link controller="playerCharacter" action="show"
									id="${c.id}">
									${c?.encodeAsHTML()}
								</g:link></td>
							<td>
								${c.xp}
							</td>
							<td>
								${eventInstance.attended.contains(c)}
							</td>
							<td>
								${d?.airCrystals}
							</td>
							<td>
								${d?.earthCrystals}
							</td>
							<td>
								${d?.fireCrystals}
							</td>
							<td>
								${d?.waterCrystals}
							</td>
							<td>
								${d?.blendedCrystals}
							</td>
							<td>
								${d?.voidCrystals}
							</td>
							<td><ul>
									<g:each in="${d?.item}" var="i">
										<li><g:link controller="Item" action="show" id="${i.id}">
												${i.name?i.name:i.toString()}
											</g:link></li>
									</g:each>
								</ul></td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<g:submitButton name="print" class="btn btn-primary" value="Print" />
		</g:form>
	</section>

</body>

</html>
