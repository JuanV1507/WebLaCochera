<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <link rel="stylesheet" type="text/css" href="css/styles.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Agregar para asegurar el diseño responsivo -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Ingreso usuario</title>
        
        <style>
    /* Container for the input */
.group {
    position: relative;
    margin-bottom: 20px;
}

/* Style the input field */
.input {
    font-size: 16px;
    padding: 10px 10px 10px 5px;
    display: block;
    width: 100%;
    border: none;
    border-bottom: 1px solid #515151;
    background: transparent;
}

.input:focus {
    outline: none;
}

/* Style for the label */
.group label {
    color: #999;
    font-size: 18px;
    font-weight: normal;
    position: absolute;
    pointer-events: none;
    left: 5px;
    top: 10px;
    transition: 0.2s ease all;
}

.input:focus ~ label, .input:valid ~ label {
    top: -20px;
    font-size: 14px;
    color: #5264AE;
}

/* Bottom bar */
.bar {
    position: relative;
    display: block;
    width: 100%;
}

.bar:before, .bar:after {
    content: '';
    height: 2px;
    width: 0;
    bottom: 1px;
    position: absolute;
    background: #5264AE;
    transition: 0.2s ease all;
}

.bar:before {
    left: 50%;
}

.bar:after {
    right: 50%;
}

.input:focus ~ .bar:before, .input:focus ~ .bar:after {
    width: 50%;
}

/* Highlight animation */
.highlight {
    position: absolute;
    height: 60%;
    width: 100px;
    top: 25%;
    left: 0;
    pointer-events: none;
    opacity: 0.5;
}

.input:focus ~ .highlight {
    animation: inputHighlighter 0.3s ease;
}

@keyframes inputHighlighter {
    from {
        background: #5264AE;
    }
    to {
        width: 0;
        background: transparent;
    }
}
/* Fondo del cuerpo */
body {
    background-color: #87CEEB; /* Color azul cielo */
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

/* Estilos del contenedor del formulario */
.card {
    background: rgba(255, 255, 255, 0.2); /* Fondo semitransparente */
    backdrop-filter: blur(10px); /* Efecto de desenfoque */
    border-radius: 15px;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Sombra para destacar el div */
}

/* Resto del estilo para el formulario */
.group {
    position: relative;
    margin-bottom: 20px;
}

.input {
    font-size: 16px;
    padding: 10px 10px 10px 5px;
    display: block;
    width: 100%;
    border: none;
    border-bottom: 1px solid #515151;
    background: transparent;
    color: #333; /* Color del texto */
}

.input:focus {
    outline: none;
}

/* Estilo para el label */
.group label {
    color: #999;
    font-size: 18px;
    font-weight: normal;
    position: absolute;
    pointer-events: none;
    left: 5px;
    top: 10px;
    transition: 0.2s ease all;
}

.input:focus ~ label, .input:valid ~ label {
    top: -20px;
    font-size: 14px;
    color: #5264AE;
}

.bar {
    position: relative;
    display: block;
    width: 100%;
}

.bar:before, .bar:after {
    content: '';
    height: 2px;
    width: 0;
    bottom: 1px;
    position: absolute;
    background: #5264AE;
    transition: 0.2s ease all;
}

.bar:before {
    left: 50%;
}

.bar:after {
    right: 50%;
}

.input:focus ~ .bar:before, .input:focus ~ .bar:after {
    width: 50%;
}

.highlight {
    position: absolute;
    height: 60%;
    width: 100px;
    top: 25%;
    left: 0;
    pointer-events: none;
    opacity: 0.5;
}

.input:focus ~ .highlight {
    animation: inputHighlighter 0.3s ease;
}

@keyframes inputHighlighter {
    from {
        background: #5264AE;
    }
    to {
        width: 0;
        background: transparent;
    }
}


</style>

    </head>
    <body>
   <div class="container-fluid d-flex justify-content-center align-items-center vh-100">
    <div class="card col-lg-4 col-md-6 col-sm-10 mx-auto">
        <div class="card-body">
            <form class="form-sign" action="Validar" method="POST"> 
                <div class="form-group text-center">
                    <img src="Imagenes/LogoCochera.png" alt="150 pixeles" height="130"/>
                    <h3>LOGIN</h3>
                   
                    <label>EL MEJOR SERVICIO DE ESTETICA AUTOMOTRIZ</label>
                </div>
                
                <div class="form-group group">
                    <input type="text" name="txtuser" class="form-control input" required>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>Usuario</label>
                </div>
                
                <div class="form-group group">
                    <input type="password" name="txtpass" class="form-control input" required>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>Password</label>
                </div>
                
                <input type="submit" name="accion" value="Ingresar" class="btn btn-primary btn-block">
            </form>
        </div>
    </div>
</div>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
