<%@ page import="at.emikat.gemerh.ooe.Gebaeude" %>

<head>
	<meta name="layout" content="main" />
    
    <title>
    	<g:message code="at.emikat.gemerh.ooe.seitentitel.gebaeude.details"
    		default="Gemeindeerhebung 2010 - Gebäudedetails" />
    </title>
</head>

<body>
	<g:form method="post" >
	  	<div id="info">
	   		<h1>
	   			<span class="float-left">
	   				<g:actionSubmit class="invisible" action="save" value="${message(code: 'at.emikat.gemerh.oee.button.gebaeude.erstellen',
						default: 'Gebäude erstellen')}" />
	   			
		    		<g:if test="${session.user == grailsApplication.config.emikat.admin.name || session.user == grailsApplication.config.emikat.support.name}">
						<g:actionSubmit class="button" action="createUebersicht"
							value="${message(code: 'at.emikat.gemerh.ooe.gemeinde', default:'Gemeinde:')}"
							onclick="return confirm('${message(code: 'at.emikat.gemerh.ooe.bestaetigung.gebaeude.neu.gemeindeuebersicht',
							default: 'Wollen Sie wirklich das Erstellen des Gebäudes abbrechen und zur Gemeindeübersicht zurückkehren?')}');" />
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
				
				<g:actionSubmit class="float-right logout button" action="createLogout"
					value="${message(code: 'at.emikat.gemerh.ooe.button.logout', default:'Ausloggen')}"
					onclick="return confirm('${message(code: 'at.emikat.gemerh.ooe.bestaetigung.gebaeude.neu.logout',
					default: 'Wollen Sie wirklich das Erstellen des Gebäudes abbrechen und sich ausloggen?')}');" />
				
				<span class="float-right">
					<g:message code="at.emikat.gemerh.ooe.gemeindecode" default="Gemeindecode nach Statistik Austria:" />
					${session.gemkz}
				</span>
			</h1>
			
			<g:render template="/layouts/infobar" />
		</div>
		
		<g:render template="/gebaeude/detailansicht" />

		<div id="navigation">
            <span class="float-left">
				<g:actionSubmit class="button" action="list" value="${message(code: 'at.emikat.gemerh.ooe.button.abbrechen',
					default: 'Abbrechen')}" onclick="return confirm('${message(code: 'at.emikat.gemerh.ooe.bestaetigung.gebaeude.neu.abbruch',
					default: 'Wollen Sie wirklich das Erstellen des Gebäudes abbrechen und zur Gebaeudeübersicht zurückkehren?')}');" />
			</span>
			
			<g:if test="${session.editierbar}">
				<span class="float-right">
					<g:actionSubmit class="button" action="save" value="${message(code: 'at.emikat.gemerh.oee.button.gebaeude.erstellen',
						default: 'Gebäude erstellen')}" />
				</span>
			</g:if>
		</div>
	</g:form>
</body>
