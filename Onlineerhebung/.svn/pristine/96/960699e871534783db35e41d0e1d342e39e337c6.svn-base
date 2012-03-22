<%@ page import="at.emikat.gemerh.ooe.Gemeinde" %>

<head>
	<meta name="layout" content="main" />
	
	<title>
		<g:message code="at.emikat.gemerh.ooe.seitentitel.erfassung" args="[2, 2]"
			default="Gemeindeerhebung 2010 - Erfassung Seite 2 von 2" />
	</title>
</head>

<body>
	<g:form method="post" >
	  	<div id="info">
	   		<h1>
	   			<span class="float-left">
	   				<g:actionSubmit class="invisible" action="erfassung2KorrekturSpeichern" value="${message(code:
						'at.emikat.gemerh.ooe.button.speichern', default: 'Speichern')}" />
	   			
		    		<g:if test="${session.user == grailsApplication.config.emikat.admin.name || session.user == grailsApplication.config.emikat.support.name}">
						<g:actionSubmit class="button" action="erfassung2KorrekturUebersicht"
							value="${message(code: 'at.emikat.gemerh.ooe.gemeinde', default:'Gemeinde:')}" />
					</g:if>
				
					<g:else>
						<g:message code="at.emikat.gemerh.ooe.gemeinde" default="Gemeinde:" />
					</g:else>
				</span>
				
				<span class="float-left platzklein">	
					${session.gemeindename}
				</span>
				
				<g:if test="${session.user == grailsApplication.config.emikat.admin.name || session.user == grailsApplication.config.emikat.support.name}">
	    				<span class="float-left">
	    					(${session.user})
	    				</span>
				</g:if>
				
				<g:actionSubmit class="float-right logout button" action="erfassung2KorrekturLogout"
					value="${message(code: 'at.emikat.gemerh.ooe.button.logout', default:'Ausloggen')}" />
				
				<span class="float-right">
					<g:message code="at.emikat.gemerh.ooe.gemeindecode" default="Gemeindecode nach Statistik Austria:" />
					${session.gemkz}
				</span>
			</h1>
			
			<g:render template="/layouts/infobar" />
		</div>

		<g:render template="/gemeinde/erfassung2" />		

		<div id="navigation">
			<g:if test="${session.editierbar}">
				<span class="float-left">
					<g:actionSubmit class="button" action="erfassung2KorrekturSpeichern" value="${message(code:
						'at.emikat.gemerh.ooe.button.speichern', default: 'Speichern')}" />
				</span>
			</g:if>
		
			<span class="float-right">
				<g:actionSubmit class="button" action="erfassung2KorrekturAbgabe" value="${message(code:
					'at.emikat.gemerh.ooe.button.ueberpruefung.zurueck.zur.abgabe', default: 'Zurück zur Abgabe')}" />
			</span>
		</div>
   	</g:form>
</body>