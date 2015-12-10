
<%@ page import="mx.gob.redoaxaca.cednna.domino.Indicador" %>
<%@ page import="mx.gob.redoaxaca.cednna.domino.Dependencia" %>
<%@ page contentType="text/html" %>
<!DOCTYPE html>
<html>
	<head>		
		<meta name="layout" content="main">
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />

	  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	    <link href="${resource(dir: 'bootstrap', file: 'css/bootstrap.min.css')}" rel="stylesheet">	

	  <script src="${resource(dir: 'bootstrap', file: 'js/bootstrap.min.js')}"></script>
	  
	  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	  <g:javascript src="jquery.dataTables.js" />
	  
	  <script type="text/javascript">

	  	function actualizar(){	  	
		  	$.ajax({type:'POST', 
	            url:CONTEXT_ROOT+'/indicador/actualizarSemaforo',
	            data: "id="+$("#dependencias").val()+"&rol="+$("#rol").val(),
	            success:function(data,textStatus){
	            	$('#semaforo').html(data);
	            },
	            error:function(XMLHttpRequest,textStatus,errorThrown)
	                {$('#diverror').html(XMLHttpRequest.responseText);}
		  	});
		}
		
	  	window.onload = actualizar;
	  </script>	  		
	</head>
	<body>		
		<div id="division">
			<h3>SEM&Aacute;FORO DE CONTROL</h3>
			<h4>ESTATUS DE ACTUALIZACI&Oacute;N POR INDICADOR</h4>
			<label for="dependencias">Dependencia: ${dependencia?.descripcion}</label>			
			
			<sec:ifAnyGranted roles="ROLE_ADMIN">
				<g:select id="dependencias" name="dependencias" optionKey="id" optionValue="descripcion" onchange="actualizar();" from="${Dependencia.list()}"/>
				<g:hiddenField name="rol" value="1"/>
			</sec:ifAnyGranted>
				
			<sec:ifAnyGranted roles="ROLE_DEP,ROLE_LECTURA,ROLE_NUCLEO">
	 		 	<g:hiddenField name="dependencias" value="${dependencia?.id}"/>
	 		 </sec:ifAnyGranted>
	 		 
			<div>
				<img src="${resource(dir: 'img', file: 'star.png')}" width="20px" height="20px"> La información se encuentra actualizada<br>
				<img src="${resource(dir: 'img', file: 'edit.png')}" width="20px" height="20px"> La información necesita ser actualizada<br><br>
			</div>
			<div id="semaforo"></div>
		</div>
	</body>
</html>


			
