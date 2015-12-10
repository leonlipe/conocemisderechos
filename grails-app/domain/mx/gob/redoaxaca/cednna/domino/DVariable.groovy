package mx.gob.redoaxaca.cednna.domino

class DVariable {

	

	String     descripcion
	String     clave
	Estado     estado
	Municipio  municipio
	Region     region
	Localidad  localidad
	Poblacion  poblacion
	String     claveVar
	int 	   intervalo
	Date	   fechaActualizacion
	Boolean    mostrarCiclo
	
	static hasMany = [categorias:Categoria]


	static belongsTo = [indicador:Indicador]
	
    static constraints = {
		clave(blank:true, nullable:true)
		estado(blank:true, nullable:true)
		municipio(blank:true, nullable:true)
		localidad(blank:true, nullable:true)
		region(blank:true, nullable:true)
		claveVar(blank:true, nullable:true)
		intervalo (nullable: true)
		fechaActualizacion(nullable:true)
		mostrarCiclo(nullable:true)
    }

   static mapping = {
		table('cat_dvariable')
		id(column: 'cdv_id')

		descripcion(column: 'cdv_descripcion')
		municipio(column: 'cdv_mun_id')
		region(column: 'cdv_reg_id')
		localidad(column: 'cdv_loc_id')
		poblacion(column: 'cdv_pob_id')
		indicador(column:'cdv_ind_id')
		clave(column:'cdv_clave_id')
		estado(column: 'cdv_ent_id')
		claveVar(column:'cdv_claveVar')
		intervalo(column:'cdv_intervalo')
		fechaActualizacion(column:'cdv_fechaActualizacion')
	//	categorias (column: 'cdc_cdv_id', joinTable: 'cat_dvariable_categoria')
		
		mostrarCiclo(column:'cdv_mostrarCiclo')

	 	categorias joinTable: [name: 'cat_dvariable_categoria',
                              key: 'cdc_cdv_id',
                              column: 'cdc_cct_id']
	
		
		version(false)
	}
    

}
