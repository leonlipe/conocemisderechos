<!DOCTYPE html>
<html>
	<head>
		<title>Mis derechos</title>
		  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="shortcut icon" type="${request.getContextPath()}/img/favicon.ico" href="${request.getContextPath()}/img/favicon.ico" type="image/x-icon"/>
			<link rel="stylesheet" href="${resource(dir: 'css', file: 'uikit.min.css')}" type="text/css">
			<link rel="stylesheet" href="${resource(dir: 'css', file: 'uikit.docs.min.css')}" type="text/css">
			<link rel="stylesheet" href="${resource(dir: 'css', file: 'uikit.css')}" type="text/css">
			<link rel="stylesheet" href="${resource(dir: 'css', file: 'custom.css')}" type="text/css">

<%--		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>
<%--						--%>
<%--						--%>
	 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'calc.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'default.css')}" type="text/css">
	    <link rel="stylesheet" href="${resource(dir: 'css', file: 'default.date.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'default.time.css')}" type="text/css">

<%--	<link rel="stylesheet" href="${resource(dir: 'css', file: 'docsupport/style.css')}" type="text/css">--%>
<%-- 	<link rel="stylesheet" href="${resource(dir: 'css', file: 'docsupport/prism.css')}" type="text/css">--%>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'chosen.css')}" type="text/css">
 				
 					
 						<g:javascript src="jquery-1.8.3.js" />
 				 		<g:javascript src="uikit.min.js" />
 						<g:javascript src="jquery-ui-1.8.20.custom.min.js" />
 						<g:javascript src="jquery.dataTables.js" />
						<g:javascript src="picker.js" />
						<g:javascript src="picker.date.js" />
						<g:javascript src="picker.time.js" />
						<g:javascript src="es_ES.js" />
					 	<g:javascript src="chosen.jquery.js" />
					  	<g:javascript src="docsupport/prism.js"  />
					  	<g:javascript src="jquery.blockUI.js" />
  						<g:javascript src="Utilerias.js" />	

		
						<script type="text/javascript">

									var CONTEXT_ROOT = '${request.getContextPath()}';
							</script>
							
	<g:layoutHead/>
		<r:layoutResources />
	</head>							
