package controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.ProveedorDAO;
import models.Proveedor;


public class ListarProveedoresServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            ProveedorDAO dao = new ProveedorDAO();
            List<Proveedor> lista = dao.listar();

            request.setAttribute("proveedores", lista);
            request.getRequestDispatcher("proveedores.jsp").forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Error al listar proveedores", e);
        }
    }
}
