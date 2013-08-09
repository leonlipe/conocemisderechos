
<%@ page import="mx.gob.redoaxaca.cednna.domino.Variable" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'variable.label', default: 'Variable')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-variable" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>


<nav class="uk-navbar">
		<ul class="uk-navbar-nav">

			<li class="uk-active"><g:link class="list" action="list">Lista de variables</g:link></li>

			
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="archivo">Subir desde archivo</g:link></li>

</nav>


		<div id="list-variable" class="content scaffold-list" role="main">
			<h1 class="uk-article-title">Lista de variables</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="clave" title="${message(code: 'variable.clave.label', default: 'Clave')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'variable.descripcion.label', default: 'Descripcion')}" />
					
						<th><g:message code="variable.estado.label" default="Estado" /></th>
					
						<th><g:message code="variable.municipio.label" default="Municipio" /></th>
					
						<g:sortableColumn property="poblacionTotal" title="${message(code: 'variable.poblacionTotal.label', default: 'Poblacion Total')}" />
					
						<g:sortableColumn property="hombres" title="${message(code: 'variable.hombres.label', default: 'Hombres')}" />
						
						<g:sortableColumn property="mujeres" title="${message(code: 'variable.hombres.label', default: 'Mujeres')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${variableInstanceList}" status="i" var="variableInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${variableInstance.id}">${fieldValue(bean: variableInstance, field: "clave")}</g:link></td>
					
						<td>${fieldValue(bean: variableInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: variableInstance, field: "estado")}</td>
					
						<td>${fieldValue(bean: variableInstance, field: "municipio")}</td>
					
						<td>${fieldValue(bean: variableInstance, field: "poblacionTotal")}</td>
					
						<td>${fieldValue(bean: variableInstance, field: "hombres")}</td>
					
						<td>${fieldValue(bean: variableInstance, field: "mujeres")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${variableInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
