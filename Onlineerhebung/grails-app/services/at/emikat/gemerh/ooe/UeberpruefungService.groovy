package at.emikat.gemerh.ooe

import javax.servlet.http.HttpSession
import org.springframework.web.context.request.RequestContextHolder

import at.emikat.gemerh.ooe.Arbeitsstaette

class UeberpruefungService {
	
	def sqlService
	
	static transactional = false
	
	def ueberpruefeAuswahl(auswahl) {
		if (auswahl != "---Bitte Auswählen---") {
			return auswahl
		} else {
			return null
		}
	}
	
	//Prüfbedingungen erfassung1
	
	def ueberpruefeE1(gem) {
		if (!e1_bearbeiter_name(gem) || !e1_bearbeiter_tel_1(gem) || !e1_bearbeiter_tel_2(gem) || !e1_heizung_gesamt(gem) || !e1_blockheizkraftwerk_1(gem) || !e1_blockheizkraftwerk_2(gem)) {
			return false
		} else { return true }
	}
	
	private e1(gem) {
		if (!e1_bearbeiter_name(gem)) {
			gem.errors.rejectValue('bearbeiter_name', 'Bitte geben Sie Ihren Namen ein (erforderlich)!')
		}
		
		if (!e1_bearbeiter_tel_1(gem) || !e1_bearbeiter_tel_2(gem)) {
			gem.errors.rejectValue('bearbeiter_tel', 'Bitte geben Sie Ihre vollständige Telefonnummer ein (inkl. Vorwahl, mindestens 8 Stellen, für Rückfragen, erforderlich)!')
		}
		
		if (!e1_heizung_gesamt(gem)) {
			gem.errors.rejectValue('heizung_holz_proz', 'Gesamtsumme der Brennstoffe aller Haushalte muss 100% betragen!')
			gem.errors.rejectValue('heizung_oel_proz', '')
			gem.errors.rejectValue('heizung_gas_proz', '')
			gem.errors.rejectValue('heizung_fernwaerme_proz', '')
			gem.errors.rejectValue('heizung_strom_proz', '')
			gem.errors.rejectValue('heizung_sonstiges_proz', '')
		}
		
		if (!e1_blockheizkraftwerk_1(gem)) {
			gem.errors.rejectValue('blockhkw_verbrauch', 'Bitte alle Daten des Blockheizkraftwerks ausfüllen oder Blockheizkraftwerk abwählen!')
		}
		
		if (!e1_blockheizkraftwerk_2(gem)) {
			gem.errors.rejectValue('blockhkw_verbrauch', 'Bitte Blockheizkraftwerk auswählen oder Daten des Blockheizkraftwerks löschen!')
		}
	}
	
	private e1_bearbeiter_name(gem) {
		if (gem.bearbeiter_name == null || gem.bearbeiter_name == "") {
			return false
		} else { return true }
	}
	
	private e1_bearbeiter_tel_1(gem) {
		if (gem.bearbeiter_tel == null || gem.bearbeiter_tel == "") {
			return false
		} else { return true }
	}
	
	private e1_bearbeiter_tel_2(gem) {
		if (gem.bearbeiter_tel?.size() < 8) {
			return false
		} else { return true }
	}
	
	private e1_heizung_gesamt(gem) {
		def heizung = 0
		
		if (gem.heizung_holz_proz) { heizung += gem.heizung_holz_proz }
		if (gem.heizung_oel_proz) { heizung += gem.heizung_oel_proz }
		if (gem.heizung_gas_proz) { heizung += gem.heizung_gas_proz }
		if (gem.heizung_fernwaerme_proz) { heizung += gem.heizung_fernwaerme_proz }
		if (gem.heizung_strom_proz) { heizung += gem.heizung_strom_proz }
		if (gem.heizung_sonstiges_proz) { heizung += gem.heizung_sonstiges_proz }
		
		if (heizung != 100) {
			return false
		} else { return true }
	}
	
	private e1_blockheizkraftwerk_1(gem) {
		if (gem.blockheizkraftwerk && (!gem.blockhkw_brennstoff || !(gem.blockhkw_verbrauch > 0) || !gem.blockhkw_einheit)) {
			return false
		} else { return true }
	}
	
	private e1_blockheizkraftwerk_2(gem) {
		if (!gem.blockheizkraftwerk && (gem.blockhkw_brennstoff || (gem.blockhkw_verbrauch > 0) || gem.blockhkw_einheit)) {
			return false
		} else { return true }
	}
	
	
	
