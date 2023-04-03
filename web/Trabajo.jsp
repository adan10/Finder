<%@page import="java.util.ArrayList"%>
<html>
    <head>
        <title>Pagina de Empleo</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <link rel="stylesheet" href="assets/css/main_2.css" />
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <script>
       function cierra() {
                document.getElementById('myModal').style.display = "none";
            }



            function lol() {
                document.getElementById('myModal').style.display = "block";
            }
            
            function mostrarModal(titulo) {
  $("#modalTitle").html(titulo);
  $("#myModal").modal("show");
}
            </script>
            <%
                 String idUsu = "0";
    String codd = "";
    
    HttpSession sesion = request.getSession();
    
    if(sesion.getAttribute("idUsr") != null) {
        idUsu = (String) sesion.getAttribute("idUsr").toString();
    }else{
     response.sendRedirect("index.html");}
    sesion.setAttribute("Tipo", "1");
    
    controlador.cUsuario persi = new controlador.cUsuario(Integer.parseInt(idUsu));
    if(!persi.VALIDAUSR()) {
        response.sendRedirect("index.html");
    }
    
   if(persi.ALTA() != 1){
        response.sendRedirect("correo.jsp");
    }
   String nomUsu = persi.NOMBRE();    
    int ID= persi.IDUSR();
            %>
    <body>

        <!-- Wrapper -->
        <div id="wrapper">

            <!-- Main -->
            <div id="main">
                <div class="inner">

                    
                    
                    <!-- Section -->
                    <section>
                        <header class="major">
                            <h2>Trabajos Publicados</h2>
                        </header>
                        <div class="posts">
                            <%
                              persi.verTEm();
                              int contador=persi.getRegistros();
                              String error=persi.error2();
                              ArrayList<String> img= persi.getImg();
                            ArrayList<String> tipoem=persi.getTemple();
                              ArrayList<Integer> idex=persi.getIdexe();
                               ArrayList<String> comen=persi.getComen();
                               String href;
                               String href2;
                               String imgaux;
                              if(contador>0){
                              for(int i=0;i<contador;i++){
                                  href="\""+"verEmpleU.jsp?us="+idex.get(i)+""+"\"";
                                  href2="\""+"validaClaves.jsp?us="+idex.get(i)+""+"\"";
                                  imgaux=img.get(i);
                            %>
                            <article>
                                <a href="#" class="image">
                                <img src=<%=imgaux%> alt=""/></a>
                                <h3><%=tipoem.get(i)%></h3>
                                <p><%=comen.get(i)%>
                                   
                               </p>
                                
                                <ul class="actions">
                                    <li><a href="#" class="button">Mas Infromacion</a></li>
                                     <div class="ec-stars-wrapper">
                                    <link href="assets/css/segunda_1.css" rel="stylesheet" type="text/css"/>
                                        <a href=<%=href2%> >Envía tu curriculum!</a>
                                    </div>
                                </ul>
                            </article>
                            
                           <%}
                        }else{%>
                           <article>
                               <header>
                                   No hay empleos subidos xc
                               </header>
                               
                           </article>
                               <%}%>
                        </div>
                    </section>

                </div>
            </div>

            <!-- Sidebar -->
            <div id="sidebar">
                <div class="inner">

                    <!-- Search -->
                    <section id="search" class="alt">
                        <form method="post" action="#">
                            <input type="text" name="query" id="query" placeholder="Search" />
                        </form>
                    </section>

                    <!-- Section -->
                    <section>
                        <header class="major">
                            <h3 >Trabajos más Populares</h3>
                        </header>
                        
                        <header class="major">
                            <h2>Tienda de Autoservicio</h2>
                        </header>
                        <div class="mini-posts">
                            <article>
                                <a href="http://www.oxxo.bumeran.com.mx/aplicantes/oportunidades.ngmf" class="image">
                                <img src="assets/images/oxxo.jpg" alt=""/></a>
                                <p>Trabaja atendiendo una tienda de autoservicio para más información picale al boton</p>
                                  <li><a href="http://www.oxxo.bumeran.com.mx/aplicantes/oportunidades.ngmf" class="button">Toda la información</a></li>
                            </article>
                            <article>
                                <a href="#" class="image">
                                <img src="assets/images/supermercado.jpg" alt=""/></a>
                                <p>Contrato de ventas masivas para super mercado </p>
                                <li><a href="#" class="button" id="myBtn">Toda la informacion</a></li>
                         
                          
 

                                <link href="assets/css/segunda_1.css" rel="stylesheet" type="text/css"/>
<!-- La Cajita -->
<div id="myModal" class="modal">

  <!-- CONTENIDO -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2 align="center"> <strong> Informacion hacerca del Empleo </strong></h2>
    </div>
    <div class="modal-body">
      <p>Esta empleo te proporciona un sueldo mensual de </p>
      <p><strong>15,000</strong></p>
      <p>Prestaciones a la ley entre otras cosas</p>
    </div>
    <div class="modal-footer">
      <h3>Pie de página del modal</h3>
    </div>
  </div>

</div>

<script>
// Jala la caja
var modal = document.getElementById('myModal');

// Jala el boton (que en nuestro caso sera otra tabla)
var btn = document.getElementById("myBtn");

// Es el close
var span = document.getElementsByClassName("close")[0];

// Pero mira ese onclick papu 
btn.onclick = function() {
    modal.style.display = "block";
}

// Tambien es del close
span.onclick = function() {
    modal.style.display = "none";
}

// Si das click afuera se cierra
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

<div class="ec-stars-wrapper">
    <link href="assets/css/segunda_1.css" rel="stylesheet" type="text/css"/>
	<a href="#" data-value="1" title="Votar con 1 estrellas">&#9733;</a>
	</div>



</body>
            

        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        <script src="assets/js/main.js"></script>

    </body>
</html>