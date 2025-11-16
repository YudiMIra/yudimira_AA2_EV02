package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.ProductoDAO;
import models.Producto;


public class CrearProductoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            double precio = Double.parseDouble(request.getParameter("precio"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            int proveedorId = Integer.parseInt(request.getParameter("proveedor_id"));

            Producto p = new Producto(nombre, descripcion, precio, stock, proveedorId);

            ProductoDAO dao = new ProductoDAO();
            dao.insertar(p);

            response.sendRedirect("listarProductos");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error al crear producto: " + e.getMessage());
        }
    }
}
