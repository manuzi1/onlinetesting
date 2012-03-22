package at.emikat.gemerh.ooe


import at.emikat.gemerh.ooe.Gemeinde;
import at.emikat.gemerh.ooe.User;
import grails.util.GrailsUtil

class UserController {
	
	def defaultAction = 'login'
	
	def grailsApplication
	def sqlService
	def userService
	
	def logout = { 
		session.invalidate()
		redirect(action: "login")
	}
	
	def login = { LoginCommand cmd ->		
		
		if (request.method == 'POST') {
			if (!cmd.hasErrors()) {
				session.user = cmd.user.name
				session.szenario = sqlService.szenario()
				
				switch(GrailsUtil.environment) {
					case "development":
					session.svr = sqlService.svr("RAHZ", session.szenario)
					break
					case "production":
					session.svr = sqlService.svr("GEME", session.szenario)
					break
				}
				
				session.vweh = sqlService.svr("VWEH", session.szenario)
				
				if (cmd.user.name == grailsApplication.config.emikat.admin.name) { //Einloggen als Admin
					//Setzen einer Standardgemeinde, siehe auch GemeindeController (Update, Zurückstellen)
					def gemeinde = Gemeinde.findBySzm_version_refAndAbgabeIsNotNull(session.svr, ['sort': 'id', 'order':'asc', 'max':1]);
					if (gemeinde) {
						userService.setGemeinde(gemeinde)
						log.error("Benutzer $cmd.user.name hat sich eingeloggt.")
						redirect(controller: "gemeinde", action: "list")
					} else {
						flash.message = "${message(code: 'at.emikat.gemerh.ooe.gemeinde.keine.gefunden', default: 'Keine Gemeinde gefunden!')}"
						redirect(controller: "gemeinde", action: "list")
					}
				} else if (cmd.user.name == grailsApplication.config.emikat.support.name) { //Einloggen als Support
					def gemeinde = Gemeinde.findBySzm_version_ref(session.svr, ['sort': 'id', 'order':'asc', 'max':1]);
					if (gemeinde) {
						userService.setGemeinde(gemeinde)
						log.error("Benutzer $cmd.user.name hat sich eingeloggt.")
						redirect(controller: "gemeinde", action: "list")
					} else {
						flash.message = "${message(code: 'at.emikat.gemerh.ooe.gemeinde.keine.gefunden', default: 'Keine Gemeinde gefunden!')}"
						redirect(controller: "gemeinde", action: "list")
					}
				} else { //Einloggen als normale Gemeinde
					userService.setGemeinde(Gemeinde.findBySzm_version_refAndGemkz(session.svr, cmd.user.name))
					log.error("Benutzer $cmd.user.name hat sich eingeloggt.")
					redirect(controller: "gemeinde", action: "erfassung1")
				}
			}
			else {
				render(view: 'login', model:[loginCmd:cmd])
			}
		}
		
		else {
			render(view: 'login')
		}
	}
	
	class LoginCommand {
		def grailsApplication
		def sqlService
		
		String login
		String passwort
		private User user
		
		User getUser() {
			
			if (!user && login) {				
				if (login == grailsApplication.config.emikat.admin.name) {
					user = new User(login, grailsApplication.config.emikat.admin.passwort)
				} else if (login == grailsApplication.config.emikat.support.name) {
					user = new User(login, grailsApplication.config.emikat.support.passwort)
				} else if (login ==~ /\d+/) {
					
					switch(GrailsUtil.environment) {
						case "development":
							user = new User(login, Gemeinde.findBySzm_version_refAndGemkz(sqlService.svr("RAHZ", sqlService.szenario()), login)?.passwort)
							break
						case "production":
							user = new User(login, Gemeinde.findBySzm_version_refAndGemkz(sqlService.svr("GEME", sqlService.szenario()), login)?.passwort)
							break
					}
				}
			}
			return user
		}
		
		static constraints = {
			login blank: false, validator:{ val, cmd ->
				if (!cmd.user) {
					return "at.emikat.gemerh.ooe.meldung.fehler.login"
				}
			}
			
			passwort blank:false, validator:{ val, cmd ->
				if (cmd.user && cmd.user.passwort != val) {
					return "at.emikat.gemerh.ooe.meldung.fehler.login"
				}
			}	
		}
	}
}