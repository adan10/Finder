<%-- 
    Document   : Formulario
    Created on : 17/10/2017, 07:53:12 AM
    Author     : adan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="assets/css/perEmple.css" /><meta name="viewport" content="initial-scale=1.0, user-scalable=no" /> 



</head>
<%
    String idUsu = "0";
    
    HttpSession sesion = request.getSession();
    
    if(sesion.getAttribute("idUsr") != null) {
        idUsu = (String) sesion.getAttribute("idUsr").toString();
    }
    
    controlador.cUsuario persi = new controlador.cUsuario();
    persi.cUsuarioE(Integer.parseInt(idUsu));
    if(!persi.VALIDAUSR()) {
        response.sendRedirect("index.html");
    }
    
    if(persi.ALTA() != 1){
        response.sendRedirect("correo2.jsp");
    }
    int ID= persi.IDUSR();
%>
<body>
    <script>

        function soloNumeros(e) {
            var key = window.Event ? e.which : e.keyCode
            return (key >= 48 && key <= 57)
        }
        function texto()
        {
            if ((event.keyCode != 32) && (event.keyCode < 65) || (event.keyCode > 90) && (event.keyCode < 97) || (event.keyCode > 122))
                event.returnValue = false;

        }

    </script>

    <!-- Header -->
    <header id="header">
        <div class="inner">
            <nav id="nav">
                <a href="pagInicio2.jsp">Regresar</a>
            </nav>
        </div>
    </header>

    <!-- Banner -->
    <section id="banner">
        <div class="inner">
            <header>
                <h8>Aqui podras ingresar tu nuevo empleo</h8>
            </header>

            <br><br>
<form align="left" action="guardaEm.jsp" method="POST">
            <div class="flex ">
                <div style="width: 20%">

                    
                        <tr>Tipo de empleo:<input align="left" type="text" name="tipo" class="calle" id="calle"  required> <br></tr>
                        <tr>Delegacion:<input type="text" name="dele" class="dele" id="dele" onkeypress="texto();" required> <br></tr>
                        <tr>Horario<input type="text" name="horario" class="colo" id="colo" required > <br></tr>
                        <tr>Link Imagen:<input align="left" type="text" name="img" class="calle" id="calle"  required> <br></tr>
                        <br>
                        <input type="submit" value="Subir">

                    
                </div>
                <div style=" width: 15%" align="center" >
                    <center>
                        <textarea   name="comentarios" rows="15" cols="35">Escribe aquí tus comentarios</textarea>
                    </center>
                </div></form>

                <div style=" width: 15%">
                    <style type="text/css"> 
                        html { height: 100% } 
                        body { height: 100%; margin: 0px; padding: 0px } 
                        #map_canvas { height: 100% } 
                    </style> 
                    <script 
                                 type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyAEwDXj25dc_wk9aF62gJfljhfJZKUljZY&callback=initMap"></script>
>
                    
                    <script type="text/javascript">
                        function getCoords(marker) {
                            document.getElementById("loglat").innerHTML = 'Latitud: ' + marker.getPosition().lat();
                            document.getElementById("loglong").innerHTML = 'Longitud: ' + marker.getPosition().lng();
                        }
                        function initialize() {
                            var myLatlng = new google.maps.LatLng(20.990291, -89.613590);
                            var myOptions = {
                                zoom: 4,
                                center: myLatlng,
                                mapTypeId: google.maps.MapTypeId.ROADMAP,
                            }
                            var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

                            marker = new google.maps.Marker({
                                position: myLatlng,
                                draggable: true,
                                title: "Hello World!"
                            });
                            google.maps.event.addListener(marker, "dragend", function () {
                                getCoords(marker);
                            });

                            marker.setMap(map);
                            getCoords(marker);


                        }

                    </script> 
                      <style>
    .google-maps {
    position: relative;
    padding-bottom: 75%;
    height: 0;
    overflow: hidden;
    }
    .google-maps iframe {
    position: absolute;
    top: 0;
    left: 0;
    width: 100% !important;
    height: 100% !important;
    }
    </style>

                    </head> 
                    <body onload="initialize()"> 

                        <div id="map_canvas" style="width:50px; height:400px"></div><br> 
                        <font color="#0000FF"><strong id="loglat">Latitud:</strong></font>  

                        <br> 
                        <font color="#FF0000"><strong id="loglong">Longitud:</strong></font>  
                </div>
            </div>



        </div>
    </section>





    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/skel.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>

</body>
</html>