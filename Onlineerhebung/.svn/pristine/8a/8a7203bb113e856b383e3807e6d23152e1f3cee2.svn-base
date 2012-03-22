package at.emikat.gemerh.ooe

import at.emikat.gemerh.ooe.Gemeinde;
import java.sql.Timestamp;

class GemeindeController {
	
	def grailsApplication
	def userService
	def gebaeudeService
	def ueberpruefungService
	
	def defaultAction = 'list'
	
	def propertiesToBindErfassung1 = ['bearbeiter_name', 'funktioningemeinde', 'bearbeiter_tel', 'bearbeiter_mail', 'heizung_holz_proz', 'heizung_oel_proz', 'heizung_gas_proz', 'heizung_fernwaerme_proz', 'heizung_strom_proz', 'heizung_sonstiges_proz', 'blockheizkraftwerk', 'blockhkw_verbrauch']
	def propertiesToBindErfassung2 = ['anz_pkw', 'anz_klein_lkw', 'anz_lkw', 'anz_sonderfahrzeuge', 'anz_stunden_sonderfahrzeuge', 'eigentankstelle', 'ts_treibstoffmenge_diesel', 'ts_treibstoffmenge_benzin', 'pistenraupen', 'anz_pistenraupen', 'anz_stunden_pistenraupen', 'schottergruben']
	
	def hilfeabgabe = { }
	
	def hilfeerfassung1 = { }
	
	def hilfeerfassung2 = { }
	
	def hilfelist = { }
	
	def list = {
		if (!params.sort) {
			params.sort = 'gemkz'
		}
		
		if (!params.order) {
			params.order = 'asc'
		}
		
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def gemeindeList
		def gemeindeCount
		
		if (session.user == grailsApplication.config.emikat.admin.name) { //Admin
			gemeindeList = Gemeinde.findAllBySzm_version_refAndAbgabeIsNotNull(session.svr, params)
			gemeindeCount = Gemeinde.countBySzm_version_refAndAbgabeIsNotNull(session.svr)
		} else if (session.user == grailsApplication.config.emikat.support.name) { //Support
			gemeindeList = Gemeinde.findAllBySzm_version_ref(session.svr, params)
			gemeindeCount = Gemeinde.countBySzm_version_ref(session.svr)
		} 
		
		if (!gemeindeList) {
			flash.message = "${message(code: 'at.emikat.gemerh.ooe.gemeinde.keine.gefunden', default: 'Keine Gemeinde gefunden!')}"
		} else {
			[gemeindeInstanceList: gemeindeList, gemeindeInstanceTotal: gemeindeCount]
		}
	}
	
	def erfassung1 = {
		def gemeindeInstance
		
		if ((session.user == grailsApplication.config.emikat.admin.name || session.user == grailsApplication.config.emikat.support.name) && params.id) { //ermöglicht admin oder support das auswählen einer anderen Gemeinde
			gemeindeInstance = Gemeinde.get(params.id)
			
			if ((session.user == grailsApplication.config.emikat.admin.name && gemeindeInstance.abgabe) || session.user == grailsApplication.config.emikat.support.name) {
				userService.setGemeinde(gemeindeInstance)
			} else {
				redirect(action: 'list')
			}
		} else {
			gemeindeInstance = Gemeinde.get(session.gemid)
		}
		
		if(session.ueberpruefung) { ueberpruefungService.e1(gemeindeInstance) }
		session.gebCount = gebaeudeService.countByGemeinde(gemeindeInstance)
		return [gemeindeInstance: gemeindeInstance]
	}
	
	def erfassung1korrektur = {
		def gemeindeInstance
		
		if ((session.user == grailsApplication.config.emikat.admin.name || session.user == grailsApplication.config.emikat.support.name) && params.id) { //ermöglicht admin oder support das auswählen einer anderen Gemeinde
			gemeindeInstance = Gemeinde.get(params.id)
			userService.setGemeinde(gemeindeInstance)
		} else {
			gemeindeInstance = Gemeinde.get(session.gemid)
		}
		
		if(session.ueberpruefung) { ueberpruefungService.e1(gemeindeInstance) }
		session.gebCount = gebaeudeService.countByGemeinde(gemeindeInstance)
		return [gemeindeInstance: gemeindeInstance]
	}
	
	def erfassung2 = {
		def gemeindeInstance = Gemeinde.get(session.gemid)
		
		if(session.ueberpruefung) { ueberpruefungService.e2(gemeindeInstance) }
		return [gemeindeInstance: gemeindeInstance]
	}
	
	def erfassung2korrektur = {
		def gemeindeInstance = Gemeinde.get(session.gemid)
		
		if(session.ueberpruefung) { ueberpruefungService.e2(gemeindeInstance) }
		return [gemeindeInstance: gemeindeInstance]
	}
	
	
	def abgabe = {
		def gem = Gemeinde.get(session.gemid)
		return ueberpruefung(gem)
	}
	
