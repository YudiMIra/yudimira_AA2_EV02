package controllers;

import utils.DbUtil;
import models.Cliente;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class ListarClientesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L; // opcional

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Cliente> lista = new ArrayList<>();
        String sql = "SELECT id, nombre, correo, telefono FROM clientes ORDER BY id DESC";

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Cliente c = new Cliente(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("correo"),
                        rs.getString("telefono")
                );
                lista.add(c);
            }

            // Enviar lista al JSP
            request.setAttribute("clientes", lista);

            // Cargar la vista
            request.getRequestDispatcher("/clientes.jsp").forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Error al listar clientes", e);
        }
    }
}
