		<div id="content">
			<div class="titel_info">
	           	<span class="float-left">
		        	<g:message code="at.emikat.gemerh.ooe.erfassung.seite" args="[1, 2]"
	       				default="Erfassung Seite 1 von 2" />
		        </span>
		        	
		        <g:render template="/layouts/info_erfassung1" />
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
				
				<g:actionSubmit class="invisible" action="erfassung1weiter" value="${message(code:
					'at.emikat.gemerh.ooe.button.weiter', default: 'Weiter')}" />
				
				<h2><g:message code="at.emikat.gemerh.ooe.erfassung.bearbeiter" default="Daten des Bearbeiters" /></h2>
	            
	            <div class="panel">    
	                
                <label class="labelnormal" for="bearbeiter_name">
                	<g:message code="at.emikat.gemerh.ooe.erfassung.bearbeiter.name"
                		default="Name" />
                </label>
                <span class="float-left textstern">
                	<g:message code="at.emikat.gemerh.ooe.erfassung.bearbeiter.stern"
                		default="* &nbsp;" />
                </span>
                <span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
					field: 'bearbeiter_name', 'fehlerhinweis')}">&nbsp;
                </span>
                <g:if test="${session.editierbar}">
	                <g:textField class="textmittel" name="bearbeiter_name"
	                	value="${fieldValue(bean: gemeindeInstance,
							field: 'bearbeiter_name')}" />
				</g:if>
				<g:else>
					<g:textField class="textmittel disabled" name="bearbeiter_name" readonly="readonly"
	                	value="${fieldValue(bean: gemeindeInstance,
							field: 'bearbeiter_name')}" />
				</g:else>
				
                <label class="labelnormalrechts" for="funktioningemeinde">
                	<g:message code="at.emikat.gemerh.ooe.erfassung.bearbeiter.funktion"
                		default="Funktion in Gemeinde" />
                </label>
                <span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
					field: 'funktioningemeinde', 'fehlerhinweis')}">&nbsp;
                </span>
                <g:if test="${session.editierbar}">             
	                <g:textField class="textmittel" name="funktioningemeinde"
	                	value="${fieldValue(bean: gemeindeInstance,
							field: 'funktioningemeinde')}" />
				</g:if>
				<g:else>
					<g:textField class="textmittel disabled" name="funktioningemeinde" readonly="readonly"
	                	value="${fieldValue(bean: gemeindeInstance,
							field: 'funktioningemeinde')}" />
				</g:else>
				<span class="float-left text">
					<a href="javascript:hilfe('gemeinde','hilfeerfassung1','#funktioningemeinde');" onclick="javascript:hilfe('gemeinde','hilfeerfassung1','#funktioningemeinde');">
						<img src="${resource(dir:'images',file:'ausfuellhilfe.png')}" width="10" height="18"
							alt="${message(code:'at.emikat.gemerh.ooe.infobar.ausfuellhilfe',default:'Ausf�llhilfe')}" />
					</a>
				</span>

				<br />
				
				<label class="labelnormal" for="bearbeiter_tel">
					<g:message code="at.emikat.gemerh.ooe.erfassung.bearbeiter.telefon"
						default="Telefonnummer" />
				</label>
				<span class="float-left textstern">
					<g:message code="at.emikat.gemerh.ooe.erfassung.bearbeiter.stern"
						default="* &nbsp;" />
				</span>
				<span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
					field: 'bearbeiter_tel', 'fehlerhinweis')}">&nbsp;
                </span>
                <g:if test="${session.editierbar}">
					<g:textField class="textmittel" name="bearbeiter_tel"
						value="${fieldValue(bean: gemeindeInstance,
							field: 'bearbeiter_tel')}" />
				</g:if>
				<g:else>
					<g:textField class="textmittel disabled" name="bearbeiter_tel" readonly="readonly"
						value="${fieldValue(bean: gemeindeInstance,
							field: 'bearbeiter_tel')}" />
				</g:else>

				<label class="labelnormalrechts" for="bearbeiter_mail">
					<g:message code="at.emikat.gemerh.ooe.erfassung.bearbeiter.mail"
						default="E-Mailadresse" />
				</label>
				<span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
					field: 'bearbeiter_mail', 'fehlerhinweis')}">&nbsp;
                </span>
                <g:if test="${session.editierbar}">
					<g:textField class="textmittel" name="bearbeiter_mail"
						value="${fieldValue(bean: gemeindeInstance,
							field: 'bearbeiter_mail')}" />
				</g:if>
				<g:else>
					<g:textField class="textmittel disabled" name="bearbeiter_mail" readonly="readonly"
						value="${fieldValue(bean: gemeindeInstance,
							field: 'bearbeiter_mail')}" />
				</g:else>
				       
			</div>
			
			<h2><g:message code="at.emikat.gemerh.ooe.erfassung.beheizung"
				default="Beheizung �ffentlicher Gebäude" /></h2>

            <div class="panel">
            	<span class="leftedge float-left">
            		<g:message code="at.emikat.gemerh.ooe.erfassung.beheizung.anzahl"
            			default="Anzahl öffentlicher Gebäude in Ihrer Gemeinde:" />
				</span>
				<g:textField class="textzahl disabled platzmittel float-left" name="gebcount"
					value="${session.gebCount}" readonly="readonly" />
				<g:actionSubmit class="button float-left" action="listGebaeude" value="${message(code:
					'at.emikat.gemerh.ooe.button.editieren', default: 'Eingeben/editieren')}" />
			</div>

			<h2><g:message code="at.emikat.gemerh.ooe.erfassung.heizgewohnheiten"
				default="Ver�nderungen der Heizgewohnheiten seit 2001 (Häuser-, Wohnungszählung)" /></h2>
           	
           	<div class="panel">
           		<h3><g:message code="at.emikat.gemerh.ooe.erfassung.heizgewohnheiten.haushalte"
           			default="Haushalte" /></h3>
           		
               	<p>
                	<g:message code="at.emikat.gemerh.ooe.erfassung.heizgewohnheiten.haushalte.brennstoffe"
                		default="Bitte schätzen Sie, welche Anteile der Haushalte mit den jeweiligen
                		Brennstoffen beheizt werden (auf 10% genau):" />
                </p>
	                
	                <label class="labelkurz" for="heizung_fernwaerme_proz">
                    	<g:message code="at.emikat.gemerh.ooe.erfassung.heizgewohnheiten.haushalte.fernwaerme"
                    		default="Fernwärme" />
					</label>
                    <span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
						field: 'heizung_fernwaerme_proz', 'fehlerhinweis')}">&nbsp;
                	</span>
                	<g:if test="${session.editierbar}">
                    	<g:textField class="textzahl" name="heizung_fernwaerme_proz" value="${fieldValue(bean:
							gemeindeInstance, field: 'heizung_fernwaerme_proz')}" />
					</g:if>
					<g:else>
						<g:textField class="textzahl disabled" name="heizung_fernwaerme_proz" readonly="readonly" value="${fieldValue(bean:
							gemeindeInstance, field: 'heizung_fernwaerme_proz')}" />
					</g:else>
					<span class="float-left textprozent">
                       	<g:message code="at.emikat.gemerh.ooe.erfassung.heizgewohnheiten.haushalte.prozent"
                       		default="%" />
                    </span>
                    
                    <label class="labelkurzrechtsabstandkleiner" for="heizung_strom_proz">
                       	<g:message code="at.emikat.gemerh.ooe.erfassung.heizgewohnheiten.haushalte.strom"
                       		default="Strom" />
                    </label>
                    <span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
						field: 'heizung_strom_proz', 'fehlerhinweis')}">&nbsp;
                	</span>   
                    <g:if test="${session.editierbar}">
                   		<g:textField class="textzahl" name="heizung_strom_proz" value="${fieldValue(bean:
							gemeindeInstance, field: 'heizung_strom_proz')}" />
					</g:if>
					<g:else>
						<g:textField class="textzahl disabled" name="heizung_strom_proz" readonly="readonly" value="${fieldValue(bean:
							gemeindeInstance, field: 'heizung_strom_proz')}" />
					</g:else>
					<span class="float-left textprozent">
                       	<g:message code="at.emikat.gemerh.ooe.erfassung.heizgewohnheiten.haushalte.prozent"
                       		default="%" />
                    </span>
                    
                    <label class="labelhalblangrechtsabstandkleiner" for="heizung_holz_proz">
               			<g:message code="at.emikat.gemerh.ooe.erfassung.heizgewohnheiten.haushalte.holz"
               				default="Holz (inkl. Pellets, Hackschnitzel, ...)" />
               		</label>
               		<span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
						field: 'heizung_holz_proz', 'fehlerhinweis')}">&nbsp;
                	</span>       		   		
                 	<g:if test="${session.editierbar}">
                 		<g:textField class="textzahl" name="heizung_holz_proz" value="${fieldValue(bean:
							gemeindeInstance, field: 'heizung_holz_proz')}" />
					</g:if>
					<g:else>
						<g:textField class="textzahl disabled" name="heizung_holz_proz" readonly="readonly" value="${fieldValue(bean:
							gemeindeInstance, field: 'heizung_holz_proz')}" />
					</g:else>
                 	<span class="float-left textprozent">
                 		<g:message code="at.emikat.gemerh.ooe.erfassung.heizgewohnheiten.haushalte.prozent"
                 			default="%" />
                 	</span> 
	                        
					<br />
					
					<label class="labelkurz" for="heizung_oel_proz">
                    	<g:message code="at.emikat.gemerh.ooe.erfassung.heizgewohnheiten.haushalte.oel"
                    		default="Öl" />
                    </label>
					<span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
						field: 'heizung_oel_proz', 'fehlerhinweis')}">&nbsp;
                	</span>
                	<g:if test="${session.editierbar}">
                		<g:textField class="textzahl" name="heizung_oel_proz" value="${fieldValue(bean:
							gemeindeInstance, field: 'heizung_oel_proz')}" />
					</g:if>
					<g:else>
						<g:textField class="textzahl disabled" name="heizung_oel_proz" readonly="readonly" value="${fieldValue(bean:
							gemeindeInstance, field: 'heizung_oel_proz')}" />	
					</g:else>
                	<span class="float-left textprozent">
                    	<g:message code="at.emikat.gemerh.ooe.erfassung.heizgewohnheiten.haushalte.prozent"
                    		default="%" />
                    </span>
	                        
					<label class="labelkurzrechtsabstandkleiner" for="heizung_gas_proz">
						<g:message code="at.emikat.gemerh.ooe.erfassung.heizgewohnheiten.haushalte.gas"
							default="Gas" />
					</label>
					<span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
						field: 'heizung_gas_proz', 'fehlerhinweis')}">&nbsp;
                	</span>
                	<g:if test="${session.editierbar}">
						<g:textField class="textzahl" name="heizung_gas_proz" value="${fieldValue(bean:
							gemeindeInstance, field: 'heizung_gas_proz')}" />
					</g:if>
					<g:else>
						<g:textField class="textzahl disabled" name="heizung_gas_proz" readonly="readonly" value="${fieldValue(bean:
							gemeindeInstance, field: 'heizung_gas_proz')}" />
					</g:else>
					<span class="float-left textprozent">
                    	<g:message code="at.emikat.gemerh.ooe.erfassung.heizgewohnheiten.haushalte.prozent"
                    		default="%" />
                    </span>
                    
                    <label class="labelhalblangrechtsabstandkleiner" for="heizung_sonstiges_proz">
                    	<g:message code="at.emikat.gemerh.ooe.erfassung.heizgewohnheiten.haushalte.sonstiges"
                    		default="andere: ergänzend auf 100%" />
					</label>
                    <span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
						field: 'heizung_sonstiges_proz', 'fehlerhinweis')}">&nbsp;
                	</span>
                	<g:if test="${session.editierbar}">
                    	<g:textField class="textzahl" name="heizung_sonstiges_proz" value="${fieldValue(bean:
							gemeindeInstance, field: 'heizung_sonstiges_proz')}" />
					</g:if>
					<g:else>
						<g:textField class="textzahl disabled" name="heizung_sonstiges_proz" readonly="readonly" value="${fieldValue(bean:
							gemeindeInstance, field: 'heizung_sonstiges_proz')}" />
					</g:else>
					<span class="float-left textprozent">
                       	<g:message code="at.emikat.gemerh.ooe.erfassung.heizgewohnheiten.haushalte.prozent"
                       		default="%" />
                    </span>
                    
                    <br />
				
                        
				<h3 class="abstandoben"><g:message code="at.emikat.gemerh.ooe.erfassung.heizgewohnheiten.blockheizkraftwerk"
					default="Blockheizkraftwerk" /></h3>
                	<p>
	                	<label for="bhkw_radio1">
	                		<g:message code="at.emikat.gemerh.ooe.erfassung.heizgewohnheiten.blockheizkraftwerk.vorhanden"
	                			default="Gibt es in Ihrer Gemeinde ein Blockheizkraftwerk (z.B. Hackschnitzelheizung?)" />
	                	</label>
	
						<g:if test="${session.editierbar}">
							<g:radio class="checkbox" id="bhkw_radio1" name="blockheizkraftwerk" value="true" checked="${gemeindeInstance?.blockheizkraftwerk}" />
						</g:if>
						<g:else>
							<g:radio class="checkbox" id="bhkw_radio1" name="blockheizkraftwerk" value="true" disabled="true" checked="${gemeindeInstance?.blockheizkraftwerk}" />
						</g:else>
						<g:message clas="text" code="at.emikat.gemerh.ooe.auswahl.ja" default="ja" />
						
						<g:if test="${session.editierbar}">
							<g:radio class="checkbox" id="bhkw_radio2" name="blockheizkraftwerk" value="false" checked="${!gemeindeInstance?.blockheizkraftwerk}" />
						</g:if>
						<g:else>
							<g:radio class="checkbox" id="bhkw_radio2" name="blockheizkraftwerk" value="false" disabled="true" checked="${!gemeindeInstance?.blockheizkraftwerk}" />
						</g:else>
						<g:message class="text" code="at.emikat.gemerh.ooe.auswahl.nein" default="nein" />
					</p>
                    
                    <p class="abstandoben">
                    	<g:message code="at.emikat.gemerh.ooe.erfassung.heizgewohnheiten.blockheizkraftwerk.verbrauch"
                    		default="Wenn Sie auf die Daten Zugriff haben: bitte geben Sie Brennstoff und Verbrauch für 2009 an:" />
                    </p>
                    	
                    
                    
                    <label class="labelnormal" for="blockhkw_verbrauch">
                    	<g:message code="at.emikat.gemerh.ooe.erfassung.heizgewohnheiten.blockheizkraftwerk.brennstoffverbrauch"
                    		default="Brennstoffverbrauch" />
                    </label>
					<span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
						field: 'blockhkw_verbrauch', 'fehlerhinweis')}">&nbsp;
                	</span>  
					<g:if test="${session.editierbar}">
						<g:textField class="textzahl" name="blockhkw_verbrauch" value="${fieldValue(bean: gemeindeInstance,
							field: 'blockhkw_verbrauch')}" />
					</g:if>
					<g:else>
						<g:textField class="textzahl disabled" name="blockhkw_verbrauch" readonly="readonly" value="${fieldValue(bean: gemeindeInstance,
							field: 'blockhkw_verbrauch')}" />
					</g:else>
					<g:if test="${session.editierbar}">
						<g:select class="textnormal platz" name="blockhkw_einheit"
							from="${[message(code: 'at.emikat.gemerh.ooe.auswahl.bitte', default: '---Bitte Ausw�hlen---'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.kg', default: 'kg'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.tonnen', default: 'Tonnen'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.l', default: 'l'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.m3', default: 'm3'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.kwh', default: 'kWh')]}"
							value="${gemeindeInstance?.blockhkw_einheit}" />
					</g:if>
					<g:else>
						<g:select class="textnormal platz disabled" name="blockhkw_einheit" disabled="true"
							from="${[message(code: 'at.emikat.gemerh.ooe.auswahl.bitte', default: '---Bitte Ausw�hlen---'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.kg', default: 'kg'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.tonnen', default: 'Tonnen'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.l', default: 'l'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.m3', default: 'm3'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.kwh', default: 'kWh')]}"
							value="${gemeindeInstance?.blockhkw_einheit}" />
					</g:else>
					<g:if test="${session.editierbar}"> 
						<g:select class="textnormal" name="blockhkw_brennstoff"
							from="${[message(code: 'at.emikat.gemerh.ooe.auswahl.bitte', default: '---Bitte Ausw�hlen---'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.pellets', default: 'Pellets'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.holz', default: 'Holz'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.kohle', default: 'Kohle/Koks'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.oel', default: '�l'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.gas', default: 'Gas')]}"
							value="${gemeindeInstance?.blockhkw_brennstoff}" />
					</g:if>
					<g:else>
						<g:select class="textnormal disabled" name="blockhkw_brennstoff" disabled="true"
							from="${[message(code: 'at.emikat.gemerh.ooe.auswahl.bitte', default: '---Bitte Ausw�hlen---'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.pellets', default: 'Pellets'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.holz', default: 'Holz'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.kohle', default: 'Kohle/Koks'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.oel', default: '�l'),
							message(code: 'at.emikat.gemerh.ooe.auswahl.gas', default: 'Gas')]}"
							value="${gemeindeInstance?.blockhkw_brennstoff}" />
					</g:else>
			</div> 
		</div>