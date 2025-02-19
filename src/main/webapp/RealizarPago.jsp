<%-- 
    Document   : RealizarPago
    Created on : 2 feb 2025, 9:11:35 a.m.
    Author     : chanv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PAGOS</title>
    </head>
    <body>
        <h1>Realizar Pago</h1>
        <form id="payment-form" action="Controlador?menu=NuevaVenta&accion=Pagar" method="post">
            <label for="card-element">Información de la Tarjeta</label>
            <div id="card-element"><!-- Stripe Elemento de Tarjeta --></div>

            <!-- Mensaje de error -->
            <div id="card-errors" role="alert"></div>

            <button type="submit">Pagar</button>

            <!-- Input oculto para almacenar el token -->
            <input type="hidden" name="stripeToken" id="stripeToken">
        </form>
    </body>
</html>