	//Prüfbedingungen erfassung2
	def ueberpruefeE2(gem) {
		if (!e2_anz_sonderfahrzeuge(gem) || !e2_eigentankstelle_1(gem) || !e2_eigentankstelle_2(gem) || !e2_zuviel_benzin(gem) || !e2_ts_treibstoffmenge_diesel(gem) || !e2_ts_treibstoffmenge_benzin(gem) || !e2_zuviel_treibstoff(gem) || !e2_pistenraupen_1(gem) || !e2_pistenraupen_2(gem)) {
			return false
		} else { return true }
	}
	
	private e2(gem) {
		if (!e2_anz_sonderfahrzeuge(gem)) {
			gem.errors.rejectValue('anz_pkw', 'Bitte prüfen: Mehr als 1 Fahrzeug pro 500 Einwohner!')
			gem.errors.rejectValue('anz_klein_lkw', '')
			gem.errors.rejectValue('anz_lkw', '')
			gem.errors.rejectValue('anz_sonderfahrzeuge', '')
		}
		
		if (!e2_eigentankstelle_1(gem)) {
			gem.errors.rejectValue('ts_treibstoffmenge_diesel', 'Bitte alle Daten der Betriebstankstelle ausfüllen oder Betriebstankstelle abwählen!')
			gem.errors.rejectValue('ts_treibstoffmenge_benzin', '')
		}
		
		if (!e2_eigentankstelle_2(gem)) {
			gem.errors.rejectValue('ts_treibstoffmenge_diesel', 'Bitte Betriebstankstelle auswählen oder Daten der Betriebstankstelle löschen!')
			gem.errors.rejectValue('ts_treibstoffmenge_benzin', '')
		}
		
		if (!e2_zuviel_benzin(gem)) {
			gem.errors.rejectValue('ts_treibstoffmenge_benzin', 'Bitte prüfen: Abgabe Benzin ist höher als Abgabe Diesel!')
		}
		
		if (!e2_ts_treibstoffmenge_diesel(gem)) {
			gem.errors.rejectValue('ts_treibstoffmenge_diesel', 'Bitte prüfen: Abgabe Diesel weniger als 10.000 Liter pro Jahr!')
		}
		
		if (!e2_ts_treibstoffmenge_benzin(gem)) {
			gem.errors.rejectValue('ts_treibstoffmenge_benzin', 'Bitte prüfen: Abgabe Benzin weniger als 10.000 Liter pro Jahr!')
		}
		
		if (!e2_zuviel_treibstoff(gem)) {
			gem.errors.rejectValue('ts_treibstoffmenge_diesel', 'Bitte prüfen: Treibstoffabgabe mehr als 5.000 Liter pro gemeindeeigenem Fahrzeug!')
			gem.errors.rejectValue('ts_treibstoffmenge_benzin', '')
		}
		
		if (!e2_pistenraupen_1(gem)) {
			gem.errors.rejectValue('anz_pistenraupen', 'Bitte alle Daten des Skigebiets ausfüllen oder Skigebiet abwählen!')
			gem.errors.rejectValue('anz_stunden_pistenraupen', '')
		}
		
		if (!e2_pistenraupen_2(gem)) {
			gem.errors.rejectValue('anz_pistenraupen', 'Bitte Skigebiet auswählen oder Daten des Skigebiets löschen!')
			gem.errors.rejectValue('anz_stunden_pistenraupen', '')
		}
	}
	
	private e2_anz_sonderfahrzeuge(gem) {
		def fahrzeuge = 0
		def einwohner = 0
		einwohner = sqlService.einwohner(getSession().vweh, gem.gemkz)
		
		if (gem.anz_pkw) { fahrzeuge += gem.anz_pkw }
		if (gem.anz_klein_lkw) { fahrzeuge += gem.anz_klein_lkw }
		if (gem.anz_lkw) { fahrzeuge += gem.anz_lkw }
		if (gem.anz_sonderfahrzeuge) { fahrzeuge += gem.anz_sonderfahrzeuge }
		
		def anzahl = einwohner/500
		
		if (fahrzeuge > anzahl) {
			return false
		} else { return true }
	}
	
	private e2_eigentankstelle_1(gem) {
		if (gem.eigentankstelle && (!(gem.ts_treibstoffmenge_diesel >= 0) || (!(gem.ts_treibstoffmenge_benzin >= 0) && gem.ts_treibstoffmenge_diesel < 10000))) {
			return false
		} else { return true }
	}
	
