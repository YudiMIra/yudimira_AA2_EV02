<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Producto" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Productos</title>

<style>
    body {
        font-family: Arial, Helvetica, sans-serif;
        background: #f5f7fa;
        margin: 0;
        padding: 30px;
        color: #333;
    }

    h2 {
        text-align: center;
        color: #2c3e50;
    }

    .container {
        width: 80%;
        margin: 0 auto;
    }

    .btn {
        display: inline-block;
        padding: 10px 15px;
        background: #3498db;
        color: white;
        border-radius: 6px;
        text-decoration: none;
        margin-bottom: 15px;
        transition: 0.3s;
    }
    .btn:hover { background: #2773a5; }

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
    }

    td {
        padding: 12px;
        border-bottom: 1px solid #eaeaea;
    }

    tr:hover {
        background: #f1f1f1;
    }

    .delete-btn {
        color: red;
        font-weight: bold;
        text-decoration: none;
    }

    .delete-btn:hover {
        text-decoration: underline;
    }

    .volver {
        display: inline-block;
        margin-top: 25px;
        padding: 8px 12px;
        background: #555;
        color: white;
        border-radius: 5px;
        text-decoration: none;
    }
    .volver:hover { background: #333; }
</style>

</head>
<body>

<div class="container">

    <h2>Lista de Productos</h2>

    <a class="btn" href="formularioProducto.jsp">+ Nuevo producto</a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Precio</th>
                <th>Stock</th>
                <th>Proveedor ID</th>
                <th>Acciones</th>
            </tr>
        </thead>

        <tbody>
        <%
            @SuppressWarnings("unchecked")
            List<Producto> productos = (List<Producto>) request.getAttribute("productos");

            if (productos != null && !productos.isEmpty()) {
                for (Producto p : productos) {
        %>
            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getNombre() %></td>
                <td><%= p.getDescripcion() %></td>
                <td><%= p.getPrecio() %></td>
                <td><%= p.getStock() %></td>
                <td><%= p.getProveedorId() %></td>
                <td>
                    <a class="delete-btn"
                       href="${pageContext.request.contextPath}/eliminarProducto?id=<%= p.getId() %>">
                        Eliminar
                    </a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="7" style="text-align:center;">No hay productos</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <a class="volver" href="index.html">⬅ Volver</a>

</div>

</body>
</html>
