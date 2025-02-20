
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Gestion de Ventas</title>
    </head>
    
    <body>
       <body>
    <div class="container mt-4">
        <!-- Fila para formulario y tabla -->
        <div class="row g-3">
            <!-- Columna para el formulario -->
            <div class="col-12 col-md-4">
                <div class="card">
                    <div class="card-body">
                        <form action="Controlador?menu=ReporteVentas" method="POST">
                            <div class="form-group mb-3">
                               <label>NroSerie</label>
                               <input type="text" value="${venta.getSerie()}" name="txtNroSerie" class="form-control">
                           </div>
                           <div class="form-group mb-3">
                               <label>Fecha</label>
                               <input type="text" value="${venta.getFecha()}" name="txtFecha" class="form-control">
                           </div>
                           <div class="form-group mb-3">
                               <label>Servicio</label>
                               <input type="text" name="txtServicio" value="${venta.getServicio()}" class="form-control">
                           </div>
                           <div class="form-group mb-3">
                               <label>Tamaño</label>
                               <input type="text" name="txtTamaño" value="${venta.getTamaño()}" class="form-control">
                           </div>
                           <div class="form-group mb-3">
                               <label>Placas</label>
                               <input type="text" value="${venta.getPlacas()}" name="txtPlacas" class="form-control">
                           </div>
                           <div class="form-group mb-3">
                               <label>Modelo</label>
                               <input type="text" value="${venta.getModelo()}" name="txtModelo" class="form-control">
                           </div>
                           <div class="form-group mb-3">
                               <label>Lavador</label>
                               <input type="text" value="${venta.getLavador()}" name="txtLavador" class="form-control">
                           </div>
                           <div class="form-group mb-3">
                               <label>Precio</label>
                               <input type="text" value="${venta.getPrecio()}" name="txtPrecio" class="form-control">
                           </div>
                           <div class="form-group mb-3">
                               <label>Cliente</label>
                               <input type="text" value="${venta.getCliente()}" name="txtCliente" class="form-control">
                           </div>
                           <div class="form-group mb-3">
                               <label>Celular</label>
                               <input type="text" value="${venta.getCelular()}" name="txtCelular" class="form-control">
                           </div>
                           <div class="form-group mb-3">
                               <label>Cant. Adicional</label>
                               <input type="number" value="${venta.getCantidadAdicional()}" name="txtCantidadAdicional" class="form-control">
                           </div>
                           <div class="form-group mb-3">
                               <label>Pre. Adicional</label>
                               <input type="text" value="${venta.getPrecioAdicional()}" name="txtPrecioAdicional" class="form-control">
                           </div>
                           <div class="form-group mb-3">
                               <label>Comentarios</label>
                               <textarea name="txtComentarios" class="form-control">${venta.getComentarios()}</textarea>
                           </div>

                            <input type="submit" name="accion" value="Agregar" class="btn btn-info w-100 mb-3">
                            <input type="submit" name="accion" value="Actualizar" class="btn btn-success w-100">
                        </form>
                    </div>
                </div>
            </div>
                            

            <!-- Columna para la tabla -->
            <div class="col-12 col-md-8">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>IdVenta</th>
                                <th>NroSerie</th>
                                <th>Fecha</th>
                                <th>Servicio</th>
                                <th>Tamaño</th>
                                <th>Placas</th>
                                <th>Modelo</th> 
                                <th>Lavador</th>
                                <th>Precio</th>
                                <th>Cliente</th>
                                <th>Celular</th>
                                <th>Cant.Adicional</th>
                                <th>Pre.Adicional</th>
                                <th>Comentarios</th>
                                <th>Total</th>
                                <th>ACCIONES</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="vt" items="${Ventas}">
                                <tr>
                                    <td>${vt.getidVenta()}</td>
                                    <td>${vt.getSerie()}</td>
                                    <td>${vt.getFecha()}</td>
                                    <td>${vt.getServicio()}</td>
                                    <td>${vt.getTamaño()}</td>
                                    <td>${vt.getPlacas()}</td>
                                    <td>${vt.getModelo()}</td>
                                    <td>${vt.getLavador()}</td>
                                    <td>${vt.getPrecio()}</td>
                                    <td>${vt.getCliente()}</td>
                                    <td>${vt.getCelular()}</td>
                                    <td>${vt.getCantidad()}</td>
                                    <td>${vt.getPrecioExtra()}</td>
                                    <td>${vt.getComentario()}</td>
                                    <td>${vt.getTotal()}</td>
                                        <div style="display: flex; justify-content: space-between; gap: 10px;">
                                            <a class="btn btn-warning" href="Controlador?menu=ReporteVentas&accion=Editar&id=${vt.getId()}">Editar</a>
                                            <a class="btn btn-danger" href="Controlador?menu=ReporteVentas&accion=Delete&id=${vt.getId  ()}">Delete</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
    </body>
</html>
