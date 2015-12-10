<%@ page import="mx.gob.redoaxaca.cednna.domino.Indicador" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'indicador.label', default: 'Indicador')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		
		<g:javascript src="tinymce/tinymce.min.js" />
		<script type="text/javascript">
			tinymce.init({
			    selector: "textarea#html",
			    plugins: [
			        "advlist autolink lists link image charmap",
			        "searchreplace visualblocks code",
			        "table contextmenu paste"
			    ],
			    language:'es_MX',
			    toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
			});
		</script>
	</head>
	<body>
		<a href="#edit-indicador" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<nav class="uk-navbar">
		<ul class="uk-navbar-nav">
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<sec:ifAnyGranted roles="ROLE_ADMIN">
					<li>
						<g:link action="ordenar">
							<g:message code="default.ordenar.label" default="Ordenar indicadores" />
						</g:link>
					</li>
				</sec:ifAnyGranted>
			</ul>
</nav></br>
		<div id="edit-indicador" class="content scaffold-edit" role="main">
			<h1 class="uk-article-title"><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${indicadorInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${indicadorInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${indicadorInstance?.id}" />
				<g:hiddenField name="version" value="${indicadorInstance?.version}" />
				<fieldset class="uk-form uk-form-horizontal">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="uk-form uk-form-horizontal">
				<div >
					<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_DEP">
					<g:actionSubmit class="save uk-button" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					</sec:ifAnyGranted>
					<sec:ifAnyGranted roles="ROLE_ADMIN">
						<g:actionSubmit action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" class="uk-button"/>
						<g:remoteLink action="delete" id="${indicadorInstance?.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"></g:remoteLink>
					</sec:ifAnyGranted>
				</div>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
