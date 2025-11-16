<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Cliente" %>

<!DOCTYPE html>
<html lang="es">
<head>
<style>
    body {
        font-family: Arial, Helvetica, sans-serif;
        background: #f5f7fa;
        margin: 0;
        padding: 30px;
        color: #333;
    }

    h1, h2 {
        text-align: center;
        color: #2c3e50;
    }

    .container {
        width: 80%;
        margin: 0 auto;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background: white;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        border-radius: 8px;
        overflow: hidden;
    }

    th {
        background: #34495e;
        color: white;
        padding: 12px;
        text-align: left;
        font-size: 14px;
    }

    td {
        padding: 12px;
        border-bottom: 1px solid #eaeaea;
    }

    tr:hover {
        background: #f1f1f1;
    }

    a {
        color: #2980b9;
        text-decoration: none;
        font-weight: bold;
    }

    a:hover {
        color: #1c5986;
    }

    .btn {
        display: inline-block;
        padding: 8px 15px;
        background: #3498db;
        color: white;
        border-radius: 6px;
        text-decoration: none;
        transition: 0.3s;
        margin-bottom: 15px;
    }

    .btn:hover {
        background: #2773a5;
    }

    /* Botón volver */
    .back-btn {
        display: inline-block;
        padding: 8px 15px;
        background: #aaa;
        color: white;
        border-radius: 6px;
        text-decoration: none;
        margin-top: 25px;
    }

    .back-btn:hover {
        background: #888;
    }

</style>

    <meta charset="UTF-8">
    <title>Clientes</title>
</head>
<body>

<div class="container">

    <h2>Lista de Clientes</h2>

    <a class="btn" href="${pageContext.request.contextPath}/formularioCliente.jsp">
        + Nuevo cliente
    </a>

    <table class="styled-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Teléfono</th>
                <th>Acciones</th>
            </tr>
        </thead>

        <tbody>
        <%
            @SuppressWarnings("unchecked")
            List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");

            if (clientes != null && !clientes.isEmpty()) {
                for (Cliente c : clientes) {
        %>
            <tr>
                <td><%= c.getId() %></td>
                <td><%= c.getNombre() %></td>
                <td><%= c.getCorreo() %></td>
                <td><%= c.getTelefono() %></td>
                <td>
                    <a class="delete-btn"
                       href="${pageContext.request.contextPath}/eliminarCliente?id=<%= c.getId() %>">
                        Eliminar
                    </a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="5" class="empty-msg">No hay clientes</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <!-- Botón VOLVER -->
    <a class="back-btn" href="${pageContext.request.contextPath}/index.html">
        ⬅ Volver al inicio
    </a>

</div>

</body>
</html>
