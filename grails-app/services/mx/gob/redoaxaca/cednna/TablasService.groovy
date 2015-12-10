package mx.gob.redoaxaca.cednna

import mx.gob.redoaxaca.cednna.domino.CatOrigenDatos
import mx.gob.redoaxaca.cednna.domino.Variable

import groovy.sql.Sql

import org.springframework.transaction.annotation.Transactional
import org.springframework.web.multipart.MultipartFile

import grails.plugins.springsecurity.Secured


class TablasService {
    def dataSource
    def springSecurityService

    def serviceMethod() {

    }

    def getTablaVariables(params, cuenta){
    	if (cuenta){ 
            return CatOrigenDatos.list().size()
        }

        String orden='clave '
        if(params?.iSortCol_0){
            switch (params?.iSortCol_0) {
                case '0':
                    orden = 'clave '
                    break
                case '1':
                    orden = 'descripcion '
                    break
            }
        }


        def list = []
        def maximo = params.iDisplayLength!=null?params.iDisplayLength:10
        def inicio = params.iDisplayStart!=null?params.iDisplayStart:0
        
        def tipo = params.sSortDir_0 != null ? params.sSortDir_0 : 'asc'
        if(params?.iSortCol_0){
            switch (params?.iSortCol_0) {
                case '0':
                    orden = 'clave'
                    break
                case '1':
                    orden = 'descripcion'
                    break  
            }
        }

        String sql = """
            select cod_id id, cod_clave clave, cod_descripcion descripcion from cat_origen_datos 
            where upper(cod_clave) like upper('%${params?.sSearch}%')
            or upper(cod_descripcion) like upper('%${params?.sSearch}%')
        """
        if(!params?.iSortCol_0){
                sql+=" ORDER BY clave "
            }else{
                sql += " ORDER BY " +orden+ " " + (params.sSortDir_0 != null ? params.sSortDir_0 : '' ) + " "
            }
            sql += " LIMIT "+ (params.iDisplayLength != null ?params.iDisplayLength:'10') +" OFFSET " + (params.iDisplayStart!=null?params.iDisplayStart:'0')

    	def variables = executeQuery(sql)

    	variables.each{
    		list<<[
    			'0':"<a href='/cednna/catOrigenDatos/show/"+it.id+"'>"+it.clave+"</a>",
    			'1':it.descripcion
    		]	
    	}


    	return list
    }

    def getTablaDatosEstadisticos(params, cuenta){
        String orden='clave '
		ArrayList columnas = ["UPPER(cvv_clave)", "UPPER(cvv_descripcion)", "UPPER(r.crg_descripcion)", "UPPER(mun.mun_descripcion)", "UPPER(cat.cct_descripcion)", "cvv_anio::text", "cvv_poblacion_total::text", "cvv_mujeres::text", "cvv_hombres::text"]
        if(params?.iSortCol_0){
            switch (params?.iSortCol_0) {
                case '1':
                    orden = 'clave '
                    break
                case '2':
                    orden = 'descripcion '
                    break
                case '3':
                    orden = 'region '
                    break
                case '4':
                    orden = 'municipio '
                    break                
                case '5':
                    orden = 'categoria '
                    break
                case '6':
                    orden = 'anio '
                    break
                case '7':
                    orden = 'poblaciontotal '
                    break
                case '8':
                    orden = 'mujeres '
                    break
                case '9':
                    orden = 'hombres '
                    break
            }
        }

        String sql = """
            select 
            cvv_id id, cvv_anio anio, cvv_clave clave, cod_descripcion descripcion, 
            e.ent_descripcion estado,  mun.mun_descripcion municipio, cvv_hombres hombres, 
            cvv_mujeres mujeres , cvv_poblacion_total poblaciontotal, r.crg_descripcion region, 
            cat.cct_descripcion categoria, p.descripcion periodo
            from cat_variable v 
            LEFT JOIN cat_entidad e ON (e.ent_id = v.cvv_estado) 
            
            LEFT JOIN cat_municipio mun ON (v.cvv_municipio = mun.mun_id) 
            LEFT JOIN cat_region r ON (v.cvv_region = r.crg_id)
            LEFT JOIN cat_variable_categoria vc ON (vc.cvc_cvv_id = v.cvv_id) 
            LEFT JOIN cat_categoria cat ON (cat.cct_id = vc.cvc_cct_id) 
            LEFT JOIN periodo p ON (p.id = v.cvv_ped_id)
			left join cat_origen_datos on (cod_clave = cvv_clave)
            """
		
		String sqlWhere = "WHERE"
		
		columnas.eachWithIndex{ valor, indice ->
			def i = indice + 1
			if(params["sSearch_"+i]!=null && params["sSearch_"+i]!=''){
				sqlWhere = sqlWhere.equals("WHERE")?sqlWhere:(sqlWhere + " AND")
				sqlWhere += " " + valor + " LIKE UPPER ('%"+params["sSearch_"+i]+"%')"
			}
		}
		
		if(sqlWhere.length()==5)
			sqlWhere = ""
		
		sql+=sqlWhere
        
        if (cuenta){ 
            return (executeQuery(" select count(*) numero from ( "+ sql +" ) consulta" ))?.numero
        }else{
            if(!params?.iSortCol_0){
                sql+=" ORDER BY clave, anio desc, categoria "
            }else{
                sql += " ORDER BY " +orden+  " " +(params.sSortDir_0 != null ? params.sSortDir_0 : '' ) + ", anio desc, categoria "
            }
            sql += " LIMIT "+ (params.iDisplayLength != null ?params.iDisplayLength:'10') +" OFFSET " + (params.iDisplayStart!=null?params.iDisplayStart:'0')
        } 
        
        def list = []
		
        def variables = executeQuery(sql)
        variables.each{
            def anio = it.periodo
            
            if(anio==null){
                anio = it.anio
            }
            list<<[
                it.id,
                it.clave,
                it.descripcion,
                it.region,
                it.municipio,                
                it.categoria,
                anio,
                it.poblaciontotal,
                it.mujeres,
                it.hombres
            ]   
        }
        return list
    }
	
