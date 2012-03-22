	    <div id="content">
			<div class="titel_info">
	           	<span class="float-left">
		        	<g:message code="at.emikat.gemerh.ooe.arbeitsstaetten.details.seite"
	        			default="Arbeitsstättendetails" />
		        </span>
		        	
		        <g:render template="/layouts/info_arbeitsstaette" />
			</div>
	    
	        <g:if test="${flash.message}">
	        	<div class="message">${flash.message}</div>
	        </g:if>
	        
	        <g:hasErrors bean="${arbeitsstaetteInstance}">
		        <div class="errors">
		            <g:renderErrors bean="${arbeitsstaetteInstance}" as="list" />
		        </div>
	        </g:hasErrors>
        
            <g:hiddenField name="id" value="${arbeitsstaetteInstance?.id}" />
            <g:hiddenField name="version" value="${arbeitsstaetteInstance?.version}" />
       
            <h2><g:message code="at.emikat.gemerh.ooe.arbeitsstaetten.details"
            	default="Detailansicht Arbeitsstätte"/></h2>
            
            <div class="panel">
            	
            	<label class="labelnormal" for="arbid">
	            	<g:message code="at.emikat.gemerh.ooe.arbeitsstaetten.arbid"
	            		default="Arbeitsstätten-ID" />
	            </label>
	            <span class="float-left fehlerhinweisStub ${hasErrors(bean: arbeitsstaetteInstance,
					field: 'arbid', 'fehlerhinweis')}">&nbsp;
				</span>
					<g:textField class="textnormal disabled" name="arbid" readonly="readonly"
						value="${fieldValue(bean: arbeitsstaetteInstance, field: 'arbid')}"/>
	            <br />
            	
	            <label class="labelnormal" for="name">
	            	<g:message code="at.emikat.gemerh.ooe.arbeitsstaetten.name"
	            		default="Name" />
	            </label>
	            <span class="float-left fehlerhinweisStub ${hasErrors(bean: arbeitsstaetteInstance,
					field: 'name', 'fehlerhinweis')}">&nbsp;
				</span>
	            <g:if test="${session.editierbar && arbeitsstaetteInstance?.status == 'NEU'}">
		            <g:textField class="textnormal" name="name"
		            	value="${fieldValue(bean: arbeitsstaetteInstance, field: 'name')}"/>
				</g:if>
				<g:else>
					<g:textField class="textnormal disabled" name="name" readonly="readonly"
						value="${fieldValue(bean: arbeitsstaetteInstance, field: 'name')}"/>
				</g:else>
                <span class="float-left text">
	                <a href="javascript:hilfe('arbeitsstaette','hilfe','#name');"
	                	onclick="javascript:hilfe('arbeitsstaette','hilfe','#name');">
						<img src="${resource(dir:'images',file:'ausfuellhilfe.png')}" width="10" height="18"
							alt="${message(code:'at.emikat.gemerh.ooe.infobar.ausfuellhilfe',default:'Ausfüllhilfe')}" />
					</a>
				</span>
					
	            <br />
                
                <label class="labelnormal" for="adr_strasse">
                	<g:message code="at.emikat.gemerh.ooe.arbeitsstaetten.strasse"
                	default="Straße" />
                </label>
                <span class="float-left fehlerhinweisStub ${hasErrors(bean: arbeitsstaetteInstance,
					field: 'adr_strasse', 'fehlerhinweis')}">&nbsp;
                </span>
                <g:if test="${session.editierbar && arbeitsstaetteInstance?.status == 'NEU'}">
                	<g:textField class="textnormal" name="adr_strasse"
                		value="${fieldValue(bean: arbeitsstaetteInstance, field: 'adr_strasse')}" />
                </g:if>
                <g:else>
                	<g:textField class="textnormal disabled" name="adr_strasse" readonly="readonly"
                		value="${fieldValue(bean: arbeitsstaetteInstance, field: 'adr_strasse')}" />
                </g:else>
                
                <label class="labelkurzrechtsabstand" for="adr_nr">
                	<g:message code="at.emikat.gemerh.ooe.arbeitsstaetten.nr"
                		default="Hausnr." />
                </label>
                <span class="float-left fehlerhinweisStub ${hasErrors(bean: arbeitsstaetteInstance,
					field: 'adr_nr', 'fehlerhinweis')}">&nbsp;
                </span>
                <g:if test="${session.editierbar && arbeitsstaetteInstance?.status == 'NEU'}">
               		<g:textField class="textnormal" name="adr_nr"
                		value="${fieldValue(bean: arbeitsstaetteInstance, field: 'adr_nr')}" />
                </g:if>
                <g:else>
                	<g:textField class="textnormal disabled" name="adr_nr" readonly="readonly"
                		value="${fieldValue(bean: arbeitsstaetteInstance, field: 'adr_nr')}" />
                </g:else>
                
				<br />
				
                <label class="labelnormal" for="adr_plz">
                	<g:message code="at.emikat.gemerh.ooe.arbeitsstaetten.plz"
                		default="PLZ" />
                </label>
                <span class="float-left fehlerhinweisStub ${hasErrors(bean: arbeitsstaetteInstance,
					field: 'adr_plz', 'fehlerhinweis')}">&nbsp;
                </span>
                <g:if test="${session.editierbar && arbeitsstaetteInstance?.status == 'NEU'}">
                	<g:textField class="textnormal" name="adr_plz"
                		value="${arbeitsstaetteInstance?.adr_plz}"  />
                </g:if>
                <g:else>
                	<g:textField class="textnormal disabled" name="adr_plz" readonly="readonly"
                		value="${arbeitsstaetteInstance?.adr_plz}"  />
                </g:else>
	            <span class="float-left text">
	                <a href="javascript:hilfe('arbeitsstaette','hilfe','#plz');"
	                	onclick="javascript:hilfe('arbeitsstaette','hilfe','#plz');">
						<img src="${resource(dir:'images',file:'ausfuellhilfe.png')}" width="10" height="18"
							alt="${message(code:'at.emikat.gemerh.ooe.infobar.ausfuellhilfe',default:'Ausfüllhilfe')}" />
					</a>
				</span>
				
	                	  
                <label class="labelkurzrechts" for="adr_ort">
                	<g:message code="at.emikat.gemerh.ooe.arbeitsstaetten.ort"
                		default="Ort" />
                </label>
                <span class="float-left fehlerhinweisStub ${hasErrors(bean: arbeitsstaetteInstance,
					field: 'adr_ort', 'fehlerhinweis')}">&nbsp;
                </span>
                <g:if test="${session.editierbar && arbeitsstaetteInstance?.status == 'NEU'}">
                	<g:textField class="textnormal" name="adr_ort"
                		value="${fieldValue(bean: arbeitsstaetteInstance, field: 'adr_ort')}" />
                </g:if>
                <g:else>
                	<g:textField class="textnormal disabled" name="adr_ort" readonly="readonly"
                		value="${fieldValue(bean: arbeitsstaetteInstance, field: 'adr_ort')}" />
                </g:else>
				
				<br />
				
				<label class="labelnormal" for="taetigkeit">
                	<g:message code="at.emikat.gemerh.ooe.arbeitsstaetten.taetigkeit"
                		default="Tätigkeit" />
                </label>
                <span class="float-left fehlerhinweisStub ${hasErrors(bean: arbeitsstaetteInstance,
					field: 'taetigkeit', 'fehlerhinweis')}">&nbsp;
                </span>
                <g:if test="${session.editierbar && arbeitsstaetteInstance?.status == 'NEU'}">
                	<g:textField class="textextremlang" name="taetigkeit"
                		value="${fieldValue(bean: arbeitsstaetteInstance, field: 'taetigkeit')}" />
                </g:if>
                <g:else>
                	<g:textField class="textextremlang disabled" name="taetigkeit" readonly="readonly"
                		value="${fieldValue(bean: arbeitsstaetteInstance, field: 'taetigkeit')}" />
                </g:else>
	            <span class="float-left text">
	                <a href="javascript:hilfe('arbeitsstaette','hilfe','#taetigkeit');"
	                	onclick="javascript:hilfe('arbeitsstaette','hilfe','#taetigkeit');">
						<img src="${resource(dir:'images',file:'ausfuellhilfe.png')}" width="10" height="18"
							alt="${message(code:'at.emikat.gemerh.ooe.infobar.ausfuellhilfe',default:'Ausfüllhilfe')}" />
					</a>
				</span>
				
                
				<g:if test="${arbeitsstaetteInstance?.status != 'NEU'}">
					<br />	
						
	                <label class="labelnormal" for="stilllegung_jahr">
	                	<g:message code="at.emikat.gemerh.ooe.arbeitsstaetten.stilllegung.jahr"
	                		default="Stilllegungsjahr" />
	                </label>
	                <span class="float-left fehlerhinweisStub ${hasErrors(bean: arbeitsstaetteInstance,
						field: 'stilllegung_jahr', 'fehlerhinweis')}">&nbsp;
	                </span>
	                <g:if test="${session.editierbar}">
	                	<g:textField class="textnormal" name="stilllegung_jahr"
	                		value="${arbeitsstaetteInstance?.stilllegung_jahr}" />
	                </g:if>
	                <g:else>
	                	<g:textField class="textnormal disabled" name="stilllegung_jahr" readonly="readonly"
	                		value="${arbeitsstaetteInstance?.stilllegung_jahr}" />
	                </g:else>
		            <span class="float-left text">
		                <a href="javascript:hilfe('arbeitsstaette','hilfe','#stilllegungsjahr');"
		                	onclick="javascript:hilfe('arbeitsstaette','hilfe','#stilllegungsjahr');">
							<img src="${resource(dir:'images',file:'ausfuellhilfe.png')}" width="10" height="18"
								alt="${message(code:'at.emikat.gemerh.ooe.infobar.ausfuellhilfe',default:'Ausfüllhilfe')}" />
						</a>
					</span>
					
		
					<br />
					
					<label class="labelnormal" for="name_neu">
	                	<g:message code="at.emikat.gemerh.ooe.arbeitsstaetten.name.neu"
	                		default="Tätigkeit" />
	                </label>
	                <span class="float-left fehlerhinweisStub ${hasErrors(bean: arbeitsstaetteInstance,
						field: 'name_neu', 'fehlerhinweis')}">&nbsp;
	                </span>
	                <g:if test="${session.editierbar}">
	                	<g:textField class="textnormal" name="name_neu"
	                		value="${fieldValue(bean: arbeitsstaetteInstance, field: 'name_neu')}" />
	                </g:if>
	                <g:else>
	                	<g:textField class="textnormal disabled" name="name_neu" readonly="readonly"
	                		value="${fieldValue(bean: arbeitsstaetteInstance, field: 'name_neu')}" />
	                </g:else>
		            <span class="float-left text">
		                <a href="javascript:hilfe('arbeitsstaette','hilfe','#name_neu');"
		                	onclick="javascript:hilfe('arbeitsstaette','hilfe','#name_neu');">
							<img src="${resource(dir:'images',file:'ausfuellhilfe.png')}" width="10" height="18"
								alt="${message(code:'at.emikat.gemerh.ooe.infobar.ausfuellhilfe',default:'Ausfüllhilfe')}" />
						</a>
					</span>
					
                </g:if>
			</div>
		</div>