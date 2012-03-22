package at.emikat.gemerh.ooe

import java.sql.Timestamp;

class Gemeinde {
	Integer szm_version_ref
	String gemkz
	String name
	String passwort
	
	String bearbeiter_name
	String funktioningemeinde
	String bearbeiter_tel
	String bearbeiter_mail

	Double heizung_holz_proz
	Double heizung_oel_proz
	Double heizung_gas_proz
	Double heizung_fernwaerme_proz
	Double heizung_strom_proz
	Double heizung_sonstiges_proz
	
	Boolean blockheizkraftwerk = false;
	String blockhkw_brennstoff
	Double blockhkw_verbrauch
	String blockhkw_einheit
	
	Integer anz_pkw
	Integer anz_klein_lkw
	Integer anz_lkw
	Integer anz_sonderfahrzeuge
	Double anz_stunden_sonderfahrzeuge
	
	Boolean eigentankstelle = false
	Double ts_treibstoffmenge_diesel
	Double ts_treibstoffmenge_benzin
	
	Boolean pistenraupen = false
	Integer anz_pistenraupen
	Double anz_stunden_pistenraupen
	
	Boolean schottergruben = false
	
	String anmerkungen
	String anmerkungen_behoerde
	
	Timestamp abgabe
	Timestamp freigabe
	String freigabe_von
	
	Timestamp dateCreated
	Integer created_by
	Timestamp lastUpdated
	Integer last_modified_by
	
	static hasMany = [arbeitsstaetten:Arbeitsstaette, gebaeude:Gebaeude]
	
	static mapping = {
		table "GEMERH_GEMEINDE"
		id column: "OBJECT_ID", sqlType: "NUMBER", generator:'sequence', params:[sequence:'GEMERH_GEMEINDE_SEQ']
		version sqlType: "NUMBER"
		szm_version_ref sqlType: "NUMBER"
		
		gemkz sqlType: "NUMBER(5)"
		name sqlType: "VARCHAR(132 CHAR)"
		passwort sqlType: "VARCHAR(132 CHAR)"
		
		bearbeiter_name sqlType: "VARCHAR(132 CHAR)"
		funktioningemeinde sqlType: "VARCHAR(132 CHAR)"
		bearbeiter_tel sqlType: "VARCHAR(132 CHAR)"
		bearbeiter_mail sqlType: "VARCHAR(132 CHAR)"
		
		heizung_holz_proz sqlType: "NUMBER(4,1)"
		heizung_oel_proz sqlType: "NUMBER(4,1)"
		heizung_gas_proz sqlType: "NUMBER(4,1)"
		heizung_fernwaerme_proz sqlType: "NUMBER(4,1)"
		heizung_strom_proz sqlType: "NUMBER(4,1)"
		heizung_sonstiges_proz sqlType: "NUMBER(4,1)"
		
		blockheizkraftwerk sqlType: "VARCHAR2(1 BYTE)"
		blockhkw_brennstoff sqlType: "VARCHAR(132 CHAR)"
		blockhkw_verbrauch sqlType: "NUMBER(11,3)"
		blockhkw_einheit sqlType: "VARCHAR(132 CHAR)"
		
		anz_pkw sqlType: "NUMBER(11)"
		anz_klein_lkw sqlType: "NUMBER(11)"
		anz_lkw sqlType: "NUMBER(11)"
		anz_sonderfahrzeuge sqlType: "NUMBER(11)"
		anz_stunden_sonderfahrzeuge sqlType: "NUMBER(11,2)"
		
		eigentankstelle sqlType: "VARCHAR2(1 BYTE)"
		ts_treibstoffmenge_diesel sqlType: "NUMBER(11,2)"
		ts_treibstoffmenge_benzin sqlType: "NUMBER(11,2)"
		
		pistenraupen sqlType: "VARCHAR2(1 BYTE)"
		anz_pistenraupen sqlType: "NUMBER(11)"
		anz_stunden_pistenraupen sqlType: "NUMBER(11,2)"
		
		schottergruben sqlType: "VARCHAR2(1 BYTE)"
		
		anmerkungen sqlType: "VARCHAR2(1500 CHAR)"
		anmerkungen_behoerde sqlType: "VARCHAR2(1500 CHAR)"
		
		abgabe sqlType: "DATE"
		freigabe sqlType: "DATE"
		freigabe_von sqlType: "VARCHAR(132 CHAR)"
		
		dateCreated column: "CREATED_DATE", sqlType: "DATE"
		created_by sqlType: "NUMBER"
		lastUpdated column: "LAST_MODIFIED_DATE", sqlType: "DATE"
		last_modified_by sqlType: "NUMBER"
	}
	
	static constraints = {
		szm_version_ref (nullable: false)
		gemkz(nullable: false, blank: false)
		name(nullable: false)
		passwort(nullable: false, blank: false)
		
		bearbeiter_name(nullable:true, maxSize: 132)
		funktioningemeinde(nullable:true, maxSize: 132)
		bearbeiter_tel(nullable:true, maxSize: 132)
		bearbeiter_mail(nullable:true, maxSize: 132)
		
		heizung_holz_proz(nullable: true, min: new Double(0.0), max: new Double(100.0), scale: 1)
		heizung_oel_proz(nullable: true, min: new Double(0), max: new Double(100.0), scale: 1)
		heizung_gas_proz(nullable: true, min: new Double(0), max: new Double(100.0), scale: 1)
		heizung_fernwaerme_proz(nullable: true, min: new Double(0), max: new Double(100.0), scale: 1)
		heizung_strom_proz(nullable: true, min: new Double(0), max: new Double(100.0), scale: 1)
		heizung_sonstiges_proz(nullable: true, min: new Double(0), max: new Double(100.0), scale: 1)
		
		blockheizkraftwerk(nullable: true)
		blockhkw_brennstoff(nullable: true, maxSize: 132)
		blockhkw_verbrauch(nullable: true, min: new Double(0), max: new Double(9999999.999), scale: 3)
		blockhkw_einheit(nullable: true, maxSize: 132)
		
		anz_pkw(nullable: true, min: 0, max: 2147483647)
		anz_klein_lkw(nullable: true, min: 0, max: 2147483647)
		anz_lkw(nullable: true, min: 0, max: 2147483647)
		anz_sonderfahrzeuge(nullable: true, min: 0, max: 2147483647)
		anz_stunden_sonderfahrzeuge(nullable: true, min: new Double(0), max: new Double(99999999.99), scale: 2)
		
		eigentankstelle(nullable: true)
		ts_treibstoffmenge_diesel(nullable: true, min: new Double(0), max: new Double(99999999.99), scale: 2)
		ts_treibstoffmenge_benzin(nullable: true, min: new Double(0), max: new Double(99999999.99), scale: 2)
		
		pistenraupen(nullable: true)
		anz_pistenraupen(nullable: true, min: 0, max: 2147483647)
		anz_stunden_pistenraupen(nullable: true, min: new Double(0), max: new Double(99999999.99), scale: 2)
		
		schottergruben(nullable: true)
		
		anmerkungen(nullable: true, maxSize: 1500)
		anmerkungen_behoerde(nullable: true, maxSize: 1500)
		
		abgabe(nullable: true)
		freigabe(nullable: true)
		freigabe_von(nullable: true)
		
		dateCreated (nullable: true)
		created_by (nullable: false)
		lastUpdated (nullable: true)
		last_modified_by (nullable: false)
	}
	
	String toString() {
		return gemkz
	}
}