	private e2_eigentankstelle_2(gem) {
		if (!gem.eigentankstelle && ((gem.ts_treibstoffmenge_diesel >= 0) || (gem.ts_treibstoffmenge_benzin >= 0))) {
			return false
		} else { return true }
	}
	
	private e2_zuviel_benzin(gem) {
		if (gem.eigentankstelle && gem.ts_treibstoffmenge_benzin > 0 && gem.ts_treibstoffmenge_diesel >= 0 && gem.ts_treibstoffmenge_benzin > gem.ts_treibstoffmenge_diesel) {
			return false
		} else { return true }
	}
	
	private e2_ts_treibstoffmenge_diesel(gem) {
		if (gem.eigentankstelle && gem.ts_treibstoffmenge_diesel < 10000) {
			return false
		} else { return true }
	}
	
	private e2_ts_treibstoffmenge_benzin(gem) {
		if (gem.eigentankstelle && gem.ts_treibstoffmenge_benzin > 0 && gem.ts_treibstoffmenge_benzin < 10000) {
			return false
		} else { return true }
	}
	
	private e2_zuviel_treibstoff(gem) {
		def treibstoff = 0
		def fahrzeuge = 0
		
		if (gem.ts_treibstoffmenge_diesel) { treibstoff += gem.ts_treibstoffmenge_diesel }
		if (gem.ts_treibstoffmenge_benzin) { treibstoff += gem.ts_treibstoffmenge_benzin }
		
		if (gem.anz_pkw) { fahrzeuge += gem.anz_pkw }
		if (gem.anz_klein_lkw) { fahrzeuge += gem.anz_klein_lkw }
		if (gem.anz_lkw) { fahrzeuge += gem.anz_lkw }
		if (gem.anz_sonderfahrzeuge) { fahrzeuge += gem.anz_sonderfahrzeuge }
		
		if (fahrzeuge > 0 && treibstoff > (5000*fahrzeuge)) {
			return false
		} else { return true }
	}
	
	private e2_pistenraupen_1(gem) {
		if (gem.pistenraupen && (!(gem.anz_pistenraupen > 0) || !(gem.anz_stunden_pistenraupen > 0))) {
			return false
		} else { return true }
	}
	
	private e2_pistenraupen_2(gem) {
		if (!gem.pistenraupen && ((gem.anz_pistenraupen > 0) || (gem.anz_stunden_pistenraupen > 0))) {
			return false
		} else { return true }
	}
	
	
	
	//Prüfbedingungen gebaeude
	def ueberpruefeGebList(gebList) {
		ArrayList result = new ArrayList()
		
		for(i in 0..<gebList.size()) {
			if (!ueberpruefeGeb(gebList.get(i))) {
				result.add(gebList.get(i))
			}
		}
		return result
	}
	
	private ueberpruefeGeb(geb) {		
		if (!geb_adresse(geb) || !geb_gebaeudeart(geb)  || geb_energiekosten(geb) != 'ja' || geb_energieeinsatz(geb) != 'ja' || geb_energie(geb) == 'Menge fehlt!' || geb_energie(geb) == 'Material fehlt!' || geb_energie(geb) == 'Material und Menge fehlt!' || geb_energie(geb) == 'Material und Einheit fehlt!') {
			return false
		} else { return true }
	}
	
	private geb(geb) {
		if (!geb_adresse(geb)) {
			geb.errors.rejectValue('adr_strasse', 'Bitte geben Sie die vollständige Adresse an!')
			geb.errors.rejectValue('adr_nr', '')
			geb.errors.rejectValue('adr_plz', '')
			geb.errors.rejectValue('adr_ort', '')
		}
		if (!geb_gebaeudeart(geb)) {
			geb.errors.rejectValue('gebaeudeart', 'Bitte wählen Sie "vorwiegende Nutzung" des betreffenden Gebäudes!')
		}
		if (geb_energiekosten(geb) == 'Falsche Einheit!' || geb_energieeinsatz(geb) == 'Falsche Einheit!') {
			geb.errors.rejectValue('heizmaterial_menge', 'Einheit für Energieträger nicht definiert!')
		}
		if (geb_energie(geb) == 'Menge fehlt!') {
			geb.errors.rejectValue('heizmaterial_menge', 'Bitte Einsatzmenge angeben oder Heizmaterial abwählen!')
			geb.errors.rejectValue('heizmaterial', '')
		}
		if (geb_energie(geb) == 'Material fehlt!') {
			geb.errors.rejectValue('heizmaterial_menge', 'Bitte Heizmaterial angeben oder Einsatzmenge und Einheit abwählen bzw. leer lassen!')
			geb.errors.rejectValue('heizmaterial', '')
		}
		if (geb_energie(geb) == 'Material und Menge fehlt!') {
			geb.errors.rejectValue('heizmaterial_menge', 'Bitte Heizmaterial und Einsatzmenge angeben oder Einheit abwählen!')
			geb.errors.rejectValue('heizmaterial', '')
		}
		if (geb_energie(geb) == 'Material und Einheit fehlt!') {
			geb.errors.rejectValue('heizmaterial_menge', 'Bitte Heizmaterial und Einheit angeben oder Einsatzmenge leer lassen!')
			geb.errors.rejectValue('heizmaterial', '')
		}
		if (geb_energiekosten(geb) == 'nein') {
			geb.errors.rejectValue('heizmaterial_menge', 'Bitte prüfen: Energiekosten nicht plausibel!')
		}
		if (geb_energieeinsatz(geb) == 'nein') {
			geb.errors.rejectValue('heizmaterial_menge', 'Bitte prüfen: Energieeinsatz beim Heizen nicht plausibel!')
		}
	}
	
