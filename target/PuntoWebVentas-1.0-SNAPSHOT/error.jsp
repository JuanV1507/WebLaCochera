<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error en el Pago</title>
        <style>
        /* Estilo general */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa; /* Color de fondo claro */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Contenedor principal */
        .container {
            text-align: center;
            background-color: #fff;
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Sombra */
        }

        /* Estilo del título */
        h1 {
            color: #28a745; /* Verde éxito */
            font-size: 28px;
            margin-bottom: 10px;
        }

        /* Estilo del párrafo */
        p {
            font-size: 18px;
            color: #555;
            margin-bottom: 20px;
        }

        /* Botón de volver */
        a {
            display: inline-block;
            text-decoration: none;
            color: #fff;
            background-color: #007bff; /* Azul llamativo */
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        /* Hover del botón */
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Hubo un error en el procesamiento del pago</h1>
    <p>Intenta nuevamente más tarde.</p>
    <a href="Controlador?menu=NuevaVenta">Volver a ventas</a>
</body>
</html>
