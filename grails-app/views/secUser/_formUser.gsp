<%@ page import="eblana.users.SecUser"%>

<div
	class="${hasErrors(bean: secUserInstance, field: 'firstName', 'error')} ">
	<label for="firstName" class="control-label"><g:message
			code="secUser.firstName.label" default="First Name" /></label>
	<div>
		<g:textField class="form-control" name="firstName" required="true"
			value="${secUserInstance?.firstName}" />
		<span class="help-inline">
			${hasErrors(bean: secUserInstance, field: 'firstName', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: secUserInstance, field: 'surname', 'error')} ">
	<label for="surname" class="control-label"><g:message
			code="secUser.surname.label" default="Surname" /></label>
	<div>
		<g:textField class="form-control" name="surname"  required="true"
			value="${secUserInstance?.surname}" />
		<span class="help-inline">
			${hasErrors(bean: secUserInstance, field: 'surname', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: secUserInstance, field: 'phoneNumber', 'error')} ">
	<label for="phoneNumber" class="control-label"><g:message
			code="secUser.phoneNumber.label" default="Phone Number" /></label>
	<div>
		<g:textField class="form-control" name="phoneNumber"
			value="${secUserInstance?.phoneNumber}" />
		<span class="help-inline">
			${hasErrors(bean: secUserInstance, field: 'phoneNumber', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: secUserInstance, field: 'medicalInformation', 'error')} ">
	<label for="medicalInformation" class="control-label"><g:message
			code="secUser.medicalInformation.label" default="Medical Information" /></label>
	<div>
		<g:textField class="form-control" name="medicalInformation"
			value="${secUserInstance?.medicalInformation}" />
		<span class="help-inline">
			${hasErrors(bean: secUserInstance, field: 'medicalInformation', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: secUserInstance, field: 'emergancyContact', 'error')} ">
	<label for="emergancyContact" class="control-label"><g:message
			code="secUser.emergancyContact.label" default="Emergancy Contact Name" /></label>
	<div>
		<g:textField class="form-control" name="emergancyContact"  required="true"
			value="${secUserInstance?.emergancyContact}" />
		<span class="help-inline">
			${hasErrors(bean: secUserInstance, field: 'emergancyContact', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: secUserInstance, field: 'emergancyContactNumber', 'error')} ">
	<label for="emergancyContactNumber" class="control-label"><g:message
			code="secUser.emergancyContactNumber.label"
			default="Emergancy Contact Number" /></label>
	<div>
		<g:textField class="form-control" name="emergancyContactNumber"  required="true"
			value="${secUserInstance?.emergancyContactNumber}" />
		<span class="help-inline">
			${hasErrors(bean: secUserInstance, field: 'emergancyContactNumber', 'error')}
		</span>
	</div>
</div>

<div
	class="${hasErrors(bean: secUserInstance, field: 'carReg', 'error')} ">
	<label for="carReg" class="control-label"><g:message
			code="secUser.carReg.label" default="Car Reg" /></label>
	<div>
		<g:textField class="form-control" name="carReg"
			value="${secUserInstance?.carReg}" />
		<span class="help-inline">
			${hasErrors(bean: secUserInstance, field: 'carReg', 'error')}
		</span>
	</div>
</div>






