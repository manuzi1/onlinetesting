package at.emikat.gemerh.ooe


import groovy.sql.Sql;

class SqlService {

	def grailsApplication
	def dataSource
	
    static transactional = false

	def szenario () {
		def sql = new Sql(dataSource)
		def query = "select WERT from  ad_user_env where user_ref=?"
		def result = sql.firstRow(query, grailsApplication.config.emikat.user_ref).wert
		result
	}
	
	def svr (acronym, szenario) {
		def sql = new Sql(dataSource)
		def lparams = [acronym, szenario]
		def query = "select v.object_id from szm_version v, szm_szenario_version sv, szm_group g where v.object_id=sv.version_ref and v.GROUP_REF=g.OBJECT_ID and g.ACRONYM=? AND sv.SZENARIO_REF=? AND g.ORGANISATION_REF=6"
		def result = sql.firstRow(query, lparams).object_id
		return result
	}
	
	def name (svr, gemkz) {
		def sql = new Sql(dataSource)
		def lparams = [svr, gemkz]
		def query = "select NAME  from verw_einheit where szm_version_ref=? and VERWSCHL=?"
		def result = sql.firstRow(query, lparams).name
		return result
	}
	
	def einwohner (vweh, gemkz) {
		gemkz = gemkz + '%'
		def sql = new Sql(dataSource)
		def lparams = [vweh, gemkz]
		def query = "select sum(EINWOHNERZAHL) AS EINWOHNERZAHL from VERW_EINHEIT WHERE SZM_VERSION_REF = ? AND VERWSCHL LIKE ?"
		def result = sql.firstRow(query, lparams).einwohnerzahl
		return result
	}
}
