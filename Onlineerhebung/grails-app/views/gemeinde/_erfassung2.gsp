		<div id="content">
			<div class="titel_info">
	           	<span class="float-left">
		        	<g:message code="at.emikat.gemerh.ooe.erfassung.seite" args="[2, 2]"
	       				default="Erfassung Seite 1 von 2" />
		        </span>
		        	
		        <g:render template="/layouts/info_erfassung2" />
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
			
			<g:actionSubmit class="invisible" action="erfassung2weiter" value="${message(code:
				'at.emikat.gemerh.ooe.button.weiter', default: 'Weiter')}" />
			
			<h2><g:message code="at.emikat.gemerh.ooe.erfassung.fahrzeuge"
				default="Gemeindeeigene Fahrzeuge und Treibstoffe" /></h2>
            
            <div class="panel">
            
            	<h3><g:message code="at.emikat.gemerh.ooe.erfassung.fahrzeuge.anzahl"
            		default="Anzahl" /></h3>
            
				<label class="labelsehrkurz" for="anz_pkw">
					<g:message code="at.emikat.gemerh.ooe.erfassung.fahrzeuge.anzahl.pkw"
						default="PKW" />
				</label>
				<span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
					field: 'anz_pkw', 'fehlerhinweis')}">&nbsp;
				</span>
				<g:if test="${session.editierbar}">
					<g:textField class="textzahl"  name="anz_pkw"
						value="${fieldValue(bean: gemeindeInstance, field: 'anz_pkw')}" />
				</g:if>
				<g:else>
					<g:textField class="textzahl disabled"  name="anz_pkw" readonly="readonly"
						value="${fieldValue(bean: gemeindeInstance, field: 'anz_pkw')}" />
				</g:else>
					
				<label class="labelnormalrechtsklein" for="anz_klein_lkw">
					<g:message code="at.emikat.gemerh.ooe.erfassung.fahrzeuge.anzahl.kleinLkw"
						default="Klein-LKW/Lieferwagen" />
				</label>
				<span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
					field: 'anz_klein_lkw', 'fehlerhinweis')}">&nbsp;
				</span>
				<g:if test="${session.editierbar}">
					<g:textField class="textzahl" name="anz_klein_lkw"
						value="${fieldValue(bean: gemeindeInstance, field: 'anz_klein_lkw')}" />
				</g:if>
				<g:else>
					<g:textField class="textzahl disabled" name="anz_klein_lkw" readonly="readonly"
						value="${fieldValue(bean: gemeindeInstance, field: 'anz_klein_lkw')}" />
				</g:else>

				<br />

				<label class="labelsehrkurz" for="anz_lkw">
					<g:message code="at.emikat.gemerh.ooe.erfassung.fahrzeuge.anzahl.lkw"
						default="LKW" />
				</label>
				<span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
					field: 'anz_lkw', 'fehlerhinweis')}">&nbsp;
				</span>
				<g:if test="${session.editierbar}">
					<g:textField class="textzahl" name="anz_lkw"
						value="${fieldValue(bean: gemeindeInstance, field: 'anz_lkw')}" />
				</g:if>
				<g:else>
					<g:textField class="textzahl disabled" name="anz_lkw" readonly="readonly"
						value="${fieldValue(bean: gemeindeInstance, field: 'anz_lkw')}" />
				</g:else>
				
				<label class="labelnormalrechtsklein" for="anz_sonderfahrzeuge">
					<g:message code="at.emikat.gemerh.ooe.erfassung.fahrzeuge.anzahl.sonderfahrzeuge"
						default="Sonderfahrzeuge" />
				</label>
				<span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
					field: 'anz_sonderfahrzeuge', 'fehlerhinweis')}">&nbsp;
				</span>
				<g:if test="${session.editierbar}">
					<g:textField class="textzahl" name="anz_sonderfahrzeuge"
						value="${fieldValue(bean: gemeindeInstance, field: 'anz_sonderfahrzeuge')}" />
				</g:if>
				<g:else>
					<g:textField class="textzahl disabled" name="anz_sonderfahrzeuge" readonly="readonly"
						value="${fieldValue(bean: gemeindeInstance, field: 'anz_sonderfahrzeuge')}" />
				</g:else>
				
				
				<br />
				
				<label class="labelsehrlang" for="anz_stunden_sonderfahrzeuge">
					<g:message code="at.emikat.gemerh.ooe.erfassung.fahrzeuge.anzahl.sonderfahrzeugeStunden"
						default="Anzahl Betriebsstunden aller Sonderfahrzeuge" />
				</label>
				<span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
					field: 'anz_stunden_sonderfahrzeuge', 'fehlerhinweis')}">&nbsp;
				</span>
				<g:if test="${session.editierbar}">
					<g:textField class="textzahl" name="anz_stunden_sonderfahrzeuge"
						value="${fieldValue(bean: gemeindeInstance, field: 'anz_stunden_sonderfahrzeuge')}" />
				</g:if>
				<g:else>
					<g:textField class="textzahl disabled" name="anz_stunden_sonderfahrzeuge" readonly="readonly"
						value="${fieldValue(bean: gemeindeInstance, field: 'anz_stunden_sonderfahrzeuge')}" />
				</g:else>
					
				<br />
				
				<h3 class="abstandoben"><g:message code="at.emikat.gemerh.ooe.erfassung.fahrzeuge.tankstelle"
					default="Betriebstankstelle" /></h3>
				
				
				<label class="labelsehrlang" for="tankstelle_radio1">
               		<g:message code="at.emikat.gemerh.ooe.erfassung.fahrzeuge.tankstelle.vorhanden"
               			default="Gibt es (z.B. im Bauhof) eine Betriebstankstelle?" />
               	</label>

				<g:if test="${session.editierbar}">
					<g:radio class="checkboxabstand" id="tankstelle_radio1" name="eigentankstelle" value="true" checked="${gemeindeInstance?.eigentankstelle}" />
				</g:if>
				<g:else>
					<g:radio class="checkboxabstand" id="tankstelle_radio1" name="eigentankstelle" value="true" disabled="true" checked="${gemeindeInstance?.eigentankstelle}" />
				</g:else>
				<g:message class="text" code="at.emikat.gemerh.ooe.auswahl.ja" default="ja" />
				
				<g:if test="${session.editierbar}">
					<g:radio class="checkboxabstand" id="tankstelle_radio2" name="eigentankstelle" value="false" checked="${!gemeindeInstance?.eigentankstelle}" />
				</g:if>
				<g:else>
					<g:radio class="checkboxabstand" id="tankstelle_radio2" name="eigentankstelle" value="false" disabled="true" checked="${!gemeindeInstance?.eigentankstelle}" />
				</g:else>
				<g:message class="text" code="at.emikat.gemerh.ooe.auswahl.nein" default="nein" />
                
                <br />
                
                
                <div class="float-left">
	                <span class="leftedge float-left abstandobenklein">
	                	<g:message code="at.emikat.gemerh.ooe.erfassung.fahrzeuge.tankstelle.treibstoffverbrauch"
	                		default="falls ja: Abgegebene Treibstoffmenge 2009" />
	                </span>
		                  
					<label class="labelsehrkurzrechts abstandobenklein" for="ts_treibstoffmenge_diesel">
						<g:message code="at.emikat.gemerh.ooe.erfassung.fahrzeuge.tankstelle.diesel"
							default="Diesel" />
					</label>
					<span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
						field: 'ts_treibstoffmenge_diesel', 'fehlerhinweis')}">&nbsp;
					</span>
					<g:if test="${session.editierbar}">
						<g:textField class="textzahl" name="ts_treibstoffmenge_diesel"
							value="${fieldValue(bean: gemeindeInstance, field: 'ts_treibstoffmenge_diesel')}" />
					</g:if>
					<g:else>
						<g:textField class="textzahl disabled" name="ts_treibstoffmenge_diesel" readonly="readonly"
							value="${fieldValue(bean: gemeindeInstance, field: 'ts_treibstoffmenge_diesel')}" />
					</g:else>
					<span class="float-left text abstandobenklein">
	                	<g:message code="at.emikat.gemerh.ooe.erfassung.fahrzeuge.tankstelle.liter" default="Liter" />
	                </span>
					
					<label class="labelsehrkurzrechts abstandobenklein" for="ts_treibstoffmenge_benzin">
						<g:message code="at.emikat.gemerh.ooe.erfassung.fahrzeuge.tankstelle.benzin"
							default="Benzin" />
					</label>
					<span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
						field: 'ts_treibstoffmenge_benzin', 'fehlerhinweis')}">&nbsp;
					</span>
					<g:if test="${session.editierbar}">
						<g:textField class="textzahl" name="ts_treibstoffmenge_benzin"
							value="${fieldValue(bean: gemeindeInstance, field: 'ts_treibstoffmenge_benzin')}" />
					</g:if>
					<g:else>
						<g:textField class="textzahl disabled" name="ts_treibstoffmenge_benzin" readonly="readonly"
							value="${fieldValue(bean: gemeindeInstance, field: 'ts_treibstoffmenge_benzin')}" />	
					</g:else>
					<span class="float-left text abstandobenklein">
	                	<g:message code="at.emikat.gemerh.ooe.erfassung.fahrzeuge.tankstelle.liter" default="Liter" />
	                </span>
                </div>

			</div>
                        
			<h2><g:message code="at.emikat.gemerh.ooe.erfassung.sonstiges" default="Sonstiges" /></h2>
			
            <div class="panel">
            	<h3><g:message code="at.emikat.gemerh.ooe.erfassung.sonstiges.pistenraupen" default="Skigebiete" /></h3>
            
				<label class="labelsehrlang" for="pistenraupen_radio1">
	              		<g:message code="at.emikat.gemerh.ooe.erfassung.sonstiges.pistenraupen.vorhanden"
	              			default="Gibt es in Ihrer Gemeinde Skigebiete mit Pistenraupen?" />
	            </label>
	
				<g:if test="${session.editierbar}">
					<g:radio class="checkboxabstand" id="pistenraupen_radio1" name="pistenraupen" value="true" checked="${gemeindeInstance?.pistenraupen}" />
				</g:if>
				<g:else>
					<g:radio class="checkboxabstand" id="pistenraupen_radio1" name="pistenraupen" value="true" disabled="true" checked="${gemeindeInstance?.pistenraupen}" />
				</g:else>
				<g:message code="at.emikat.gemerh.ooe.auswahl.ja" default="ja" />
				
				<g:if test="${session.editierbar}">
					<g:radio id="pistenraupen_radio2" class="checkboxabstand" name="pistenraupen" value="false" checked="${!gemeindeInstance?.pistenraupen}" />
				</g:if>
				<g:else>
					<g:radio id="pistenraupen_radio2" class="checkboxabstand" name="pistenraupen" value="false" disabled="true" checked="${!gemeindeInstance?.pistenraupen}" />
				</g:else>
				<g:message code="at.emikat.gemerh.ooe.auswahl.nein" default="nein" />
	                  
	            <br />
	
				<label class="labelsehrlang" for="anz_pistenraupen">
					<g:message code="at.emikat.gemerh.ooe.erfassung.sonstiges.pistenraupen.anzahl"
	                 			default="falls ja: Anzahl der Pistenraupen" />
				</label>
				<span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
					field: 'anz_pistenraupen', 'fehlerhinweis')}">&nbsp;
				</span>
				<g:if test="${session.editierbar}">
					<g:textField class="textzahl" name="anz_pistenraupen"
						value="${fieldValue(bean: gemeindeInstance, field: 'anz_pistenraupen')}" />
				</g:if>
				<g:else>
					<g:textField class="textzahl disabled" name="anz_pistenraupen" readonly="readonly"
						value="${fieldValue(bean: gemeindeInstance, field: 'anz_pistenraupen')}" />
				</g:else>
				
				<br />
						
				<label class="labelsehrlang" for="anz_stunden_pistenraupen">
					<g:message code="at.emikat.gemerh.ooe.erfassung.sonstiges.pistenraupen.stunden"
	                 			default="Anzahl der Betriebsstunden aller Pistenraupen" />
				</label>
				<span class="float-left fehlerhinweisStub ${hasErrors(bean: gemeindeInstance,
					field: 'anz_stunden_pistenraupen', 'fehlerhinweis')}">&nbsp;
				</span>
				<g:if test="${session.editierbar}">
					<g:textField class="textzahl" name="anz_stunden_pistenraupen"
						value="${fieldValue(bean: gemeindeInstance, field: 'anz_stunden_pistenraupen')}" />
				</g:if>
				<g:else>
					<g:textField class="textzahl disabled" name="anz_stunden_pistenraupen" readonly="readonly"
						value="${fieldValue(bean: gemeindeInstance, field: 'anz_stunden_pistenraupen')}" />
				</g:else>
						
				<br />
					
				<h3 class="abstandoben"><g:message code="at.emikat.gemerh.ooe.erfassung.sonstiges.schottergruben" default="Schottergruben" /></h3>
            
				<label class="labelsehrlang"for="schottergruben_radio1">
               		<g:message code="at.emikat.gemerh.ooe.erfassung.sonstiges.schottergruben.vorhanden"
               			default="Gibt es Schottergruben/Steinbr�che?" />
               	</label>

				<g:if test="${session.editierbar}">
					<g:radio id="schottergruben_radio1" class="checkboxabstand" name="schottergruben" value="true" checked="${gemeindeInstance?.schottergruben}" />
				</g:if>
				<g:else>
					<g:radio id="schottergruben_radio1" class="checkboxabstand" name="schottergruben" value="true" disabled="true" checked="${gemeindeInstance?.schottergruben}" />
				</g:else>
				<g:message code="at.emikat.gemerh.ooe.auswahl.ja" default="ja" />
				
				<g:if test="${session.editierbar}">
					<g:radio id="schottergruben_radio2" class="checkboxabstand" name="schottergruben" value="false" checked="${!gemeindeInstance?.schottergruben}" />
				</g:if>
				<g:else>
					<g:radio id="schottergruben_radio2" class="checkboxabstand" name="schottergruben" value="false" disabled="true" checked="${!gemeindeInstance?.schottergruben}" />
				</g:else>
				<g:message code="at.emikat.gemerh.ooe.auswahl.nein" default="nein" />
                   <br />
				
				<p>
					<g:message code="at.emikat.gemerh.ooe.erfassung.sonstiges.schottergruben.arbeitsstaetten"
                   			default="falls ja: Bitte neue Arbeitsstätte mit den relevanten Informationen erstellen
                   			(bei Prüfung der Arbeitsstätten)!" />
                </p>
                
				<h3 class="abstandobenmittel"><g:message code="at.emikat.gemerh.ooe.erfassung.sonstiges.arbeitsstaetten"
					default="Arbeitsstätten" /></h3>
						
				<span class="float-left leftedge">
					<g:message code="at.emikat.gemerh.ooe.erfassung.sonstiges.arbeitsstaetten.pruefen"
					default="Bitte prüfen Sie die Ihrer Gemeinde zugeordneten Arbeitsstätten:" />
				</span>
					<g:actionSubmit class="button" action="listArbeitsstaetten" value="${message(code:
						'at.emikat.gemerh.ooe.button.editieren', default: 'Eingeben/editieren')}" />
			</div>
		</div>