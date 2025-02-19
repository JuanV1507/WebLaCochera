<%-- 
    Document   : ReporteVentas
    Created on : 10 feb 2025, 16:13:02
    Author     : USUARIO
--%>

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
                        <form action="Controlador?menu=Empleado" method="POST">
                            <div class="form-group mb-3">
                                <label>NumSerie</label>
                                <input type="text" value="${venta.getSerie()}" name="txtSerie" class="form-control">
                            </div>
                            <div class="form-group mb-3">
                                <label>Fecha</label>
                                <input type="text" value="${empleado.getNom()}" name="txtNombres" class="form-control">
                            </div>
                            <div class="form-group mb-3">
                                <label>Servicio</label>
                                <input type="text" name="txtTel" value="${empleado.getTel()}" class="form-control">
                            </div>
                            <div class="form-group mb-3">
                                <label for="txtPagoDiario">Tamaño</label>
                                <input type="number" name="txtPagoDiario" value="${empleado.getPagoDiario()}" class="form-control">
                            </div>
                            <div class="form-group mb-3">
                                <label>Descripcion</label>
                                <input type="number" name="txtDiasTrabajo" value="${empleado.getDiasTrabajo()}" class="form-control">
                            </div>
                            <div class="form-group mb-3">
                                <label>Placas</label>
                                <input type="text" value="${empleado.getUser()}" name="txtUsuario" class="form-control">
                            </div>
                            <div class="form-group mb-3">
                                <label>Precio</label>
                                <input type="text" value="${empleado.getUser()}" name="txtUsuario" class="form-control">
                            </div>
                            <div class="form-group mb-3">
                                <label>Lavador</label>
                                <input type="text" value="${empleado.getUser()}" name="txtUsuario" class="form-control">
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
                                <th>NroSerie</th>
                                <th>Fecha</th>
                                <th>Servicio</th>
                                <th>Tamaño</th>
                                <th>Descripcion</th>
                                <th>Placas</th>
                                <th>Precio</th>
                                <th>Lavador</th>
                                <th>ACCIONES</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="em" items="${Empleados}">
                                <tr>
                                    <td>${em.getId()}</td>
                                    <td>${em.getDni()}</td>
                                    <td>${em.getNom()}</td>
                                    <td>${em.getTel()}</td>
                                    <td>${em.getPagoDiario()}</td>
                                    <td>${em.getDiasTrabajo()}</td>
                                    <td>${em.getsueldoSemanal()}</td>
                                    <td>${em.getUser()}</td>
                                    <td>
                                        <div style="display: flex; justify-content: space-between; gap: 10px;">
                                            <a class="btn btn-warning" href="Controlador?menu=Empleado&accion=Editar&id=${em.getId()}">Editar</a>
                                            <a class="btn btn-danger" href="Controlador?menu=Empleado&accion=Delete&id=${em.getId()}">Delete</a>
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
