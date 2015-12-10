<%@ page import="mx.gob.redoaxaca.cednna.domino.*" %>
<%@ page import="grails.converters.JSON" %>

<div id="mensaje"></div>

<g:if test="${dependencia}">
	<div
		class="fieldcontain uk-form-row ${hasErrors(bean: variableInstance, field: 'region', 'error')} ">
		<label class="uk-form-label" for="region"> <g:message
				code="variable.region.label" default="Variable" />
			<span class="required-indicator">*</span>
		</label>
		<div class="uk-form-controls">
			<g:select id="origenDatos" name="origenDatos"
				from="${mx.gob.redoaxaca.cednna.domino.CatOrigenDatos.findAllByDependencia(dependencia)}"
				optionKey="clave" optionValue="detalleCombo"
				class="chosen-select  uk-width-1-1" style="width:300px;"
				value="${variableInstance?.clave}"
				required="required" />
		</div>
	</div>
</g:if>
<g:else>
	<div
		class="fieldcontain uk-form-row ${hasErrors(bean: variableInstance, field: 'region', 'error')} ">
		<label class="uk-form-label" for="region"> <g:message
				code="variable.region.label" default="Variable" />
			<span class="required-indicator">*</span>
		</label>
		<div class="uk-form-controls">
			<g:select id="origenDatos" name="origenDatos"
				from="${mx.gob.redoaxaca.cednna.domino.CatOrigenDatos.list()}"
				optionKey="clave" optionValue="detalleCombo" class="chosen-select required"
				style="width:800px;" value="${variableInstance?.clave}"
				required="required"/>
		</div>
	</div>
</g:else>

<%--<div class="fieldcontain uk-form-row ${hasErrors(bean: variableInstance, field: 'descripcion', 'error')} required">--%>
<%--	<label class="uk-form-label" for="descripcion">--%>
<%--		<g:message code="variable.descripcion.label" default="Descripción" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<div class="uk-form-controls">--%>
<%--	<g:textArea name="descripcion" cols="40" rows="5" maxlength="500" required="" value="${variableInstance?.descripcion}"/>--%>
<%--	</div>--%>
<%--</div>--%>



<div class="fieldcontain uk-form-row ${hasErrors(bean: variableInstance, field: 'region', 'error')} ">
	<label class="uk-form-label" for="region">
		<g:message code="variable.region.label" default="Región" />
		
	</label>
	<div class="uk-form-controls">
	<g:select id="region" name="region.id" from="${mx.gob.redoaxaca.cednna.domino.Region.list()}" optionKey="id" optionValue="descripcion"  class="chosen-select" style="width:350px;"  value="${variableInstance?.region?.id}"  noSelection="['null': '- Ninguna región-']"/>
	</div>
</div>


<div class="fieldcontain uk-form-row ${hasErrors(bean: variableInstance, field: 'municipio', 'error')} ">
	<label class="uk-form-label" for="municipio">
		<g:message code="variable.municipio.label" default="Municipio" />
		
	</label>
	<div class="uk-form-controls">
	<div id="divMun">
	<g:select id="municipio" name="municipio.id" from="${mx.gob.redoaxaca.cednna.domino.Municipio.list()}" optionKey="id"  class="chosen-select" style="width:350px;"  optionValue="descripcion"  value="${variableInstance?.municipio?.id}"   noSelection="['null':'- Ningun municipio-']"/>
	</div>
	</div>
</div>

<div class="fieldcontain uk-form-row ${hasErrors(bean: variableInstance, field: 'localidad', 'error')} required">
	<label class="uk-form-label" for="localidad">
		<g:message code="variable.localidad.label" default="Localidad" />

	</label>
	<div class="uk-form-controls">
	<div id="divLoc">
	<g:select id="localidad" name="localidad.id" from="${mx.gob.redoaxaca.cednna.domino.Localidad.list()}" optionKey="id"  class="chosen-select" style="width:350px;"  optionValue="descripcion" value="${variableInstance?.localidad?.id}" noSelection="['null': '- Ninguna  localidad -']"/>
	</div>
	</div>
