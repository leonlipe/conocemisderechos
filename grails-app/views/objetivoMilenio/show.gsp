
<%@ page import="mx.gob.redoaxaca.cednna.domino.ObjetivoMilenio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'objetivoMilenio.label', default: 'ObjetivoMilenio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-objetivoMilenio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list">Lista ODM</g:link></li>
				<li><g:link class="create" action="create">Nuevo ODM</g:link></li>
			</ul>
		</div>
		<div id="show-objetivoMilenio" class="content scaffold-show" role="main">
			<h1>Mostrar ODM</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list objetivoMilenio">
			
				<g:if test="${objetivoMilenioInstance?.clave}">
				<li class="fieldcontain">
					<span id="clave-label" class="property-label"><g:message code="objetivoMilenio.clave.label" default="Clave" /></span>
					
						<span class="property-value" aria-labelledby="clave-label"><g:fieldValue bean="${objetivoMilenioInstance}" field="clave"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${objetivoMilenioInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="objetivoMilenio.descripcion.label" default="Descripción" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${objetivoMilenioInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="uk-form-horizontal">
					<g:hiddenField name="id" value="${objetivoMilenioInstance?.id}" />
					<g:link class="uk-button" action="edit" id="${objetivoMilenioInstance?.id}"><i class="uk-icon-small uk-icon-edit"></i><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="uk-button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
