package at.emikat.gemerh.ooe

import java.sql.Timestamp;

class Arbeitsstaette {
	Integer szm_version_ref
	Integer arbid
	String name
	Integer adr_plz
	String adr_ort
	String adr_strasse
	String adr_nr
	String taetigkeit
	Integer stilllegung_jahr
	String status
	String name_neu
	
	Timestamp dateCreated
	Integer created_by
	Timestamp lastUpdated
	Integer last_modified_by
	
	static belongsTo = [gemeinde:Gemeinde]
	
	static mapping = {
		table "GEMERH_ARBEITSSTAETTE"
		id column: "OBJECT_ID", sqlType: "NUMBER", generator:'sequence', params:[sequence:'GEMERH_ARBEITSSTAETTE_SEQ']
		version sqlType: "NUMBER"
		szm_version_ref sqlType: "NUMBER"
		arbid sqlType: "NUMBER"
		gemeinde column: "GEMEINDE_REF", sqlType: "NUMBER"
		
		name sqlType: "VARCHAR2(132 CHAR)"
		adr_plz sqlType: "NUMBER(4)"
		adr_ort sqlType: "VARCHAR2(132 CHAR)"
		adr_strasse sqlType: "VARCHAR2(132 CHAR)"
		adr_nr sqlType: "VARCHAR2(132 CHAR)"
		taetigkeit sqlType: "VARCHAR2(256 CHAR)"
		stilllegung_jahr sqlType: "NUMBER(4)"
		status sqlType: "VARCHAR2(132 CHAR)"
		name_neu sqlType: "VARCHAR2(132 CHAR)"
		
		dateCreated column: "CREATED_DATE", sqlType: "DATE"
		created_by sqlType: "NUMBER"
		lastUpdated column: "LAST_MODIFIED_DATE", sqlType: "DATE"
		last_modified_by sqlType: "NUMBER"
	}
	
	static constraints = {
		szm_version_ref (nullable: false)
		arbid (nullable: true)
		gemeinde (nullable: false)
		name (nullable: false, blank: false, maxSize: 132)
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
		taetigkeit (nullable: true, maxSize: 256)
		stilllegung_jahr (nullable: true, validator: {
			if(it) {
				if (!(it ==~ /\d{4}/)) {
					return 'at.emikat.gemerh.ooe.meldung.fehler.stilllegung_jahr'
				}
			}
		})
		status (nullable: true, maxSize: 132)
		name_neu (nullable: true, maxSize: 132)
		
		dateCreated (nullable: true)
		created_by (nullable: false)
		lastUpdated (nullable: true)
		last_modified_by (nullable: false)
	}
	
}
