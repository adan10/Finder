<%-- 
    Document   : val
    Created on : 02-nov-2017, 22:08:30
    Author     : mfuen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String usu = request.getParameter("usuario2") == null ? "" : request.getParameter("usuario2");
    String pass = request.getParameter("psw2") == null ? "" : request.getParameter("psw2");
    String msj="Encuentra tu trabajo ideal";
    
    if(!usu.equals("")&&!pass.equals("")){
        controlador.cUsuario ob=new controlador.cUsuario(usu,pass);
        String res=ob.error2();
        if(res.equals("Usuario o contraseña incorrectos")){
            msj=res;   
        }
        else{
            if(res.equals("Usu")){
                 
                response.sendRedirect("pagInicio.jsp");
                HttpSession xSes = request.getSession(true);
                xSes.setAttribute("idUsr", ob.IDUSR());
            }if(res.equals("Empresa")){
                response.sendRedirect("pagInicio2.jsp");
                HttpSession xSes = request.getSession(true);
                xSes.setAttribute("idUsr", ob.IDUSR());
            }
            msj=res;
        }
        
    } 
    else{
        msj="Escribe un usuario y contraseña";
    }
    
%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<html>
    <head>
        <title>FinderBliss</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/inicio.css">
 
        <style>

            ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                background-color: #333;
                position: fixed;
                top: 0;
                width: 100%;
                font-family: Helvica;
                font-size: 12px;
                z-index: 1;
            }

            li {
                float: right;
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

            html, body {  margin: 0; padding: 0; }

            .form {

                position: static;
                z-index: 1;
                background: #FFFFFF;
                max-width: 360px;
                margin-top: -100px;
                margin-left: 800px;
                padding: 45px;
                text-align: center;
                box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);



            }

            .form input, .form select {
                font-family: "Roboto", sans-serif;
                outline: 0;
                background: #f2f2f2;
                width: 100%;
                border: 0;
                margin: 0 0 15px;
                padding: 15px;
                box-sizing: border-box;
                font-size: 14px;
            }

            .boton{
                outline: 0;
                width: 100%;
                border: 0;
                padding: 15px;
                color: #000;
                background-color: pink;
                font-size: 14px;
                -webkit-transition: all 0.3 ease;
                transition: all 0.3 ease;
                cursor: pointer;
                border-radius: 1000px;
            }
            .boton:hover, .boton:active,.boton:focus {
                background-color: #8A0808;
                color:#FFF;
            }.form .message {
                margin: 15px 0 0;
                color: #b3b3b3;
                font-size: 12px;
            }
            .form .message a {
                color: #8A0808;
                text-decoration: none;
            }
            #forma{
                animation-duration: 1.5s;
                animation-name: atenuar;
            }

            .input-text,
            .textarea {
                width: 100%;
                float: left;
                border: 2px solid #d8d8d8;
                background: white;
                height: 58px;
                padding: 10px 21px;
                font: 500 17px/34px "Raleway", "Helvetica Neue", Helvetica, Arial, sans-serif;
                -moz-transition: color 0.1s linear, background-color 0.1s linear, border-color 0.1s linear;
                -ms-transition: color 0.1s linear, background-color 0.1s linear, border-color 0.1s linear;
                -o-transition: color 0.1s linear, background-color 0.1s linear, border-color 0.1s linear;
                -webkit-transition: color 0.1s linear, background-color 0.1s linear, border-color 0.1s linear;
                transition: color 0.1s linear, background-color 0.1s linear, border-color 0.1s linear;
                -moz-border-radius: 5px;
                -webkit-border-radius: 5px;
                border-radius: 5px;
                -moz-box-sizing: border-box;
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
            }

            .input-text:focus,
            .textarea:focus {
                border-color: #641E16
            }

            .textarea {
                font-family: "Helvetica Neue", Helvetica, Arial, sans-serif
            }

            .button {
                color: white;
                background: #99A3A4  
                    ;
                height: 58px;
                border: 2px solid#99A3A4  
                    ;
                font: 500 22px "Raleway", "Helvetica Neue", Helvetica, Arial, sans-serif;
                padding: 0 21px;
                -moz-transition: color 0.1s linear, background-color 0.1s linear, border-color 0.1s linear;
                -ms-transition: color 0.1s linear, background-color 0.1s linear, border-color 0.1s linear;
                -o-transition: color 0.1s linear, background-color 0.1s linear, border-color 0.1s linear;
                -webkit-transition: color 0.1s linear, background-color 0.1s linear, border-color 0.1s linear;
                transition: color 0.1s linear, background-color 0.1s linear, border-color 0.1s linear;
                -moz-border-radius: 5px;
                -webkit-border-radius: 5px;
                border-radius: 5px;
                -moz-box-sizing: border-box;
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
            }

            .button:hover {
                background: #641E16  ;
                border-color: #641E16  ;
            }

            .button:active {
                background: #641E16  ;
                border-color: #641E16  ;
            }

            a.button {
                text-decoration: none;
                display: inline-block;
                line-height: 54px;
                color: white;
            }

            a.button:hover {
                color: white
            }

            a.button:active {
                color: white
            }

            a.button.button-stripe {
                background-color: rgba(0, 0, 0, 0.2);
                border-color: #641E16;
            }

            a.button.button-stripe:hover {
                color: #641E16;
                background-color: #99A3A4  
                    ;
                border-color: #641E16 
                    ;
            }

            a.button.button-stripe:active {
                color: #222222;
                background-color: #641E16;
                border-color: #641E16;
            }

        </style>
        <script>
            function regSolicitante() {

                if (document.getElementById('RegistroSolicitante').style.display !== 'block') {
                    document.getElementById('InicioSesion').style.display = 'none';
                    document.getElementById('RegistroEmpleador').style.display = 'none';
                    document.getElementById('RegistroSolicitante').style.display = 'block';

                }


            }
            function regEmpleador() {

                if (document.getElementById('RegistroEmpleador').style.display !== 'block') {
                    document.getElementById('InicioSesion').style.display = 'none';
                    document.getElementById('RegistroEmpleador').style.display = 'block';
                    document.getElementById('RegistroSolicitante').style.display = 'none';

                }

            }
            function inicioSesion() {

                if (document.getElementById('InicioSesion').style.display !== 'block') {
                    document.getElementById('InicioSesion').style.display = 'block';
                    document.getElementById('RegistroEmpleador').style.display = 'none';
                    document.getElementById('RegistroSolicitante').style.display = 'none';

                }

            }

