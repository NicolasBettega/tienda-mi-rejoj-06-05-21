<?php

require __DIR__ . '/../funciones/f_producto.php';


$id = $_GET['id'];
$producto = getProductoById($id);



$relacionados = getRelacionados($id);


?>
<section class="container">
    <h2 class=" pt-5"> Detalle del producto</h2>

    <article class="row py-5">

        <div class="col-12 col-lg-6 bd-highlight text-center order-lg-0 ">
            <picture>
                <source srcset="<?= 'res/img/' . $producto['imagen']; ?>">
                <img src="<?= 'res/img/' . $producto['imagen']; ?>" alt="<?= $producto['nombre']; ?>">
            </picture>
        </div>


        <div class="col-12 col-lg-6 text-dark order-lg-2">
            <h2><?= $producto['nombre']; ?></h2>
            <p class="h3">$<?= $producto['precio']; ?></p>


            <div class="my-4">

                <h3 class=" pb-2">Caracteristicas</h3>
                <ul class="pl-3">
                    <?php
                    foreach ($producto['caracteristicas'] as $key => $caract) :
                    ?>

                        <li class="h6">
                            <span> <?= $caract; ?></span>
                        </li>
                    <?php
                    endforeach;
                    ?>
                </ul>

            </div>

        </div>

        <div class="descrit-prod col-12 order-4 order-lg-4 text-lg-left p-4">
            <h4>Descripción</h4>
            <p class=" text-justify pt-3 "><?= $producto['descripcion']; ?></p>
        </div>


    </article>

    <div id="mtdPago" class="container pb-5 text-center">
        <h3 class="pb-4">Medios de pago</h3>
        <ul class="row justify-content-around list-unstyled">
            <li class="col-5 col-sm-3 col-md-3 bgPago-1">Efectivo</li>
            <li class="col-5 col-sm-3 col-md-3 bgPago-2">Transferencia</li>
            <li class="col-5 col-sm-3 col-md-3 bgPago-3">Deposito</li>
            <li class="col-5 col-sm-3  col-lg-3 bgPago-4">Tarjeta</li>
        </ul>
    </div>

</section>

<section id="productos" class="destacado container-fluid py-3">
    <h3 id="titulo" class="text-white text-center">Destacado</h3>

    <div class="row justify-content-around">
        <?php
        foreach ($relacionados as $produ) :
        ?>
            <a href="index.php?s=productos-detalle&id=<?= $produ['prod_id']; ?>" class=" cardi btn tarjeta col-8 col-md-4 col-lg-3 my-3 mx-4 p-0  bg-white shadow">
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