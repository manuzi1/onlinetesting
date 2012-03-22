<%@ page import="at.emikat.gemerh.ooe.Arbeitsstaette" %>

<head>
	<meta name="layout" content="main" />
    
    <title>
    	<g:message code="at.emikat.gemerh.ooe.seitentitel.arbeitsstaette.details"
    		default="Gemeindeerhebung 2010 - Arbeitsstättendetails" />
    </title>
</head>

<body>
    	<g:form method="post" >
	  	<div id="info">
	   		<h1>
	   			<span class="float-left">
	   				<g:actionSubmit class="invisible" action="speichern" value="${message(code:
						'at.emikat.gemerh.ooe.button.speichern', default: 'Speichern')}" />
	   			
		    		<g:if test="${session.user == grailsApplication.config.emikat.admin.name || session.user == grailsApplication.config.emikat.support.name}">
						<g:actionSubmit class="button" action="editUebersicht"
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
				
				<g:actionSubmit class="float-right logout button" action="editLogout"
					value="${message(code: 'at.emikat.gemerh.ooe.button.logout', default:'Ausloggen')}" />
				
				<span class="float-right">
					<g:message code="at.emikat.gemerh.ooe.gemeindecode" default="Gemeindecode nach Statistik Austria:" />
					${session.gemkz}
				</span>
			</h1>
			
			<g:render template="/layouts/infobar" />
		</div>
		
		<g:render template="/arbeitsstaette/detailansicht" />

		<div id="navigation">
            <span class="float-left">
				<g:actionSubmit class="button" action="uebersicht" value="${message(code: 'at.emikat.gemerh.oee.button.zurueck', default: 'Zurück')}" />
			</span>
			
			<span class="float-left abstand">
				<g:actionSubmit class="button" action="zurueck" value="${message(code: 'at.emikat.gemerh.oee.button.arbeitsstaette.zurueck', default: 'Vorherige Arbeitsstätte')}" />
			</span>
			
			<g:if test="${session.editierbar}">
				<span class="float-left abstand">
					<g:actionSubmit class="button" action="speichern" value="${message(code:
						'at.emikat.gemerh.ooe.button.speichern', default: 'Speichern')}" />
				</span>
			</g:if>
			
			<g:if test="${session.editierbar && arbeitsstaetteInstance?.status == 'NEU'}">
				<span class="float-left abstand">
					<g:actionSubmit class="button" action="delete" value="${message(code:
						'at.emikat.gemerh.ooe.button.loeschen', default: 'Löschen')}"
			        	onclick="return confirm('${message(code: 'at.emikat.gemerh.ooe.bestaetigung.arbeitsstaette.loeschen',
			        	default: 'Wollen Sie diese Arbeitsstätte wirklich löschen?')}');" />
				</span>
			</g:if>
			
			<span class="float-right">
				<g:actionSubmit class="button" action="weiter" value="${message(code: 'at.emikat.gemerh.oee.button.arbeitsstaette.weiter', default: 'Nächste Arbeitsstätte')}" />
			</span>
		</div>
	</g:form>
</body>
