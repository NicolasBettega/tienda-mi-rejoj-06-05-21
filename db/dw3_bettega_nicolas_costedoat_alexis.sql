-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-08-2021 a las 00:36:43
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dw3_bettega_nicolas_costedoat_alexis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `carrito_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `producto_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `alt` varchar(150) NOT NULL,
  `precio` decimal(7,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `cat_id` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`cat_id`, `nombre`) VALUES
(1, 'Digital'),
(2, 'Analogico'),
(3, 'Sport'),
(4, 'Smartwatch');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `detalle_id` int(10) UNSIGNED NOT NULL,
  `pedido_id` int(10) UNSIGNED NOT NULL,
  `producto_id` int(10) UNSIGNED NOT NULL,
  `precio_unitario` decimal(7,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `estado_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`estado_id`, `nombre`) VALUES
(1, 'Pendiente'),
(2, 'En camino'),
(3, 'Finalizado'),
(4, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `pago_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`pago_id`, `nombre`) VALUES
(1, 'Devito'),
(2, 'Credito'),
(3, 'Transferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `pedido_id` int(10) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL,
  `estado_id` int(10) UNSIGNED NOT NULL,
  `pago_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `total` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `producto_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(7,2) NOT NULL,
  `descripcion` text NOT NULL,
  `alt` varchar(150) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `destacado` tinyint(1) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `categoria_cat_id1` tinyint(3) UNSIGNED NOT NULL,
  `sexo_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`producto_id`, `usuario_id`, `nombre`, `precio`, `descripcion`, `alt`, `imagen`, `destacado`, `marca`, `categoria_cat_id1`, `sexo_id`) VALUES
(1, 1, 'Comp All White', '7900.00', 'Ideal para deportes de agua, tanto por su tamaño ideal para usar bajo un traje de neoprene como su malla de silicona moldeada.\r\nCuenta con día, fecha, cronómetro y temporizador de cuenta regresiva con función de bloqueo para garantizar la cuenta regresiva', 'Reloj nixon comp all white', '20210813062122_nixon-sport.jpg', 0, 'Nixon', 1, 1),
(2, 1, 'Base All Gold', '21000.00', 'Las curvas y los contornos retro otorgan al Base un aspecto vintage, pero con toques modernos propios de la era digital. Reminiscencias de una época en la que los viajes en el tiempo parecían posibles e incluso probables.\r\nEntre sus caracteristicas se encuentran, Calendario totalmente digital, hora doble, Timer, Cuenta atrás y cronografo. Caja de acero inoxidable especial con botones con junta de policarbonato moldeados y botones atornillados de acero inoxidable.Correa fina de 5 eslabones y cierre a presión de acero inoxidable.', 'Reloj nixon digital Base all Gold', 'nixon-dorado.jpg', 0, 'Nixon', 1, 1),
(3, 1, 'LA11WL-7A', '12000.00', 'Valor y estilo chocan con este nuevo reloj para mujer. Ofreciendo una correa de cuero sintético, cronómetro y temporizador de cuenta regresiva, este modelo es un complemento perfecto para cualquier atuendo.', 'Reloj Casio LA11WL-7A', 'casio-digital.jpg', 0, 'Nixon', 1, 1),
(4, 1, 'A1000MG-9VT', '18000.00', 'CASIO lanza el nuevo reloj vintage digital de acero inoxidable con baño de iones de oro A1000MG-9BVT con esfera de nácar. Las características adicionales incluyen alarma diaria, super luz LED y banda milanesa de fácil ajuste.', 'Reloj Casio  A1000MG-9VT', 'casio-vintage-digital.jpg', 0, 'Casio', 2, 1),
(5, 1, 'LW204-4A', '15000.00', 'CASIO lanza un nuevo estilo de barril vintage LW204. Este reloj completamente negro viene equipado con un cronómetro de 1/100 segundos, temporizador de cuenta regresiva, alarma multifunción, calendario automático, resistencia al agua de 50 metros y retroiluminación LED.', 'Reloj Casio LW204-4A', 'casio-sport.jpg', 0, 'Casio', 2, 1),
(6, 1, 'Thess TH1782251', '21588.00', 'Reloj Tommy Hilfiger Mujer 1782251, femenino y moderno, con caja de acero rosé de 35mm y correa de silicona rosa con delicado motivo floral. Es resistente al agua hasta 3 ATM / 30 metros.', 'Reloj Tommy Hilfiger Thess TH1782251', 'tomy-m-rosa.jpg', 0, 'Casio', 2, 1),
(7, 1, 'Easton TH1710433', '35000.00', 'Reloj Tommy Hilfiger 1782244. Reloj de mujer Tommy Hilfiger 1782244 . Con este modelo de la colección Alex tendrás un look moderno y juvenil , su correa de acero regulable y su esfera rosa con índices haciendo juego serán un complemento que te hará brillar a donde vayas.\r\nSumergibilidad 3 ATM (30 Mts) Diámetro de la caja: 40 mm.', 'Reloj Tommy hilfiger Easton TH1710433', 'tomy-acero.jpg', 1, 'Casio', 2, 1),
(8, 1, 'Barclay TH1791716', '42000.00', 'Reloj Tommy Hilfiger de Hombre 1791614 de la familia DANE clásico y moderno. Diseño ultradelgados de 40 mm de acero inoxidable, acero inoxidable plateado y dial negro. Cuenta con marcadores de hora en índice y logotipo de Tommy Hilfiger a las 12:00. Resistente al agua hasta 3 ATM / 30 metros.', 'Reloj Tommy Hilfiger Barclay TH1791716', 'tomy-cuero.jpg', 0, 'Tommy Hilfiger', 3, 1),
(9, 1, 'CAMOUFOREST', '14380.00', 'RELOJ SWATCH CAMOUFOREST (SUOG114) reinterpreta el estampado de camuflaje clásico con efecto metalizado en la correa. El mismo estampado verde es visible en la esfera.', 'Reloj Swatch', 'swatch-camuflado.jpg', 0, 'Tommy Hilfiger', 3, 1),
(10, 1, 'BIG BOLD JELLYFISH', '18000.00', 'Reloj SWATCH BIG BOLD JELLYFISH (SO27E100) es la nueva creación de la familia BIG BOLD. Nacido con un diseño único, marcando una era en la que puedes expresar tu personalidad, tan clara como sea posible.\nCon una esfera de 47 mm totalmente transparente y una correa de silicona semitransparente, puede realizar un seguimiento discreto de reuniones demasiado largas y fechas tediosas de los viernes por la noche, sin ofender a nadie.\nLas llamativas flechas azules, rojas y amarillas marcan el momento de decir lo que piensas en voz alta sin hacer un solo sonido. Excepto el tictac, el que amamos. Material del cierre de la correa Aluminio. Resistente al agua 3 ATM (30 M).', 'Reloj Swatch BIG BOLD JELLYFISH', 'swatch-transparente.jpg', 0, 'Tommy Hilfiger', 3, 1),
(11, 1, 'SPEED UP SWYVS441G', '51000.00', 'Mejora tu estilo con SPEED UP (YVS441G), que combina deportividad y elegancia en un modelo elegante.\r\nCon una esfera negra cepillada al sol con impresión en blanco, tiene los beneficios adicionales de una ventana de fecha a las 4:30 y manos con superluminova. Un acero inoxidable pulido con bisel de PVD negro está grabado y relleno de color blanco, y está alojado en una caja de acero inoxidable pulido.\r\nDando la impresión de una larga franja negra de carreras, la pulsera está hecha de acero inoxidable pulido ajustable con enlaces intermedios de resina negra.', 'Reloj  Swatch SPEED UP SWYVS441G', 'swatch-acero.jpg', 1, 'Tommy Hilfiger', 3, 1),
(12, 1, 'Leather Antique Silver', '46000.00', 'Con su atractivo diseño de facil lectura, acompañando a la familia del 51-30, este modelo, cuenta con una caja hecha en acero inoxidable, con cristal mineral endurecido.  La combinacion de estilo, inteligencia y fuerza del reloj 48-20 es insuperable.<br/> La corona y los botones se ubican a las 9 en punto de la caja en vez de las 3 en punto para evitar posibles molestias en la muñeca durante cualquier tipo de actividad por intensa que sea.<br/> Bisel giratorio unidireccional para contador analógico de cuenta atrás. Cronómetro de 6 agujas, esfera secundaria de 24 horas, indicador de segundos impreso y ventana de fecha a las 4 en punto.', 'Reloj Nixon Chrono Leather Antique Silver', 'nixon-cuero.jpg', 1, 'nixon', 3, 1),
(13, 1, 'Venu 2', '73999.00', 'Este smartwatch, que dispone de un resistente cristal Corning® Gorilla® Glass 3, un elegante bisel de acero inoxidable y una cómoda correa de silicona, puede con todo.', 'Reloj Garmin Venu2', 'venu-2.jpg', 0, 'Garmin', 4, 1),
(14, 1, 'Venu 2s', '73999.00', 'Este smartwatch, que dispone de un resistente cristal Corning® Gorilla® Glass 3, un elegante bisel de acero inoxidable y una cómoda correa de silicona, puede con todo.', 'Reloj Garmin Venusq', 'venu-2s.jpg', 0, 'Garmin', 4, 1),
(15, 1, 'Venu SQ Music', '46999.00', 'Este reloj, cuyo elegante diseño se adapta a cada estilo y momento de tu día, cuenta con una pantalla brillante a color y un modo opcional de encendido permanente para que puedas ver todo rápidamente.', 'Reloj Garmin vivofit4', 'venusq.jpg', 0, 'Garmin', 4, 1),
(16, 1, 'vivofit4', '12999.00', 'Encuentre más formas de superarse gracias a la facilidad de uso de vívofit 4. Le permite realizar un seguimiento de la actividad y le brinda la libertad para seguir moviéndose sin detenerse para cargar. Gracias a la autonomía de la batería de más de un año, vívofit 4 es perfecto para llevarlo continuamente, así siempre registrará su actividad, la cual se clasificará automáticamente con Move IQ y mucho más.', 'Reloj Garmin Venu5', 'vivofit4.jpg', 0, 'Garmin', 4, 1),
(17, 1, 'Reloj Unit Marbled Camo', '21995.00', 'El LCD de 5 paneles incluye información de la hora, día, fecha, alarma, cronómetro regresivo y termómetro. La correa blanda de silicona de giro libre se fija a la caja dándote una total portabilidad a lo largo del día, dentro y fuera del agua. Entre sus principales caracteristcas estan, módulo personalizado digital con visualización positiva o negativa. Caja de policarbonato de fibra reforzada y duradera, preparada para soportar los impactos del día a día, mientras que el bisel sobre moldeado de silicona protege el cristal.\r ', 'Reloj Nixon Marbled Camo', 'marbled-camo.png', 0, 'Nixon', 1, 1),
(18, 1, 'Matte Periwincle', '12995.00', 'Nuestro modelo más vendido de todos los tiempos, apariencia versátil y sin pretensiones que funciona en todo momento y lugar', 'Reloj Nixon Matte Periwincle', 'matte-periwincle.jpg', 0, 'Nixon', 2, 2),
(19, 1, 'Time Teller Rose Gold/Split', '20995.00', 'Como icono del legado de Nixon, el Time Teller transmite vibraciones y sofisticación. Su diseño minimalista es el lienzo perfecto para que des rienda suelta a tu expresión estética, mientras que su sumergibilidad de 100 m/10 ATM significa que si se moja no tienes de qué preocuparte. Tienes una amplia gama de opciones de acabado, seguro que encuentras tu estilo. Siempre habrá un Time Teller para ti.', 'Reloj Nixon TimeTreller Rose Gold/split', 'teller-rose.jpg', 0, 'Nixon', 2, 2),
(20, 1, 'Tommy Hilfiger Jenna', '29995.00', 'El reloj Tommy Hilfiger Jenna es la reversión de un best seller. Esta nueva versión presenta una pulsera de dos tonos. La caja de 38 mm está disponible en varias combinaciones de dos tonos, que incluyen acero inoxidable, dorado y carnation gold. Resistente al agua 3 ATM / 30 metros', 'Reloj Tommy Hilfiger Jenna', 'tommy-hilfiger-jenna.jpg', 0, 'Tommy Hilfiger', 2, 2),
(21, 1, 'Tommy Hilfiger 1782205', '27295.00', 'Descubrí la amplia variedad de relojes de Tommy Hilfiger. Modelos clásicos, versátiles y atemporales con estilo renovado para hombres y mujeres de espíritu joven y moderno. Reloj Tommy Hilfiger 1782205 Reade.', 'Reloj Tommy Hilfiger 1782205', 'tommy-hilfiger-1782205.jpg', 0, 'Tommy Hilfiger', 2, 1),
(22, 1, 'Tommy Hilfiger Liv', '33000.00', 'Descubrí la amplia variedad de relojes de Tommy Hilfiger. Modelos clásicos, versátiles y atemporales con estilo renovado para hombres y mujeres de espíritu joven y moderno.', 'Reloj Tommy Hilfiger Liv', 'tommy-hilfiger-liv.jpg', 0, 'Tommy Hilfiger', 2, 1),
(23, 1, 'Tommy Hilfiger Denim', '19395.00', 'El reloj Tommy hilfiger Denim es una nueva versión divertida y fresca del reloj deportivo más vendido. La perfecta integración de casual y sport. La caja de 44 mm, negra presenta una esfera texturizada horizontal con un único ojo secundario. Con correa de silicona y logo grabado. Resistencia al agua de 3 ATM / 3 metros', 'Reloj Tommy Hilfiger Denim', 'tommy-hilfiger-demin.jpg', 0, 'Tommy Hilfiger', 2, 1),
(24, 1, 'Tommy Hilfiger Silicona', '18900.00', 'Descubrí la amplia variedad de relojes de Tommy Hilfiger. Modelos clásicos, versátiles y atemporales con estilo renovado para hombres y mujeres de espíritu joven y moderno. Reloj de mujer de la familia Essentials, cuenta con caja de acero inoxidable y esfera plateada haciendo juego, correa de caucho celeste y la bandera con los colores característicos de la marca a la altura de las 3 .', 'Reloj Tommy Hilfiger Silicona', 'tommy-hilfiger-silicona.jpg', 0, 'Tommy Hilfiger', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `rol_id` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`rol_id`, `nombre`) VALUES
(1, 'admin'),
(2, 'usuario'),
(3, 'editor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `sexo_id` tinyint(3) UNSIGNED NOT NULL,
  `genero` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sexo`
--

INSERT INTO `sexo` (`sexo_id`, `genero`) VALUES
(1, 'Masculino'),
(2, 'Femenino'),
(3, 'Unisex');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `rol_id` tinyint(3) UNSIGNED NOT NULL,
  `email` varchar(120) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `rol_id`, `email`, `nombre`, `password`, `apellido`, `username`, `telefono`, `direccion`) VALUES
