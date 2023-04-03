<%-- 
    Document   : pagInicio2
    Created on : 30-sep-2017, 9:38:59
    Author     : mfuen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>




<html>
    <head>
         <title>Menu Empleador</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
                        <link rel="shortcut icon" href="imagenes/FinderB.png" />

        <link rel="stylesheet" href="assets/css/main.css" />
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
    sesion.setAttribute("Tipo", "2");
    
    if(persi.ALTA() != 1){
        response.sendRedirect("correo2.jsp");
    }
    String nomUsu = persi.NOMBRE();    
    int ID= persi.IDUSR();
    String email= persi.MAIL();
    
    controlador.llaves ob=new controlador.llaves(2, ID);
    String error= ob.info();
    String info=ob.getValor();
    
%>
    <body>

        <!-- Header -->
        <div id="header">

            <div class="top">

                <!-- Logo -->
                <div id="logo">
                    <span class="image avatar48">
                        <img src="assets/images/ava.png" alt=""/></span>
                    <h1 id="title"></h1>
                    
                </div>

                <!-- Barra de Navegacion -->
                <nav id="nav">

                    <ul>
                        <li><a href="#top" ><span class="icon">Inicio</span></a></li>
                        <li><a href="#portfolio" ><span class="icon">Ofertas Ingresadas</span></a></li>
                        <li><a href="#curriculo"><span class="icon">Acerca de mi</span></a></li>
                        <li><a href="#contact" ><span class="icon ">Contacto</span></a></li>
                        <li><a href="salir.jsp"><span class="icon">Cerrar Sesion</span></a></li>
                        
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
                        <h2 class="alt">Bienvenido: <%=nomUsu%>  
                            Esta es una página de Empleo  </h2>
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
                        <h2>Ofertas Ingresadas</h2>
                    </header>

                    <p>En esta parte ingresa tus ofertas de trabajo</p>
                   <a href="creaEmple.jsp" class="button scrolly">Crea un empleo</a>
                    <div class="row">
                        
                         <%
                        persi.verOfer(ID);
                        int contador=persi.getNum2();
                        if(contador!=0){
                            ArrayList<String> img= persi.getImg();
                            ArrayList<String> tipoem=persi.getTemple();
                            ArrayList<Integer> id=persi.getIDemple();
                            String imgaux;
                            String href2;
                        for(int i=0;i<contador;i++){
                            imgaux=img.get(i);
                            href2="\""+"verEmple.jsp?us="+id.get(i)+""+"\"";
                            
                            //img.set(i, "\""+imgaux+"\"");
                    %>    
                        <div class="4u 12u(mobile)">
                            <article class="item">
                                <a href=<%=href2%> class="image fit"> <img src=<%=imgaux%> height="250" /></a>
                                <header>
                                    <h3><%=tipoem.get(i)%></h3>
                                    <br/>
                                    <a href="modiEmple.jsp" class="button scrolly"  style="padding-right: 6px; padding-left: 6px; padding-top: 3px; padding-bottom: 3px;">Editar</a>
                                </header>
                            </article>
                                    
                                    
                        </div>
                         <%}
                    }
                        else{
                      %>  
                        <div class="4u 12u(mobile)">
                            <article class="item">
                                <header>
                                    <h3>No has registrado ningún empleo</h3>
                                </header>
                            </article>
                            
                        </div>
                         <% } %>

                    </div>
                      
                      
                        
                  
                     
                </div>
            </section>

            <!-- Informacion del Usuarios -->
            
            <section  class="three" id="curriculo">
                <div class="container">

                    <header>
                        <h2 class="texto">Acerca de Mí</h2>
                    </header>

                    <a href="#" class="image featured"><img src="images/pic08.jpg" alt="" /></a>

                    <p class="texto">En esta sección podrás ver tu informacián y poderla modificarla</p>
                    
                    <p class="texto">Nombre: <%=nomUsu%></p>
                    <p class="texto">Email: <%=email%></p>
                    
                    <a href="#" class="button scrolly">Modifica tu Informacion</a>
                </div>
            </section>

            
           
            
            <!-- Contact -->
            
            <section id="contact" class="four">
                <div class="container">
                    <% 
                persi.verSolEn(ID);
                if(persi.getNum()!=0){
                    
                int num=persi.getNum();
            %>

                    <header>
                        <h2>Solicitudes</h2>
                    </header>

                    <p>Estas son las solicitudes que has recibido</p>
                    <table border=1 bordercolor="fff">
                        <% 
                            ArrayList <String> nombre=persi.getUsuario();
                            ArrayList <String> TEmp=persi.getTipoEmpleo();
                            String href;
                            for(int i=0;i<num;i++){
                                
                            href="\""+"validaClaves.jsp?us="+nombre.get(i)+""+"\"";
                        %>
                        <tr>
                            <td><%=nombre.get(i)%></td>
                            <td><a href=<%=href %>>Ver solicitud </a> </td>
                            <td><%=TEmp.get(i)%></td>
                            
                        </tr>
                        <% } %>
                    </table>
                    
                    <%} 
                    else{ %>
                    <header>
                        <h2>No tienes solicitudes</h2>
                    </header>
                    <% } %>
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
       