</div>



<div class="fieldcontain uk-form-row ${hasErrors(bean: variableInstance, field: 'mujeres', 'error')} required">
	<label class="uk-form-label" for="mujeres">
		<g:message code="variable.mujeres.label" default="Mujeres" />
		<span class="required-indicator">*</span>
	</label>
	<div class="uk-form-controls">
	<g:field name="mujeres" id="mujeres" type="text" value="${variableInstance.mujeres}" required=""/>
	</div>
</div>

<div class="fieldcontain uk-form-row ${hasErrors(bean: variableInstance, field: 'hombres', 'error')} required">
	<label class="uk-form-label" for="hombres">
		<g:message code="variable.hombres.label" default="Hombres" />
		<span class="required-indicator">*</span>
	</label>
	<div class="uk-form-controls">
	
	<g:field name="hombres"  id="hombres" type="text" value="${variableInstance.hombres}" required="" />
	</div>
</div>

<div class="fieldcontain uk-form-row ${hasErrors(bean: variableInstance, field: 'poblacionTotal', 'error')} required">
	<label class="uk-form-label" for="poblacionTotal">
		<g:message code="variable.poblacionTotal.label" default="Poblaci&oacute;n total" />

	</label>
	<div class="uk-form-controls">
	<input name="poblacionTotal" id="poblacionTotal" type="text" value="${variableInstance.poblacionTotal}"  readonly="readonly"/>
	</div>
</div>

<g:hiddenField name="tipoPeriodo" value="false"/>
<br>
<div class="fieldcontain uk-form-row required">
	<div id="divAnio" >
		<div id="divAnio" class="fieldcontain uk-form-row ${hasErrors(bean: variableInstance, field: 'anio', 'error')} required">
		<label class="uk-form-label" for="anio">
			<g:message code="variable.anio.label" default="Año" />
			<span class="required-indicator">*</span>
		</label>
		<div class="uk-form-controls">
			<select id="anio" name="anio" ></select>
			<input type="button" id="mostrarPeriodo" onClick="$('#divPeriodo').show();$('#divAnio').hide();$('#anio').attr('disabled','disabled');$('#periodo').removeAttr('disabled'); $('#tipoPeriodo').val('true');" value="Mostrar periodos" class="uk-button">
		</div>
	</div>
	</div>
	
	<div id="divPeriodo">
		<label class="uk-form-label"for=periodo>
			<g:message code="indicador.frecuencia.label" default="Ciclo escolar " />
			<span class="required-indicator">*</span>
		</label>
		<div class="uk-form-controls">
			<g:select id="periodo" name="periodo.id" from="${mx.gob.redoaxaca.cednna.domino.Periodo.findAllByCategoria(1).sort{it.descripcion}}" optionKey="id" optionValue="descripcion" required="" value="${variableInstance?.periodo?.id}" class="form-h-mix4 chosen-select" style="width:666px;"/>
			<input type="button" id="ocultarPeriodo" onclick="$('#divPeriodo').hide();$('#divAnio').show();$('#anio_chosen').width('666px');$('#periodo').attr('disabled','disabled');$('#anio').removeAttr('disabled');$('#tipoPeriodo').val('false');" value="Ocultar periodos" class="form-h-mix4 uk-button">
		</div>
	</div>
</div>

<br>

