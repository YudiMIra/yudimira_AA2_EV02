package controllers;

import models.Proveedor;
import dao.ProveedorDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;


public class CrearProveedoresServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nombre = request.getParameter("nombre");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");

        Proveedor p = new Proveedor(nombre, telefono, direccion);
        try {
            ProveedorDAO dao = new ProveedorDAO();
            dao.insertar(p);

            response.sendRedirect(request.getContextPath() + "/listarProveedores");
        } catch (Exception e) {
            throw new ServletException("Error al crear proveedor", e);
        }
    }
}
