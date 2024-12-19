-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 11-12-2024 a las 00:18:34
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `control_de_inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada_medicamentos`
--

CREATE TABLE `entrada_medicamentos` (
  `id` int NOT NULL,
  `medicamento_codigo` int NOT NULL,
  `cantidad_recibida` int NOT NULL,
  `lote` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `proveedor_nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `proveedor_cedula` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `usuario_id` int DEFAULT NULL,
  `fecha_entrada` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `entrada_medicamentos`
--

INSERT INTO `entrada_medicamentos` (`id`, `medicamento_codigo`, `cantidad_recibida`, `lote`, `fecha_vencimiento`, `proveedor_nombre`, `proveedor_cedula`, `usuario_id`, `fecha_entrada`) VALUES
(1, 9, 10, '1111111', '2025-11-05', 'Seguridad y Salud Laboral', '14957042', NULL, '2024-11-05 20:06:16'),
(3, 19, 20, 'A55A55', '2025-01-31', 'HECTOR LLOVERA', '14393019', NULL, '2024-11-06 01:07:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `codigo` int NOT NULL,
  `nombre` varchar(70) DEFAULT NULL,
  `principio_activo` varchar(100) DEFAULT NULL,
  `marca` varchar(20) DEFAULT NULL,
  `laboratorio` varchar(70) DEFAULT NULL,
  `funcion` varchar(70) DEFAULT NULL,
  `presentacion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `forma_empaque` varchar(50) DEFAULT NULL,
  `cantidad_dosis` int DEFAULT NULL,
  `imagen` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`codigo`, `nombre`, `principio_activo`, `marca`, `laboratorio`, `funcion`, `presentacion`, `descripcion`, `forma_empaque`, `cantidad_dosis`, `imagen`) VALUES
