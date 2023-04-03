<%-- 
    Document   : correo2
    Created on : 30-sep-2017, 9:17:04
    Author     : mfuen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
        String idUsu="0";
        HttpSession sesion=request.getSession();
        if(sesion.getAttribute("idUsr")!=null){
            idUsu=(String) sesion.getAttribute("idUsr").toString();
        }
        controlador.cUsuario persi = new controlador.cUsuario();
        persi.cUsuarioE(Integer.parseInt(idUsu));
        if(persi.ALTA() == 0){
            controlador.random rand=new controlador.random();
            int numero=rand.getCod();
            String cuerpo="Copia y pega este código para activar tu cuenta: "+String.valueOf(numero);
            String titulo="Código para activar tu cuenta";
            persi.DaAltaE(Integer.parseInt(idUsu), numero);
            controlador.Correo cor=new controlador.Correo();
            cor.mandaMAil(persi.MAIL(),titulo, cuerpo);
        }        
        if (!persi.VALIDAUSR()) {
                response.sendRedirect("index.html");
        }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
               <style>
            @import url("https://fonts.googleapis.com/css?family=Lato:300,400,700|Pacifico");
            
           h1 {
    font-family: 'Pacifico', cursive;
    display: inline-block;
    height: inherit;
  
    line-height: inherit;
   
    padding: 0;
   
    top: 0;
    color: #e5474b;
    font-size: 1.75em;
    text-transform: none;
    font-weight: normal;
    padding: 0;
}

 html, body {  margin: 0; padding: 0; }

 
 body{
     background-image: url("assets/images/fondo.jpg");
     background-size: cover;
     background-repeat: no-repeat;
     
 }
            .form {

                position: static;
                z-index: 1;
                background: #FFFFFF;
                max-width: 320px;
                margin-top: 100px;
                margin-left: 35%; 
                padding: 45px;
                text-align: center;
                box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);



            }

            .form input {
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
                background-color: #e5474b;
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
            
        </style>
    </head>
    <body>
        
           <div class="form" id="forma"   >      
          <form class="login-form" action="valCorreo2.jsp" method="POST" >
                       
                        <div id="ValidaCorreo" style="display: block;">
                            <h1>Valida tu correo</h1>
                            <input type="text" placeholder="Escribe el código que fue enviado a tu correo" id="codigo"  name="codigo" required/>
                           

                            <input type="submit"  value="Enviar" name="botton" class="boton"/>

                        </div>  </form>

          </div>
    </body>
</html>
