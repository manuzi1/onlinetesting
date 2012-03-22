package at.emikat.gemerh.ooe

import javax.servlet.http.HttpSession
import org.springframework.web.context.request.RequestContextHolder

class UserService {
	
	def grailsApplication
	def sqlService
	
	static transactional = false
	
	def setGemeinde (gemeinde) {
		getSession().gemid = gemeinde?.id
		getSession().gemkz = gemeinde?.gemkz
		getSession().gemeindename = gemeinde?.name
		getSession().ueberpruefung = false
		
		// Bestimmung ob noch editiert werden darf (geht nur vor Abgabe oder als Admin)
		if ((getSession().user == grailsApplication.config.emikat.admin.name && !gemeinde.freigabe) || !gemeinde.abgabe) {
			getSession().editierbar = true
		} else {
			getSession().editierbar = false
		}
		
	}
	
	private HttpSession getSession() {
		return RequestContextHolder.currentRequestAttributes().getSession()
	}
}
