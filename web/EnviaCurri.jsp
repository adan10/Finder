<%-- 
    Document   : EnviaCurri
    Created on : 1/12/2017, 07:49:11 AM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
        int us = Integer.parseInt(request.getParameter("us"));
       //String us=(String)sesion.getAttribute("us");
        //int us=(int)sesion.getAttribute("otroId");
        persi.enviaCurri(ID, us);
        String error=persi.error2();
        %>
        <h1><%=error%></h1><br>
        <a href="Trabajo.jsp">Regresar</a>
    </body>
</html>
