	    <div id="content">
			<div class="titel_info">
	           	<span class="float-left">
		        	<g:message code="at.emikat.gemerh.ooe.gebaeude.details.seite"
	        			default="Gebäudedetails" />
		        </span>
		        	
		        <g:render template="/layouts/info_gebaeude" />
			</div>
	    
	        <g:if test="${flash.message}">
	        	<div class="message">${flash.message}</div>
	        </g:if>
	        
	        <g:hasErrors bean="${gebaeudeInstance}">
		        <div class="errors">
		            <g:renderErrors bean="${gebaeudeInstance}" as="list" />
		        </div>
	        </g:hasErrors>
        
            <g:hiddenField name="id" value="${gebaeudeInstance?.id}" />
            <g:hiddenField name="version" value="${gebaeudeInstance?.version}" />
       
            <h2><g:message code="at.emikat.gemerh.ooe.gebaeude.details"
            	default="Detailansicht öffentliches Gebäude"/></h2>
            
            <div class="panel">
            
            	<h3><g:message code="at.emikat.gemerh.ooe.gebaeude.details.allgemein"
            		default="Allgemeine Informationen" /></h3>
            	
	            <label class="labellang" for="nr">
	            	<g:message code="at.emikat.gemerh.ooe.gebaeude.nr"
	            		default="interne Nummer" />
	            </label>
	            <span class="float-left fehlerhinweisStub">&nbsp;
				</span>
	            <g:textField class="disabled textzahl" name="nr" value="${fieldValue(bean:
					gebaeudeInstance, field: 'nr')}" readonly="readonly" />
	            <br />
                
                <label class="labellang" for="adr_strasse">
                	<g:message code="at.emikat.gemerh.ooe.gebaeude.adresse.strasse"
                	default="Straße" />
                </label>
                <span class="float-left fehlerhinweisStub ${hasErrors(bean: gebaeudeInstance,
					field: 'adr_strasse', 'fehlerhinweis')}">&nbsp;
                </span>
                <g:if test="${session.editierbar}">
                	<g:textField class="textmittel" name="adr_strasse"
                		value="${fieldValue(bean: gebaeudeInstance, field: 'adr_strasse')}" />
                </g:if>
                <g:else>
                	<g:textField class="textmittel disabled" name="adr_strasse" readonly="readonly"
                		value="${fieldValue(bean: gebaeudeInstance, field: 'adr_strasse')}" />
                </g:else>
                
                <label class="labelkurzrechtsabstandklein" for="adr_nr">
                	<g:message code="at.emikat.gemerh.ooe.gebaeude.adresse.nr"
                		default="Hausnr." />
                </label>
                <span class="float-left fehlerhinweisStub ${hasErrors(bean: gebaeudeInstance,
					field: 'adr_nr', 'fehlerhinweis')}">&nbsp;
                </span>
                <g:if test="${session.editierbar}">
               		<g:textField class="textnormal" name="adr_nr"
                		value="${fieldValue(bean: gebaeudeInstance, field: 'adr_nr')}" />
                </g:if>
                <g:else>
                	<g:textField class="textnormal disabled" name="adr_nr" readonly="readonly"
                		value="${fieldValue(bean: gebaeudeInstance, field: 'adr_nr')}" />
                </g:else>
                
				<br />
				
                <label class="labellang" for="adr_plz">
                	<g:message code="at.emikat.gemerh.ooe.gebaeude.adresse.plz"
                		default="PLZ" />
                </label>
                <span class="float-left fehlerhinweisStub ${hasErrors(bean: gebaeudeInstance,
					field: 'adr_plz', 'fehlerhinweis')}">&nbsp;
                </span>
                <g:if test="${session.editierbar}">
                	<g:textField class="textmittel" name="adr_plz"
                		value="${gebaeudeInstance?.adr_plz}"  />
                </g:if>
                <g:else>
                	<g:textField class="textmittel disabled" name="adr_plz" readonly="readonly"
                		value="${gebaeudeInstance?.adr_plz}"  />
                </g:else>
	            <span class="float-left text">
	            	<a href="javascript:hilfe('gebaeude','hilfe','#plz');"
	            		onclick="javascript:hilfe('gebaeude','hilfe','#plz');">
						<img src="${resource(dir:'images',file:'ausfuellhilfe.png')}" width="10" height="18"
							alt="${message(code:'at.emikat.gemerh.ooe.infobar.ausfuellhilfe',default:'Ausfüllhilfe')}" />
					</a>
				</span>
				
	                	  
                <label class="labelkurzrechtsabstandkleiner" for="adr_ort">
                	<g:message code="at.emikat.gemerh.ooe.gebaeude.strasse.ort"
                		default="Ort" />
                </label>
                <span class="float-left fehlerhinweisStub ${hasErrors(bean: gebaeudeInstance,
					field: 'adr_ort', 'fehlerhinweis')}">&nbsp;
                </span>
                <g:if test="${session.editierbar}">
                	<g:textField class="textnormal" name="adr_ort"
                		value="${fieldValue(bean: gebaeudeInstance, field: 'adr_ort')}" />
                </g:if>
                <g:else>
                	<g:textField class="textnormal disabled" name="adr_ort" readonly="readonly"
                		value="${fieldValue(bean: gebaeudeInstance, field: 'adr_ort')}" />
                </g:else>
				
				<br />
				
				<label class="labellang" for="gebaeudeart">
	                <g:message code="at.emikat.gemerh.ooe.gebaeude.nutzung"
	                	default="vorwiegende Nutzung" />
	            </label>
           		<span class="float-left fehlerhinweisStub ${hasErrors(bean: gebaeudeInstance,
					field: 'gebaeudeart', 'fehlerhinweis')}">&nbsp;
                </span>
				<g:if test="${session.editierbar}">
					<g:select class="textmittel" name="gebaeudeart"
						from="${[message(code: 'at.emikat.gemerh.ooe.auswahl.bitte', default: '---Bitte Auswählen---'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.gemeindeamt', default: 'Gemeindeamt'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.schule', default: 'Schule, Kindergarten'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.mehrzweckhalle', default: 'Sport- / Mehrzweckhalle'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.schwimmbad', default: 'Schwimmbad'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.hallenbad', default: 'Hallenbad'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.feuerwehr', default: 'Feuerwehr'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.altersheim', default: 'Alters- / Pflegeheim, Spital'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.bauhof', default: 'Bauhof'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.sonstiges', default: 'Sonstiges')]}"
						value="${gebaeudeInstance?.gebaeudeart}" />	
				</g:if>
				<g:else>
					<g:select class="textmittel disabled" name="gebaeudeart" disabled="true"
						from="${[message(code: 'at.emikat.gemerh.ooe.auswahl.bitte', default: '---Bitte Auswählen---'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.gemeindeamt', default: 'Gemeindeamt'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.schule', default: 'Schule, Kindergarten'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.mehrzweckhalle', default: 'Sport- / Mehrzweckhalle'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.schwimmbad', default: 'Schwimmbad'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.hallenbad', default: 'Hallenbad'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.feuerwehr', default: 'Feuerwehr'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.altersheim', default: 'Alters- / Pflegeheim, Spital'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.bauhof', default: 'Bauhof'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.sonstiges', default: 'Sonstiges')]}"
						value="${gebaeudeInstance?.gebaeudeart}" />	
				</g:else>
				
				<br />	
					
                <label class="labellang" for="anz_schueler">
                	<g:message code="at.emikat.gemerh.ooe.gebaeude.details.allgemein.personenanzahl"
                		default="Personenanzahl (Schüler, Sitzplätze, etc.)" />
                </label>
                <span class="float-left fehlerhinweisStub ${hasErrors(bean: gebaeudeInstance,
					field: 'anz_schueler', 'fehlerhinweis')}">&nbsp;
                </span>
                <g:if test="${session.editierbar}">
                	<g:textField class="textzahl" name="anz_schueler"
                		value="${fieldValue(bean: gebaeudeInstance, field: 'anz_schueler')}" />
                </g:if>
                <g:else>
                	<g:textField class="textzahl disabled" name="anz_schueler" readonly="readonly"
                		value="${fieldValue(bean: gebaeudeInstance, field: 'anz_schueler')}" />
                </g:else>
	
				<br />
				
				<h3><g:message code="at.emikat.gemerh.ooe.gebaeude.details.heizung"
					default="Heizinformationen" /></h3>
				
				<label class="labellang" for="heizmaterial">
	                <g:message code="at.emikat.gemerh.ooe.gebaeude.details.heizung.heizmaterial"
	                	default="Heizungsart und -material" />
	            </label>
				<span class="float-left fehlerhinweisStub ${hasErrors(bean: gebaeudeInstance, field:
					'heizmaterial', 'fehlerhinweis')}">&nbsp;
               	</span>
               	<g:if test="${session.editierbar}">
					<g:select class="textlang" name="heizmaterial"
						from="${[message(code: 'at.emikat.gemerh.ooe.auswahl.bitte', default: '---Bitte Auswählen---'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.fernheizwerk', default: 'an Fernheizwerk angeschlossen'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.heizkontrakt', default: 'Heizkontrakt'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.pellets', default: 'Pellets'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.holz', default: 'Holz'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.kohle', default: 'Kohle/Koks'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.oel', default: 'Öl'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.gas', default: 'Gas'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.strom', default: 'Strom')]}"
						value="${gebaeudeInstance?.heizmaterial}" />	
				</g:if>
				<g:else>
					<g:select class="textlang disabled" name="heizmaterial" disabled="true"
						from="${[message(code: 'at.emikat.gemerh.ooe.auswahl.bitte', default: '---Bitte Auswählen---'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.fernheizwerk', default: 'an Fernheizwerk angeschlossen'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.heizkontrakt', default: 'Heizkontrakt'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.pellets', default: 'Pellets'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.holz', default: 'Holz'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.kohle', default: 'Kohle/Koks'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.oel', default: 'Öl'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.gas', default: 'Gas'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.strom', default: 'Strom')]}"
						value="${gebaeudeInstance?.heizmaterial}" />	
				</g:else>
				
				<br />
				
				<label class="labellang" for="heizmaterial_menge">
	                <g:message code="at.emikat.gemerh.ooe.gebaeude.details.heizung.menge"
	                	default="Einsatzmenge (2009)" />
	            </label>
	            <span class="float-left fehlerhinweisStub ${hasErrors(bean: gebaeudeInstance, field:
					'heizmaterial_menge', 'fehlerhinweis')}">&nbsp;
               	</span>
               	<g:if test="${session.editierbar}">
		            <g:textField class="textzahl" name="heizmaterial_menge"
	                	value="${fieldValue(bean: gebaeudeInstance, field: 'heizmaterial_menge')}" />
                </g:if>
                <g:else>
                    <g:textField class="textzahl disabled" name="heizmaterial_menge" readonly="readonly"
	                	value="${fieldValue(bean: gebaeudeInstance, field: 'heizmaterial_menge')}" />
                </g:else>
                <g:if test="${session.editierbar}">
					<g:select class="textnormal platz" name="heizmaterial_einheit"
						from="${[message(code: 'at.emikat.gemerh.ooe.auswahl.bitte', default: '---Bitte Auswählen---'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.kg', default: 'kg'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.tonnen', default: 'Tonnen'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.l', default: 'l'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.m3', default: 'm3'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.kwh', default: 'kWh')]}"
						value="${gebaeudeInstance?.heizmaterial_einheit}" />
				</g:if>
				<g:else>
					<g:select class="textnormal platz disabled" name="heizmaterial_einheit" disabled="true"
						from="${[message(code: 'at.emikat.gemerh.ooe.auswahl.bitte', default: '---Bitte Auswählen---'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.kg', default: 'kg'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.tonnen', default: 'Tonnen'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.l', default: 'l'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.m3', default: 'm3'),
						message(code: 'at.emikat.gemerh.ooe.auswahl.kwh', default: 'kWh')]}"
						value="${gebaeudeInstance?.heizmaterial_einheit}" />
				</g:else>
			
				<br />
				
				<label class="labellang" for="heizmaterial_kosten">
	                <g:message code="at.emikat.gemerh.ooe.gebaeude.details.heizung.kosten"
	                	default="Kosten (2009)" />
	            </label>
	            <span class="float-left fehlerhinweisStub ${hasErrors(bean: gebaeudeInstance,
					field: 'heizmaterial_kosten', 'fehlerhinweis')}">&nbsp;
               	</span>
               	<g:if test="${session.editierbar}">
		            <g:textField class="textzahl" name="heizmaterial_kosten"
	                	value="${fieldValue(bean: gebaeudeInstance, field: 'heizmaterial_kosten')}" />
                </g:if>
                <g:else>
                    <g:textField class="textzahl disabled" name="heizmaterial_kosten" readonly="readonly"
	                	value="${fieldValue(bean: gebaeudeInstance, field: 'heizmaterial_kosten')}" />
                </g:else>
               	<span class="float-left text textstern">
                	<g:message code="at.emikat.gemerh.ooe.gebaeude.details.heizung.euro" default="&nbsp; &euro;" />
                </span>       
			</div>
		</div>