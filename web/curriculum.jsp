
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
    String idUsu = "0";
    String codd = "";
    
    HttpSession sesion = request.getSession();
    
    if(sesion.getAttribute("idUsr") != null) {
        idUsu = (String) sesion.getAttribute("idUsr").toString();
    }else{
     response.sendRedirect("index.html");}
    
    controlador.cUsuario persi = new controlador.cUsuario(Integer.parseInt(idUsu));
    if(!persi.VALIDAUSR()) {
        response.sendRedirect("index.html");
    }
    
   if(persi.ALTA() != 1){
        response.sendRedirect("correo.jsp");
    }
    String nomUsu = persi.NOMBRE();    
    int ID= persi.IDUSR();
    String email= "\""+persi.MAIL()+"\"";
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Curriculum</title>
        <link rel="shortcut icon" href="imagenes/FinderB.png" />
        <style>
@import url("https://fonts.googleapis.com/css?family=Lato:300,400,700|Pacifico");

            body
            {
                background-color: grey;
                align-content: center;
                font-family: Arial;
                margin:auto;
            }
            .active {
                background-color: #ff4136;
            }

            #contenedor{ 
                margin: 10px;

            } 


            #contenedor{
                background-color: white;
                margin-left: 80px;
                margin-right: 80px;
                margin-top: 100px;
                margin-bottom: 25px;
                height: max-content;
                position:relative;
                box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
            }
            #tabla1{
                background-color: #ff4136;
                width: 30%; 
                padding: 0px;
                height: 100%;
            }
            #cuadro1
            {
                background-color: #ff4136;
                color: white;
                text-align: center;
                position: relative;  
            }
            #cuadro2{
                background-color:white;
                position: relative;  
            }
            #cuadro3{
                background-color:white;
                width: 50%;
                position: relative;  
            } #cuadro4{
                background-color:white;
                width: 20%;
                position: relative;  
            } #cuadro5{
                background-color:white;
                width: 80%;
                position: relative;  
            }

            hr { 

                border-width: 2px;
                border-color:  white;
            } 
            .boton{
                outline: 0;
                width: 10%;
                border: 0;
                padding: 15px;
                color: #000;
                background-color: lightgray;
                font-size: 14px;
                -webkit-transition: all 0.3 ease;
                transition: all 0.3 ease;
                cursor: pointer;
                border-radius: 1000px;
            }

            .boton:hover, .boton:active,.boton:focus {
                background-color: #ff4136;
                color:#FFF;
            }

            input,
            select,
            textarea {
                -moz-appearance: none;
                -webkit-appearance: none;
                -ms-appearance: none;
                appearance: none;
                background: white;
                border-radius: 10px;
                border: solid 2px black;
                color: black;
                outline: 0;
                padding: 0 1em;
                text-decoration: none;

            }

            input:invalid,
            select:invalid,
            textarea:invalid {
                box-shadow: none;
            }

            input:focus,
            select:focus,
            textarea:focus {
                border-color: pink;
                box-shadow: 0 0 0 1px #4bae77;
            }

            .select-wrapper {
                text-decoration: none;
                display: block;
                position: relative;
            }

            .select-wrapper:before {
                content: "";
                -moz-osx-font-smoothing: grayscale;
                -webkit-font-smoothing: antialiased;
                font-family: FontAwesome;
                font-style: normal;
                font-weight: normal;
                text-transform: none !important;
            }

            .select-wrapper:before {
                color: #fff;
                display: block;
                height: 2.75em;
                line-height: 2.75em;
                pointer-events: none;
                position: absolute;
                right: 0;
                text-align: center;
                top: 0;
                width: 2.75em;
            }

            .select-wrapper select::-ms-expand {
                display: none;
            }

            input,	select {
                height: 2.75em;
            }

            textarea {
                padding: 0.75em 1em;
            }

            #header {
		background: #1c1c1c;
		color: #d5d5d5;
		cursor: default;
		height: 5em;
		left: 0;
		line-height: 5em;
		position: fixed;
		text-align: right;
		top: 0;
		width: 100%;
		z-index: 10001;
	}

		#header .inner {
			max-width: 65em;
			width: calc(100% - 6em);
			margin: 0 auto;
			position: relative;
		}

			@media screen and (max-width: 480px) {

				#header .inner {
					max-width: 90%;
					width: 90%;
				}

			}

		#header .logo {
			font-family: 'Pacifico', cursive;
			display: inline-block;
			height: inherit;
			left: 0;
			line-height: inherit;
			margin: 0;
			padding: 0;
			position: absolute;
			top: 0;
			color: #e5474b;
			font-size: 1.75em;
			text-transform: none;
			font-weight: normal;
			padding: 0;
		}

			#header .logo:hover {
				color: rgba(229, 71, 75, 0.75);
			}

		#header a {
			-moz-transition: color 0.2s ease-in-out;
			-webkit-transition: color 0.2s ease-in-out;
			-ms-transition: color 0.2s ease-in-out;
			transition: color 0.2s ease-in-out;
			display: inline-block;
			padding: 0 2em;
			color: #ffffff;
			text-decoration: none;
			text-transform: uppercase;
			font-weight: 700;
			font-size: .85em;
		}

			#header a:hover {
				color: rgba(255, 255, 255, 0.75);
			}

			#header a:last-child {
				padding-right: 0em;
			}

			@media screen and (max-width: 736px) {

				#header a {
					padding: 0 0.5em;
				}

			}

	@media screen and (max-width: 480px) {

		#header {
			min-width: 320px;
		}

	}


            .buton{
                outline: 0;
                padding: 15px 16px;
                margin: 0px;
                border: 0px;
                color: white;
                background-color: transparent;
                font-size: 14px;
                font-family:Arial;



            }
            .buton:hover{
                background-color: #111;
                color: white;
            } .buton:active,.buton:focus {
                background-color: #3B0B0B;
                color:#FFF;
            }
            .active {
                background-color: #3B0B0B;
                color:#FFF;
            }
            .leftli {
                float: left;
            }


        </style>
        <script>

            function editar() {
                //cambiaImagen();
                cambiaColor();
                if(validar()){
                    estatico();
                    
                }

            }
            function cambiaImagen() {
                var imagen = document.getElementById('imagen').value;
                if (imagen == "") {


                } else {
                    alert(imagen);
                    document.getElementById('foto').src = imagen;
                }
            }
            function cambiaColor() {

                var col = document.getElementById("myColor").value;


                if (col !== '#ffffff') {

                    document.getElementById("cuadro1").style.backgroundColor = col;
                    document.getElementById("cuadro1").style.color = "white";
                    document.getElementById("h1").style.color = col;
                    document.getElementById("h2").style.color = col;
                    document.getElementById("h3").style.color = col;
                    document.getElementById("h4").style.color = col;
                    document.getElementById("h5").style.color = col;
                    document.getElementById("btnActualiza").style.backgroundColor = col;
                    document.getElementById("tabla1").style.backgroundColor = col;


                } else {
                    document.getElementById("cuadro1").style.backgroundColor = col;
                    document.getElementById("cuadro1").style.color = "black";
                    document.getElementById("cuadro1").style.borderRight = "1px solid black";
                    document.getElementById("h1").style.color = "black";
                    document.getElementById("h2").style.color = "black";
                    document.getElementById("h3").style.color = "black";
                    document.getElementById("h4").style.color = "black";
                    document.getElementById("h5").style.color = "black";
                    document.getElementById("activo").style.backgroundColor = "black";
                    document.getElementById("btnActualiza").style.backgroundColor = "black";
                    document.getElementById("tabla1").style.backgroundColor = col;
                }



            }

            var numero = 1;
            var numeroT = 1;
            var numeroS = 1;
            var numeroI = 1;
            function Añadir() {
                if (numero === 1) {
                    document.getElementById('Estudios1').style.visibility = 'visible';
                    document.getElementById('Quita').style.display = 'block';
                    numero = numero + 1;
                } else if (numero === 2) {
                    document.getElementById('Estudios2').style.visibility = 'visible';
                    numero = numero + 1;
                } else if (numero > 2) {
                    alert('Solo puedes agregar dos campos');
                }
            }
            function Quitar() {
                if (numero === 1) {
                    document.getElementById('Quita').style.display = 'none';
                    alert('No puedes quitar tantos campos');
                } else if (numero === 2) {
                    document.getElementById('Estudios1').style.visibility = 'collapse';
                    numero = numero - 1;
                } else if (numero === 3) {
                    document.getElementById('Estudios2').style.visibility = 'collapse';
                    numero = numero - 1;
                }
            }
            function AñadirT() {
                if (numeroT === 1) {
                    document.getElementById('Trabajos1').style.visibility = 'visible';
                    document.getElementById('QuitaT').style.display = 'block';
                    numeroT = numeroT + 1;
                } else if (numeroT === 2) {
                    document.getElementById('Trabajos2').style.visibility = 'visible';
                    numeroT = numeroT + 1;
                } else if (numeroT > 2) {
                    alert('Solo puedes agregar dos campos');
                }
            }
            function QuitarT() {
                if (numeroT === 1) {
                    document.getElementById('QuitaT').style.display = 'none';
                    alert('No puedes quitar tantos campos');
                } else if (numeroT === 2) {
                    document.getElementById('Trabajos1').style.visibility = 'collapse';
                    numeroT = numeroT - 1;
                } else if (numeroT === 3) {
                    document.getElementById('Trabajos2').style.visibility = 'collapse';
                    numeroT = numeroT - 1;
                }
            }
            function AñadirI() {

                if (numeroI === 1) {
                    document.getElementById('Idioma1').style.visibility = 'visible';
                    document.getElementById('QuitaI').style.display = 'block';
                    numeroI = numeroI + 1;
                } else if (numeroI === 2) {
                    document.getElementById('Idioma2').style.visibility = 'visible';
                    numeroI = numeroI + 1;
                } else if (numeroI > 2) {
                    alert('Solo puedes agregar dos campos');
                }
            }
            function QuitarI() {
                if (numeroI === 1) {
                    document.getElementById('QuitaI').style.display = 'none';
                    alert('No puedes quitar tantos campos');
                } else if (numeroI === 2) {
                    document.getElementById('Idioma1').style.visibility = 'collapse';
                    numeroI = numeroI - 1;
                } else if (numeroI === 3) {
                    document.getElementById('Idioma2').style.visibility = 'collapse';
                    numeroI = numeroI - 1;
                }
            }
            function AñadirS() {
                if (numeroS === 1) {
                    document.getElementById('Software1').style.visibility = 'visible';
                    document.getElementById('QuitaS').style.display = 'block';
                    numeroS = numeroS + 1;
                } else if (numeroS === 2) {
                    document.getElementById('Software2').style.visibility = 'visible';
                    numeroS = numeroS + 1;
                } else if (numeroS > 2) {
                    alert('Solo puedes agregar dos campos');
                }
            }
            function QuitarS() {
                if (numeroS === 1) {
                    document.getElementById('QuitaS').style.display = 'none';
                    alert('No puedes quitar tantos campos');
                } else if (numeroS === 2) {
                    document.getElementById('Software1').style.visibility = 'collapse';
                    numeroS = numeroS - 1;
                } else if (numeroS === 3) {
                    document.getElementById('Software2').style.visibility = 'collapse';
                    numeroS = numeroS - 1;
                }
            }
            function validar()
            {
                var aux1="", aux2="";
                
                var nombre = document.getElementById('nombre').value;
                var fechaNac = document.getElementById('fechaNac').value;
                var nacionalidad = document.getElementById('nacionalidad').value;
                var estadoC = document.getElementById('EstadoC').selectedIndex.value;
                var expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                var tel1 = document.getElementById('tel1').value;
                var tel2 = document.getElementById('tel2').value;
                var email = document.getElementById('email').value;

                var social1 = document.getElementById('red1').value;
                var social2 = document.getElementById('red2').value;

                var patron = /\D[A-Za-zÁÉÍÓÚáéíóú]/;

                if (nombre === "") {
                    alert('Asegurate de no dejar datos en blanco');
                    return false;
                } else
                if (email === "") {
                    alert('Asegurate de no dejar datos en blanco');
                    return false;
                } else
                if (fechaNac === "") {
                    alert('Asegurate de no dejar datos en blanco');
                    return false;
                } else
                if (nacionalidad === "") {
                    alert('Asegurate de no dejar datos en blanco');
                    return false;
                } else
                if (estadoC === "") {
                    alert('Asegurate de no dejar datos en blanco');
                    return false;
                } else
                if (tel1 === "") {
                    alert('Asegurate de no dejar datos en blanco');
                    return false;
                } else
               
                if (tel2 === "") {
                    alert('Asegurate de no dejar datos en blanco');
                    return false;
                } else
                if (/^[A-Za-zñÑ-áéíóúÁÉÍÓÚ\s]*$/.test(nombre) === false) {
                    if (/^([0-9])*$/.test(nombre) === false) {
                        alert('Escribe tu nombre sin números ni caracteres especiales');
                        return false;
                    } else
                        alert('Escribe tu nombre sin números ni caracteres especiales');
                    return false;
                } else
                if (/^[A-Za-zñÑ-áéíóúÁÉÍÓÚ\s]*$/.test(nacionalidad) === false) {
                    if (/^([0-9])*$/.test(nacionalidad) === false) {
                        alert('Escribe tu nacionalidad sin números ni caracteres especiales');
                        return false;
                    } else
                        alert('Escribe tu nacionalidad sin números ni caracteres especiales');
                    return false;
                } else
                if (!expr.test(email)) {
                    alert('Algo está mal. Verifica tu correo electrónico');
                    return false;
                } else

                if (isNaN(tel1) || isNaN(tel2)) {
                    alert('Error en tu telefono');
                    return false;
                }else 
                if (social1 === "") {
                     aux1 = confirm('Estas seguro de que no quieres ingresar tu Twitter?');
                    if (aux1 === 'false') {
                        return false;
                    }
                }
            
                if (social2 === "") {
                     aux2 = confirm('Estas seguro de que no quieres ingresar tu Facebook?');
                    if (aux2 === 'false') {
                        return false;
                    }
                } 
                
validar2();
                    //    return true;
                

            }

            function validar2() {
                var perfil = document.getElementById('PerfilTxt').value;
                var año = document.getElementById('año1').value;
                var años = document.getElementById('años1').value;
                var expProf = document.getElementById('expProf1').value;
                var formAca = document.getElementById('formAca1').value;
                
                var soft = document.getElementById('software1').value;
                var nivelS = document.getElementById('nivelS1').selectedIndex.value;
                var idio = document.getElementById('idioma1').value;
                var nivelI = document.getElementById('nivelI1').selectedIndex.value;
                
                if (perfil === "") {
                    alert('Ingresa informacion de tu perfil');
                    return false;
                }else
                if (/^[A-Za-zñÑ-áéíóúÁÉÍÓÚ\s]*$/.test(perfil) === false) {
                    if (/^([0-9])*$/.test(perfil) === false) {
                        alert('Escribe tu perfil sin números ni caracteres especiales');
                        return false;
                    } else
                        alert('Escribe tu perfil sin números ni caracteres especiales');
                    return false;
                } /*else
                
                if (año ==="" || expProf==="") {
                    alert('Estas dejando un campo de tu experiencia profesional vacio');
                    return false;
                }else
                
                if (años === "" || formAca==="") {
                    alert('Estas dejando un campo de tu formacion academica vacio');
                    return false;
                }else
                
                if (nivelS === "" || soft==="") {
                    alert('Estas dejando un campo de tu formacion academica vacio');
                    return false;
                }else
                
                if (nivelI === "" || idio==="") {
                    alert('Estas dejando un campo de tu formacion academica vacio');
                    return false;
                }*/
            
            if (año === "" && expProf === "") {
                    var aux = confirm('Seguro que quieres dejar tu experiencia profesional en blanco?');
                    if (aux === 'false') {
                        return false;
                    }
                } 
            
                    if (años === "" && formAca==="") {
                    var aux = confirm('Seguro que quieres dejar tu formacion academica en blanco?');
                    if (aux === 'false') {
                        return false;
                    }
                    }
                    if (nivelS === "" && soft==="") {
                    var aux = confirm('Seguro que quieres dejar tu conocimiento de Software en blanco?');
                
                    if (aux === 'false') {
                        return false;
                    }}
                    
                    if (nivelI === "" && idio==="") {
                    var aux = confirm('Seguro que quieres dejar tu nivel de Idioma en blanco?');
                    if (aux === 'false') {
                        return false;
                    }
                    }
                    
                    return true;
                    
                    
                    
            }
            
            
            function trabajos(){
                window.location.href='Trabajo.jsp';
            }
             function estatico(){
                var nombre = document.getElementById('nombre');
                var fechaNac = document.getElementById('fechaNac');
                var nacionalidad = document.getElementById('nacionalidad');
                var tel1 = document.getElementById('tel1').value;
                var tel2 = document.getElementById('tel2').value;
                var email = document.getElementById('email').value;
               
        
         if (col !== '#ffffff') {
                
              nombre.style.color="white";
              fechaNac.style.color="white";
               nacionalidad.style.color="white";
               tel1.style.color="white";
              tel2.style.color="white";
               email.style.color="white";
          
        }
        
                nombre.readOnly = "true";
                nombre.style.backgroundColor= col;
                nombre.style.borderColor=col;
                nombre.style.fontSize="18px";
                
                fechaNac.readOnly = "true";
                fechaNac.style.backgroundColor= col;
                fechaNac.style.borderColor=col;
                
                nacionalidad.readOnly = "true";
                nacionalidad.style.backgroundColor= col;
                nacionalidad.style.borderColor=col;
                
                tel1.readOnly = "true";
                tel1.style.backgroundColor= col;
                tel1.style.borderColor=col;
                
                tel2.readOnly = "true";
                tel2.style.backgroundColor= col;
                tel2.style.borderColor=col;
                
               email.readOnly = "true";
                email.style.backgroundColor= col;
                email.style.borderColor=col;
            }
        </script>

    </head>
    <body>   
         <header id="header">
            <div class="inner">
                <a href="pagInicio.jsp" class="logo">FinderBliss</a>
                <nav id="nav">
                    <div class="message"> 
                        <input type="button" value="Curriculum" onclick="#" id="home"  class="buton active">
                        <input type="button" value="Trabajos" onclick="trabajos();"  class="buton">
                        <input type="button" value="Otros" onclick="#" class="buton">
                        <input type="button" value="Cerrar Sesión" onclick="#" class="buton">

                    </div>
                </nav>
            </div>


        </header>
        <form action="curri.jsp" method="POST">
        <table  id="contenedor">
            
            <tr>                    

                <td id="tabla1"  >
                    <div id="cuadro1">
                        <br>
                        
                            <h5>Selecciona el color que desees: <input name="color" type="color" id="myColor" value="#ff4136" style="height: 25px; width: 30px; padding-left: 0; padding-right: 0; " /></h5> 
                        <br>
                        <center><image src="imagenes\NoImagen.png" width="85%" id="foto" /><br><br>
                            <input type="file" id="imagen"  value="noImagen" accept=".jpg, .jpeg,.png" style="border:0; background-color: transparent; "></center>
                            <h2>Nombre Completo <br/><input name="nombre"type="text" id="nombre" placeholder="Nombre Completo"></h2><br>
                               
                           
                        <h2>Información Personal</h2>
                        <hr width="80%" >
                        <p style='font-size: 18px;' ><b>Nacimiento: </b> <input name="fechaNac" id="fechaNac" type="date" placeholder="dd/mm/aa"/></p>
                        <hr width="80%" >
                        <p  style='font-size: 18px; '><b>Nacionalidad: </b><input name="nacionalidad" id="nacionalidad" placeholder="País"/></p>
                        <hr width="80%" >
                        <p  style='font-size: 18px;' ><b>Estado Civil: </b>
                            <select id="EstadoC" name="EstadoC">
                                <option value="">Seleccione una opcion</option>
                                <option value="sotero">Soltero</option>
                                <option value="casado">Casado</option>
                                <option value="separado">Separado</option>
                                <option value="divorciado">Divorciado o Viudo</option>
                            </select>
                        </p>
                       
                        <br/><br/>
                        <h2>Contacto</h2>
                        <hr width="80%" >
                        <p  style='font-size: 18px;' ><b>Casa: </b> <input name="telefono"id="tel1" type="tel" placeholder="Telefono"/></p>
                        <hr width="80%" >
                        <p style='font-size: 18px; '><b>Movil: </b><input name="celular"id="tel2" type="tel" placeholder=" Telefono celular"/></p>
                        <hr width="80%" >
                        <p style='font-size: 18px; '><b>Email: </b> <input id="email" type="email" value=<%=email%>/></p>
                        <br/><br/>
                        <h2>Redes Sociales</h2>
                        
                        <hr width="80%" >
                        <blockquote >
                            <img src="imagenes\Captura.PNG" width="55px" align="center"/> <input name="twit" id="red1" type="text" placeholder="Twitter"/><br/><br/>
                            <img src="imagenes\Imagen1.png" width="55px" align="center"/> <input name="face"id="red2" type="text" placeholder="Facebook"/>
                        </blockquote>
                        <br>
                        
                    </div>
                </td>
                <td style="width: 69.5%; padding: 0px;">
                    <div id="cuadro2">
                        <h1 id="h1" align="left" style="color: #ff4136;  ">&nbsp;&nbsp;&nbsp;&nbsp;Mi Perfil
                            <hr width="90%" style="border-color: black; border-width: 3px;"/></h1>
                        <blockquote>
                            <textarea name="desc" style="font-size: 18px; margin: 0px; width: 95%; height: 89px; " id="PerfilTxt" name=" " style="display: none;" placeholder="Escribe una descripcion de tu perfil"></textarea>
                            <br/> 
                            
                            
                        
                        </blockquote>
                        <br><br>
                        <h1 id="h2" align="left" style="color: #ff4136;  ">&nbsp;&nbsp;&nbsp;&nbsp; Experiencia Profesional
                            <hr width="90%" style="border-color: black; border-width: 3px;"></h1>
                        <blockquote>
                            <table style="width: 100%;">
                                <tr >
                                    <td style="width: 20%;"><input name="EPt1" type="number" min="1850" max="2017" placeholder="Año:" style="width: 70%;" id="año1"/> </td>
                                    <td style="width: 80%;"><textarea name="EPinfo1" id="expProf1" style="margin: 0px; resize: none; width: 90%; height: 57px; " placeholder="Ingresa la informacion de tu formacion profesional"></textarea></td>
                                </tr>
                                <tr style="visibility: collapse;" id="Trabajos1">
                                    <td style="width: 20%;"><input name="EPt2" type="number" placeholder="Año:" min="1850" max="2017" style="width: 70%;" id="año2"/> </td>
                                    <td style="width: 80%;"><textarea name="EPinfo2" id="expProf2" style="margin: 0px; resize: none; width: 90%; height: 57px;" placeholder="Ingresa la informacion de tu formacion profesional"></textarea></td>
                                </tr>
                                <tr style="visibility: collapse;" id="Trabajos2">
                                    <td style="width: 20%;"><input name="EPt3" type="number"  id="año3" min="1850" max="2017" placeholder="Año:" style="width: 70%;" /> </td>
                                    <td style="width: 80%;"><textarea name="EPinfo3" id="expProf3" style="margin: 0px; resize: none;  width: 90%; height: 57px;" placeholder="Ingresa la informacion de tu formacion profesional"></textarea></td>
                                </tr>
                                <tr>
                                    <td><input type="button"  onclick="AñadirT();" value="Añadir más"></td>
                                    <td><input type="button"  id="QuitaT" onclick="QuitarT();" style="display: none;" value="Quitar"></td>
                                </tr>
                            </table>
                        </blockquote>
                      
                        <br><br>
                        <h1 id="h3" align="left" style="color: #ff4136;  ">&nbsp;&nbsp;&nbsp;&nbsp; Formación Académica
                            <hr width="90%" style="border-color: black; border-width: 3px;"></h1>
                        <blockquote>
                            <table style="width: 100%;">
                                <tr >
                                    <td style="width: 20%;"><input name="FAt1" type="number" id="años1"  placeholder="Año:" min="1850" max="2017" style="width: 70%;"/> </td>
                                    <td style="width: 80%;"><textarea name="FAinfo1" id="formAca1" style="margin: 0px; resize: none;  width: 90%; height: 57px; " placeholder="Ingresa la informacion de tus estudios"></textarea></td>
                                </tr>
                                <tr style="visibility: collapse;" id="Estudios1">
                                    <td style="width: 20%;"><input name="FAt2" type="number" id="años2" placeholder="Año:" min="1850" max="2017" style="width: 70%;"/> </td>
                                    <td style="width: 80%;"><textarea name="FAinfo2"id="formAca2" style="margin: 0px; resize: none;  width: 90%; height: 57px;" placeholder="Ingresa la informacion de tus estudios"></textarea></td>
                                </tr>
                                <tr style="visibility: collapse;" id="Estudios2">
                                    <td style="width: 20%;"><input name="FAt3" type="number" id="años3" placeholder="Año:" min="1850" max="2017" style="width: 70%;"/> </td>
                                    <td style="width: 80%;"><textarea name="FAinfo3"id="formAca3" style="margin: 0px; resize: none; width: 90%; height: 57px;" placeholder="Ingresa la informacion de tus estudios"></textarea></td>
                                </tr>
                                <tr>
                                    <td><input type="button" value="Añadir más" onclick="Añadir();"></td>
                                    <td><input type="button" value="Quitar"  id="Quita" onclick="Quitar();" style="display: none;"></td>
                                </tr>
                            </table>
                        </blockquote>
                        <br><br>
                        <div id="cuadro3" style="float: left;">
                            <h1 id="h4" align="left" style="color: #ff4136;  ">&nbsp;&nbsp;&nbsp;&nbsp; Software
                                <hr width="85%" style="border-color: black; border-width: 3px;">
                                <blockquote>
                                    <table>
                                        <tr>
                                            <td>
                                                <input name="Sinfo1" id="software1" placeholder="Nombre de la Aplicacion (Lenguaje)" style="width: 60%;"/>
                                                <select name="Sn1"id="nivelS1" style="width: 25%;">
                                                    <option value="">Nivel</option>
                                                    <option value="Usuario">Usuario</option>
                                                    <option value="UsuarioAvanzado">UsuarioAvanzado</option>
                                                    <option value="Profesional">Profesional</option>
                                                    <option value="Experto">Experto</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="Software1" style="visibility: collapse;">
                                                <input name="Sinfo2"id="software2" placeholder="Nombre de la Aplicacion (Lenguaje)" style="width: 60%;"/>
                                                <select name="Sn2"id="nivelS2" style="width: 25%;">
                                                    <option value="">Nivel</option>
                                                    <option value="Usuario">Usuario</option>
                                                    <option value="UsuarioAvanzado">UsuarioAvanzado</option>
                                                    <option value="Profesional">Profesional</option>
                                                    <option value="Experto">Experto</option>
                                                </select>
                                            </td>
                                        </tr><tr>
                                            <td id="Software2" style="visibility: collapse;">
                                                <input name="Sinfo3"id="software3" placeholder="Nombre de la Aplicacion (Lenguaje)" style="width: 60%;"/>
                                                <select name="Sn3"id="nivelS3" style="width: 25%;">
                                                    <option value="">Nivel</option>
                                                    <option value="Usuario">Usuario</option>
                                                    <option value="UsuarioAvanzado">UsuarioAvanzado</option>
                                                    <option value="Profesional">Profesional</option>
                                                    <option value="Experto">Experto</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="button" value="Añadir más"  onclick="AñadirS();">
                                            <td><input type="button" value="Quitar"  id="QuitaS" onclick="QuitarS();" style="display: none;"></td>
                                            </td>
                                        </tr>
                                    </table>
                                </blockquote>
                            </h1>
                        </div>
                        <div id="cuadro3" style="float: right;">
                            <h1 id="h5" align="left" style="color: #ff4136;  ">&nbsp;&nbsp;&nbsp;&nbsp; Idiomas
                                <hr width="85%" style="border-color: black; border-width: 3px;">
                                <blockquote>
                                    <table>
                                        <tr>
                                            <td>
                                                <input name="Iinfo1" id="idioma1" placeholder="Idioma" style="width: 60%;"/>
                                                <select name="In1" id="nivelI1" style="width: 25%;">
                                                    <option value="">Nivel</option>
                                                    <option value="basico">Basico</option>
                                                    <option value="intermedio">Intermedio</option>
                                                    <option value="avanzado">Avanzado</option>
                                                    <option value="nativo">Nativo</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="Idioma1" style="visibility: collapse;">
                                                <input name="Iinfo2" placeholder="Idioma" style="width: 60%;"/>
                                                <select name="In2"id="nivelI2" style="width: 25%;">
                                                    <option value="">Nivel</option>
                                                    <option value="basico">Basico</option>
                                                    <option value="intermedio">Intermedio</option>
                                                    <option value="avanzado">Avanzado</option>
                                                    <option value="nativo">Nativo</option>
                                                </select>
                                            </td>
                                        </tr><tr>
                                            <td id="Idioma2" style="visibility: collapse;">
                                                <input name="Iinfo3" placeholder="Idioma" style="width: 60%;"/>
                                                <select name="In3" id="nivelI3" style="width: 25%;">
                                                    <option value="">Nivel</option>
                                                    <option value="basico">Basico</option>
                                                    <option value="intermedio">Intermedio</option>
                                                    <option value="avanzado">Avanzado</option>
                                                    <option value="nativo">Nativo</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="button" value="Añadir más" onclick="AñadirI();">
                                            <td><input type="button" value="Quitar"  id="QuitaI" onclick="QuitarI();" style="display: none;"></td>
                                            </td>
                                        </tr>
                                    </table>
                                </blockquote>
                            </h1>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <br>
        <center> <input type="submit" onclick="editar()" value="Envía"  name="btnActualiza" id="btnActualiza" class="boton"></center>  
        </form>
    <br> <br>
</body>
</html>



https://www.infoempleo.com/consejos/curriculum_vitae_elementos_cv/






