<%-- 
    Document   : pagInicio
    Created on : 01-nov-2017, 12:27:44
    Author     : mfuen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
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
    
  // persi.llaves(1, ID);
    //String error=persi.info();
    //String info=persi.getValor();
    controlador.llaves ob=new controlador.llaves(1, ID);
    String error= ob.info();
    String info=ob.getValor();
%>
<html>
    <head>
         <title>Inicio De Sesion</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="assets/css/main.css" />
    </head>
    <body>

        <!-- Header -->
        <div id="header">

            <div class="top">

                <!-- Logo -->
                <div id="logo">
                    <span class="image avatar48">
                        <img src="assets/images/ava.png" alt=""/></span>
                    <h1 id="title"><%= nomUsu%></h1>
                    
                </div>

                <!-- Barra de Navegacion -->
                <nav id="nav">
                    

                    <ul>
                        <li><a href="#top" ><span class="icon">Inicio</span></a></li>
                        <li><a href="#portfolio" ><span class="icon">Mis trabajos</span></a></li>
                        <li><a href="#curriculo"><span class="icon">Acerca de mi</span></a></li>
                        <li><a href="#aceptadas" ><span class="icon ">Propuestas Aceptadas</span></a></li>
                        <li><a href="#contact" ><span class="icon ">Contacto</span></a></li>
                        <li><a href="salir.jsp" ><span class="icon ">Cerrar Sesion</span></a></li>
                    </ul>
                </nav>

            </div>

            <div class="bottom">
            </div>

        </div>

        <!-- Main -->
        <div id="main">

            <!-- Intro -->
            <section id="top" class="one dark cover">
                <div class="container">

                    <header>
                        <h2 class="alt">Bienvenido:   
                            Esta es una página de Empleo </h2>
                    </header>

                    <footer>
                        <a href="#portfolio" class="button scrolly">Empezar</a>
                    </footer>

                </div>
            </section>

            <!-- Portfolio -->
            <section id="portfolio" class="two">
                <div class="container">

                    <header>
                        <h2>Trabajos</h2>
                    </header>

                    <p>En esta parte ingresa tus ofertas de trabajo</p>

                    <div class="row">
                        <div class="4u 12u(mobile)">
                            <article class="item">
                                <a href="https://www.google.com.mx/about/" class="image fit"> <img src="assets/images/google.jpg" height="250" /></a>
                                <header>
                                    <h3>Google</h3>
                                   
                                </header>
                            </article>
                            <article class="item">
                                <a href="https://www.facebook.com/search/top/?q=Solicitud+Empleo&init=public" class="image fit"><img src="assets/images/facebook.jpg" alt=""/>
                                </a>
                                <header>
                                    <h3>Facebook</h3>
                                </header>
                            </article>
                        </div>
                        <div class="4u 12u(mobile)">
                            <article class="item">
                                <a href="https://www.uber.com/es-MX/drive/" class="image fit">
                                    <img  src="assets/images/uber.jpg" width="100" height="250"/></a>
                                <header>
                                    <h3>Uber</h3>
                                </header>
                            </article>
                            <article class="item">
                                <a href="#" class="image fit">
                                    <img src="assets/images/empresas.jpg" width="150" height="225"/></a>
                                <header>
                                    <h3>Empresas en general</h3>
                                </header>
                            </article>
                        </div>
                        <div class="4u 12u(mobile)">
                            <article class="item">
                                <a href="https://www.computrabajo.com.mx/trabajo-de-chef-ejecutivo" class="image fit">
                                    <img src="assets/images/cocina.JPG" alt=""/></a>
                                <header>
                                    <h3>Cocinas</h3>
                                </header>
                            </article>
                            <article class="item">
                                <a href="#" class="image fit">
                                    <img src="assets/images/imagenes.jpg" height="225"/></a>
                                <header>
                                    <h3>Hoteles</h3>
                                </header>
                            </article>
                        </div>
                    </div>
                     <a href="Trabajo.jsp" class="button scrolly">Ir a pagina de trabajos </a>
                </div>
            </section>

            <!-- Informacion del Usuarios -->
            
            <section  class="three" id="curriculo">
                <div class="container">

                    <header>
                        <h2 class="texto">Curiculum</h2>
                    </header>

                    <a href="#" class="image featured"></a>

                    <p class="texto">En esta sección podrás ver tu información y poderla modificarla</p>
                    
                    <p class="texto">Nombre: <%=nomUsu%></p>
                    <p class="texto">Email: <%=email%></p>
                    
                    <a href="curriculum.jsp" class="button scrolly">Modifica tu Curriculum </a>
                </div>
            </section>
                    <br/>

                   <!-- Aceptadas--> 
                    
                    <section  class="five" id="aceptadas">
                <div class="container">

                    <header>
                        <h2 class="texto">Propuestas Aceptadas</h2>
                    </header>

                   

                    <p class="texto">En esta sección podrás ver tu tus propuestas aceptadas</p>
                    
                    <p class="texto">Hasta el momento tienes: 0 propuestas aceptadas</p>
                   
                    
                    <a href="curriculum.jsp" class="button scrolly">Ofertas Aceptadas </a>
                </div>
            </section>
            <!-- Contact -->
            <section id="contact" class="four">
                <div class="container">

                    <header>
                        <h2>Contacto</h2>
                    </header>

                    <p>Con esto nos podrás contactar </p>

                    <form method="post" action="#">
                        <div class="row">
                            <div class="6u 12u(mobile)"><input type="text" name="name" placeholder="Name" /></div>
                            <div class="6u 12u(mobile)"><input type="text" name="email" placeholder="Email" /></div>
                            <div class="12u">
                                <textarea name="message" placeholder="Message"></textarea>
                            </div>
                            <div class="12u">
                                <input type="submit" value="Send Message" />
                            </div>
                        </div>
                    </form>

                </div>
            </section>

        </div>

        <!-- Footer -->
        <div id="footer">

            <!-- Copyright -->
            <ul class="copyright">
                <li>&copy; Todos los derechos reservados para Finder Bliss Asociacion</li><li>Design: Finder Bliss </li>
            </ul>

        </div>

        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.scrolly.min.js"></script>
        <script src="assets/js/jquery.scrollzer.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>

    </body>
</html>
       
