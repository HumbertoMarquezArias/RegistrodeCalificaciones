package com.emergentes.controlador;

import com.emergentes.modelo.Calificaciones;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MARQUEZ
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        int id, pos;
        if (ses.getAttribute("listacal") == null) {
            ArrayList<Calificaciones> listaux=new ArrayList<Calificaciones>();
            
            ses.setAttribute("listacal", listaux);
        }
        ArrayList<Calificaciones> lista = (ArrayList<Calificaciones>) ses.getAttribute("listacal");

        String op = request.getParameter("op");
        String opcion = (op != null) ? op : "view";
        Calificaciones obj1 = new Calificaciones();
        switch (opcion) {
            case "editar":
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarindice(request, id);
                obj1 = lista.get(pos);
                request.setAttribute("mical", obj1);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "eliminar" :
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarindice(request, id);
                lista.remove(pos);
                response.sendRedirect("index.jsp");
                break;
            case "nuevo":
                request.setAttribute("mical", obj1);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "view":
               
                response.sendRedirect("index.jsp");
                break;

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Calificaciones obj1 = new Calificaciones();
        int idt;
      
        obj1.setId(Integer.parseInt(request.getParameter("id")));
        obj1.setNombre(request.getParameter("Nombre"));
        obj1.setP1(Integer.parseInt(request.getParameter("P1")));
        obj1.setP2(Integer.parseInt(request.getParameter("P2")));
        obj1.setP3(Integer.parseInt(request.getParameter("P3")));
        obj1.setNota(Integer.parseInt(request.getParameter("P1"))  +Integer.parseInt(request.getParameter("P2")) +Integer.parseInt(request.getParameter("P3")) );
       

        HttpSession ses = request.getSession();
        ArrayList<Calificaciones> lista = (ArrayList<Calificaciones>) ses.getAttribute("listacal");

        idt = obj1.getId();
        if (idt == 0) {
            obj1.setId(ultimoid(request));
            lista.add(obj1);
        } else {
            lista.set(buscarindice(request, idt), obj1);
        }

        response.sendRedirect("index.jsp");
        
     
        
        
    }
    
    
    private int ultimoid(HttpServletRequest request) {
        HttpSession ses = request.getSession();
        ArrayList<Calificaciones> lista = (ArrayList<Calificaciones>) ses.getAttribute("listacal");
        int idaux = 0;
        for (Calificaciones item : lista) {
            idaux = item.getId();
        }
        return idaux + 1;
    }

    private int buscarindice(HttpServletRequest request, int id) {
        HttpSession ses = request.getSession();
        ArrayList<Calificaciones> lista = (ArrayList<Calificaciones>) ses.getAttribute("listacal");

        int i = 0;
        if (lista.size() > 0) {
            while (i < lista.size()) {
                if (lista.get(i).getId() == id) {
                    break;
                } else {
                    i++;
                }
            }
        }
        return i;
    }
    
    
    
    
    
}
