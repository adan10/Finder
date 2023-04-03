<%-- 
    Document   : salir
    Created on : 19-nov-2017, 21:05:20
    Author     : mfuen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sss = request.getSession();
    
    sss.removeAttribute("idUsr");
    
    sss.invalidate();
    
    response.sendRedirect("index.html");


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
