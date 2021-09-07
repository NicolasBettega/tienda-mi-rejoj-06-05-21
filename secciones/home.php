<?php
require __DIR__ . '/../funciones/f_producto.php';
$producto = getDestacado();

?>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <picture>
                <source srcset="res/img/banner_md_1.jpg" media=" only screen and (min-width:481px) and (max-width:768px)">

                <source srcset="res/img/banner_lg_1.jpg" media=" only screen and (min-width:769px) and (max-width:1920px)">

                <img src="res/img/banner_sm_1.jpg" class="d-block w-100" alt="reloj con pulsera de cuero marron">
            </picture>
        </div>
        <div class="carousel-item">
            <picture>
                <source srcset="res/img/banner_md_2.jpg" media=" only screen and (min-width:481px) and (max-width:768px)">

                <source srcset="res/img/banner_lg_2.jpg" media=" only screen and (min-width:769px) and (max-width:1920px)">

                <img src="res/img/banner_sm_2.jpg" class="d-block w-100" alt="reloj con pulsera de cuero negro">
            </picture>
        </div>
        <div class=" carousel-item">

            <picture>
                <source srcset="res/img/banner_md_3.jpg" media=" only screen and (min-width:481px) and (max-width:768px)">

                <source srcset="res/img/banner_lg_3.jpg" media=" only screen and (min-width:769px) and (max-width:1920px)">

                <img src="res/img/banner_sm_3.jpg" class="d-block w-100" alt="Imagen de un reloj a pulso alta gama">
            </picture>


        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<div class="intro container text-center py-4">
    <h2 class="titulo">Bienvenido</h2>
    <p>
        <b> Te deseamos que tengas una experiencia positiva en tienda Mi Reloj.</b>
    </p>
    <p>
        Tenemos el objetivo de convertirnos en un referente a nivel nacional en la venta de relojes. A partir de esto, se han incorporado diversas marcas para poder cumplir con las necesidades de nuestro clientes.
    </p>
</div>
<section class="destacado container-fluid py-4">

    <h3 id="titulo" class="text-white text-center">Destacado</h3>

    <div class="  row justify-content-around">
        <?php
        foreach ($producto as $produ) :
        ?>
            <a href="index.php?s=productos-detalle&id=<?= $produ['prod_id']; ?>" class=" cardi btn tarjeta col-8 col-md-4 col-lg-3 col-xl-2 my-3 mx-4 p-0  bg-white shadow">
                <article class="  d-flex flex-column-reverse">


                    <div class="col-12 bd-highlight texto-card p-2 text-center h-100 d-inline-block">
                        <h4><?= $produ['nombre']; ?></h4>
                        <span class="precio d-block py-2">$<?= $produ['precio']; ?></span>

                    </div>

                    <div class="col-12 bd-highlight pb-2 text-center">

                        <img src="<?= 'res/img/' . $produ['imagen']; ?>" alt="<?= $produ['nombre']; ?>">

                    </div>

                </article>
            </a>
        <?php
        endforeach;
        ?>
    </div>
</section>
<div class="marcas container py-5 text-center">
    <h3 class="pb-4">Marcas con las que trabajamos</h3>
    <ul class="row justify-content-around list-unstyled">
        <li class="bgMarca-1 col-5 col-sm-3 col-md-3">Nixon</li>
        <li class="bgMarca-2 col-5 col-sm-3 col-md-3">Casio</li>
        <li class="bgMarca-3 col-5 col-sm-3 col-md-3">Tomy Hilfiges</li>
        <li class="bgMarca-4 col-5 col-sm-3 col-md-3">Swatch</li>
    </ul>
</div>