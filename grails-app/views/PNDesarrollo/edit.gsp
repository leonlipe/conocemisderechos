<%@ page import="mx.gob.redoaxaca.cednna.domino.PNDesarrollo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'PNDesarrollo.label', default: 'PNDesarrollo')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-PNDesarrollo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list">Lista de ejes</g:link></li>
				<li><g:link class="create" action="create">Nuevo eje</g:link></li>
			</ul>
		</div>
		<div id="edit-PNDesarrollo" class="content scaffold-edit" role="main">
			<h1><g:message code="mx.gob.redoaxaca.division.crear.label" default="Editar" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${PNDesarrolloInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${PNDesarrolloInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" class="uk-form uk-form-horizontal"  >
				<g:hiddenField name="id" value="${PNDesarrolloInstance?.id}" />
				<g:hiddenField name="version" value="${PNDesarrolloInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="uk-form-horizontal" >
					<g:actionSubmit class="uk-button" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="uk-button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