<li>
	<g:if test="${variableInstance?.categorias}">
		<g:each status="i" var="cat" in="${variableInstance.categorias}">
			<div id="divVar_${i+1}"
				class="fieldcontain uk-form-row ${hasErrors(bean: indicadorInstance, field: 'localidad', 'error')} required">
				<div class="uk-grid">
					<div class="uk-width-1-2">
						<label class="uk-form-label" for="localidad"> <g:message
								code="indicador.localidad.label" default="Tipo de categoria" />

						</label>
						<g:select id="tipo_${i+1}" name="tipo_${i+1}"
							from="${mx.gob.redoaxaca.cednna.domino.Tipo.list()}"
							optionKey="id" class="chosen-select sel-var"
							value="${cat?.tipo?.id}" optionValue="descripcion" />
					</div>
					<div class="uk-width-1-2">
						<label class="uk-form-label" for="localidad"> <g:message
								code="indicador.localidad.label" default="Categoria" />

						</label>
						<div id="divTipo_${i+1}">
							<g:select id="categoria" name="categoria_${i+1}"
								from="${mx.gob.redoaxaca.cednna.domino.Categoria.list()}"
								optionKey="id" class="chosen-select " value="${cat?.id}"
								optionValue="descripcion" />
						</div>
					</div>
				</div>
				<input id="del_${i+1}" name="del_${i+1}" value="-" type="button"
					class="uk-button" />
			</div>

			<script type="text/javascript">
			
				$(function(){
					$("#del_${i+1}").click(function(){
						$("#divVar_${i+1}").remove();
      					var num = parseInt($("#numCategorias").val()); 
						num=num-1;
	     				$("#numCategorias").val(num);
				
					});	
				});
									                		
			</script>
		</g:each>

		<g:hiddenField name="numCategorias"
			value="${variableInstance.categorias.size()}" />
	</g:if> 
	<g:else>
		<g:hiddenField name="numCategorias" value="0" />
	</g:else>
</li>

<h3>Categor&iacute;as</h3>





<input id="addCat" name="addCat" value="Agregar Categor&iacute;a"
	type="button" class="uk-button" />

<div id="divCate"></div>



<script type="text/javascript">
$(function(){

	$(document).ready(function() {
		
		llenaCombo({
			url : CONTEXT_ROOT+'/json/anos.json',
			htmlOptions : {
				name : "anio",
				id : "anio",
				clase : "chosen-select",
				style : "width:666px"
			},
			index : ${variableInstance.anio},
			chained : false,
			anchor : "#anio",
			combo : true
		});

		<g:if test="${variableInstance?.periodo}">
			$('#divAnio').hide();
			$('#periodo_chosen').css({"width": "666px"});
			$('#anio').attr('disabled','disabled');
		</g:if>
		<g:else>
			$('#divPeriodo').hide();
			$('#anio_chosen').css({"width": "666px"});
			$('#periodo').attr('disabled','disabled');
		</g:else>  

	});
	

	var config = {
		      '.chosen-select'           : {},
		      '.chosen-select-deselect'  : {allow_single_deselect:true},
		      '.chosen-select-no-single' : {disable_search_threshold:10},
		      '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
		      '.chosen-select-width'     : {width:"95%"}
		    }
		    for (var selector in config) {
		      $(selector).chosen(config[selector]);
		    }

	    asignaEventorRegion();
		asignaEventorMunicipio();
<%--		asignaEventorTipo(1);--%>

		 $("#newVariable").click(function(){
			 var selectedValues = $(".sel-var").map(function(){
				    return this.value;
				}).get().join(',');

			 var arrVar = selectedValues.split(",");
			 var num=0,cont=0;
			  for (var i = 0; i < arrVar.length; i++) {
		            num = arrVar[i];
		            for (var j = i+1; j < arrVar.length; j++) {
		                if (num == arrVar[j]) {
		                    cont++;
		                }
		            }
		      }
		      
		      if (cont > 0) {
			  		$("#mensaje").html(	"<div class='uk-alert uk-alert-danger' ><a  class='uk-alert-close uk-close'></a><p>Solo puedes seleccionar un solo tipo de categoria</p></div>");
		      }else {
					var total= parseInt($("#poblacionTotal").val());
				    if(total>0){
			            $('.submit').click();
				        return false;
			       	}else{
			       		if(confirm("Se ingresará un total igual a cero, ¿Desea continuar?")==true){
<%--			       			$.validator.setDefaults({ ignore: ":hidden:not(.chosen-select)" });--%>
			       			$('.submit').click();
					        return false;
				       	}
				    }	
			  }
		});

		$("#hombres").change(function(){
			var h= parseInt($("#hombres").val());
			var m= parseInt( $("#mujeres").val());
			var total=h+m;
			$("#poblacionTotal").val(total);
		});

		$("#mujeres").change(function(){

			var h= parseInt($("#hombres").val());
			var m= parseInt( $("#mujeres").val());
			var total=h+m;
			$("#poblacionTotal").val(total);

		});


		$("#addCat").click(function(){
				
			var cont=	parseInt($("#numCategorias").val());
			cont=cont+1;
			$("#numCategorias").val(cont);				  

			var unused = $.ajax({type:'POST', 
            url:CONTEXT_ROOT+'/variable/categorias',
              data: {con:cont,valida:$("#valida").val()},
              success:function(data,textStatus)
              {
              
              		$('#divCate').append(data);
              	
             
              },
           	  error:function(XMLHttpRequest,textStatus,errorThrown)
                  {		$('#diverror').html(XMLHttpRequest.responseText);}
                 ,
                 complete:function(data,textStatus){

               	  var config = {
					      '.chosen-select'           : {},
					      '.chosen-select-deselect'  : {allow_single_deselect:true},
					      '.chosen-select-no-single' : {disable_search_threshold:10},
					      '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
					      '.chosen-select-width'     : {width:"95%"}
					    }
					    for (var selector in config) {
					      $(selector).chosen(config[selector]);
					    }

               	  asignaEventorTipo(cont);
              }
			});
		});
});


