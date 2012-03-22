package at.emikat.gemerh.ooe

class GeneralFilters {
	
	def grailsApplication
	
	def filters = {
		//		Sobald abgegeben: Meldung, dass abgegeben wurde und keine Daten mehr verändert werden können (Ansichten Arbeitsstätte bzw. Gebäude)
		abgegebenArbGeb(controller: 'arbeitsstaette|gebaeude', action: '*') {
			before = {
				if (session.editierbar == false) {
					if (session.user == grailsApplication.config.emikat.admin.name) {
						flash.message = "Gemeinde freigegeben. Bearbeitung nicht möglich."
					} else {
						flash.message = "Daten bereits abgegeben. Bearbeitung nicht möglich."
					}
				}
			}
		}
		
		//		Sobald abgegeben: Meldung, dass abgegeben wurde und keine Daten mehr verändert werden können (Ansichten Gemeinde)
		abgegebenGem(controller: 'gemeinde', action: 'abgabe|erfassung1|erfassung1korrektur|erfassung2|erfassung2korrektur') {
			before = {
				if (session.editierbar == false) {
					if (session.user == grailsApplication.config.emikat.admin.name) {
						flash.message = "Gemeinde freigegeben. Bearbeitung nicht möglich."
					} else {
						flash.message = "Daten bereits abgegeben. Bearbeitung nicht möglich."
					}
				}
			}
		}
	}
	
}
