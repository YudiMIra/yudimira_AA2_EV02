package controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.ProductoDAO;
import models.Producto;


public class ListarProductosServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            ProductoDAO dao = new ProductoDAO();
            List<Producto> lista = dao.listar();

            request.setAttribute("productos", lista);
            request.getRequestDispatcher("productos.jsp").forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Error al listar productos: " + e.getMessage());
        }
    }
}
