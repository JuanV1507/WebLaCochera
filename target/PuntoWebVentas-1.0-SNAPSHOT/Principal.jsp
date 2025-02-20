<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Asegura la responsividad -->
        <meta charset="UTF-8">
        <title>Sistema De Ventas</title>
        <!-- Bootstrap CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/EstiloPrincipal.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"> 
       
    </head>

    <body>
      
        <!-- Barra de navegación -->
        <nav class="navbar navbar-expand-lg navbar-light bg-info">
            <a class="navbar-brand text-white" href="#">Sistema La Cochera 1.0.1    </a>
            <!-- Botón de menú colapsable en pantallas pequeñas -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Opciones del menú -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link text-white" href="#" onclick="resetHome()">Home</a>
                    </li>
                    <li class="nav-item">
                        <!-- Botón sin bordes -->
                        <a class="btn btn-outline-light btn-no-border ml-2" href="Controlador?menu=Producto&accion=Listar" target="myFrame">Servicios</a>
                    </li>
                    <li class="nav-item">
                        <!-- Botón sin bordes -->
                        <a class="btn btn-outline-light btn-no-border ml-2" href="Controlador?menu=Empleado&accion=Listar" target="myFrame">Empleado</a>
                    </li>

                    <li class="nav-item">
                        <!-- Botón sin bordes -->
                        <a class="btn btn-outline-light btn-no-border ml-2" href="Controlador?menu=NuevaVenta&accion=default" target="myFrame">Nueva venta</a>
                    </li>
                    <li class="nav-item">
                        <!-- Botón sin bordes -->
                        <a class="btn btn-outline-light btn-no-border ml-2" href="Controlador?menu=ReporteVentas&accion=Listar" target="myFrame">Reporte Ventas</a>
                    </li>
                </ul>


                <!-- Dropdown para usuario, alineado a la derecha -->
                <div class="dropdown ml-auto">
                    <button class="btn btn-outline-light btn-no-border dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${usuario.getNom()}
                    </button>
                    <div class="dropdown-menu dropdown-menu-right text-center">
                        <a class="dropdown-item" href="#">
                            <img src="Imagenes/Usuario.jpg" alt="Usuario" height="87" class="rounded-circle">
                        </a>
                        <a class="dropdown-item" href="#">${usuario.getUser()}</a>
                        <a class="dropdown-item" href="#">${usuario.getUser()}@gmail.com</a>
                        <div class="dropdown-divider"></div>
                        <form action="Validar" method="POST">
                            <button name="accion" value="salir" class="dropdown-item">Salir</button>
                        </form>
                    </div>
                </div>

            </div>
        </nav>
        <header class="hero">
            <h1>Nuestro portafolio de lavado de vehículos</h1>
            <p>El mejor servicio se estetica automotriz</p>
            <div class="gallery">
                <img src="Imagenes/Camioneta.jpeg" alt="150 pixeles" width="150"/>
                <img src="Imagenes/Motor.jpeg" alt="150 pixeles" width="150"/>
                <img src="Imagenes/Porshe.jpeg" alt="150 pixeles" width="150"/>
            </div>
        </header>
         
        <footer>
            <div class="info-box">
                <h3>📞 LLÁMANOS</h3>
                <p>9995183166</p>
            </div>
            <div class="info-box">
                <h3>📍 UBICACIÓN</h3>
                <p>Calle 7#335 x 24 y 42, Colonia Xcumpich, 97204</p>
            </div>
            <div class="info-box">
                <h3>⏰ HORAS</h3>
                <p>Lunes a Sabado de 8:00 AM a 6.30 PM y domingos de 8:00 am a 2:30 PM</p>
            </div>
            <div class="info-box">
                <h3>🛡️GARANTIA</h3>
                <p>Lluvia por 48 hrs Aplican TyC</p>
            </div>

        </footer>
        <div class="container-fluid mt-4">
            <div class="embed-responsive embed-responsive-16by9">
                <iframe name="myFrame" class="embed-responsive-item" allowfullscreen></iframe>
            </div>
        </div>

        <!-- Scripts de Bootstrap -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4xF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <!-- Estilos personalizados para quitar bordes y contornos -->
       
        <script>
                            document.addEventListener("DOMContentLoaded", function () {
                                const enlaces = document.querySelectorAll(".navbar-nav a[target='myFrame']");
                                const header = document.querySelector(".hero");
                                const footer = document.querySelector("footer");

                                enlaces.forEach(enlace => {
                                    enlace.addEventListener("click", function () {
                                        header.style.display = "none";
                                        footer.style.display = "none";
                                        document.querySelector(".nav-link[href='#']").addEventListener("click", function () {
                                            header.style.display = "block";
                                            footer.style.display = "flex"; // Se usa flex si el footer usa display:flex
                                        });
                                    });
                                });
                            });

        </script>
        <script>
            function resetHome() {
                document.getElementsByName("myFrame")[0].src = ""; // Vaciar el iframe
            }
        </script>


        <style>

            body {
                
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                text-align: center;
            }
            .hero {
                background-color: #333;
                color: white;
                padding: 50px 20px;
            }
            .gallery {
                display: flex;
                justify-content: center;
                gap: 10px;
            }
            .gallery img {
                width: 150px;
                height: auto;
                border-radius: 8px;
            }
            .contact {
                padding: 50px 20px;
                background-color: #f4f4f4;
            }
            .contact-container {
                display: flex;
                justify-content: center;
                gap: 20px;
            }
            form {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }
            input, textarea {
                padding: 10px;
                width: 250px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            button {
                background-color: blue;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            footer {
                display: flex;            
                justify-content: space-around;
                background-color: #222;
                color: white;
                padding: 40px;
            }
            .info-box {
                text-align: left;
            }
            .credits {
                text-align: center;
                margin-top: 10px;
            }
            .credits a {
                color: lightblue;
            }
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                text-align: center;
            }
            .hero {
                background-color: #333;
                color: white;
                padding: 50px 20px;
            }
            .gallery {
                display: flex;
                justify-content: center;
                gap: 10px;
                flex-wrap: wrap;
            }
            .gallery img {
                width: 150px;
                height: auto;
                border-radius: 8px;
            }
            .contact {
                padding: 50px 20px;
                background-color: #f4f4f4;
            }
            .contact-container {
                display: flex;
                justify-content: center;
                gap: 20px;
                flex-wrap: wrap;
            }
            form {
                display: flex;
                flex-direction: column;
                gap: 10px;
                align-items: center;
            }
            input, textarea {
                padding: 10px;
                width: 100%;
                max-width: 300px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            button {
                background-color: blue;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;        
            }
            footer {
                display: flex;
                justify-content: space-around;
                background-color: #222;
                color: white;
                padding: 40px;
                flex-wrap: wrap;
                text-align: center;
            }
            .info-box {
                text-align: center;
                flex: 1 1 200px;
                margin: 10px;
            }
            .credits {
                text-align: center;
                margin-top: 10px;
                width: 100%;
            }
            .credits a {
                color: lightblue;
            }
            .gallery img {
                width: 100%; /* La imagen tomará el 100% del ancho de su contenedor */
                max-width: 300px; /* Tamaño máximo para pantallas grandes */
                height: auto; /* Mantener la proporción original */
                object-fit: contain; /* Evitar el recorte */
                border-radius: 8px; /* Mantener las esquinas redondeadas */
              /* Fondo gris claro para que el espacio vacío sea más estético */
}

            .gallery {
                display: flex;
                justify-content: center;
                gap: 10px;
                flex-wrap: wrap; /* Permitir que las imágenes se ajusten en varias filas en pantallas más pequeñas */
                padding: 20px;
}


            .btn-no-border {
                border: none !important; /* Elimina el borde */
                box-shadow: none !important; /* Elimina el contorno de enfoque */
                outline: none !important; /* Elimina el contorno del enfoque */
            }

            .btn-no-border:focus, .btn-no-border:hover {
                outline: none !important;
                box-shadow: none !important; /* Asegura que no haya sombra o borde al hacer focus o hover */
            }

        </style>

    </body>

</html>
