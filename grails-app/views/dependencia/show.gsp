
<%@ page import="mx.gob.redoaxaca.cednna.domino.Dependencia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dependencia.label', default: 'Dependencia')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-dependencia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list">Listado de dependencias</g:link></li>
				<li><g:link class="create" action="create">Nueva dependencia</g:link></li>
			</ul>
		</div>
		<div id="show-dependencia" class="content scaffold-show" role="main">
			<h1>Dependencia</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list dependencia">
			
				<g:if test="${dependenciaInstance?.clave}">
				<li class="fieldcontain">
					<span id="clave-label" class="property-label"><g:message code="dependencia.clave.label" default="Clave" /></span>
					
						<span class="property-value" aria-labelledby="clave-label"><g:fieldValue bean="${dependenciaInstance}" field="clave"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dependenciaInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label">Descripci&oacute;n</span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${dependenciaInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="uk-form-horizontal">
					<g:hiddenField name="id" value="${dependenciaInstance?.id}" />
					<g:link class="edit uk-button" action="edit" id="${dependenciaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete uk-button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
