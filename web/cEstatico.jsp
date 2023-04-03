
 
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
    String email= persi.MAIL();
    
persi.obtenDpersonalesU(String.valueOf(ID));
persi.obtenExLabU(String.valueOf(ID));
persi.obtenExAcU(String.valueOf(ID));
persi.obtenExSof(String.valueOf(ID));
persi.obtenExIdi(String.valueOf(ID));
    
String fechaN=persi.getFechaN();
String nac=persi.getNaci();
String ecivil=persi.geteCivil();
String tel=persi.getTcasa();
String cel=persi.getTcel();
String tw=persi.getTwit();
String fb=persi.getFace();
String descripcion=persi.getDes();
String error=persi.error2();
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Curriculum </title>
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
                box-shadow: 0 0 0 1px black;
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
           
            function trabajos(){
                window.location.href='Trabajo.jsp';
            }
            function salir(){
                window.location.href='salir.jsp';
            }
            
        </script>

    </head>
    <body>   
         <header id="header">
            <div class="inner">
                <a href="pagInicio.jsp" class="logo">FinderBliss </a>
                <nav id="nav">
                    <div class="message"> 
                        <input type="button" value="Curriculum" onclick="#" id="home"  class="buton active">
                        <input type="button" value="Trabajos" onclick="trabajos();"  class="buton">
                        <input type="button" value="Otros" onclick="#" class="buton">
                        <input type="button" value="Cerrar Sesión" onclick="salir();" class="buton">

                    </div>
                </nav>
            </div>


        </header>
        <form >
        <table  id="contenedor">
            
            <tr>                    

                <td id="tabla1"  >
                    <div id="cuadro1">
                        <br/>
                        <center><image src="imagenes\NoImagen.png" width="85%" id="foto" /><br><br>
                           </center>
                            <h2>Nombre Completo <br/><%=nomUsu%></h2><br>
                               
                           
                        <h2>Información Personal</h2>
                        <hr width="80%" >
                        <p style='font-size: 18px;' ><b>Nacimiento: </b> <%=fechaN%></p>
                        <hr width="80%" >
                        <p  style='font-size: 18px; '><b>Nacionalidad: </b><%=nac%></p>
                        <hr width="80%" >
                        <p  style='font-size: 18px;' ><b>Estado Civil: </b>
                            <%=ecivil%>
                        </p>
                       
                        <br/><br/>
                        <h2>Contacto</h2>
                        <hr width="80%" >
                        <p  style='font-size: 18px;' ><b>Casa: </b> <%=tel%></p>
                        <hr width="80%" >
                        <p style='font-size: 18px; '><b>Movil: </b><%=cel%></p>
                        <hr width="80%" >
                        <p style='font-size: 18px; '><b>Email: </b> <%=email%></p>
                        <br/><br/>
                        <h2>Redes Sociales</h2>
                        
                        <hr width="80%" >
                        <blockquote >
                            <img src="imagenes\Captura.PNG" width="55px" align="center"/> <%=tw%><br/><br/>
                            <img src="imagenes\Imagen1.png" width="55px" align="center"/> <%=fb%>
                        </blockquote>
                        <br>
                        
                    </div>
                </td>
                <td style="width: 69.5%; padding: 0px;">
                    <div id="cuadro2">
                        <h1 id="h1" align="left" style="color: #ff4136;  ">&nbsp;&nbsp;&nbsp;&nbsp;Mi Perfil
                            <hr width="90%" style="border-color: black; border-width: 3px;"/></h1>
                        <blockquote>
                            <%=descripcion%>
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
                                        
                                    </table>
                                </blockquote>
                            </h1>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <br>

        </form>
    <br> <br>
</body>
</html>




