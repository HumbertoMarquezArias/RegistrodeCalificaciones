<%-- 
    Document   : index
    Created on : 2 abr. de 2024, 18:36:08
    Author     : Marquez
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Calificaciones"%>
<%
    ArrayList<Calificaciones> lista =(ArrayList<Calificaciones>) session.getAttribute("listacal");
    
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
    
        
 
        <h1>Registro de Calificaciones</h1>
        
        </center>
        
        
        <a href="MainController?op=nuevo">Nuevo</a>
        <table border="1">
            <tr>
                <th>id</th>
                <th>Nombre</th>
                <th>P1(30)</th>
                <th>P2(30)</th>
                <th>EF(40)</th>
                <th>Nota</th>
                <th>Editar</th>
                <th>Eliminar</th>
            </tr>
            <%
                if(lista!=null){
                for (Calificaciones item :lista){
            %>
            <tr>
                <td><%= item.getId() %></td>
                <td><%= item.getNombre()%></td>
                <td><%= item.getP1()%></td>
                <td><%= item.getP2()%></td>
                <td><%= item.getP3()%></td>
                <td><%= item.getNota()%></td>
                <td><a href="MainController?op=editar&id=<%= item.getId()%>">editar</a></td>
                <td><a href="MainController?op=eliminar&id=<%= item.getId() %>"
                       oneclick ="return confirm ('Esta seguro de eliminar?') " >Eliminar</a></td>
            </tr>
            <%
                }
            }
            %>
        </table>
    </body>
</html>
