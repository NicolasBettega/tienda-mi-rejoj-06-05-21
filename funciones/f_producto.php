<?php

/**
 * Retorna un array con todas los productos.
 *
 * Cada noticia vuelve como un array con las siguientes claves:
 * * prod_1
 * * destacado
 * * categoria
 * * marca
 * * sexo
 * * nombre
 * * imagen
 * * alt
 * * descripcion
 * * caracteristicas
 * * precio
 *  
 *
 * @return array[]
 */

function getProducto(): array
{
    $archivo = __DIR__ . '/../data/d_productos.json';
    $contenido = file_get_contents($archivo);
    return json_decode($contenido, true);
}




/**
 * Retorna un array en donde solo se van a mostrar los productos con la destacados con el valor True para mostrar en la seccion home.
 * 
 * * prod_id
 * * nombre
 * * imagen
 * * descripcion
 * * categoria
 * * precio
 * 
 * @return array[]
 */
function getDestacado(): array
{
    $datos = getProducto();
    $filtrado = [];

    foreach ($datos as $key => $destacado) {
        if ($destacado['destacado'] === true) {
            $filtrado[$key] = $destacado;
        }
    }
    return $filtrado;
}


/**
 * Funcion que rertona los productos relacionados por el atributo caracteristicas.
 * 
 * * prod_id
 * * nombre
 * * imagen
 * * descripcion
 * * categoria
 * * precio
 * @return array[]
 */
function getRelacionados($id): array
{
    $produID = getProductoById($id);

    $datos = getProducto();
    $filtrado = [];

    foreach ($datos as $key => $relacionados) {
        // Consulto las categorias relacionadas al producto 
        if ($relacionados['categoria'] === $produID['categoria']) {
            // Filtro para que no repita el producto que se esta mostrando en el detalle
            if ($relacionados['prod_id'] !== $produID['prod_id']) {

                $filtrado[$key] = $relacionados;
            }
        }
    }
    return $filtrado;
};

// /**
//  * Retorna los datos de la noticia asociada al $id provisto por parámetro al ingresar a la descripcion de los productos.
//  *
//  * @param int $id
//  * @return array
//  */
function getProductoById(int $id): array
{
    $producto = getProducto();

    // Buscamos en las noticias la que tenga el id indicado.
    foreach ($producto as $prod) {
        if ($prod['prod_id'] === $id) {
            // Filtro el producto por id. Retornamos el valor, y termina la función.
            return $prod;
        }
    }
}
