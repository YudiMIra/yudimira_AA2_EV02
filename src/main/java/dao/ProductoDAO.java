package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import models.Producto;
import utils.DbUtil;

public class ProductoDAO {

	public void insertar(Producto p) throws Exception {
	    String sql = "INSERT INTO productos (nombre, descripcion, precio, stock, proveedor_id) VALUES (?, ?, ?, ?, ?)";

	    Connection con = DbUtil.getConnection();
	    PreparedStatement ps = con.prepareStatement(sql);

	    ps.setString(1, p.getNombre());
	    ps.setString(2, p.getDescripcion());
	    ps.setDouble(3, p.getPrecio());
	    ps.setInt(4, p.getStock());
	    ps.setInt(5, p.getProveedorId());

	    ps.executeUpdate();
	    ps.close();
	    con.close();
	}

    public List<Producto> listar() throws Exception {
        List<Producto> lista = new ArrayList<>();

        String sql = "SELECT * FROM productos";

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt("id"));
                p.setNombre(rs.getString("nombre"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setPrecio(rs.getDouble("precio"));
                p.setStock(rs.getInt("stock"));
                p.setProveedorId(rs.getInt("proveedor_id"));
                lista.add(p);
            }
        }
        return lista;
    }

    public void eliminar(int id) throws Exception {
        String sql = "DELETE FROM productos WHERE id = ?";

        try (Connection conn = DbUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}
