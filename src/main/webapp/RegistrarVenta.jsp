<%@page import="Modelo.Producto"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://js.stripe.com/v3/"></script>
        <title>Ventas</title>
        <!-- Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Estilos/EstiloVenta.css">

    </head>

    <body>        
        <div class="container-fluid">
            <div class="row">
                <!-- Formulario del Servicio -->
                <div class="col-md-3 col-sm-12">
                    <div class="modern-form">
                        <form action="Controlador?menu=NuevaVenta" method="POST">
                            <div class="card-body">
                                <h4>Datos Servicio</h4>
                                <div class="input-group">
                                    <div class="input-wrapper">
                                        <input type="text" name="Servicio" class="form-input" placeholder="Servicio">
                                        <span class="input-icon">🧽</span>
                                    </div>                                                      
                                </div>
                                <div class="input-group">
                                    <div class="input-wrapper">
                                        <select class="form-input" name="Tamanio">
                                            <option value="0">Tamaño vehiculo</option>
                                            <option value="Chico">Chico</option>
                                            <option value="SUV Chica">SUV Chica</option>
                                            <option value="SUV Grande">SUV Grande</option>
                                            <option value="Urvan/Suburban">Urvan/Suburban</option>
                                        </select>
                                        <span class="input-icon">📏</span>
                                    </div>
                                </div>
                                <div class="input-group">
                                    <div class="input-wrapper">
                                        <input type="text" name="Placas" class="form-input" placeholder="Placas">
                                        <span class="input-icon">🔖</span>
                                    </div>
                                </div>
                                <div class="input-group">
                                    <div class="input-wrapper">
                                        <input type="text" name="Modelo" class="form-input" placeholder="Modelo">
                                        <span class="input-icon">🚗</span>
                                    </div>
                                </div>
                                
                                <div class="input-group">
                                    <div class="input-wrapper">
                                        <input type="text" name="Lavador" class="form-input" placeholder="Lavador">
                                        <span class="input-icon">👤</span>
                                    </div>
                                </div>
                                <div class="input-group">
                                    <div class="input-wrapper">
                                        <input type="text" name="Precio" class="form-input" placeholder="Precio">
                                        <span class="input-icon">💰</span>
                                    </div>
                                </div>
                                <h4>Datos Cliente</h4>
                                <div class="input-group">
                                    <div class="input-wrapper">
                                        
                                        <input 
                                            list="clientes" 
                                            id="cliente" 
                                            name="Cliente" 
                                            placeholder="Selecciona o ingresa" 
                                            class="form-input"
                                            >
                                        <datalist id="clientes">
                                            <option value="Keken"></option>
                                            <option value="Gobierno"></option>
                                            <option value="SUV Grande"></option>
                                            <option value="Urvan/Suburban"></option>
                                        </datalist>
                                        <span class="input-icon"></span>
                                    </div>
                                </div>
                                 <div class="input-group">
                                    <div class="input-wrapper">
                                        <input type="text" name="Celular" class="form-input" placeholder="Celular">
                                        <span class="input-icon">👤</span>
                                    </div>
                                </div>

                                <h4>Serv.Extra</h4>
                                 <div class="input-group">
                                    <div class="input-wrapper">
                                        <select class="form-input" name="Numero">
                                            <option value="0">Servicios Adicionales</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                        </select>
                                        <span class="input-icon">📏</span>
                                    </div>
                                 </div>
                                 <div class="input-group">
                                     <div class="input-wrapper">
                                         <input type="text" name="ServicioAdicional" class="form-input" placeholder="Serv.Adicional">
                                         <span class="input-icon">➕</span>
                                     </div>
                                 </div>
                                 <div class="input-group">
                                    <div class="input-wrapper">
                                        <input type="text" name="PrecioAdicional" class="form-input" placeholder="Precio">
                                        <span class="input-icon">💰</span>
                                    </div>
                                </div>

                                <div class="input-group">
                                    <div class="input-wrapper">
                                        <textarea name="Comentario" class="form-input" placeholder="Comentarios"></textarea>
                                        <span class="input-icon">💬</span> 
                                    </div>
                                </div>
                                                             
                                <div class="form-group">
                                    <button type="submit" name="accion" value="Agregar" class="btn btn-outline-primary">Agregar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
        

                <!-- Tabla de Ventas -->
                <div class="col-md-8 col-sm-12">
                    <div class="card parte02">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <label class="text-right mt-2">NRO. SERIE</label>           
                                <input readonly type="text" name="numeroserie" class="form-control text-center" value="${nserie}" style="font-weight: bold; font-size: 18px; max-width: 200px;">
                            </div>
                            <br>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr class="text-center">
                                            <th>Nro</th>
                                            <th>SERVICIO</th>
                                            <th>TAMAÑO</th>
                                            <th>PLACAS</th>
                                            <th>MODELO</th>
                                            <th>LAVADOR</th>
                                            <th>PRECIO</th>
                                            <th>CANT.ADICIONAL</th>
                                            <th>SERV.ADICIONAL</th>
                                            <th>PRECIO ADICIONAL</th>
                                            <th>COMENTARIOS</th>
                                            <th>TOTAL</th>
                                            <th>ACCIONES</th>
               
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="list" items="${sessionScope.lista}">
                                            <tr class="text-center">
                                                <td>${list.getItem()}</td>   
                                                <td>${list.getServicio()}</td>
                                                <td>${list.getTamaño()}</td>
                                               <td>${list.getPlacas()}</td>
                                                <td>${list.getModelo()}</td>
                                                <td>${list.getLavador()}</td>
                                                <td>${list.getPrecio()}</td>
                                                <td>${list.getCantidad()}</td>
                                               <td>${list.getServicioExtra()}</td>
                                                <td>${list.getPrecioExtra()}</td>
                                                <td>${list.getComentario()}</td>
                                                 <td>${list.getTotal()}</td>
                                                
                                                <td class="d-flex">
                                                    <a href="" class="btn btn-warning">Editar</a>
                                                    <a class="btn btn-danger" style="margin-left: 10px">Delete</a>
                                                </td
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="row">
                                <div class="col-md-6 col-sm-12 mb-2 mb-md-0">
                                    <a href="Controlador?menu=NuevaVenta&accion=GenerarVenta" class="btn btn-success">Generar Venta</a>
                                    <input type="submit" name="accion" value="Cancelar" class="btn btn-danger">
                                    <h3>Realizar Pago</h3>
                                    <form id="payment-form" action="Controlador?menu=NuevaVenta&accion=Pagar" method="post">
                                        <label for="card-element">Información de la Tarjeta</label>
                                        <div id="card-element"><!-- Stripe Elemento de Tarjeta --></div>

                                        <!-- Mensaje de error -->
                                        <div id="card-errors" role="alert"></div>

                                        <button type="submit">Pagar</button>

                                        <!-- Input oculto para almacenar el token -->
                                        <input type="hidden" name="stripeToken" id="stripeToken">
                                    </form>
                                </div>
                                <div class="col-md-6 col-sm-12 d-flex justify-content-between align-items-center">
                                    <label class="text-right">Total a Pagar</label>
                                    <input type="text" name="txtTotal" value="$${TotalPagar}" class="form-control text-center font-weight-bold" style="font-size: 18px; max-width: 200px;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <script>

            //PAGO CON STRIPE
            // clave pública de Stripe
            var stripe = Stripe("pk_test_51Qnae6RFM3OuQco0QRHMHcFCxehfjCjX1DPFDZ9YXzzC14OvtVPGzGFQPgomjwq6ZQPfyjnN1YUOnIGZe4yzZ7UV00kKritgXf");
            var elements = stripe.elements();//Crea una instancia de los Elementos de Stripe
            var card = elements.create("card");// Crea un campo de entrada para el número de la tarjeta de crédito
            card.mount("#card-element");//Monta el campo de tarjeta en el elemento HTML

            var form = document.getElementById("payment-form");// Obtiene una referencia al formulario HTML
            //Evento del boton
            form.addEventListener("submit", function (event) {
                //Manjea primero la generacion del token 
                event.preventDefault();
                // Solicita a Stripe que genere un token basado en los datos ingresados en el campo de tarjeta.
                //Then maneja la respuesta
                stripe.createToken(card).then(function (result) {
                    //si hay error en la creacion de token muestra error
                    if (result.error) {
                        document.getElementById("card-errors").textContent = result.error.message;
                    } else {
                        console.log("Token generado:", result.token.id); // Verifica que el token se genera
                        document.getElementById("stripeToken").value = result.token.id;
                        form.submit(); // Enviar el formulario con el token
                    }
                });
            });
         </script>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>          
    </body>

</html>