	private update = {from, toController, toAction, params ->
		if (session.editierbar) {
			def gemeindeInstance = Gemeinde.get(session.gemid)
			
			if (params.version) {
				def version = params.version.toLong()
				if (gemeindeInstance.version > version) {
					gemeindeInstance.errors.rejectValue("version", "default.optimistic.locking.failure")
					render(view: from, model: [gemeindeInstance: gemeindeInstance])
					return
				}
			}
			
			if (from == "erfassung1" || from == "erfassung1korrektur") {
				gemeindeInstance.properties[propertiesToBindErfassung1] = params
				gemeindeInstance.blockhkw_einheit = ueberpruefungService.ueberpruefeAuswahl(params.blockhkw_einheit)
				gemeindeInstance.blockhkw_brennstoff = ueberpruefungService.ueberpruefeAuswahl(params.blockhkw_brennstoff)
			} else if (from == "erfassung2" || from == "erfassung2korrektur") {
				gemeindeInstance.properties[propertiesToBindErfassung2] = params
			} else if (from == "abgabe") {
				gemeindeInstance.properties[['anmerkungen']] = params
				
				if (session.user == grailsApplication.config.emikat.admin.name) {
					gemeindeInstance.properties[['anmerkungen_behoerde']] = params
					
					if (toAction == "zurueckstellen") {
						if (!gemeindeInstance.freigabe) {gemeindeInstance.abgabe = null }
						else {
							flash.message = "Zurückstellen nicht möglich, da die Gemeinde bereits freigegeben wurde!"
						}
					} else if (toAction == "freigeben") {
						if (gemeindeInstance.abgabe) {gemeindeInstance.freigabe = new Timestamp(new Date().getTime()) }
						else {
							flash.message = "Freigeben nicht möglich, da die Gemeinde noch nicht abgegeben hat!"
						}
					}
				} else if (toAction == "abgeben") {
					if (!abgeben(gemeindeInstance)) {
						gemeindeInstance.errors.rejectValue('bearbeiter_name', 'Abgeben nicht möglich. Bitte geben Sie zumindest Ihren Namen und Ihre Telefonnummer auf Erfassung Seite 1 an!')
					} else {
						gemeindeInstance.abgabe = new Timestamp(new Date().getTime());
					}
				}
			}
			
			gemeindeInstance.last_modified_by = grailsApplication.config.emikat.user_ref
			
			if (!gemeindeInstance.hasErrors() && gemeindeInstance.save(flush: true)) {
				if (toAction == "erfassung1korrektur" || toAction == "erfassung2korrektur") {
					flash.message = "${message(code: 'default.updated.message')}"
				} else if (toController == "gebaeude" && toAction == "korrektur") {
					redirect(controller: "gebaeude", action: "korrektur", id: params.gebId)
				} else if (toController == "arbeitsstaette" && toAction == "korrektur") {
					redirect(controller: "arbeitsstaette", action: "korrektur", id: params.arbId)
				} else if (session.user != grailsApplication.config.emikat.admin.name) {
					if(toController == "gemeinde" && toAction == "abgeben") {
						session.editierbar = false;
						session.ueberpruefung = false;
						flash.message = "Abgeben erfolgreich!"
						redirect(controller: "gemeinde", action: "abgabe")
					}
				} else if (session.user == grailsApplication.config.emikat.admin.name) {
					if(toController == "gemeinde" && toAction == "zurueckstellen") {
						flash.message = "Zurückstellen erfolgreich!"
						
						//Setzen neuer Gemeinde, da aktuelle zurückgesetzt wurde und nicht mehr sichtbar ist (siehe UserController)
						def gemeinde = Gemeinde.findBySzm_version_refAndAbgabeIsNotNull(session.svr, ['sort': 'id', 'order':'asc', 'max':1]);
						if (gemeinde) {
							userService.setGemeinde(gemeinde)
						} else {
							flash.message = "${message(code: 'at.emikat.gemerh.ooe.gemeinde.keine.gefunden', default: 'Keine Gemeinde gefunden!')}"
						}
						
						redirect(controller: "gemeinde", action: "list")
					} else if (toController == "gemeinde" && toAction == "freigeben") {
						flash.message = "Freigeben erfolgreich!"
						session.editierbar = false
						redirect(controller: "gemeinde", action: "abgabe")
					}
				}
				redirect(controller: toController, action: toAction)
			}
			else {
				render(view: from, model: [gemeindeInstance: gemeindeInstance])
			}
		} else {
			redirect(controller: toController, action: toAction)
		}
	}
	
