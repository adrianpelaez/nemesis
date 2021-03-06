<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>VM</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>

        <script type="text/javascript"
            src="guacamole-common-js/all.min.js"></script>

		<div class="alert alert-info" role="alert">Conexi�n VNC</div>
		<!-- Display -->
		<div id="display"></div>

				
		

        <!-- Init -->
        <script type="text/javascript"> /* <![CDATA[ */
	   
		// Extraer el display del document
       var display = document.getElementById("display");
        
    	// instanciar el client, usando un tunel http para comunicaciones.
       var guac = new Guacamole.Client(
           new Guacamole.HTTPTunnel("tunnel")
       );
    	
   		// A�adir el cliente al div que hemos designado
       display.appendChild(guac.getDisplay().getElement());
    
   		//ver a que nos conectamos
       var data= "direccion=" + "${direccion}"
       + "&puerto=" + "${puerto}"
       // nos conectamos
       guac.connect(data);	
   	
    	// Manejador de errores
       guac.onerror = function(error) {
           alert(error);
       };
   		
   		 // Desconectarse al cerrar
       window.onunload = function() {
           guac.disconnect();
       }
   		 
    	// Mouse
       var mouse = new Guacamole.Mouse(guac.getDisplay().getElement());
       mouse.onmousedown = 
       mouse.onmouseup   =
       mouse.onmousemove = function(mouseState) {
           guac.sendMouseState(mouseState);
       };
       // Keyboard
       var keyboard = new Guacamole.Keyboard(document);
       keyboard.onkeydown = function (keysym) {
           guac.sendKeyEvent(1, keysym);
       };
       keyboard.onkeyup = function (keysym) {
           guac.sendKeyEvent(0, keysym);
       };
		
        /* ]]> */ </script>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>
</html>