<%@ page import="eblana.items.Item"%>

<style>
td.name {
	width: 15%;
}
</style>
<section id="show-item" class="first">

	<table class="frame">
		<tr>
			<td>

				<table class="body">

					<tr class="prop">
						<td valign="top" class="name"><g:message
								code="item.name.label" default="Name" /></td>

						<td valign="top" class="value">
							${fieldValue(bean: itemInstance, field: "name")}
						</td>

					</tr>

					<tr class="prop">
						<td valign="top" class="name"><g:message
								code="item.type.label" default="Type" /></td>

						<td valign="top" class="value">
							${fieldValue(bean: itemInstance, field: "type")}
						</td>

					</tr>

					<tr class="prop">
						<td valign="top" class="name"><g:message
								code="item.power1.label" default="Power" /></td>

						<td valign="top" class="value">
							${fieldValue(bean: itemInstance, field: "power1")} ${fieldValue(bean: itemInstance, field: "power2")}
						</td>

					</tr>

					<tr class="prop">
						<td valign="top" class="name"><g:message
								code="item.attunementTime.label" default="Attunement Time" /></td>

						<td valign="top" class="value">
							${fieldValue(bean: itemInstance, field: "attunementTime")}
						</td>

					</tr>

					<tr class="prop">
						<td valign="top" class="name"><g:message
								code="item.duration.label" default="Duration" /></td>

						<td valign="top" class="value">
							${fieldValue(bean: itemInstance, field: "duration")}
						</td>

					</tr>



					</tbody>
				</table>

			</td>
		</tr>
	</table>
</section>

