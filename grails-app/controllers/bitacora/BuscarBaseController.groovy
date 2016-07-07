package bitacora

class BuscarBaseController extends seguridad.Shield {


    def dbConnectionService
    def tramitesService

    def busquedaBase() {
//        println "busqueda "
    }

    def tablaBusquedaBase() {
//        println "buscar .... $params"
        def persona = session.usuario.id
        def data = []
        def base = []
        def cn = dbConnectionService.getConnection()
        def buscar = params.buscar.split(' ').toList()
        def sql = ""
//        println "buscar .. ${buscar}"

        def resultado = []
        buscar.each {pl ->
            sql = "select base__id, sum(plbrvlor) valor from plbr where plbrplbr like '%${pl}%' group by base__id " +
                    "order by 2"
//            println "sql: $sql"
            cn.eachRow(sql.toString()){d ->
//                println "id: ${d.base__id} ${d.valor}"
                if(data.find{ it.id == d.base__id}){
                    data.find{it.id == d.base__id}.valor += d.valor
                } else {
                    data.add([id: d.base__id, valor: d.valor])
                }
            }
        }

        base = data.sort{ it.valor}.reverse()

//        println "base: ${base}"

        def msg = ""
        if(base?.size() > 20){
            base = base[0..19]
            msg = "<div class='alert-danger' style='margin-top:-20px; diplay:block; height:25px;margin-bottom: 20px;'>" +
                    " <i class='fa fa-warning fa-2x pull-left'></i> Su búsqueda ha generado más de 20 resultados. " +
                    "Use más palabras para especificar mejor la búsqueda.</div>"
        }

        base.each {
            resultado += Base.get(it.id)
        }

        cn.close()
//        println "resultado: ${resultado.id}"

        return [bases: resultado, persona: persona, msg: msg]
    }

    def busquedaEnviados() {
    }

    def actualizarPlbr() {
        println "actualizarPlbr..."
        def cn = dbConnectionService.getConnection()
        def sql = ""
        sql = "select * from sp_plbr()"
        cn.execute(sql.toString())
        cn.close()
        redirect action: 'busquedaBase'
    }


}
