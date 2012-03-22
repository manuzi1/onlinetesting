
<%@ page import="at.emikat.gemerh.ooe.Gemeinde" %>
<head>
	<meta name="layout" content="main" />
       
	<title>
		<g:message code="at.emikat.gemerh.ooe.seitentitel.gemeinden.uebersicht"
			default="Gemeindeerhebung 2010 - Gemeindenübersicht" />
	</title>
</head>

<body>
	<g:form method="post" >
	  	<div id="info">
	   		<h1>
	   			<span class="float-left">
		    		<g:if test="${session.user == grailsApplication.config.emikat.admin.name || session.user == grailsApplication.config.emikat.support.name}">
						<g:actionSubmit class="button" action="list"
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
				
				<g:actionSubmit class="float-right logout button" action="uebersichtLogout"
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
	        	<g:message code="at.emikat.gemerh.ooe.gemeinden.uebersicht.seite"
        			default="Gemeinden " />
	        </span>
	        	
	        <g:render template="/layouts/info_gemeindelist" />
		</div>
        
        <g:if test="${flash.message}">
       		<div class="message">${flash.message}</div>
        </g:if>
        
		<h2><g:message code="at.emikat.gemerh.ooe.gemeinden.uebersicht"
		  	default="Gemeindeübersicht"/></h2>
            
        <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="gemkz" title="${message(code:
								'gemeinde.gemkz.label', default: 'Gemeindekennzahl')}" />
							
							<g:sortableColumn property="name" title="${message(code:
								'gemeinde.gemkz.label', default: 'Name')}" />
                            
                            <g:sortableColumn property="abgabe" title="${message(code:
								'gemeinde.abgabe.label', default: 'Abgabe')}" />
                            
                            <g:sortableColumn property="freigabe" title="${message(code:
								'gemeinde.freigabe.label', default: 'Freigabe')}" /> 
								
							<th class="sortable">&nbsp;</th>
                        </tr>
                    </thead>
                    
                    <tbody>
	                   <g:each in="${gemeindeInstanceList}" status="i" var="gemeindeInstance">
	                       <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                           <td>
		                           <g:link action="erfassung1" id="${gemeindeInstance.id}">
		                          		${fieldValue(bean: gemeindeInstance, field: "gemkz")}
		                           </g:link>
	                           </td>
	                           
	                           <td>
	                           		<g:link action="erfassung1" id="${gemeindeInstance.id}">
	                           			${fieldValue(bean: gemeindeInstance, field: "name")}
	                           		</g:link>
	                           </td>
	                           
	                           <td>
	                           		<g:link action="erfassung1" id="${gemeindeInstance.id}">
	                          			 <g:formatDate format="yyyy-MM-dd" date="${gemeindeInstance?.abgabe}"/>
	                           		</g:link>
	                           </td>
	                           
	                           <td>
	                           		<g:link action="erfassung1" id="${gemeindeInstance.id}">
	                           			 <g:formatDate format="yyyy-MM-dd" date="${gemeindeInstance?.freigabe}"/>
	                           		</g:link>
	                           </td>
	                           
	                           <td>
	                        	<g:link class="button" action="erfassung1" id="${gemeindeInstance.id}">
	                        		<g:message code = "at.emikat.gemerh.ooe.button.bearbeiten"
	                        		default="Bearbeiten" />
								</g:link>
	                        </td>
	                           
	                       </tr>
	                   </g:each>
                    </tbody>
                </table>
            </div>
            
            <g:if test="${gemeindeInstanceTotal > 10 }" >
            	<div class="paginateButtons">
                	<g:paginate total="${gemeindeInstanceTotal}" />
            	</div>
            </g:if>
        </div>
    </body>
