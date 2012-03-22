<%@ page import="at.emikat.gemerh.ooe.Arbeitsstaette" %>

<head>
	<meta name="layout" content="main" />
       
	<title>
		<g:message code="at.emikat.gemerh.ooe.seitentitel.arbeitsstaetten.uebersicht"
			default="Gemeindeerhebung 2010 - Arbeitsstättenübersicht" />
	</title>
</head>

<body>
	<g:form method="post" >
	  	<div id="info">
	   		<h1>
	   			<span class="float-left">
		    		<g:if test="${session.user == grailsApplication.config.emikat.admin.name || session.user == grailsApplication.config.emikat.support.name}">
						<g:actionSubmit class="button" action="listUebersicht"
							value="${message(code: 'at.emikat.gemerh.ooe.gemeinde', default:'Gemeinde:')}" />
					</g:if>
				
					<g:else>
						<g:message code="at.emikat.gemerh.ooe.gemeinde" default="Gemeinde:" />
					</g:else>
				</span>
				
				<span class="float-left platzklein">	
					${session.gemeindename}
				</span>
				
				<g:if test="${session.user == grailsApplication.config.emikat.admin.name}">
	    				<span class="float-left">
	    					(${session.user})
	    				</span>
				</g:if>
				
				<g:actionSubmit class="float-right logout button" action="listLogout"
					value="${message(code: 'at.emikat.gemerh.ooe.button.logout', default:'Ausloggen')}" />
				
				<span class="float-right">
					<g:message code="at.emikat.gemerh.ooe.gemeindecode" default="Gemeindecode nach Statistik Austria:" />
					${session.gemkz}
				</span>
			</h1>
			
			<g:render template="/layouts/infobar" />
		</div>
	</g:form>

    <div id="content">
    	<div class="titel_info">
           	<span class="float-left">
	        	<g:message code="at.emikat.gemerh.ooe.arbeitsstaetten.uebersicht.seite"
        			default="Arbeitsstätten " />
	        </span>
	        	
	        <g:render template="/layouts/info_arbeitsstaettelist" />
		</div>
        
        <g:if test="${flash.message}">
       		<div class="message">${flash.message}</div>
        </g:if>
        
        <g:hasErrors bean="${arb}">
	        <div class="errors">
	            <g:renderErrors bean="${arb}" as="list" />
	        </div>
	    </g:hasErrors>
        
		<h2><g:message code="at.emikat.gemerh.ooe.arbeitsstaetten.uebersicht"
		  	default="Übersicht Arbeitsstätten"/></h2>
            
        <div class="list">
            <table>
                <thead>
                    <tr>
                    	<g:sortableColumn property="arbid" title="${message(code:
							'at.emikat.gemerh.ooe.arbeitsstaetten.arbid', default: 'Arbeitsstätten-ID')}" />
                    
                        <g:sortableColumn property="name" title="${message(code:
							'at.emikat.gemerh.ooe.arbeitsstaetten.name', default: 'Name')}" />
                    
                        <g:sortableColumn property="adr_plz" title="${message(code:
							'at.emikat.gemerh.ooe.arbeitsstaetten.plz', default: 'PLZ')}" />
                    
                        <g:sortableColumn property="adr_ort" title="${message(code:
							'at.emikat.gemerh.ooe.arbeitsstaetten.ort', default: 'Ort')}" />
                    
                        <g:sortableColumn property="adr_strasse" title="${message(code:
							'at.emikat.gemerh.ooe.arbeitsstaetten.strasse', default: 'Straße')}" />
							
						<g:sortableColumn property="adr_nr" title="${message(code:
							'at.emikat.gemerh.ooe.arbeitsstaetten.nr', default: 'Hausnr.')}" />
							
						<g:sortableColumn property="taetigkeit" title="${message(code:
							'at.emikat.gemerh.ooe.arbeitsstaetten.taetigkeit', default: 'Tätigkeit')}" />
							
						<g:sortableColumn property="stilllegung_jahr" title="${message(code:
							'at.emikat.gemerh.ooe.arbeitsstaetten.stilllegung.jahr', default: 'Stilllegungsjahr')}" />
							
						<g:sortableColumn property="name_neu" title="${message(code:
							'at.emikat.gemerh.ooe.arbeitsstaetten.name.neu', default: 'Neuer Name')}" />
							
						<th class="sortable">&nbsp;</th>

						<th class="sortable">&nbsp;</th>
                    </tr>
				</thead>
				
				<tbody>
                    <g:each in="${arbeitsstaetteInstanceList}" status="i" var="arbeitsstaetteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">                  
                            <td>
                            	<g:link action="edit" id="${arbeitsstaetteInstance.id}">
                            		${fieldValue(bean: arbeitsstaetteInstance,
										field: "arbid")}
								</g:link>
                            </td>
                            
                            <td>
                            	<g:link action="edit" id="${arbeitsstaetteInstance.id}">
                            		${fieldValue(bean: arbeitsstaetteInstance,
										field: "name")}
								</g:link>
                            </td>
                        
                            <td>
                            	<g:link action="edit" id="${arbeitsstaetteInstance.id}">
                            		${arbeitsstaetteInstance?.adr_plz}
								</g:link>
                            </td>
                        
                            <td>
                            	<g:link action="edit" id="${arbeitsstaetteInstance.id}">
                            		${fieldValue(bean: arbeitsstaetteInstance,
										field: "adr_ort")}
								</g:link>
                            </td>
                        
                            <td>
                            	<g:link action="edit" id="${arbeitsstaetteInstance.id}">
                            		${fieldValue(bean: arbeitsstaetteInstance,
										field: "adr_strasse")}
								</g:link>
                            </td>
                            
                            <td>
                            	<g:link action="edit" id="${arbeitsstaetteInstance.id}">
                            		${fieldValue(bean: arbeitsstaetteInstance,
										field: "adr_nr")}
								</g:link>
                            </td>
                            
                            <td>
                            	<g:link action="edit" id="${arbeitsstaetteInstance.id}">
                            		${fieldValue(bean: arbeitsstaetteInstance,
										field: "taetigkeit")}
								</g:link>
                            </td>
                            
                            <td>
                            	<g:link action="edit" id="${arbeitsstaetteInstance.id}">
                            		${fieldValue(bean: arbeitsstaetteInstance,
										field: "stilllegung_jahr")}
								</g:link>
                            </td>
                            
                            <td>
                            	<g:link action="edit" id="${arbeitsstaetteInstance.id}">
                            		${fieldValue(bean: arbeitsstaetteInstance,
										field: "name_neu")}
								</g:link>
                            </td>
                            
                            <td>
                            	<g:if test="${session.editierbar}">
		                        	<g:link class="button" action="edit" id="${arbeitsstaetteInstance.id}">
		                        		<g:message code = "at.emikat.gemerh.ooe.button.bearbeiten"
		                        		default="Bearbeiten" />
									</g:link>
	                        	</g:if>
	                        </td>
	                                    
                            <td>
                            	<g:if test="${session.editierbar && arbeitsstaetteInstance?.status == 'NEU'}">
                            		<g:link class="button" action="delete" id="${arbeitsstaetteInstance.id}"
                            			onclick="return confirm('${message(code:
										'at.emikat.gemerh.ooe.bestaetigung.arbeitsstaette.loeschen',
			        					default: 'Wollen Sie diese Arbeitsstätte wirklich löschen?')}');">
		                        		<g:message code = "at.emikat.gemerh.ooe.button.loeschen"
		                        		default="Löschen" />
									</g:link>
	                        	</g:if>
	                        </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
		</div>
		
		<g:if test="${arbeitsstaetteInstanceTotal > 10 }" >
			<div class="paginateButtons">
			    <g:paginate total="${arbeitsstaetteInstanceTotal}" />
			</div>
		</g:if>
		
		<g:form method="post" class="abstandoben">
	    	<div id="navigation">
				<span class="float-left">
					<g:actionSubmit class="button" action="ListZurueck" value="${message(code:
						'at.emikat.gemerh.ooe.button.zurueck',
						default: 'Zurück')}" />
				</span>
				
				<g:if test="${session.editierbar && session.ueberpruefung}">
					<span class="float-left abstand">
						<g:actionSubmit class="button" action="listAbgabe" value="${message(code:
							'at.emikat.gemerh.ooe.button.ueberpruefung.zurueck.zur.abgabe',
							default: 'Zurück zur Abgabe')}" />
					</span>
				</g:if>
				
					                      
               <g:if test="${session.editierbar && arb}">
                   	<span class="float-left abstand">
                 		<g:link class="button" action="checked">
                 			<g:message code = "at.emikat.gemerh.ooe.button.keine.aenderungen"
                 				default="Keine Änderungen" />
						</g:link>
					</span>
                </g:if>
				
				<g:if test="${session.editierbar}">
					<span class="float-right">
						<g:actionSubmit class="button" action="create" value="${message(code:
							'at.emikat.gemerh.ooe.button.arbeitsstaette.neu',
							default: 'Neue Arbeitsstaette hinzufügen')}" />
					</span>
				</g:if>
			</div>
		</g:form>
	</div>
</body>