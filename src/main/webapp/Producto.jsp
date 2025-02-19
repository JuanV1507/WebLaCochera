<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SERVICIOS</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Estilos/EstiloServicios.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        

    </head>
    <body>
        <div class="container mt-4">
            <div class="row g-3">
                <div class="col-12 col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <form action="Controlador?menu=Producto" method="POST">
                                <input type="hidden" name="idProducto" value="${producto.idProducto}" id="idProductoInput">
                                <div class="form-group mb-3">
                                    <label>NOMBRE</label>
                                    <input type="text" value="${producto.getNombre()}" name="txtNombre" class="form-control">
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
                                    <th>IDPRODUCTO</th>
                                    <th>NOMBRE</th> 
                                    <th>ACCIONES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="pd" items="${Productos}">
                                    <tr>
                                        <td>${pd.getIdProducto()}</td>
                                        <td>${pd.getNombre()}</td>
                               
                                        <td>
                                            <div style="display: flex; justify-content: space-between; gap: 10px;">
                                                <a class="btn btn-warning" href="Controlador?menu=Producto&accion=Editar&idProducto=${pd.idProducto}">Editar</a>
                                                <a class="btn btn-danger" href="Controlador?menu=Producto&accion=Delete&idProducto=${pd.idProducto}">Delete</a>
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
</html>
