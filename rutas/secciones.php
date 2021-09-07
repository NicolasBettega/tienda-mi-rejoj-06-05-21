<?php

/**
 * Retorna un array con la lista de todas las secciones permitidas en el sitio.
 *
 * Las claves (keys) del array son los nombres de las secciones, y como valores llevan un array con
 * las configuraciones particulares de esa sección/ruta.
 *
 * Ej: sarasa
 * ```
 * [
 *     'home' => [
 *          'title' => 'Saraza Title',
 *          ...
 *     ],
 *     ...
 * ]
 * ```
 *
 * @return string[]
 */
function getSeccionesLista()
{
    return [
        'home' => [
            'title' => 'Bienvenidos a tienda mi reloj',

        ],
        'productos' => [
            'title' => 'Productos de la mejor calidad',
        ],
        'productos-detalle' => [
            'title' => 'Detalle del producto',
        ],
        'contacto' => [
            'title' => 'Contactanos',
        ],

    ];
}
