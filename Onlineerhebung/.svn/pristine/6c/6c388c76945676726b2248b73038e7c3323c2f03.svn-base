<%@ page import="at.emikat.gemerh.ooe.Gebaeude" %>

<head>
    <meta name="layout" content="main" />
    
    <title>
    	<g:message code="at.emikat.gemerh.ooe.seitentitel.gebaeude.uebersicht"
    		default="Gemeindeerhebung 2010 - Gebäudeübersicht" />
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
	        	<g:message code="at.emikat.gemerh.ooe.gebaeude.uebersicht.seite"
        			default="Gebäudeübersicht" />
	        </span>
	        	
	        <g:render template="/layouts/info_gebaeudelist" />
		</div>
        
        <g:if test="${flash.message}">
        	<div class="message">${flash.message}</div>
        </g:if>
        
        <h2><g:message code="at.emikat.gemerh.ooe.gebaeude.uebersicht"
            	default="Übersicht öffentliche Gebäude"/></h2>
        
        <div class="list">
            <table>
                <thead>
                    <tr>
                        <g:sortableColumn property="nr" title="${message(code:
							'at.emikat.gemerh.ooe.gebaeude.nr',
							default: 'interne Nummer')}" />

                        <g:sortableColumn property="gebaeudeart" title="${message(code:
							'at.emikat.gemerh.ooe.gebaeude.nutzung',
							default: 'vorwiegende Nutzung')}" />
                        
                        <g:sortableColumn property="adr_plz" title="${message(code:
							'at.emikat.gemerh.ooe.gebaeude.adresse.plz',
							default: 'PLZ')}" />
                    
                        <g:sortableColumn property="adr_ort" title="${message(code:
							'at.emikat.gemerh.ooe.gebaeude.adresse.ort',
							default: 'Ort')}" />
                    
                        <g:sortableColumn property="adr_strasse" title="${message(code:
							'at.emikat.gemerh.ooe.gebaeude.adresse.strasse',
							default: 'Straße')}" />
                        
                        <g:sortableColumn property="adr_nr" title="${message(code:
							'at.emikat.gemerh.ooe.gebaeude.adresse.nr',
							default: 'Hausnr.')}" />
							
						<th class="sortable">&nbsp;</th>
						
						<th class="sortable">&nbsp;</th>
                    </tr>
                </thead>
                
                <tbody>
	                <g:each in="${gebaeudeInstanceList}" status="i" var="gebaeudeInstance">
	                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                        <td>
	                        	<g:link action="edit" id="${gebaeudeInstance.id}">
	                        		${fieldValue(bean: gebaeudeInstance, field: "nr")}
	                        	</g:link>
	                        </td>

	                        <td>
	                        	<g:link action="edit" id="${gebaeudeInstance.id}">
	                        		${fieldValue(bean: gebaeudeInstance, field: "gebaeudeart")}
	                        	</g:link>
	                        </td>
	                    
	                        <td>
		                        <g:link action="edit" id="${gebaeudeInstance.id}">
		                        	${gebaeudeInstance?.adr_plz}
		                        </g:link>
	                        </td>
	                    
	                        <td>
	                        	<g:link action="edit" id="${gebaeudeInstance.id}">
	                        		${fieldValue(bean: gebaeudeInstance, field: "adr_ort")}
	                        	</g:link>
	                        </td>
	                    
	                        <td>
	                        	<g:link action="edit" id="${gebaeudeInstance.id}">
	                        		${fieldValue(bean: gebaeudeInstance, field: "adr_strasse")}
	                        	</g:link>
	                        </td>
	                        
	                        <td>
	                        	<g:link action="edit" id="${gebaeudeInstance.id}">
	                        		${fieldValue(bean: gebaeudeInstance, field: "adr_nr")}
	                        	</g:link>
	                        </td>
	                        
	                        <td>
                            	<g:if test="${session.editierbar}">
		                        	<g:link class="button" action="edit" id="${gebaeudeInstance.id}">
		                        		<g:message code = "at.emikat.gemerh.ooe.button.bearbeiten"
		                        		default="Bearbeiten" />
									</g:link>
	                        	</g:if>
	                        </td>
	                     
                            <td>
                            	<g:if test="${session.editierbar}">
                            		<g:link class="button" action="delete" id="${gebaeudeInstance.id}"
                            			onclick="return confirm('${message(code:
										'at.emikat.gemerh.ooe.bestaetigung.gebaeude.loeschen',
			        					default: 'Wollen Sie dieses Gebauede wirklich löschen?')}');">
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
        
        <g:if test="${gebaeudeInstanceTotal > 10 }" >
	        <div class="paginateButtons">
	           	<g:paginate total="${gebaeudeInstanceTotal}" />
	       	</div>
       	</g:if>
	        
        
		<g:form method="post" class="abstandoben">
		    <div id="navigation">
				<span class="float-left">
					<g:actionSubmit class="button" action="ListZurueck" value="${message(code:
						'at.emikat.gemerh.ooe.button.zurueck', default: 'Zurück')}" />
				</span>
				
				<g:if test="${session.editierbar}">
					<span class="float-right">
						<g:actionSubmit class="button" action="create" value="${message(code:
							'at.emikat.gemerh.ooe.button.gebaeude.neu',
							default: 'Neues Gebäude hinzufügen')}" />
					</span>
				</g:if>
			</div>
		</g:form>
	</div>
</body>