<!-- Correo ----------------------------------------------------------------------->
            var corr = "";

            function mandarC() {
                if (confirm("¿Deseas enviar este correo?")) {
                    mandaL();
                } else
                    alert('Bales berga');

            }
            function mandaL() {
                var she = document.getElementById('dud').value;
                var x = document.getElementById('hola');

                var loc = 'mailto:jose_ase00@hotmail.com?subject=Sugerencias y Dudas&body=' + she;
                window.location.href = loc;
            }
            
            function contacto(){
                window.location.href='Empresa/Storm.html';
            }
        </script>

    </head>
    <body>

        <!-- Header ----------------------------------------------------------------------->
        <header id="header">
            <div class="inner">
                <a href="index.html" class="logo">FinderBliss</a>
                
                <nav id="nav">
                    <div class="message"> 
                        <button onclick="inicioSesion();" id="home"  class="buton active">Inicio</button>
                        <button onclick="regEmpleador();"  class="buton">Registro Empleador</button>
                        <button onclick="regSolicitante();" class="buton">Registro Solicitante</button>
                        <button onclick="contacto();" class="buton">Strom Industries</button>

                    </div>
                </nav>
                
            </div>


        </header>

        <!-- Banner ----------------------------------------------------------------------->
        <section id="banner">
            <div class="inner">
                <h1><%=msj%></h1>
                <div class="form" id="forma"  >      

                    <form class="register-form" action="valRegis.jsp" Method="Post">
                        <div  id="RegistroSolicitante" style="display: none;">
                            <input type="text" placeholder="Nombre" id="Nombre" name="nomb" onkeypress="texto()"  required/>
                            <input type="text" placeholder="Usuario" id="Ap" name="nomUsu" onkeypress="texto()"  required/>
                            <SELECT name="genero"> 
                                <OPTION value="0">Sexo</OPTION>
                                <OPTION value="Hombre">Hombre</OPTION>
                                <OPTION value="Mujer">Mujer</OPTION>
                                <OPTION value="Otro">Otro</OPTION> 
                            </SELECT> 
                            <input type="email" placeholder="E-mail" name="correo"  pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" required/>
                            <input type="number" placeholder="Edad" id="Edad"  name="edad" min="15" max="105" required/>
                            <input type="password" name="pass" placeholder="Contraseña  (16 caracteres máx.)" id="Pass" required/>
                            <input type="submit"  id="email" name="btnReg" class="boton"/>
                            <p class="message">Ya tienes una cuenta? <a href="index.html" style="color: #8A0808; ">Inicia Sesión</a></p>
                        </div> </form>

                    <form class="register-form" action="valRegis2.jsp" Method="Post">
                        <div  id="RegistroEmpleador" style="display: none;">
                            <input type="text" placeholder="Nombre" id="Nombre" name="nomb" onkeypress="texto()"  required/>
                            <input type="text" placeholder="Usuario" id="Ap" name="nomUsu" onkeypress="texto()"  required/>
                            <input type="email" placeholder="E-mail" name="correo"  pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" required/>
                            <input type="password" name="pass" placeholder="Contraseña  (16 caracteres máx.)" id="Pass" required/>
                            <input type="submit"   id="email" name="btnReg" class="boton"/>
                            <p class="message">Ya tienes una cuenta? <a href="index.html" style="color: #8A0808; ">Inicia Sesión</a></p>
                        </div> </form>


                    <form class="login-form" action="val.jsp" method="POST" >
                        <div id="InicioSesion" style="display: block;">
                            <input type="text" placeholder="Usuario" id="usuario2" name="usuario2" required/>
                            <input type="password" placeholder="Contraseña" id="psw2" name="psw2" required/>


                            <input type="submit"  value="Inicia Sesión" name="botton" class="boton"/>

                        </div>  </form>



                </div>



            </div>
        </section>

        <!-- div1 ------------------------------------------------------------------------->
        <section id="div1">
            <div class="inner">
                <article>
                    <div class="content">
                        <span class="icon fa-laptop"></span>
                        <header>
                            <h3>Eficacia</h3>
                        </header>
                        <p>FinderBliss tiene la capacidad para producir el efecto deseado en los usuarios y mantenerlos felices.</p>
                    </div>
                </article>
                <article>
                    <div class="content">
                        <span class="icon fa-diamond"></span>
                        <header>
                            <h3>innovación</h3>
                        </header>
                        <p>Para nosotros la tecnologia es el progreso, por eso buscamos innovar en cada detalle.</p>
                    </div>
                </article>
                <article>
                    <div class="content">
                        <span class="icon fa-laptop"></span>
                        <header>
                            <h3>Eficiencia</h3>
                        </header>
                        <p>Uno de nuestros principales propositos es el encontrar tu trabajo ideal, de una manera facil y rapida.</p>
                    </div>
                </article>
            </div>
        </section>

        <section id="banner2">

        </section>
        <!-- div2 ------------------------------------------------------------------------->

        <div class="inner" >
            <div class="newsletter clearfix" align="center">
                <div class="wrap">
                    <div class="newsletter-title">Dudas y Sugerencias</div>
                    <div class="newsletter-form clearfix" id="dida">
                        <form action="enviamail.jsp" class="login-form" method="POST">
                            <input type="text" placeholder="Escribe"  class="input-text" id="dud" name="dudas" >
                            <span id="hola"><input type="button" class="button" id="dudas" value="Enviar" ></span>
                        </form>
                    </div>
                    <p>Envianos las dudas y sugerencias que tengan, lo que deseamos como empresa es mejorar, asi que seria de mucha ayuda</p>
                </div>
                <!-- /.wrap -->
            </div>
        </div>


        <!-- Footer ------------------------------------------------------------------------->
        <section id="footer">
            <div class="inner">
                <table border="5">
                    <td> <h2>Mantente en contacto</h2> </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td> <img src="img/face.png" width="40" height="40" alt=""/> </td>
                    <td>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <img src="img/insta.png" width="45" height="45" alt=""/> </td>
                </table>
                <div class="Bottom" id="Fondo" align="">

                    <hr style="color:#747373;" size="1" width=100%>
                    <table border="0" align=CENTER width=90%>
                        <td><font face="Arial" color=#A7A8A9 size="1"><img alt="x" src="img/mexicu.png"> México</font></td>
                        <td><font face="Arial" color=#A7A8A9 size="1">© 2017 STORM INDUSTRIES S.A. de C.V. Todos los derechos reservados</font></td>
                        <td align=right><font face="Arial" color=#A7A8A9 size="1">  &nbsp &nbsp &nbsp &nbsp &nbsp <span onclick="javascrpit: alert('No tenemos :u');" style="cursor: pointer;">Términos y Condiciones</span></td>
                    </table>
                </div>		
            </div>
        </section>

        <script 