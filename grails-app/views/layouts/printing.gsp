<!DOCTYPE html>
<%-- <html lang="${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().replace('_', '-')}"> --%>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">

<head>
	
    <meta charset="utf-8">
    <meta name="viewport"		content="width=device-width, initial-scale=1.0">
    <meta name="description"	content="">
    <meta name="author"			content="">
    
	<link rel="shortcut icon"		href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
	
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:300,400,700" type="text/css">
    
	
	<%-- Manual switch for the skin can be found in /view/_menu/_config.gsp --%>
	<r:require module="jquery-ui"/>
	<r:require modules="jquery"/> <%-- jQuery is required for Bootstrap! --%>
	<%--<r:require modules="jquery.media"/> --%>
	<r:require modules="bootstrap"/>
	<r:require modules="bootstrap_utils"/>
	
	<r:layoutResources />
	<g:layoutHead />

	<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
	<!--[if lt IE 9]>
		<script src="https://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<%-- For Javascript see end of body --%>
	<%-- <link rel="stylesheet"		href="${resource(dir:'css',file:'style.css')}" type="text/css" /> --%>
	<link rel="stylesheet" href="${resource(dir:'css',file:'stylesheet.css')}" type="text/css" />
	
</head>

<body>
												
	<!-- Enable to overwrite Header by individual page -->
	<g:if test="${ pageProperty(name:'page.header') }">
   		<g:pageProperty name="page.header" />
	</g:if>
	<g:else>
		<g:render template="/layouts/header"/>														
	</g:else>

	<g:render template="/layouts/contentPrint"/>														

	<!-- Enable to overwrite Footer by individual page -->
<%--	<g:if test="${ pageProperty(name:'page.footer') }">--%>
<%--	    <g:pageProperty name="page.footer" />--%>
<%--	</g:if>--%>
<%--	<g:else>--%>
<%--		<g:render template="/layouts/footer"/>														--%>
<%--	</g:else>--%>

	<!-- Enable to insert additional components (e.g., modals, javascript, etc.) by any individual page -->
	<g:if test="${ pageProperty(name:'page.include.bottom') }">
   		<g:pageProperty name="page.include.bottom" />
	</g:if>
	<g:else>
		<!-- Insert a modal dialog for registering (for an open site registering is possible on any page) -->
		<g:render template="/_common/modals/registerDialog" model="[item: item]"/>
	</g:else>
	
	<!-- Included Javascript files and other resources -->
	<r:layoutResources />
</body>

</html>