	private geb_adresse(geb) {
		if (!geb.adr_plz || !geb.adr_ort || !geb.adr_strasse || !geb.adr_nr) {
			return false
		} else { return true }
	}
	
	private geb_gebaeudeart(geb) {
		if (!geb.gebaeudeart) {	return false }
		else { return true }
	}
	
	private geb_energiekosten(geb) {
		def energie = geb_energie(geb)
		
		if (energie != "Falsche Einheit!" && (!geb.heizmaterial_kosten || !geb.heizmaterial_menge)) {
			return 'ja'
		} else if (energie instanceof Double && geb.heizmaterial_kosten) {
			def kosten = geb.heizmaterial_kosten/energie
			
			if (kosten >= 0.01 && kosten <= 0.2) {
				return 'ja'
			} else { return 'nein' }
		} else {
			return energie
		}
	}
	
	private geb_energieeinsatz(geb) {
		def energie = geb_energie(geb)
		
		if (energie != "Falsche Einheit!" && (!geb.anz_schueler || !geb.heizmaterial_menge)) {
			return 'ja'
		} else if (energie instanceof Double && geb.anz_schueler) {
			def einsatz = energie/geb.anz_schueler
			
			if (einsatz >= 1000 && einsatz <= 20000) {
				return 'ja'
			} else { return 'nein' }
		} else {
			return energie
		}
	}
	
	private geb_energie(geb) {
		
		def kg = "kg"
		def t = "Tonnen"
		def l = "l"
		def m3 = "m3"
		def kWh = "kWh"
		
		def energie = 0
		
		if (geb.heizmaterial_menge instanceof Double && geb.heizmaterial && !geb.heizmaterial_einheit) {
			energie = 'Falsche Einheit!'
		} else if (!(geb.heizmaterial_menge instanceof Double) && geb.heizmaterial && geb.heizmaterial_einheit){
			energie = 'Menge fehlt!'
		} else if (geb.heizmaterial_menge instanceof Double && !geb.heizmaterial && geb.heizmaterial_einheit){
			energie = "Material fehlt!"
		} else if (!(geb.heizmaterial_menge instanceof Double) && !geb.heizmaterial  && geb.heizmaterial_einheit) {
			energie = 'Material und Menge fehlt!'
		} else if (geb.heizmaterial_menge instanceof Double && !geb.heizmaterial  && !geb.heizmaterial_einheit) {
			energie = 'Material und Einheit fehlt!'
		}else if (geb.heizmaterial_menge >= 0 && (geb.heizmaterial == "an Fernheizwerk angeschlossen" || geb.heizmaterial == "Heizkontrakt" || geb.heizmaterial == "Strom")) {
			if (geb.heizmaterial_einheit != 'kWh') {
				energie = 'Falsche Einheit!'
			} else {
				energie = geb.heizmaterial_menge
			}
		} else if (geb.heizmaterial_menge >= 0 && geb.heizmaterial == "Pellets") {
			switch(geb.heizmaterial_einheit) {
				case kg:
					energie = geb.heizmaterial_menge*5.222
				break
				case t:
					energie = geb.heizmaterial_menge*5222
				break
				case l:
					energie = 'Falsche Einheit!'
				break
				case m3:
					energie = geb.heizmaterial_menge*3394
				break
				case kWh:
					energie = geb.heizmaterial_menge
				break
			}
		}  else if (geb.heizmaterial_menge >= 0 && geb.heizmaterial == "Holz") {
			switch(geb.heizmaterial_einheit) {
				case kg:
					energie = geb.heizmaterial_menge*3.927
				break
				case t:
					energie = geb.heizmaterial_menge*3927
				break
				case l:
					energie = 'Falsche Einheit!'
				break
				case m3:
					energie = geb.heizmaterial_menge*1767
				break
				case kWh:
					energie = geb.heizmaterial_menge
				break
			}
		} else if (geb.heizmaterial_menge >= 0 && geb.heizmaterial == "Kohle/Koks") {
			switch(geb.heizmaterial_einheit) {
				case kg:
					energie = geb.heizmaterial_menge*7.917
				break
				case t:
					energie = geb.heizmaterial_menge*7917
				break
				case l:
					energie = 'Falsche Einheit!'
				break
				case m3:
					energie = 'Falsche Einheit!'
				break
				case kWh:
					energie = geb.heizmaterial_menge
				break
			}
		} else if (geb.heizmaterial_menge >= 0 && geb.heizmaterial == "Öl") {
			switch(geb.heizmaterial_einheit) {
				case kg:
					energie = geb.heizmaterial_menge*11.805
				break
				case t:
					energie = geb.heizmaterial_menge*11805
				break
				case l:
					energie = geb.heizmaterial_menge*9.681
				break
				case m3:
					energie = geb.heizmaterial_menge*9681
				break
				case kWh:
					energie = geb.heizmaterial_menge
				break
			} 
		} else if (geb.heizmaterial_menge >= 0 && geb.heizmaterial == "Gas") {
			switch(geb.heizmaterial_einheit) {
				case kg:
					energie = geb.heizmaterial_menge*13.773
				break
				case t:
					energie = geb.heizmaterial_menge*13773
				break
				case l:
					energie = 'Falsche Einheit!'
				break
				case m3:
					energie = geb.heizmaterial_menge*9.917
				break
				case kWh:
					energie = geb.heizmaterial_menge
				break
			}
		}
		return energie   
	}
	
	
	
