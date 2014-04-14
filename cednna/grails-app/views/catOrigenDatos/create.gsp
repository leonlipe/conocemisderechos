<%@ page import="mx.gob.redoaxaca.cednna.domino.CatOrigenDatos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'catOrigenDatos.label', default: 'CatOrigenDatos')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-catOrigenDatos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list">Listado de variables</g:link></li>
			</ul>
		</div>
		<div id="create-catOrigenDatos" class="content scaffold-create" role="main">
			<h1><g:message code="mx.gob.redoaxaca.catOrigenDatos.crear.label" default="Crear"/></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${catOrigenDatosInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${catOrigenDatosInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form name="form" action="save" class="uk-form uk-form-horizontal">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<button  onclick="form.submit();" class="uk-button uk-button-primary">
				<i class="uk-icon-small uk-icon-edit"></i> ${message(code: 'default.button.create.label', default: 'Create')}
				</button>
			</g:form>
		</div>
	</body>
</html>
