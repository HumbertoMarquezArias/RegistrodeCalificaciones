<%-- 
    Document   : editar
    Created on : 2 abr. de 2024, 18:36:25
    Author     : Marquez
--%>


<%@page import="com.emergentes.modelo.Calificaciones"%>
<%
    Calificaciones item = (Calificaciones)request.getAttribute("mical");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <center>
        <table border="" style="background-color:beige " padding="10x">
            <td>
               <label>PRIMER PARCIAL TEM - 742</label> 
               <br>
               <label>Nombre: Humberto Marquez Arias </label>
               <br>
               <label>Carnet: 6799185</label>
            </td>
        </table>
    
        
        
        
        <h1><%= (item.getId()==0)?"Registro de Calificaciones " : "Editar Calificacion" %></h1>
        
        </center>
        
        <form action="MainController" method="post">
            <input type="hidden" name="id" value="<%= item.getId() %>">
            <table>
                <tr>
                    <td>Nombre</td>
                    <td><input type="text" name="Nombre" value="<%= item.getNombre()%>" ></td>
                </tr>
                <tr>
                    <td>P1(30)</td>
                    <td><input type="text" name="P1" value="<%= item.getP1() %>" ></td>
                </tr>
                <tr>
                    <td>P2(30)</td>
                    <td><input type="text" name="P2" value="<%= item.getP2() %>" ></td>
                </tr>
                <tr>
                    <td>EF(40)</td>
                    <td><input type="text" name="P3" value="<%= item.getP3()%>" ></td>
                </tr>
                
                <tr>
                    <td></td>
                    <td><input type="submit" value="Enviar"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