(1, 1, 'alexis.costedoat@davinci.edu.ar', 'Alexis', '$2y$10$GyTCT/rk.vRMlAnUflfwTO9jJzgkXJ/N4./RxMGpxoqOmNAisprkK', 'Costedoat', 'Costeva', 1168344316, 'Av. siempre viva 123'),
(2, 1, 'nicolas.bettega@davinci.edu.ar', 'Nicolas', '$2y$10$GyTCT/rk.vRMlAnUflfwTO9jJzgkXJ/N4./RxMGpxoqOmNAisprkK', 'Bettega', 'Neo', 1168344316, 'Av. siempre viva 123'),
(3, 2, 'alexiscostedoat@gmail.com', 'Alexis', '$2y$10$GyTCT/rk.vRMlAnUflfwTO9jJzgkXJ/N4./RxMGpxoqOmNAisprkK', 'Coste', 'Costa', 1168344316, 'Av. siempre viva 123'),
(11, 2, 'nicolas@hotmail.com', NULL, '$2y$10$GyTCT/rk.vRMlAnUflfwTO9jJzgkXJ/N4./RxMGpxoqOmNAisprkK', 'Bettega', 'Bette', 1168344316, 'Av. siempre viva 123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`carrito_id`),
  ADD KEY `usuario_id_idx` (`usuario_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`detalle_id`),
  ADD KEY `fk_detalle_pedidos1_idx` (`pedido_id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`estado_id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`pago_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pedido_id`),
  ADD KEY `fk_pedidos_estados1_idx` (`estado_id`),
  ADD KEY `fk_pedidos_pagos1_idx` (`pago_id`),
  ADD KEY `fk_pedidos_usuarios1_idx` (`usuario_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`producto_id`),
  ADD KEY `fk_productos_usuarios_idx` (`usuario_id`),
  ADD KEY `titulo_INDEX` (`nombre`),
  ADD KEY `fk_productos_categoria1_idx` (`categoria_cat_id1`),
  ADD KEY `fk_productos_sexo1_idx` (`sexo_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rol_id`);

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`sexo_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `fk_usuarios_roles_idx` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `carrito_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `cat_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle`
--
ALTER TABLE `detalle`
  MODIFY `detalle_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `estado_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `pago_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedido_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `producto_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `rol_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sexo`
--
ALTER TABLE `sexo`
  MODIFY `sexo_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `fk_detalle_pedidos1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_estados1` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`estado_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_pagos1` FOREIGN KEY (`pago_id`) REFERENCES `pagos` (`pago_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_categoria1` FOREIGN KEY (`categoria_cat_id1`) REFERENCES `categoria` (`cat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_sexo1` FOREIGN KEY (`sexo_id`) REFERENCES `sexo` (`sexo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_roles` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`rol_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