    @Secured( ['IS_AUTHENTICATED_ANONYMOUSLY'])
    def getTablaBuscador(params, cuenta){
        String orden='modulo '
        if(params?.iSortCol_0){
            switch (params?.iSortCol_0) {
                case '0':
                    orden = 'modulo '
                    break
                case '1':
                    orden = 'seccion '
                    break
                case '2':
                    orden = 'indicador '
                    break
            }
        }

        String sql = """
            select i.idn_id id,  idn_urlexterna url,  e.id ejeid, e.descripcion modulo, d.descripcion seccion,  i.idn_nombre indicador from idn_indicador i
            left join division d on (i.division_id=d.id) left join eje e on (d.eje_id = e.id)
            WHERE idn_publico = true
        """

        if(params?.sSearch!=null && params?.sSearch!=''){
            sql +=
            """
            and (UPPER(idn_nombre) LIKE UPPER ('%${params?.sSearch}%') 
            OR UPPER(e.descripcion) LIKE UPPER ('%${params?.sSearch}%') 
            OR UPPER(d.descripcion) LIKE UPPER ('%${params?.sSearch}%') )
        """
        }

        if (cuenta){ 
            return (executeQuery(" select count(*) numero from ( "+ sql +" ) consulta" ))?.numero
        }else{
            if(!params?.iSortCol_0){
                sql+=" ORDER BY modulo, seccion "
            }else{
                sql += " ORDER BY " +orden+ (params.sSortDir_0 != null ? params.sSortDir_0 : '' ) + " "
            }
            sql += " LIMIT "+ (params.iDisplayLength != null ?params.iDisplayLength:'10') +" OFFSET " + (params.iDisplayStart!=null?params.iDisplayStart:'0')
        }

        def list = []
        def indicadores = executeQuery(sql)
        def url = ""
        indicadores.each{
            if(it.url){
                url = "<a href='"+it.url+"' class='uk-icon-button uk-icon-search'> </a>"
            }else{
                url = "<a href='publico/mostrarIndicador/"+it.id+"?ejeInstance="+it.ejeid+"' class='uk-icon-button uk-icon-search'> </a>"
            }

            list<<[
                '0':it.modulo,
                '1':it.seccion,
                '2':it.indicador,
                '3':url
            ]   
        }
        return list

    }

    @Secured( ['IS_AUTHENTICATED_ANONYMOUSLY'])
    @Transactional(readOnly = true)
    def executeQuery(String sql){
        def db = new Sql(dataSource)
        def rows = db.rows(sql)
        db.close()
        return rows
    }
}
