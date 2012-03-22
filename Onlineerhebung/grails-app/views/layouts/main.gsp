<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        
        <title>
        	<g:layoutTitle default="${message(code: 'at.emikat.gemerh.ooe', default: 'Gemeindeerhebung 2010')}" />
        </title>
        
        <link rel="stylesheet" href="${resource(dir:'css',file:'at.emikat.gemerh.ooe.css')}" type="text/css"/>
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        
        <g:urlMappings />
        
	    <script type="text/javascript">
			function hilfe (controller, action, anchor) {
				url = g.createLink({controller: controller, action: action});
				url = url + anchor
				fenster = window.open(url, "fenster1", "width=600,height=400,status=yes,scrollbars=yes,resizable=yes");
				fenster.focus();
			}
		</script>
    </head>
    
    <body>
    	<div id="wrap">			
	        <g:layoutBody />
        </div>
    </body>
</html>