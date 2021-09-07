<?php
require __DIR__ . '/../funciones/f_producto.php';
$producto = getProducto();

$i = 1;
?>



<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <picture>
                <source srcset="res/img/b-m-nixon.jpg" media=" only screen and (min-width:481px) and (max-width:768px)">

                <source srcset="res/img/b-l-nixon.jpg" media=" only screen and (min-width:769px) and (max-width:1920px)">
                <img src="res/img/b-p-nixon.jpg" class="d-block w-100" alt="Relojes de la marca Nixon">


            </picture>
        </div>

        <div class="carousel-item">
            <picture>
                <source srcset="res/img/b-m-tomy.jpg" media=" only screen and (min-width:481px) and (max-width:768px)">

                <source srcset="res/img/b-l-tomy.jpg" media=" only screen and (min-width:769px) and (max-width:1920px)">
                <img src="res/img/b-p-tomy.jpg" class="d-block w-100" alt="Reloj Tommy Hilfiger">


            </picture>

        </div>

        <div class="carousel-item">
            <picture>

                <source srcset="res/img/b-m-casio.jpg" media=" only screen and (min-width:481px) and (max-width:768px)">

                <source srcset="res/img/b-l-casio.jpg" media=" only screen and (min-width:769px) and (max-width:1920px)">
                <img src="res/img/b-p-casio.jpg" class="d-block w-100" alt="Relojes Casio ">


            </picture>

        </div>

        <div class="carousel-item">
            <picture>
                <source srcset="res/img/b-m-swatch.jpg" media=" only screen and (min-width:481px) and (max-width:768px)">

                <source srcset="res/img/b-l-swatch.jpg" media=" only screen and (min-width:769px) and (max-width:1920px)">
                <img src="res/img/b-p-swatch.jpg" class="d-block w-100" alt="Relojes de la marca Swatch">


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


<section class="container productos">

    <div class="text-center pt-5">
        <h2>Nuestros productos</h2>

    </div>
    <div class="row justify-content-around">
        <?php
        foreach ($producto as $prod) :
        ?>
            <a href="index.php?s=productos-detalle&id=<?= $prod['prod_id']; ?>" class="btn cardi tarjeta col-8 col-md-4 col-lg-3 my-3 mx-4 p-0  bg-white shadow">
                <article class="  d-flex flex-column-reverse">


                    <div class="col-12 bd-highlight texto-card p-2 text-center h-100 d-inline-block">
                        <h3><?= $prod['nombre']; ?></h3>
                        <span class="precio d-block py-2">$<?= $prod['precio']; ?></span>

                    </div>

                    <div class="col-12 bd-highlight pb-2 text-center">

                        <img src="<?= 'res/img/' . $prod['imagen']; ?>" alt="<?= $prod['nombre']; ?>">

                    </div>

                </article>
            </a>
        <?php
        endforeach;
        ?>
    </div>
</section>