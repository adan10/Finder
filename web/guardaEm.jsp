<%-- 
    Document   : guardaEm
    Created on : 24-nov-2017, 0:12:02
    Author     : mfuen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    String Templeo = request.getParameter("tipo");
    String dele = request.getParameter("dele");
    String hor = request.getParameter("horario");
    String link=request.getParameter("img");
    String comentario=request.getParameter("comentarios");
    String ID= String.valueOf(persi.IDUSR());
    
    persi.guardaEm("0", ID, Templeo, dele,hor, comentario, link);
    
    response.sendRedirect("pagInicio2.jsp");
    %>
    <body>
        <h1>Hello World!</h1>
        <%=persi.error2()%>
    </body>
</html>
