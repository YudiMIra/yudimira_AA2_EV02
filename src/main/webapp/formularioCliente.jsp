<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    /* Tabla elegante */
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

    /* Links */
    a {
        color: #2980b9;
        text-decoration: none;
        font-weight: bold;
    }

    a:hover {
        color: #1c5986;
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

    /* Formulario */
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
    input[type="email"],
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
</style>

    <meta charset="UTF-8">
    <title>Registrar Cliente</title>
</head>
<body>
    <div class="form-box">
    <h2>Registrar Cliente</h2>

    <form action="${pageContext.request.contextPath}/crearCliente" method="post">

        <label>Nombre:</label>
        <input type="text" name="nombre" required>

        <label>Correo:</label>
        <input type="email" name="correo">

        <label>Teléfono:</label>
        <input type="text" name="telefono">

        <input type="submit" value="Guardar">
    </form>

    
    <br>
    <a class="btn" href="${pageContext.request.contextPath}/listarClientes">Ver clientes</a>
</div>
</body>
</html>