function asignaEventorRegion(){

	$("#region").change(function(){
		llenaCombo({
			url : CONTEXT_ROOT+'/variable/getMunicipioByRegion/'+$("#region").val(),
			htmlOptions : {
				name : "municipio.id",
				id : "municipio",
				clase : "chosen-select "
			},
			index : 0,
			chained : false,
			anchor : "#municipio",
			combo : true,
			valorDefault:true,
			valorDefaultText:" Seleccione el municipio ",
			delTag: true,
			tag:"#divMun"
		});  

	});

	asignaEventorMunicipio();
}



function asignaEventorMunicipio(){

	$("#municipio").change(function(){

		llenaCombo({
			url : CONTEXT_ROOT+'/variable/getLocalidadByMunicipio/'+$("#municipio").val(),
			htmlOptions : {
				name : "localidad.id",
				id : "localidad",
				clase : "chosen-select",
				
			},
			index : 0,
			chained : false,
			anchor : "#localidad",
			combo : true,
			valorDefault:true,
			valorDefaultText:" Seleccione la localidad ",
			delTag: true,
			tag:"#divLoc"
		});  


		});
	


	
}


function asignaEventorTipo(num){

	llenaCombo({
		url : CONTEXT_ROOT+'/variable/getCategoriaByTipo/'+$("#tipo_"+num).val(),
		htmlOptions : {
			name : "categoria_"+num,
			id : "categoria_"+num,
			clase : "chosen-select",
			
		},
		index : 0,
		chained : false,
		anchor : "#categoria_"+num,
		combo : true,
		valorDefault:false,
		valorDefaultText:" Seleccione la categoria ",
		delTag: true,
		tag:"#divTipo_"+num
	});  


	$("#tipo_"+num).change(function(){


		
		
		llenaCombo({
			url : CONTEXT_ROOT+'/variable/getCategoriaByTipo/'+$("#tipo_"+num).val(),
			htmlOptions : {
				name : "categoria_"+num,
				id : "categoria_"+num,
				clase : "chosen-select",
				
			},
			index : 0,
			chained : false,
			anchor : "#categoria_"+num,
			combo : true,
			valorDefault:false,
			valorDefaultText:" Seleccione la categoria ",
			delTag: true,
			tag:"#divTipo_"+num
		});  
	

		});
	
}




</script>
