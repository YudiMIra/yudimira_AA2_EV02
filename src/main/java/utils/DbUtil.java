package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Clase utilitaria para obtener una conexión JDBC a MySQL.
 */
public class DbUtil {

    private static final String URL = "jdbc:mysql://localhost:3307/gestion_tienda?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASS = ""; // agrega tu contraseña si tienes

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Driver de MySQL 8+
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Método que devuelve la conexión
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
