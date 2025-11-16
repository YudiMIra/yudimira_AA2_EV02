<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Producto</title>

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
    
     /* Botón */
    .btn {
        display: inline-block;
        padding: 8px 15px;
        background: #3498db;
        color: white;
        border-radius: 6px;
        text-decoration: none;
        transition: 0.3s;
    }

    .btn:hover {
        background: #2773a5;
    }

    .form-box {
        width: 40%;
        margin: 40px auto;
        padding: 25px;
        background: white;
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    label {
        font-weight: bold;
        display: block;
        margin-top: 10px;
    }

    input[type="text"],
    input[type="number"] {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        border-radius: 5px;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

    input[type="submit"] {
        margin-top: 15px;
        width: 100%;
        background: #27ae60;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background: #1e7f47;
    }

    .volver {
        display: block;
        text-align: center;
        margin-top: 20px;
        color: #2980b9;
        text-decoration: none;
    }
    .volver:hover { color: #1c5986; }
</style>

</head>
<body>

<h2>Registrar Producto</h2>

<div class="form-box">
    <form action="${pageContext.request.contextPath}/crearProducto" method="post">

        <label>Nombre:</label>
        <input type="text" name="nombre" required>

        <label>Descripción:</label>
        <input type="text" name="descripcion">

        <label>Precio:</label>
        <input type="number" name="precio" step="0.01" required>

        <label>Stock:</label>
        <input type="number" name="stock" required>

        <label>Proveedor ID:</label>
        <input type="number" name="proveedor_id" required>

        <input type="submit" value="Guardar producto">

    </form>

    <br>
    <a class="btn" href="${pageContext.request.contextPath}/listarProductos">Ver Productos</a>
</div>

</body>
</html>
