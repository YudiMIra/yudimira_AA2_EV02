package controllers;

import utils.DbUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;


public class EliminarClienteServlet extends HttpServlet {

    private static final long serialVersionUID = 1L; // opcional

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        // Si no mandan ID, redirige a la lista
        if (idParam == null) {
            response.sendRedirect(request.getContextPath() + "/listarClientes");
            return;
        }

        int id = Integer.parseInt(idParam);
        String sql = "DELETE FROM clientes WHERE id = ?";

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

            // Redirige a la lista después de eliminar
            response.sendRedirect(request.getContextPath() + "/listarClientes");

        } catch (Exception e) {
            throw new ServletException("Error al eliminar cliente", e);
        }
    }
}
