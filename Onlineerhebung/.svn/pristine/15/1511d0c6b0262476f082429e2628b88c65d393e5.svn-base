<head>
	<meta name="layout" content="main" />
	
	<title>
		<g:message code="at.emikat.gemerh.ooe.seitentitel.erfassung" args="[2, 2]"
			default="Gemeindeerhebung 2010 - Erfassung Seite 2 von 2" />
	</title>
</head>

<body>
    <div id="info">
    	<h1><g:message code="at.emikat.gemerh.ooe" default="Gemeindeerhebung 2010" /></h1>
    	<g:render template="/layouts/infobar" />
       </div>
       
       <div id="content">
       	<div class="titel_info">
       		<span class="float-left">
     		<g:message code="at.emikat.gemerh.ooe.login.seite"
     			default="Login" />
     	</span>
     	
     	<g:render template="/layouts/info" />
     </div>

	<g:hasErrors bean="${loginCmd}">
		<div class="errors">
			<g:renderErrors bean="${loginCmd}" as="list" />
		</div>
	</g:hasErrors>
    
      <g:form action="login" >
      
      	<h2><g:message code="at.emikat.gemerh.ooe.login"
		default="Oberösterreichischer Emissionskataster" /></h2>
       
       <div class="panel">
          	<h3><g:message code="at.emikat.gemerh.ooe.login.bereitstellung"
          		default="Bereitstellung der Daten für das System emikat.at" /></h3>
		
		<p>
			<g:message code="at.emikat.gemerh.ooe.login.anmeldung"
            			default="Bitte melden Sie sich mit dem für Ihre Gemeinde gültigen, 5-stelligen Code (z.B. 40101) und dem Kennwort laut Einladungsschreiben im System an." />
            	</p>
            	
			<label class="labelnormal" for="login">
				<g:message code="at.emikat.gemerh.ooe.login.zaehlcode" default="Zählcode" />
			</label>
        				
        				<g:textField class="textnormal" name="login" />
		
		<br />
                                   

			<label class="labelnormal" for="passwort">
				<g:message code="at.emikat.gemerh.ooe.login.passwort" default="Kennwort" />
			</label>
			
        				<g:passwordField class="textnormal" name="passwort" />
		
		<br />
		
		<label class="labelloginbutton">&nbsp; </label>
		<input class="button" type="submit" value="${message(code: 'at.emikat.gemerh.ooe.button.login', default: 'Einloggen')}" />
     	</div>
        </g:form>
    </div>
</body>
