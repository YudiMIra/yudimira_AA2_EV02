package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.ProveedorDAO;


public class EliminarProveedoresServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect(request.getContextPath() + "/listarProveedores");
            return;
        }

        int id = Integer.parseInt(idParam);

        try {
            ProveedorDAO dao = new ProveedorDAO();
            dao.eliminar(id);

            response.sendRedirect(request.getContextPath() + "/listarProveedores");
        } catch (Exception e) {
            throw new ServletException("Error al eliminar proveedor", e);
        }
    }
}
