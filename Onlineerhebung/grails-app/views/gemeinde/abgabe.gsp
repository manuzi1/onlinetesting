<%@ page import="at.emikat.gemerh.ooe.Gemeinde" %>

<head>
	<meta name="layout" content="main" />
	
	<title>
		<g:message code="at.emikat.gemerh.ooe.seitentitel.abgabe"
			default="Gemeindeerhebung 2010 - Abgabe" />
	</title>
</head>

<body>
	<g:form method="post" >
	  	<div id="info">
	   		<h1>
	   			<span class="float-left">
	   				<g:actionSubmit class="invisible" action="abgabeSpeichern" value="${message(code:
							'at.emikat.gemerh.ooe.button.speichern', default: 'Speichern')}" />
	   			
		    		<g:if test="${session.user == grailsApplication.config.emikat.admin.name || session.user == grailsApplication.config.emikat.support.name}">
						<g:actionSubmit class="button" action="abgabeUebersicht"
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
				
				<g:actionSubmit class="float-right logout button" action="abgabeLogout"
					value="${message(code: 'at.emikat.gemerh.ooe.button.logout', default:'Ausloggen')}" />
				
				<span class="float-right">
					<g:message code="at.emikat.gemerh.ooe.gemeindecode" default="Gemeindecode nach Statistik Austria:" />
					${session.gemkz}
				</span>
			</h1>
			
			<g:render template="/layouts/infobar" />
		</div>
		
		<div id="content">
			<div class="titel_info">
	           	<span class="float-left">
		        	<g:message code="at.emikat.gemerh.ooe.abgabe.seite"
	        			default="Überprüfung und Abgabe" />
		        </span>
		        	
		        <g:render template="/layouts/info_abgabe" />
			</div>
	        
	        
	        
			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
			</g:if>
			
			<g:hasErrors bean="${gemeindeInstance}">
				<div class="errors">
				    <g:renderErrors bean="${gemeindeInstance}" as="list" />
				</div>
			</g:hasErrors>
		
			<g:hiddenField name="id" value="${gemeindeInstance?.id}" />
			<g:hiddenField name="version" value="${gemeindeInstance?.version}" />
			
			<g:actionSubmit class="invisible" action="abgabeAbgeben" value="${message(code:
				'at.emikat.gemerh.ooe.button.abgeben', default: 'Abgeben')}" />
			
			<g:if test="${session.editierbar}">
				<h2><g:message code="at.emikat.gemerh.ooe.ueberpruefung"
					default="Überprüfung" /></h2>

            	<div class="panel">
	            	<g:if test="${session.ueberpruefung}">
	            		<g:actionSubmit class="button" action="ueberpruefungToggle" value="${message(code:
							'at.emikat.gemerh.ooe.button.ueberpruefung.beenden', default: 'Überprüfung beenden')}" />
	            	</g:if>
	            	
	            	<g:else>
	            		<g:actionSubmit class="button" action="ueberpruefungToggle" value="${message(code:
							'at.emikat.gemerh.ooe.button.ueberpruefung.starten', default: 'Überprüfung starten')}" />
					</g:else>
					
					<br />
					
					<g:if test="${session.ueberpruefung && erfassung1}">
						<label class="labellang">
							<g:message code="at.emikat.gemerh.ooe.erfassung.seite" args="[1, 2]"
		       				default="Erfassung Seite 1 von 2" />
		       			</label>
	            		<g:link class="button float-left" controller="gemeinde" action="erfassung1korrektur">
		       				<g:message code="at.emikat.gemerh.ooe.button.ueberpruefung.korrigieren" default="Korrigieren" />
		       			</g:link>
						<br />
	            	</g:if>
	            	
	            	<g:if test="${session.ueberpruefung && erfassung2}">
						<label class="labellang">
							<g:message code="at.emikat.gemerh.ooe.erfassung.seite" args="[2, 2]"
		       				default="Erfassung Seite 2 von 2" />
		       			</label>
	            		<g:link class="button float-left" controller="gemeinde" action="erfassung2korrektur">
		       				<g:message code="at.emikat.gemerh.ooe.button.ueberpruefung.korrigieren" default="Korrigieren" />
		       			</g:link>
						<br />
	            	</g:if>
	            	
	            	<g:if test="${session.ueberpruefung}">
		            	<g:each in="${gebList}" status="i" var="geb">
	            			<label class="labellang">
								<g:message code="at.emikat.gemerh.ooe.gebaeudenr"
		       						default="Gebäude Nr." />&nbsp;
		       					${geb.nr}
		       				</label>
	            			<g:link class="button float-left" controller="gebaeude" action="korrektur" id="${geb.id}">
		       					<g:message code="at.emikat.gemerh.ooe.button.ueberpruefung.korrigieren" default="Korrigieren" />
		       				</g:link>
	            			<br />
		            	</g:each>
	            	</g:if>
	            	
	            	<g:if test="${session.ueberpruefung}">
		            	<g:each in="${arbList}" status="i" var="arb">
	            			<label class="labellang">
								<g:message code="at.emikat.gemerh.oee.arbeitsstaette.label"
		       						default="Arbeitsstätte" />&nbsp;
		       					${arb.name}
		       				</label>
		       				<g:link class="button float-left" controller="arbeitsstaette" action="korrektur" id="${arb.id}">
		       					<g:message code="at.emikat.gemerh.ooe.button.ueberpruefung.korrigieren" default="Korrigieren" />
		       				</g:link>
							<br />
		            	</g:each>
	            	</g:if>
	            	
	            	<g:if test="${session.ueberpruefung && arbNeues}">
						<label class="labellang">
							<g:message code="at.emikat.gemerh.ooe.arbeitsstaette.aenderungen"
		       				default="Arbeitsstättenänderungen" />
		       			</label>
		       			<g:link class="button float-left" controller="arbeitsstaette" action="list">
		       				<g:message code="at.emikat.gemerh.ooe.button.ueberpruefung.korrigieren" default="Korrigieren" />
		       			</g:link>
						<br />
	            	</g:if>
	            	
	            	<g:if test="${session.ueberpruefung && !erfassung1 && !erfassung2 && !gebList && !arbList && !arbNeues}">
	            		<label class="labellang">
							<g:message code="at.emikat.gemerh.ooe.ueberpruefung.passt"
		       				default="Keine Fehler gefunden!" />
		       			</label>
	            	</g:if>
				</div>
			</g:if>
                        
			<h2><g:message code="at.emikat.gemerh.ooe.abgabe" default="Abgabe" /></h2>
			
            <div class="panel">
            <div class="float-left">
            	<label class="labellang" for="anmerkungen">
            		<g:message code="at.emikat.gemerh.ooe.abgabe.anmerkungen" default="Anmerkungen" />
            	</label>
            	<span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
					field: 'anmerkungen', 'fehlerhinweis')}">&nbsp;
				</span>
				
				<g:if test="${session.editierbar}">
					<br />
					<br />
					<span class="float-left">
						<g:actionSubmit class="button abstand-links-kurz" action="abgabeSpeichern" value="${message(code:
							'at.emikat.gemerh.ooe.button.speichern.anmerkungen', default: 'Anmerkungen speichern')}" />
					</span>
				</g:if>
				
				</div>
				
				<div class="float-left">
	            	<g:if test="${session.editierbar}">
	            		<g:textArea cols="40" rows="10" name="anmerkungen"
							value="${fieldValue(bean: gemeindeInstance, field: 'anmerkungen')}" />
					</g:if>
					<g:else>
	            		<g:textArea class="disabled" cols="40" rows="10" name="anmerkungen" readonly="readonly"
							value="${fieldValue(bean: gemeindeInstance, field: 'anmerkungen')}" />
					</g:else> 	
				</div>
			</div> 
					
			<g:if test="${session.user == grailsApplication.config.emikat.admin.name}">
	     		<div class="panel">
	     			<div class="float-left">
		            	<label class="labellang" for="anmerkungen_behoerde">
		            		<g:message code="at.emikat.gemerh.ooe.freigabe.kommentar"
		            			default="Behördenkommentar" />
		            	</label>
		            	<span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
							field: 'anmerkungen_behoerde', 'fehlerhinweis')}">&nbsp;
						</span>
						
						<g:if test="${session.editierbar}">
							<br />
							<br />
							<span class="float-left">
								<g:actionSubmit class="button abstand-links-kurz" action="abgabeSpeichern" value="${message(code:
									'at.emikat.gemerh.ooe.button.speichern.behoerdenkommentar', default: 'Behördenkommentar speichern')}" />
							</span>
						</g:if>
					</div>
						<div class="float-left">
						<g:if test="${session.editierbar}">
		            		<g:textArea cols="40" rows="10" name="anmerkungen_behoerde"
								value="${fieldValue(bean: gemeindeInstance, field: 'anmerkungen_behoerde')}" />
						</g:if>
						<g:else>
		            		<g:textArea class="disabled" cols="40" rows="10" name="anmerkungen_behoerde" readonly="readonly"
								value="${fieldValue(bean: gemeindeInstance, field: 'anmerkungen_behoerde')}" />
						</g:else>
	            	</div>
				</div> 
			</g:if>

			<div id="navigation">
				<span class="float-left">
					<g:actionSubmit class="button" action="abgabeZurueck" value="${message(code:
					'at.emikat.gemerh.ooe.button.zurueck', default: 'Zurück')}" />
				</span>
				
				<g:if test="${session.editierbar}">
					<span class="float-left abstand">
						<g:actionSubmit class="button" action="abgabeSpeichern" value="${message(code:
							'at.emikat.gemerh.ooe.button.speichern', default: 'Speichern')}" />
					</span>
				</g:if>
				
				<g:if test="${session.editierbar && session.user != grailsApplication.config.emikat.admin.name}">				
					<g:if test="${erfassung1 || erfassung2 || gebList || arbList || arbNeues}">
		            	<span class="float-right">
							<g:actionSubmit class="button bold" action="abgabeAbgeben" value="${message(code:
								'at.emikat.gemerh.ooe.button.abgeben', default: 'ABGEBEN')}" 
								onclick="return confirm('${message(code: 'at.emikat.gemerh.ooe.bestaetigung.abgabe.prueffehler',
								default: 'Es bestehen noch Prüffehler, wollen Sie wirklich schon abgeben? Sie können dann keine Daten mehr ändern.')}');" />
						</span>
					</g:if>
					
					<g:else>
		            	<span class="float-right">
							<g:actionSubmit class="button bold" action="abgabeAbgeben" value="${message(code:
								'at.emikat.gemerh.ooe.button.abgeben', default: 'ABGEBEN')}"
								onclick="return confirm('${message(code: 'at.emikat.gemerh.ooe.bestaetigung.abgabe',
								default: 'Wollen Sie wirklich abgeben? Sie können dann keine Daten mehr ändern.')}');" />
						</span>
					</g:else>
				</g:if>
				
				<g:if test="${session.user == grailsApplication.config.emikat.admin.name && session.editierbar}">
					<span class="float-right abstand-links-kurz">
						<g:actionSubmit class="button" action="freigeben" value="${message(code:
							'at.emikat.gemerh.ooe.button.freigeben', default: 'Freigeben')}"
							onclick="return confirm('${message(code: 'at.emikat.gemerh.ooe.bestaetigung.freigabe',
							default: 'Wollen Sie diese Gemeinde wirklich freigeben? Sie können dann keine Daten mehr ändern.')}');" />
					</span>
					
					<span class="float-right">
						<g:actionSubmit class="button" action="zurueckstellen" value="${message(code:
							'at.emikat.gemerh.ooe.button.zurueckstellen', default: 'Zurückstellen')}"
							onclick="return confirm('${message(code: 'at.emikat.gemerh.ooe.bestaetigung.zurueckstellen',
							default: 'Wollen Sie diese Gemeinde wirklich zurückstellen?')}');" />
					</span>
				</g:if>
			</div>
		</div>
   	</g:form>
</body>