package controllers;

import utils.DbUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;


public class CrearClienteServlet extends HttpServlet {
	
	  private static final long serialVersionUID = 1L; // opcional

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");

        String sql = "INSERT INTO clientes(nombre, correo, telefono) VALUES (?, ?, ?)";

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, nombre);
            ps.setString(2, correo);
            ps.setString(3, telefono);
            ps.executeUpdate();

            // Evita que se duplique al refrescar
            response.sendRedirect(request.getContextPath() + "/listarClientes");

        } catch (Exception e) {
            throw new ServletException("Error al crear cliente", e);
        }
    }
}