(2, 'Aspirina', 'Acido Acetilsalicilico', 'Bayer', 'Bayer', 'Antiagregante Plaquetario', 'Tableta', 'Caja con 2 Blister de 10 Tabletas de 100 mg', 'Caja', 20, 'http://localhost/Backendmedicamentos/img/2-Aspirina-Bayer.jpg'),
(3, 'Adrenalina', 'Epinefrina', 'ADN Medical', 'Pharmax india', 'Catecolamina Neurotransmisor', 'Ampolla (Solución Inyectable)', 'Caja con 10 Ampollas de 1 ml', 'Caja', 10, 'http://localhost/Backendmedicamentos/img/3-adrenapra-adrenalina.jpg'),
(4, 'Ambroxol', 'Ambroxol', 'Pharmetique', 'La sante', 'Mucolitico', 'Jarabe', 'Frasco con 120 ml de 30 mg/5 ml', 'Frasco', 120, 'http://localhost/Backendmedicamentos/img/4 Ambroxol.jpg'),
(5, 'Aminofilina', 'Teofilina - atilendiamina', 'Unipharma', 'Unipharma', 'Broncodilatador', 'Ampolla (Solución Inyectable)', 'Caja con 10 Ampollas de 10 ml', 'Caja', 10, 'http://localhost/Backendmedicamentos/img/5 Aminofilina.png'),
(6, 'Bacitracina', 'Bacitracina Zinc', 'DAC 55', 'Ohad Pharmaceuticals', 'Antibiotico', 'Ungüento', 'Tubo con 20 g de 500 UI/g', 'Tubo', 20, 'http://localhost/Backendmedicamentos/img/6 Bacitracina DAC 55.jpg'),
(7, 'Buscapina', 'Hioscina N- Butilbromuro', 'Sanofi', 'Boehringer Ingelheim', 'Antiespasmodico', 'Gragea', 'Caja con 2 Blister de 10 Grageas de 10 mg', 'Caja', 20, 'http://localhost/Backendmedicamentos/img/7 Buscapina.jpg'),
(8, 'Captopril', 'Captopril', 'Calox', 'Calox', 'Antihipertensivo', 'Tableta', 'Caja con 1 Blister de 10 Tabletas de 50 mg', 'Caja', 10, 'http://localhost/Backendmedicamentos/img/8 Captopril-50x10-1.png'),
(9, 'Cetirizina', 'Cetirizina Diclorhidrato', 'Siegfried', 'Meyer Productos Terapeuticos', 'Antihistaminico', 'Tableta', 'Caja con 1 Blister de 10 Tabletas de 10 mg', 'Caja', 10, 'http://localhost/Backendmedicamentos/img/9 Cetirizina Siegfried.jpg'),
(10, 'Aplacal', 'Carbonato de calcio', 'Siegfried', 'Meyer Productos Terapeuticos', 'Antiacido', 'Tableta', 'Caja con 1 Blister de 10 Tabletas de 750 mg', 'Caja', 10, 'http://localhost/Backendmedicamentos/img/10 Aplacal.jpg'),
(11, 'Clarasol', 'Nafazolina Clohidrato', 'Oftalmi', 'Oftalmi', 'Colirio Oftalmico', 'Gotas', 'Gotero con 15 ml', 'Gotero', 300, 'http://localhost/Backendmedicamentos/img/11 Clarasol.jpg'),
(12, 'Clorace', 'Acetaminofen + Cloferniramina Maleato', 'Cofasa', 'Cofasa', 'Antigripal', 'Tableta', 'Caja con 1 Blister de 10 Tabletas de 500 mg - 4 mg', 'Caja', 10, 'http://localhost/Backendmedicamentos/img/12 Clorace.jpg'),
(13, 'Clorfeniramina', 'Clorfeniramina', 'Unipharma', 'Ronak Healthcare', 'Antialérgico', 'Ampolla (Solución Inyectable)', 'Caja con 10 Ampollas de 10 mg/ml', 'Caja', 10, 'http://localhost/Backendmedicamentos/img/13 Clorfeniramina.jpg'),
(14, 'Dencorub', 'Alcanfor + Eucalipto + mentol + salicilato de metilo', 'Ponce', 'Ponce', 'Analgésico Topico', 'Gel', 'Tubo con 40 g de 40 gr. 1,41 oz', 'Tubo', 10, 'http://localhost/Backendmedicamentos/img/14 Dencorub.png'),
(15, 'Dexametasona', 'Dexametasona sodio Fosfato', 'Corpomedica', 'Corpo Meca', 'Antihistaminico Inyectable', 'Ampolla (Solución Inyectable)', 'Caja con 10 Ampollas de 4 mg/1 ml', 'Caja', 10, 'http://localhost/Backendmedicamentos/img/15 Dexametasona.png'),
(16, 'Diclofenac Sodico', 'Diclofenac Sodico', 'La Sante', 'Pharmetique', 'Antiinflamatorio no esteroideo (AINE)', 'Tableta Recubierta', 'Caja con 2 Blister de 10 tabletas de 50 mg', 'Caja', 20, 'http://localhost/Backendmedicamentos/img/16 Diclofenac Sodico.jpg'),
(17, 'Diclofenac Sodico', 'Diclofenac Sodico', 'Corpomedica', 'Corpo Meca', 'Antiinflamatorio no esteroideo (AINE)', 'Ampolla (Solución Inyectable)', 'Caja con 10 Ampollas de 75 mg/3 ml', 'Caja', 10, 'http://localhost/Backendmedicamentos/img/17 Diclofenac Sodico corpo meca.jpg'),
(18, 'Diclofenac Potasico', 'Diclofenac Potasico', 'Genven', 'Genven', 'Analgesico - Antiinflamatorio (AINE)', 'Comprimido', 'Caja con 3 Blister de 10 Tabletas de 50 mg', 'Caja', 30, 'http://localhost/Backendmedicamentos/img/18 Diclofenac Potasico.jpg'),
(19, 'Diagesic', 'Diclofenac Potasico', 'Biotech', 'Biotech', 'Analgesico - Antiinflamatorio (AINE)', 'Ampolla (Solución Inyectable)', 'Caja con 2 Ampollas de 75 mg/3 ml', 'Caja', 2, 'http://localhost/Backendmedicamentos/img/19 Diagesic ampolla.png'),
(20, 'Dinitrato de Isosorbide', 'Dinitrato de Isosorbide', 'Laproff', 'Laproff', 'Vasodilatador', 'Tableta', 'Caja con 10 Blister de 30 Tabletas de 10 mg', 'Caja', 300, 'http://localhost/Backendmedicamentos/img/20 Dinitrato de Isosorbide.jpg'),
(47, 'Clarasol', 'Dinitrato', 'Venezuela', 'Oftalmi', 'Colirio Oftalmico', 'Comprimido', 'ffffffxxxxxxxx', 'Caja', 8, 'http://localhost/Backendmedicamentos/img/38 Tiocolchicosido calox.png'),
(53, 'aaaaaaa', 'Dinitrato', 'Venezuela', 'ddddddddd', 'eeeeeeeeee', 'Comprimido', 'hdhaskldcjhawdpfoicf ´dpfi9asnshv ioufodsjjfodifdosi dffiosafijsdfoijf ', 'Caja', 100, 'http://localhost/Backendmedicamentos/img/1 Dynacet Grip.png'),
(56, 'prueba de medicamento', 'Acido Acetilsalicilico', 'aaaaaa', 'aa', 'Antiagregante Plaquetario', 'Ungüento', 'aaaaa', 'sdtsghsdgb', 1, 'http://localhost/Backendmedicamentos/img/23 Hidrocortisona.jpg'),
(58, 'Clarasol', 'Nafazolina Clohidrato', 'Laproff', 'Bayer', 'Vasodilatador', 'Comprimido', 'hdhaskldcjhawdpfoicf ´dpfi9asnshv ioufodsjjfodifdosi dffiosafijsdfoijf ', 'Gotero', 2, 'http://localhost/Backendmedicamentos/img/25 Ibutanfem.jpg'),
(59, 'Clarasol', 'Dinitrato', 'Venezuela', 'ddddddddd', 'Vasodilatador', 'Inyectable', 'cccccccccc', 'Caja', 2, 'http://localhost/Backendmedicamentos/img/7 Buscapina.jpg'),
(60, 'Clarasol', 'dddasad', 'Laproff', 'Oftalmi', 'Antigripal', 'Comprimido', 'sssssssss', 'Gotero', 1, 'http://localhost/Backendmedicamentos/img/26 Ivagan Forte.png'),
(62, 'Clarasol', 'Dinitrato', 'Venezuela', 'ddddddddd', 'eeeeeeeeee', 'Comprimido', 'asasasasasasasasasasas asasasasasasas asasasasa asasas asas as asasas ', 'Gotero', 5, 'http://localhost/Backendmedicamentos/img/50 Antiácido Dicigel.jpg'),
(63, 'Clarasol', 'Dinitrato', 'Laproff', 'Bayer', 'Colirio Oftalmico', 'Tableta', 'hihjh jhjkhkjh jklhkljhkjhkñljh ñhkjhjh ñkj hñjhñkjhdufydgyfy ', 'Gotero', 5, 'http://localhost/Backendmedicamentos/img/1 Dynacet Grip.png'),
(64, 'prueba de ingreso', 'xxxxx', 'Venezuela', 'Bayer', 'Colirio Oftalmico', 'Tableta', 'adasdadasd', 'Gotero', 5, 'http://localhost/Backendmedicamentos/img/34 Omeprazol ADN Medical.png'),
(65, 'zzzzzzzzzz', 'xxxxxxx', 'zzzzzzzz', 'zzzzzz', 'zzzzzzz', 'Comprimido', 'zzzzzz', 'zzzzzz', 5, 'http://localhost/Backendmedicamentos/img/1 Dynacet Grip.png'),
(66, 'qqqqqqq', 'qqqqqqq', 'qqqqqq', 'qqqqqqq', 'qqqqqqq', 'Tableta', 'qqqqqqqqq', 'Frasco', 2, 'http://localhost/Backendmedicamentos/img/5 Aminofilina.png'),
(67, 'wwwww', 'wwwww', 'wwwwwww', 'wwwwwww', 'wwwwwww', 'Polvo', 'shshs dffjf jdjdfsdkc jxxc  hectorbbdjjs hhdncbnñsdfóas ffvnu{ jfj{scv jfp hewc cc hecrtórnv{dfen v', 'Sobre', 5, 'http://localhost/Backendmedicamentos/img/34 Omeprazol ADN Medical.png'),
(68, 'aaaaa', 'aaaaaaa', 'aaaaaa', 'aaaaaaaa', 'aaaaaaaa', 'Jarabe', 'aaaaaaaaaaaaa', 'Tubo', 5, 'http://localhost/Backendmedicamentos/img/51 Miovit.jpg'),
(69, 'qqqqqq', 'qqqqqq', 'qqqqqq', 'qqqqqq', 'qqqqqqq', 'Ungüento', 'qqqqqqqqqq', 'Tubo', 5, 'http://localhost/Backendmedicamentos/img/45 Adantol.jpg'),
(70, 'bbbbbb', 'bbbbbb', 'bbbbbb', 'bbbbbb', 'bbbbbbb', 'Tableta', 'bbbbbbbbb', 'Tubo', 5, 'http://localhost/Backendmedicamentos/img/31 Metoclopramida Laproff.jpg'),
(71, 'qqqqq', 'qqqq', 'qqqqq', 'qqqqq', 'qqqqq', 'Tableta', 'qqqqqqqqqqqqqqqq', 'Tubo', 5, 'http://localhost/Backendmedicamentos/img/26 Ivagan Forte.png'),
(72, 'Hirudoid', 'Dinitrato', 'Hirudoid', 'Bayer', 'Vasodilatador', 'Tableta', 'descripción del producto', 'Frasco', 100, 'http://localhost/Backendmedicamentos/img/22 Hirudoid.png'),
(73, 'Aplacal', 'Dinitrato', 'Venezuela', 'Bayer', 'Vasodilatador', 'Cápsula', 'ddssdfrty uuuy hhhggh hbfgde ddffcsd ', 'Caja', 100, 'http://localhost/Backendmedicamentos/img/10 Aplacal.jpg'),
(74, 'Clarasol', 'Dinitrato', 'Laproff', 'Bayer', 'Antigripal', 'Comprimido', 'dfghdfghdfjhdfj', 'Frasco', 18, 'http://localhost/Backendmedicamentos/img/27 Poliotico Rowe.png'),
(75, 'Clarasol', 'Acido Acetilsalicilico', 'Oftalmi', 'Oftalmi', 'Colirio Oftalmico', 'Comprimido', 'ssssssss', 'Ampolla', 5, 'http://localhost/Backendmedicamentos/img/26 Ivagan Forte.png'),
(76, 'Clarasol', 'Nafazolina Clohidrato', 'Laproff', 'Oftalmi', 'Antigripal', 'Comprimido', 'dsdsdsdsdsd', 'Goteros', 5, 'http://localhost/Backendmedicamentos/img/25 Ibutanfem.jpg'),
(79, 'Clarasol', 'Acido Acetilsalicilico', 'Laproff', 'Bayer', 'Colirio Oftalmico', 'Jarabe', 'ffffvv ccv vvfcv ', 'Caja', 5, 'http://localhost/Backendmedicamentos/img/44 Motidel Enzimatico.png'),
(80, 'Clarasol', 'Nafazolina Clohidrato', 'Laproff', 'ddddddddd', 'eeeeeeeeee', 'Tableta', 'sdsddddd', 'Caja', 5, 'http://localhost/Backendmedicamentos/img/52 Atroveran.jpg'),
(81, 'HECTOR RAMON', 'Nafazolina Clohidrato', 'Oftalmi', 'Laproff', 'Vasodilatador', 'Jarabe', 'fhxghdfhdfhdf', 'Blister', 16, 'http://localhost/Backendmedicamentos/img/12 Clorace.jpg'),
(89, 'aaaaaaa', 'Acido Acetilsalicilico', 'Laproff', 'Oftalmi', 'Colirio Oftalmico', 'Cápsula', 'dddddd', 'Frasco', 5, 'http://localhost/Backendmedicamentos/img/25 Ibutanfem.jpg'),
(92, 'API', 'Acido Acetilsalicilico', 'Oftalmi', 'Bayer', 'Colirio Oftalmico', 'Cápsula', 'derdser', 'caja de 3', 100, ''),
(95, 'Clarasol', 'Acido Acetilsalicilico', 'Laproff', 'Laproff', 'Vasodilatador', 'Cápsula', 'ffd dffff xfghnjfdhjd fghdfgjh sdgh wsth  sh sfb s sghsghsd sgs dfb sgsd sdfg avv ', 'Caja', 17, 'http://localhost/Backendmedicamentos/img/18 Diclofenac Potasico.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrousuariointranet`
--

CREATE TABLE `registrousuariointranet` (
  `id` int NOT NULL,
  `nombres` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apellidos` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `correo` int NOT NULL,
  `telefono` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `perfil_usuario` enum('Gerente Medico','Medico Ocupacional','Medico General','Enfermera') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contrasena` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `registrousuariointranet`
--

INSERT INTO `registrousuariointranet` (`id`, `nombres`, `apellidos`, `usuario`, `correo`, `telefono`, `perfil_usuario`, `contrasena`) VALUES
(22, 'HECTOR RAMON', 'LLOVERA AREVALO', 'admin', 0, '4080643', 'Gerente Medico', '$2y$10$RvweYJwbCaJLpd2EM67AcOzfWNgRVrQbrTkZkZlM44K9ODO5aJBBi');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `entrada_medicamentos`
--
ALTER TABLE `entrada_medicamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medicamento_id` (`medicamento_codigo`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `registrousuariointranet`
--
ALTER TABLE `registrousuariointranet`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `entrada_medicamentos`
--
ALTER TABLE `entrada_medicamentos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT de la tabla `registrousuariointranet`
--
ALTER TABLE `registrousuariointranet`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entrada_medicamentos`
--
ALTER TABLE `entrada_medicamentos`
  ADD CONSTRAINT `entrada_medicamentos_ibfk_1` FOREIGN KEY (`medicamento_codigo`) REFERENCES `medicamentos` (`codigo`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
