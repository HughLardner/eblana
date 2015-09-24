<!DOCTYPE html>
<html>
<style>
table {
	border-collapse: collapse;
}

table, tr, td {
	border: 1px solid black;
	padding: 15px;
}
</style>

<body>
<table>
<tr>
<td>
Name
</td>
<td>
Phone Number
</td>
<td>
Emergency Contact
</td>
<td>
Emergency Contact Number
</td>
<td>
Medical Information
</td>
<td>
Car Registration</td>

</tr>
	<g:each in="${instanceList}" status="i"
		var="instance">
		<tr>
		
			
				
				<g:render template="/secUser/medicalForm"
					model="['instance': instance]" />
			
		
			</tr>
		
	</g:each>
</table>
</body>
</html>