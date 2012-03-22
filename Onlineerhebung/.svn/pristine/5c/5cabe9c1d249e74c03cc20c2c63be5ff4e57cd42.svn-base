package at.emikat.gemerh.ooe

class SecurityFilters {
	
	def grailsApplication
	
	def filters = {
//		überprüft ob man eingeloggt ist, falls nicht, wird die Loginseite aufgerufen
		loginCheck(controller: '*', action: '*') {
			before = {
				if(!session.user && actionName != 'login') {
					redirect(controller: 'user', action: 'login')
					return false
				}
			}
		}
		
//		falls man eingeloggt ist und die Loginseite aufruft, wird die erste Seite aufgerufen
		alreadyLoggedIn(controller: 'user', action: 'login') {
			before = {
				if (session.user) {
					redirect(controller: 'gemeinde', action: 'list')
					return false
				}
			}
		}
		
//		Admin- & Supportbereich
		admin(controller: 'gemeinde', action: 'list') {
			before = {
				if (!(session.user == grailsApplication.config.emikat.admin.name || session.user == grailsApplication.config.emikat.support.name)) {
					redirect(controller: 'gemeinde', action: 'erfassung1')
					return false
				}
			}
		}		
	}
}