	private ueberpruefung = {gem ->
		def erfassung1 = false
		def erfassung2 = false
		def gebList = null
		def arbList = null
		def arbNeues = false
		
		erfassung1 = !ueberpruefungService.ueberpruefeE1(gem)
		erfassung2 = !ueberpruefungService.ueberpruefeE2(gem)
		gebList = ueberpruefungService.ueberpruefeGebList(Gebaeude.findAllByGemeinde(gem))
		arbList = ueberpruefungService.ueberpruefeArbList(Arbeitsstaette.findAllByGemeinde(gem))
		arbNeues = ueberpruefungService.ueberpruefeArbListAufNeues(Arbeitsstaette.findAllByGemeinde(gem))
		
		return [gemeindeInstance: gem, erfassung1: erfassung1, erfassung2: erfassung2, gebList: gebList, arbList: arbList, arbNeues: arbNeues]
	}
	
	private abgeben = {gem ->
		if (!ueberpruefungService.e1_bearbeiter_name(gem) || !ueberpruefungService.e1_bearbeiter_tel_1(gem) || !ueberpruefungService.e1_bearbeiter_tel_2(gem)) {
			return false
		} else { return true }
	}
	
	def erfassung1Speichern = {
		update("erfassung1", "gemeinde", "erfassung1", params)
	}
	
	def erfassung1KorrekturSpeichern = {
		update("erfassung1korrektur", "gemeinde", "erfassung1korrektur", params)
	}
	
	def erfassung2Speichern = {
		update("erfassung2", "gemeinde", "erfassung2", params)
	}
	
	def erfassung2KorrekturSpeichern = {
		update("erfassung2korrektur", "gemeinde", "erfassung2korrektur", params)
	}
	
	def abgabeSpeichern = {
		update("abgabe", "gemeinde", "abgabe", params)
	}
	
	def erfassung1weiter = {
		update("erfassung1", "gemeinde", "erfassung2", params)
	}
	
	def erfassung2zurueck = {
		update("erfassung2", "gemeinde", "erfassung1", params)
	}
	
	def erfassung2weiter = {
		update("erfassung2", "gemeinde", "abgabe", params)
	}
	
	def abgabeAbgeben = {
		update("abgabe", "gemeinde", "abgeben", params)
	}
	
	def abgabeZurueck = {
		update("abgabe", "gemeinde", "erfassung2", params)
	}
	
	def listGebaeude = {
		update("erfassung1", "gebaeude", "list", params)
	}
	
	def listArbeitsstaetten = {
		update("erfassung2", "arbeitsstaette", "list", params)
	}
	
	def erfassung1KorrekturLogout = {
		update("erfassung1korrektur", "user", "logout", params)
	}
	
	def erfassung1Logout = {
		update("erfassung1", "user", "logout", params)
	}
	
	def erfassung2Logout = {
		update("erfassung2", "user", "logout", params)
	}
	
	def erfassung2KorrekturLogout = {
		update("erfassung1korrekturs", "user", "logout", params)
	}
	
	def abgabeLogout = {
		update("abgabe", "user", "logout", params)
	}
	
	def uebersichtLogout = {
		redirect(controller: "user", action: "logout")
	}
	
	def erfassung1Uebersicht = {
		update("erfassung1", "gemeinde", "list", params)
	}
	
	def erfassung1KorrekturUebersicht = {
		update("erfassung1korrektur", "gemeinde", "list", params)
	}
	
	def erfassung2Uebersicht = {
		update("erfassung2", "gemeinde", "list", params)
	}
	
	def erfassung2KorrekturUebersicht = {
		update("erfassung2korrektur", "gemeinde", "list", params)
	}
	
	def abgabeUebersicht = {
		update("abgabe", "gemeinde", "list", params)
	}
	
	def ueberpruefungToggle = {
		session.ueberpruefung = !session.ueberpruefung
		update("abgabe", "gemeinde", "abgabe", params)
	}
	
	def erfassung1KorrekturAbgabe = {
		update("erfassung1korrektur", "gemeinde", "abgabe", params)
	}
	
	def erfassung2KorrekturAbgabe = {
		update("erfassung2korrektur", "gemeinde", "abgabe", params)
	}
	
	def korrekturErfassung1 = {
		update("abgabe", "gemeinde", "erfassung1korrektur", params)
	}
	
	def korrekturErfassung2 = {
		update("abgabe", "gemeinde", "erfassung2korrektur", params)
	}
	
	def korrekturGebaeude = {
		update("abgabe", "gebaeude", "korrektur", params)
	}
	
	def korrekturArbeitsstaette = {
		update("abgabe", "arbeitsstaette", "korrektur", params)
	}
	
	def korrekturArbeitsstaetteNeu = {
		update("abgabe", "arbeitsstaette", "list", params)
	}
	
	def zurueckstellen = {
		update("abgabe", "gemeinde", "zurueckstellen", params)
	}
	
	def freigeben = {
		update("abgabe", "gemeinde", "freigeben", params)
	}
}