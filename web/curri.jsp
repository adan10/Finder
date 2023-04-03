<%-- 
    Document   : curri
    Created on : 20-nov-2017, 0:51:05
    Author     : mfuen
--%>

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
    
    
   if(persi.ALTA() != 1){
        response.sendRedirect("correo.jsp");
    }
    String nomUsu = persi.NOMBRE();    
    int ID= persi.IDUSR();
    String email= "\""+persi.MAIL()+"\"";
    //String col= request.getParameter("color").valueOf("color");
    //String color = request.getParameter("color") == null ? "" : request.getParameter("color");
    String nombre = request.getParameter("nombre") == null ? "" : request.getParameter("nombre");
    String fechaN = request.getParameter("fechaNac") == null ? "" : request.getParameter("fechaNac");
    String nac = request.getParameter("nacionalidad") == null ? "" : request.getParameter("nacionalidad");
    String ecivil = request.getParameter("EstadoC") == null ? "" : request.getParameter("EstadoC");
    String tel = request.getParameter("telefono") == null ? "" : request.getParameter("telefono");
    String cel = request.getParameter("celular") == null ? "" : request.getParameter("celular");
    String tw = request.getParameter("twit") == null ? "" : request.getParameter("twit");
    String fb = request.getParameter("face") == null ? "" : request.getParameter("face");
    String descripcion = request.getParameter("desc") == null ? "" : request.getParameter("desc");
    
    persi.DPersonales("0", String.valueOf(ID), nombre, fechaN, ecivil, tel, cel, nac, tw, fb, descripcion);
    //out.print("<script>alert('"+persi.ERROR()+" "+persi.error2()+"');</script>");
    String error=persi.error2();
    if(error.equals("Datos Personales guardados exitosamente")){
    
    
    String epaño1 = request.getParameter("EPt1") == null ? "" : request.getParameter("EPt1");
    String epinfo1 = request.getParameter("EPinfo1") == null ? "" : request.getParameter("EPinfo1");
    String epaño2 = request.getParameter("EPt2") == null ? "" : request.getParameter("EPt2");
    String epinfo2 = request.getParameter("EPinfo2") == null ? "" : request.getParameter("EPinfo2");
    String epaño3 = request.getParameter("EPt3") == null ? "" : request.getParameter("EPt3");
    String epinfo3 = request.getParameter("EPinfo3") == null ? "" : request.getParameter("EPinfo3");
    
    if(!epaño1.equals("") && !epinfo1.equals("")){
        persi.ExLabU("0", String.valueOf(ID), epaño1, epinfo1);
    }
    if(!epaño2.equals("") && !epinfo2.equals("")){
        persi.ExLabU("0", String.valueOf(ID), epaño2, epinfo2);
    }
    if(!epaño3.equals("") && !epinfo3.equals("")){
        persi.ExLabU("0", String.valueOf(ID), epaño3, epinfo3);
    }
    
    String faaño1 = request.getParameter("FAt1") == null ? "" : request.getParameter("FAt1");
    String fainfo1 = request.getParameter("FAinfo1") == null ? "" : request.getParameter("FAinfo1");
    String faaño2 = request.getParameter("FAt2") == null ? "" : request.getParameter("FAt2");
    String fainfo2 = request.getParameter("FAinfo2") == null ? "" : request.getParameter("FAinfo2");
    String faaño3 = request.getParameter("FAt3") == null ? "" : request.getParameter("FAt3");
    String fainfo3 = request.getParameter("FAinfo3") == null ? "" : request.getParameter("FAinfo3");
    
     if(!faaño1.equals("") && !fainfo1.equals("")){
        persi.ExAcU("0", String.valueOf(ID), faaño1, fainfo1);
    }
    if(!faaño2.equals("") && !fainfo2.equals("")){
        persi.ExAcU("0", String.valueOf(ID), faaño2, fainfo2);
    }
    if(!faaño3.equals("") && !fainfo3.equals("")){
        persi.ExAcU("0", String.valueOf(ID), faaño3, fainfo3);
    }
    
    String sn1 = request.getParameter("Sn1") == null ? "" : request.getParameter("Sn1");
    String sinfo1 = request.getParameter("Sinfo1") == null ? "" : request.getParameter("Sinfo1");
    String sn2 = request.getParameter("Sn2") == null ? "" : request.getParameter("Sn2");
    String sinfo2 = request.getParameter("Sinfo2") == null ? "" : request.getParameter("Sinfo2");
    String sn3 = request.getParameter("Sn3") == null ? "" : request.getParameter("Sn3");
    String sinfo3 = request.getParameter("Sinfo3") == null ? "" : request.getParameter("Sinfo3");
    
    if(!sn1.equals("") && !sinfo1.equals("")){
        persi.software("0", String.valueOf(ID), sn1, sinfo1);
    }
    if(!sn2.equals("") && !sinfo2.equals("")){
        persi.software("0", String.valueOf(ID), sn2, sinfo2);
    }
    if(!sn3.equals("") && !sinfo3.equals("")){
        persi.software("0", String.valueOf(ID), sn3, sinfo3);
    }
    
    String in1 = request.getParameter("In1") == null ? "" : request.getParameter("In1");
    String iinfo1 = request.getParameter("Iinfo1") == null ? "" : request.getParameter("Iinfo1");
    String in2 = request.getParameter("In2") == null ? "" : request.getParameter("In2");
    String iinfo2 = request.getParameter("Iinfo2") == null ? "" : request.getParameter("Iinfo2");
    String in3 = request.getParameter("In3") == null ? "" : request.getParameter("In3");
    String iinfo3 = request.getParameter("Iinfo3") == null ? "" : request.getParameter("Iinfo3");

     if(!in1.equals("") && !iinfo1.equals("")){
        persi.idiomas("0", String.valueOf(ID), in1, iinfo1);
    }
    if(!in2.equals("") && !iinfo2.equals("")){
        persi.idiomas("0", String.valueOf(ID), in2, iinfo2);
    }
    if(!in3.equals("") && !iinfo3.equals("")){
        persi.idiomas("0", String.valueOf(ID), in3, iinfo3);
    }
    response.sendRedirect("cEstatico.jsp");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
         <%=fechaN%>
          <%=nac%>
           <%=ecivil%>
           <%=tel%>
           <%=cel%>
           <%=tw%>
           <%=fb%>
           <%=descripcion%>
          
           <%=epaño1%>
           <%=epinfo1%>
           <%=epaño2%>
           <%=epinfo2%>
           <%=epaño3%>
           <%=epinfo3%>
           
            <%=faaño1%>
           <%=fainfo1%>
           <%=faaño2%>
           <%=fainfo2%>
           <%=faaño3%>
           <%=fainfo3%>
           
            <%=sn1%>
           <%=sinfo1%>
           <%=sn2%>
           <%=sinfo2%>
           <%=sn3%>
           <%=sinfo3%>
           
           <%=in1%>
           <%=iinfo1%>
           <%=in2%>
           <%=iinfo2%>
           <%=in3%>
           <%=iinfo3%>
           <br>
           <%=error%>
           
           <%}else{
           out.println(error);
            }%>
           
    </body>
</html>
