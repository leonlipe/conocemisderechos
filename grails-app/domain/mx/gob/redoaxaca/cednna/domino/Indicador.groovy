package mx.gob.redoaxaca.cednna.domino

class Indicador {
	
	
	
	String          nombre
	String          objetivo	
	Dependencia     dependencia
	UnidadEjecutora ejecutora
	Frecuencia      frecuencia
	Formula 	    formula
	String          mediosVerificacion
	String          comentarios
	
	Sentido         sentido
	Date 		    fecha= new Date()
	
	String          nombreResponsable
	String          mailResponsable
	String          areaResponsable
	String			cargoResponsable
	String			telefonoResponsable
	String 			extensionResponsable
	
	Date		    fechaActualizacion
	UnidadMedida    uMedida
	PNDesarrollo    pnDesarrollo
	
    
	String 			objetivoPND
	String          estrategia
	String 		    nombrePrograma
	ObjetivoMilenio objetivosMilenio
	Periodo			periodo
	String			fuenteInformacion
	Tema			tema
	Integer			decimales
	
	String 			urlExterna
	String			html
	
	Division       division
	
	boolean			publico	
	boolean 		etiquetaPeriodo
	
	TipoIndicador	tipo
	Dimension		dimension
	
	Integer			orden
	
	String 			valorNivelNacional
	String 			fuenteNivelNacional
	Periodo 		periodoNivelNacional
	Boolean 		calcularPorPeriodoNivelNacional
	
	static hasMany = [variables:DVariable]


    static constraints = {
		
		
				nombreResponsable(blank:false, nullable:false, size:1..500)
				fechaActualizacion(blank:false, nullable:false, size:1..500)
				areaResponsable(blank:false, nullable:false, size:1..500)
				mailResponsable(blank:false, nullable:false, size:1..1024,email:true)
				urlExterna(nullable:true, size:1..1024)
				etiquetaPeriodo(nullable:true)
		
		
				comentarios(blank:false, nullable:false, size:1..4048)
				sentido(blank:false, nullable:false)
			    nombre(blank:false, nullable:false)
				objetivo(blank:false, nullable:false, size:1..4048)
				dependencia(blank:false, nullable:false)
				ejecutora(blank:false, nullable:false)
				frecuencia(blank:false, nullable:false)
				formula(blank:false, nullable:false)
				division(blank:true, nullable:true)
				pnDesarrollo(blank:true, nullable:true)
				uMedida(blank:true, nullable:true)
				tema(blank:true, nullable:true)
				objetivoPND(blank:true, nullable:true, size:1..4048)
				estrategia(blank:true, nullable:true)
				nombrePrograma(blank:true, nullable:true)
				objetivosMilenio(blank:true, nullable:true)
				
				mediosVerificacion(nullable:true)
				fuenteInformacion( nullable:true)
				periodo( nullable:true)
				decimales( nullable:true)
				tipo(nullable:true)
				dimension(nullable:true)
				
				cargoResponsable(blank:true, nullable:true)
				telefonoResponsable(blank:true, nullable:true)
				extensionResponsable(blank:true, nullable:true)
				
				html(blank:true, nullable:true, size:1..4048)
				orden nullable:true
				
				valorNivelNacional(blank:true, nullable:true)
				fuenteNivelNacional(blank:true, nullable:true)
				periodoNivelNacional(nullable:true)
				calcularPorPeriodoNivelNacional(nullable:true)
    }

  static mapping = {
	table('idn_indicador')
	id(column: 'idn_id')


	publico(column:'idn_publico')
	fecha(column:'idn_fecha')
    fechaActualizacion(column:'idn_fecha_actualizacion')
	dependencia(column:'idn_cdp_id')


	frecuencia(column:'idn_frecuencia')

	formula(column:'idn_ctf_id')
	
	sentido(column:'idn_sentido')
	nombre(column:'idn_nombre')
	objetivo(column:'idn_objetivo')
	mediosVerificacion(column:'idn_medios_verificacion')
	comentarios(column:'idn_comentarios')
	nombreResponsable(column:'idn_nombre_responsable')
	mailResponsable(column:'idn_mail_responsable')
	areaResponsable(column:'idn_area_responsable')
	cargoResponsable(column:'idn_cargo_responsable')
	telefonoResponsable(column:'idn_telefono_responsable')
	extensionResponsable(column:'idn_extension_responsable')
	ejecutora(column:'idn_cue_id')
	
	tema(column:'idn_tema')
	objetivoPND(column:'idn_obj_pdn')
	estrategia(column:'idn_estrategia')
	nombrePrograma(column:'idn_nom_programa')
	objetivosMilenio(column:'idn_obj_milenio')

	fuenteInformacion(column:'idn_fue_info')
	periodo(column:'idn_periodo')
	decimales(column:'idn_decimales')
	urlExterna(column:'idn_urlExterna')
	etiquetaPeriodo(column:'idn_etiquetaperiodo')
	tipo(column:'idn_tipo')
	dimension(column:'idn_dimension')
	html(column:'idn_html')
	
	orden(column:'idn_orden')
	
	valorNivelNacional(column:'idn_valorNivelNacional')
	fuenteNivelNacional(column:'idn_fuenteNivelNacional')
	periodoNivelNacional(column:'idn_periodoNivelNacional')
	calcularPorPeriodoNivelNacional(column:'idn_calcularPorPeriodoNivelNacional')
	
	version(false)
  }    
}
