package at.emikat.gemerh.ooe

import java.sql.Timestamp;

class Gebaeude {
	Integer szm_version_ref
	Integer nr
	Integer adr_plz
	String adr_ort
	String adr_strasse
	String adr_nr
	String gebaeudeart
	Integer anz_schueler
	String heizmaterial
	Double heizmaterial_menge
	String heizmaterial_einheit
	Double heizmaterial_kosten
	
	Timestamp dateCreated
	Integer created_by
	Timestamp lastUpdated
	Integer last_modified_by
	
	static belongsTo = [gemeinde: Gemeinde]
	
	static mapping = {
		table "GEMERH_GEM_OEFF_GEB"
		id column: "OBJECT_ID", sqlType: "NUMBER", generator:'sequence', params:[sequence:'GEMERH_GEM_OEFF_GEB_SEQ']
		version sqlType: "NUMBER"
		szm_version_ref sqlType: "NUMBER"
		gemeinde column: "GEMEINDE_REF", sqlType: "NUMBER"
		nr sqlType: "NUMBER"
		
		adr_plz sqlType: "NUMBER(4)"
		adr_ort sqlType: "VARCHAR2(132 CHAR)"
		adr_strasse sqlType: "VARCHAR2(132 CHAR)"
		adr_nr sqlType: "VARCHAR2(132 CHAR)"
		gebaeudeart sqlType: "VARCHAR2(132 CHAR)"
		anz_schueler sqlType: "NUMBER(10)"
		heizmaterial sqlType: "VARCHAR2(132 CHAR)"
		heizmaterial_menge sqlType: "NUMBER(19,3)"
		heizmaterial_einheit sqlType: "VARCHAR2(132 CHAR)"
		heizmaterial_kosten sqlType: "NUMBER(19,2)"
		
		dateCreated column: "CREATED_DATE", sqlType: "DATE"
		created_by sqlType: "NUMBER"
		lastUpdated column: "LAST_MODIFIED_DATE", sqlType: "DATE"
		last_modified_by sqlType: "NUMBER"
	}
	
    static constraints = {
		szm_version_ref (nullable: false)
		gemeinde(nullable: false)
		nr(nullable: false)
		adr_plz (nullable: true, validator: {
			if(it) {
				if (!(it ==~ /\d{4}/)) {
					return 'at.emikat.gemerh.ooe.meldung.fehler.plz'
				}
			}
		})
		adr_ort (nullable: true, maxSize: 132)
		adr_strasse (nullable: true, maxSize: 132)
		adr_nr (nullable: true, maxSize: 132)
		gebaeudeart (nullable: true, maxSize: 132)
		anz_schueler (nullable: true, min: 0, max: 2147483647)
		heizmaterial (nullable: true, maxSize: 132)
		heizmaterial_menge (nullable: true, min: new Double(0), max: new Double(999999999999999.999), scale: 3)
		heizmaterial_einheit (nullable: true, maxSize: 132)
		heizmaterial_kosten (nullable: true, min: new Double(0), max: new Double(9999999999999999.99), scale: 2)
		
		dateCreated (nullable: true)
		created_by (nullable: false)
		lastUpdated (nullable: true)
		last_modified_by (nullable: false)
    }
}
