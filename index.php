<?php
// header permite informarle al browser que lea el archivo como text/html
// header("Content-type: text/html");

// creo un array secuencial que me va a permitir recorrerlo y traer el dato correcsponciente al hacer click en el menu
// Incluimos el archivo de rutas.
require __DIR__ . '/rutas/secciones.php';

// Llamamos la función getSeccionesLista para obtener la lista de secciones.

$secciones = getSeccionesLista();

// (contol + click) => nos da un atajo a al codigo de la funcion getSeccionesLista().


$seccionActual = $_GET['s'] ?? 'home';

if (!isset($secciones[$seccionActual])) {
    $seccionActual = '404';
}

?>

<!doctype html>
<html lang="es">

<head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title><?= $secciones[$seccionActual]['title'] ?? 'Razor Store'; ?></title>


    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <link rel="stylesheet" href="css/estilo.css">
    <link rel="shortcut icon" href="res/img/ico/logo-favic-01.svg" type="image/x-icon">
    <link rel="icon" href="res/img/ico/logo-favic-01.svg" type="image/x-icon">
</head>

<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-light colorNav py-0">
            <a class="navbar-brand" href="index.php">
                <h1 class="logo">Tienda Mi Reloj</h1>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ml-auto text-center">
                    <li class="nav-item ">
                        <a class=" nav-link" href="index.php">Home</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link " href="index.php?s=productos">Productos</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="index.php?s=contacto">Contacto</a>
                    </li>
                </ul>
            </div>
        </nav>

    </header>
    <main>


        <?php

        require __DIR__ . "/secciones/" . $seccionActual . ".php";

        ?>



    </main>

    <footer class="pie-pag pt-3 pb-2">
        <div class="container">
            <div class="row">

                <div class="col-12 col-md-6">
                    <div class="datos">

                        <ul class="list-unstyled text-center text-white">
                            <li>
                                Desarrolado por:
                                <ul class="list-unstyled">
                                    <li>Nicolas Bettega.</li>
                                    <li>Alexis Costedoat.</li>
                                </ul>
                            </li>
                            <li>Materia: Programación II.</li>
                            <li>Turno: Noche.</li>
                            <li>Comisión: A.</li>
                            <li>Año: 2021.</li>
                        </ul>
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <ul class="row text-center list-unstyled py-5">
                        <li class="col-4"><a class="btn-redes face" href="#">facebook</a></li>
                        <li class="col-4"><a class="btn-redes insta" href="#">instagram</a></li>
                        <li class="col-4"><a class="btn-redes twitter" href="#">youtube</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>

</html>