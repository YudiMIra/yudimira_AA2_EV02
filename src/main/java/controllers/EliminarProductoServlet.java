package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.ProductoDAO;


public class EliminarProductoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            ProductoDAO dao = new ProductoDAO();
            dao.eliminar(id);

            response.sendRedirect("listarProductos");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error al eliminar producto: " + e.getMessage());
        }
    }
}