<body class="tm-background">
			<nav class="tm-navbar uk-navbar uk-navbar-attached">
			<div class="uk-container uk-container-center">

				<div class="uk-grid" >
				<div class="uk-width-medium-8-10 uk-width-large-7-10">	
					<a class="uk-hidden-small" href="http://www.cednna.oaxaca.gob.mx"><img class="uk-margin uk-margin-remove" src="${request.getContextPath()}/img/logostop_01.png" title="CEDNNA" alt="CEDNNA" target="_blank"></a>
					<a class="uk-hidden-small" href="http://www.oaxaca.gob.mx/" target="_blank"><img class="uk-margin uk-margin-remove" src="${request.getContextPath()}/img/logo-g-cafe.png" title="Gobierno del Estado de Oaxaca" alt="Gobierno del Estado de Oaxaca"></a>
					<a class="uk-hidden-small" href="http://www.bienestar.oaxaca.gob.mx" target="_blank"><img class="uk-margin uk-margin-remove" src="${request.getContextPath()}/img/logo-bien-n.png" title="Generando Bienestar" alt="Generando Bienestar"></a>
					<a class="uk-hidden-small" href="http://www.oaxtransparente.oaxaca.gob.mx/" target="_blank"><img class="uk-margin uk-margin-remove" src="${request.getContextPath()}/img/logostop_04.png" title="OaxTransparente" alt="OaxTransparente"></a>
                    
				</div>
				<div class="uk-width-medium-2-10 uk-width-large-3-10">	
					<ul class="uk-navbar-nav uk-hidden-small">
						<li><g:link class="iconobar icono_catalogos"  controller="indicador" action="descargarCatalogoIndicadores" data-uk-tooltip="{pos:'bottom'}" title="Catálogo de indicadores"></g:link></li>
						<li><g:link class="iconobar icono_ayuda"  controller="indicador" action="descargarManual" data-uk-tooltip="{pos:'bottom'}" title="Manual de operación"></g:link></li>	
					</ul>
				</div>
				<div class="uk-width-1-10">
					<a href="#tm-offcanvas" class="uk-navbar-toggle uk-visible-small" data-uk-offcanvas></a>
				</div>

				<div class="uk-navbar-brand uk-navbar-center uk-visible-small">
					<img src="${request.getContextPath()}/img/logomini_cednna.png"  title="CEDNNA" alt="CEDNNA" class="fondologomini">
				</div>

				</div>

			</div>
		</nav>

		<div class="tm-middle">
			<div class="uk-container uk-container-center">

				<div class="uk-grid" data-uk-grid-margin>
				
					<div class="tm-sidebar uk-width-medium-1-5 uk-hidden-small">

						<ul class="tm-nav uk-nav" data-uk-nav>

							<li class="uk-nav-header">Men&uacute;</li>

							<li><g:link controller="Indicador" >Principal</g:link></li>
							<li><g:link controller="Indicador" action="list">Indicadores</g:link></li>
							   <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_NUCLEO">
							   		<li><g:link controller="infografia" action="list">Infografías</g:link></li>
								   <li><g:link controller="Formula">F&oacute;rmulas</g:link></li>
							   </sec:ifAnyGranted>
							<li><g:link controller="Variable">Datos estad&iacute;sticos</g:link></li>
						<sec:ifAnyGranted roles="ROLE_ADMIN">
							<li><g:link controller="Variable" action="dele">Eliminar Datos</g:link></li>
							<li class="uk-nav-header">Cat&aacute;logos</li>
							<li><g:link controller="tipo" action="list">Categor&iacute;as </g:link></li>
							<li><g:link controller="sentido" action="list">Sentido</g:link></li>
							<li><g:link controller="dependencia" action="list">Dependencia</g:link></li>
							<li><g:link controller="unidadEjecutora" action="list">Unidad ejecutora</g:link></li>
							<li><g:link controller="Frecuencia" action="list">Frecuencia de medici&oacute;n</g:link></li>
							<li><g:link controller="unidadMedida" action="list">Unidad de medida</g:link></li>
							<li><g:link controller="eje" action="list">M&oacute;dulo</g:link></li>
							<li><g:link controller="division" action="list">SubM&oacute;dulo</g:link></li>
							<li><g:link controller="PNDesarrollo" action="list">PED</g:link></li>
							<li><g:link controller="tema" action="list">Tema PED</g:link></li>
							<li><g:link controller="objetivoMilenio" action="list">ODM</g:link></li>
							<li><g:link controller="catOrigenDatos" action="list">Variables</g:link></li>
							<li><g:link controller="directorio" action="list">Directorio</g:link></li>
							<li><g:link controller="logotipo" action="list">Logotipos</g:link></li>
							<li><g:link controller="documento" action="list">Centro de información</g:link></li>
							<li><g:link controller="tipoEje" action="list">Tipo de eje</g:link></li>
							<li><g:link controller="nivel" action="list">Nivel</g:link></li>
							<li><g:link controller="indicador" action="correo">Correo</g:link></li>
							<li><g:link controller="documento" action="manual">Documentos CEDNNA</g:link></li>
							<li class="uk-nav-header">Seguridad</li>
							<li><g:link controller="Usuario" action="list">Usuarios</g:link></li>
						</sec:ifAnyGranted>
						<li class="uk-nav-header">Seguimiento</li>
							<li><g:link controller="Indicador" action="semaforo">Sem&aacute;foro</g:link></li>
							<li><g:link controller="frecuenciaIndicador" action="calendario">Calendario</g:link></li>
							<li><g:link controller="frecuenciaIndicador" action="list">Frecuencia de actualización</g:link></li>
							<br/>
							<li><g:link controller="logout">Cerrar sesi&oacute;n </g:link></li>

						</ul>

					</div>
                
				<div class="tm-main uk-width-medium-4-5">
							
							
	
		<g:layoutBody/>
	
	
					</div> 
				</div>

			</div>
		</div>

		<div class="tm-footer">
			<div class="uk-container uk-container-center">
				<p><strong>Mis derechos,</strong> Sistema de Monitoreo de Derechos de la Niñez y Adolescencia en Oaxaca, es una plataforma de <a href="https://github.com/redoaxacadetodos/conocemisderechos.git">código abierto</a> del Gobierno del Estado de Oaxaca que forma parte de su política transversal de Derechos Humanos, y su política de Transparencia, Participación Ciudadana y Gobierno abierto.</p>
				<a href="http://www.redoaxaca.oaxaca.gob.mx/" target="_blank"><img src="${request.getContextPath()}/img/logored.png"></a>
				<hr></hr>
				<div class="uk-grid">
                     <div class="uk-width-1-3"><div class="uk-panel">
                     	<a href="http://www.oaxaca.gob.mx" target="_blank"><p>www.oaxaca.gob.mx</a>
                     	<br> Gobierno del Estado de Oaxaca 2010-2016</p>
						<img src="${request.getContextPath()}/img/logo_cednna_footer.png">
						<p>Av. San Felipe del Agua #836 Col. San Felipe del Agua, Oaxaca de Juárez, Oax., C.P. 68020	
						<br>Tel: (951) 5201146
						<a href="http://www.cednna.oaxaca.gob.mx" target="_blank"><br>www.cednna.oaxaca.gob.mx</a></p></div></div>
                     <div class="uk-width-1-3"><div class="uk-panel">
                     	<h3>Ligas de interés</h3>
						<a href="http://www.periodicooficial.oaxaca.gob.mx/" target="_blank"><p>Periódico Oficial del @GobOax</p></a>
						<a href="http://www.transparenciapresupuestaria.oaxaca.gob.mx/" target="_blank"><p>Portal de Transparencia presupuestaria del @GobOax</p></a>
						<a href="http://www.infopublica.oaxaca.gob.mx/" target="_blank"><p>Ventanilla Única de Acceso a la Información del @GobOax</p></a>
						<a href="http://www.oaxtransparente.oaxaca.gob.mx/evaluarparamejorar/evaluar.php" target="_blank"><p>Evaluar para Mejorar 2.0</p></a>
						<a href="http://sapao.herokuapp.com/" target="_blank"><p>Plataforma de reportes ciudadanos de @SAPAOOaxaca</p></a>
						<a href="http://www.oaxtransparente.oaxaca.gob.mx/" target="_blank"><p>Oaxtransparente</p></a>
					</div></div>
                     <div class="uk-width-1-3"><div class="uk-panel">
                     	<h3>Síguenos en las redes</h3>
                     	<p><a href="https://www.facebook.com/cednna.oaxaca" target="_blank"><i class="uk-icon-facebook-square uk-icon-large"></i> Facebook</a></p>
                     	<p><a href="https://twitter.com/cednna_oaxaca" target="_blank"><i class="uk-icon-twitter-square uk-icon-large"></i> Twitter</a></p>
                     </div></div>
                </div>
			</div>
		</div>

		<div id="tm-offcanvas" class="uk-offcanvas">
			<div class="uk-offcanvas-bar">
				<ul class="uk-nav uk-nav-offcanvas" data-uk-nav="{multiple:true}">
					<li class=""><a href="#">Índice</a>
						<ul class="uk-nav-sub">
							<li class="uk-nav-header">Men&uacute;</li>
							<li><g:link controller="Indicador" >Principal</g:link></li>
							<li><g:link controller="Indicador" action="list">Indicadores</g:link></li>
							   <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_NUCLEO">
							   		<li><g:link controller="infografia" action="list">Infografías</g:link></li>
								   <li><g:link controller="Formula">F&oacute;rmulas</g:link></li>
							   </sec:ifAnyGranted>
							<li><g:link controller="Variable">Datos estad&iacute;sticos</g:link></li>
						<sec:ifAnyGranted roles="ROLE_ADMIN">
							<li><g:link controller="Variable" action="dele">Eliminar Datos</g:link></li>
							<li class="uk-nav-header">Cat&aacute;logos</li>
							<li><g:link controller="tipo" action="list">Categor&iacute;as </g:link></li>
							<li><g:link controller="sentido" action="list">Sentido</g:link></li>
							<li><g:link controller="dependencia" action="list">Dependencia</g:link></li>
							<li><g:link controller="unidadEjecutora" action="list">Unidad ejecutora</g:link></li>
							<li><g:link controller="Frecuencia" action="list">Frecuencia de medici&oacute;n</g:link></li>
							<li><g:link controller="unidadMedida" action="list">Unidad de medida</g:link></li>
							<li><g:link controller="eje" action="list">M&oacute;dulo</g:link></li>
							<li><g:link controller="division" action="list">SubM&oacute;dulo</g:link></li>
							<li><g:link controller="PNDesarrollo" action="list">PED</g:link></li>
							<li><g:link controller="tema" action="list">Tema PED</g:link></li>
							<li><g:link controller="objetivoMilenio" action="list">ODM</g:link></li>
							<li><g:link controller="catOrigenDatos" action="list">Variables</g:link></li>
							<li><g:link controller="directorio" action="list">Directorio</g:link></li>
							<li><g:link controller="logotipo" action="list">Logotipos</g:link></li>
							<li><g:link controller="documento" action="list">Centro de información</g:link></li>
							<li><g:link controller="tipoEje" action="list">Tipo de eje</g:link></li>
							<li><g:link controller="nivel" action="list">Nivel</g:link></li>
							<li><g:link controller="indicador" action="correo">Correo</g:link></li>
							<li><g:link controller="documento" action="manual">Documentos CEDNNA</g:link></li>
							<li class="uk-nav-header">Seguridad</li>
							<li><g:link controller="Usuario" action="list">Usuarios</g:link></li>
						</sec:ifAnyGranted>
						<li class="uk-nav-header">Seguimiento</li>
							<li><g:link controller="Indicador" action="semaforo">Sem&aacute;foro</g:link></li>
							<li><g:link controller="frecuenciaIndicador" action="calendario">Calendario</g:link></li>
							<li><g:link controller="frecuenciaIndicador" action="list">Frecuencia de actualización</g:link></li>
							<br/>
							<li><g:link controller="logout">Cerrar sesi&oacute;n </g:link></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>

	</body>
	
</html>