	//Prüfbedingungen arbeitsstaette	
	def ueberpruefeArbList(arbList) {
		ArrayList result = new ArrayList()
		
		for(i in 0..<arbList.size()) {
			def arb = arbList.get(i)
			
			if (arb.status == "NEU" && !ueberpruefeArbNeues(arbList.get(i))) {
				result.add(arbList.get(i))
			} else if (arb.status != "NEU" && !ueberpruefeArbBestand(arbList.get(i))) {
				result.add(arbList.get(i))
			}
		}
		return result
	}
	
	private ueberpruefeArbBestand(arb) {
		if (!arb_name_geschlossen(arb)) {
			return false
		} else { return true }
	}
	
	private ueberpruefeArbNeues(arb) {
		if (!arb_adresse(arb)) {
			return false
		} else { return true }
	}
	
	private arbBestand(arb) {
		if (!arb_name_geschlossen(arb)) {
			arb.errors.rejectValue('name_neu', 'Bitte geben Sie entweder einen neuen Namen oder ein Jahr für die Stilllegung an!')
		}
	}
	
	private arbNeues(arb) {
		if (!arb_adresse(arb)) {
			arb.errors.rejectValue('adr_strasse', 'Bitte geben Sie die vollständige Adresse an!')
			arb.errors.rejectValue('adr_nr', '')
			arb.errors.rejectValue('adr_plz', '')
			arb.errors.rejectValue('adr_ort', '')
		}
	}
	
	private arb_adresse(arb) {
		if (!arb.adr_plz || !arb.adr_ort || !arb.adr_strasse || !arb.adr_nr) {
			return false
		} else { return true }
	}
	
	private arb_name_geschlossen(arb) {
		if (arb.name_neu && arb.stilllegung_jahr) {
			return false
		} else { return true }
	}
	
	//Überprüfung auf Veränderungen der Arbeitsstätten
	def ueberpruefeArbListAufNeues(arbList) {
		for(i in 0..<arbList.size()) {
			if(arbList.get(i).status != "UNVERÄNDERT") {
				return false
			}
		}
		return true
	}
	
	private arbNeu(arbList) {
		if (ueberpruefeArbListAufNeues(arbList)) {
			Arbeitsstaette arb = new Arbeitsstaette()
			arb.errors.rejectValue('adr_strasse', 'Bitte überprüfen Sie ob unsere Daten über Arbeitsstätten korrekt sind - informieren Sie uns über allfällige Änderungen!')
			return arb
		}
	}
	
	private HttpSession getSession() {
		return RequestContextHolder.currentRequestAttributes().getSession()
	}
}
