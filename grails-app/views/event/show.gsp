
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
	<jq:plugin name="redirect" />
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
		<button onclick="printItems()" class="btn btn-primary">Print
			Items</button>
		<a href="${g.createLink(action:"printLabels", id:eventInstance.id)}"
			class="btn btn-primary">Print Labels</a>
		<g:form action="print" class="form-horizontal" role="form">
			<g:hiddenField name="event" value="${eventInstance.id}" />
			<div class="row">
				<div class="col-xs-2">Number</div>
				<div class="col-xs-2">
					${fieldValue(bean: eventInstance, field: "eventNumber")}
				</div>
				<div class="col-xs-2">Name</div>
				<div class="col-xs-2">
					${fieldValue(bean: eventInstance, field: "name")}
				</div>
				<div class="col-xs-2">Date</div>
				<div class="col-xs-2">
					${fieldValue(bean: eventInstance, field: "date")}
				</div>
			</div>
			<div class="row">
				<div class="col-xs-2">Downtime Open</div>
				<div class="col-xs-2">
					${fieldValue(bean: eventInstance, field: "lastEvent")}
				</div>
				<div class="col-xs-2">Current Downtime</div>
				<div class="col-xs-2">
					${fieldValue(bean: eventInstance, field: "currentDowntime")}
				</div>
				<div class="col-xs-2">Downtime Done</div>
				<div class="col-xs-2">
					${fieldValue(bean: eventInstance, field: "downtimeDone")}
				</div>
			</div>
			<table class="table table-bordered table-sm table-responsive">
				<thead>
					<tr>
						<th>Print</th>
						<th>Player Id</th>
						<th>Player Name</th>
						<th>Character Id</th>
						<th>Character Name</th>
						<th>Downtime Id</th>
						<th>XP</th>
						<th>Attended</th>
						<th></th>
						<th class="air">Air Crystals</th>
						<th class="earth">Earth Crystals</th>
						<th class="fire">Fire Crystals</th>
						<th class="water">Water Crystals</th>
						<th class="blended">Blended Crystals</th>
						<th class="void">Void Crystals</th>
						<th>Items</th>
					</tr>
					<tr>
				</thead>
				<tbody>
					<g:each
						in="${PlayerCharacter.findAllByAlive(true,[sort:'user.firstName'])}"
						var="c">
						<g:set var="d" value="${downtimes.get(c.id)}" />
						<g:render template="player" model="['c': c, 'd': d]"></g:render>

					</g:each>
				</tbody>
			</table>



			<g:submitButton name="print" class="btn btn-primary" value="Print" />
		</g:form>
	</section>

</body>

</html>
