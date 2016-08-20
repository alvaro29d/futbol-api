-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-08-2016 a las 16:58:39
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biribiri`
--

DELIMITER $$
--
-- Procedimientos
--

--Partidos

CREATE DEFINER=`root`@`localhost` PROCEDURE ` SeleccionarPartido` (IN `pi_id_partido` INT(4))  NO SQL
SELECT fecha_partido,id_equipo_1_partido, 	id_equipo_2_partido,resultado_equipo_1_partido,resultado_equipo_2_partido FROM partidos 
WHERE id_partido = pi_id_partido$$

--Categorias

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarNuevaCategoria` (IN `pi_nombre_categoria` VARCHAR(50), IN `id_torneo_categoria` INT(4))  NO SQL
INSERT INTO categorias (nombre_categoria, id_torneo_categoria) VALUES (pi_nombre_categoria,pi_nombre_categoria)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarCategoria` (IN `pi_id_categoria` INT(4), IN `pi_nombre_categoria` VARCHAR(50), IN `pi_id_torneo_categoria` INT(4))  NO SQL
UPDATE categorias SET nombre_categoria = pi_nombre_categoria,id_torneo_categoria = pi_id_torneo_categoria WHERE id_categoria = pi_id_categoria$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarEquiposDeUnaCategoria` (IN `pi_nombre_categoria` VARCHAR(50))  NO SQL
SELECT categorias.nombre_categoria, equipos.nombre_equipo,equipos.escudo_equipo 
FROM categorias 
INNER JOIN equipos ON categorias.id_categoria=equipos.categoria_id_equipo
WHERE categorias.nombre_categoria = pi_nombre_categoria$$


--noticias

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarNuevaNoticia` (IN `pi_titulo_noticia` VARCHAR(100), IN `pi_subtitulo_noticia` VARCHAR(150), IN `pi_cuerpo_noticia` TEXT, IN `pi_foto_noticia` VARCHAR(100), IN `pi_comentario_noticia` VARCHAR(200), IN `pi_id_torneo_noticia` INT(4))  NO SQL
INSERT INTO noticias (titulo_noticia,subtitulo_noticia,cuerpo_noticia,foto_noticia,comentario_noticia,id_torneo_noticia) VALUES (pi_titulo_noticia,pi_subtitulo_noticia,pi_cuerpo_noticia,pi_foto_noticia,pi_comentario_noticia,pi_id_torneo_noticia)$$


CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarNoticia` (IN `pi_titulo_noticia` INT(100), IN `pi_subtitulo_noticia` VARCHAR(150), IN `pi_cuerpo_noticia` TEXT, IN `pi_foto_noticia` VARCHAR(100), IN `pi_comentario_noticia` VARCHAR(200), IN `pi_id_torneo_noticia` INT(4), IN `pi_id_noticia` INT(4))  NO SQL
UPDATE noticias SET titulo_noticia = pi_titulo_noticia, subtitulo_noticia = pi_subtitulo_noticia,cuerpo_noticia = pi_cuerpo_noticia,foto_noticia = pi_foto_noticia,comentario_noticia = pi_comentario_noticia,id_torneo_noticia = pi_id_torneo_noticia WHERE id_noticia = pi_id_noticia$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarNoticia` (IN `pi_id_noticia` INT(4))  NO SQL
SELECT  	titulo_noticia,subtitulo_noticia,cuerpo_noticia,foto_noticia,comentario_noticia FROM noticias 
WHERE id_noticia = pi_id_noticia$$



--sedes

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarNuevaSede` (IN `pi_nombre_sede` VARCHAR(50), IN `pi_direccion_sede` VARCHAR(250), IN `pi_id_torneo_sede` INT(1))  NO SQL
INSERT INTO sedes (nombre_sede,direccion_sede,id_torneo_sede) VALUES (pi_nombre_sede,pi_direccion_sede,pi_id_torneo_sede)$$


CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarSede` (IN `pi_id_sede` INT(4), IN `pi_nombre_sede` VARCHAR(50), IN `pi_direccion_sede` VARCHAR(250), IN `pi_id_torneo_sede` INT(5))  NO SQL
UPDATE sedes SET nombre_sede = pi_nombre_sede, direccion_sede = pi_direccion_sede,id_torneo_sede = pi_id_torneo_sede WHERE id_sede = pi_id_sede$$



CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarSede` (IN `pi_id_sede` INT(4))  NO SQL
SELECT nombre_sede,direccion_sede FROM sedes 
WHERE id_sede = pi_id_sede$$


--equipos

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarNuevoEquipo` (IN `pi_nombre_equipo` VARCHAR(30), IN `pi_escudo_equipo` VARCHAR(50), IN `pi_partidos_equipo` INT(11), IN `pi_puntos_equipo` INT(11), IN `pi_goles_equipo` INT(11))  NO SQL
INSERT INTO equipos (nombre_equipo,escudo_equipo,partidos_equipo,puntos_equipo,goles_equipo) values(pi_nombre_equipo,pi_escudo_equipo,pi_partidos_equipo,pi_puntos_equipo,pi_goles_equipo)$$


CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarEquipo` (IN `pi_id_equipo` INT(4), IN `pi_nombre_equipo` VARCHAR(30), IN `pi_escudo_equipo` VARCHAR(50), IN `pi_partidos_equipo` INT(11), IN `pi_puntos_equipo` INT(11), IN `pi_goles_equipo` INT(11))  NO SQL
UPDATE equipos SET nombre_equipo = pi_nombre_equipo, escudo_equipo = pi_escudo_equipo,partidos_equipo = pi_partidos_equipo,puntos_equipo = pi_puntos_equipo,goles_equipo = pi_goles_equipo WHERE id_equipo = pi_id_equipo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarEquipo` (IN `pi_id_equipo` INT(4))  NO SQL
SELECT nombre_equipo,escudo_equipo,partidos_equipo,puntos_equipo,goles_equipo FROM equipos 
WHERE id_equipo = pi_id_equipo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarJugadoresDeUnEquipo` (IN `pi_nombre_equipo` VARCHAR(30))  NO SQL
SELECT equipos.nombre_equipo, jugadores.numero_jugador, jugadores.nombre_jugador,jugadores.foto_jugador
FROM equipos 
INNER JOIN jugadores ON equipos.id_equipo=jugadores.equipo_jugador
WHERE equipos.nombre_equipo = pi_nombre_equipo$$


--jugadores

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarNuevoJugador` (IN `p_nombre_jugador` VARCHAR(35), IN `p_apellido_jugador` VARCHAR(20), IN `p_email_jugador` VARCHAR(50), IN `p_pass_jugador` VARCHAR(20), IN `p_edad_jugador` INT(2), IN `p_numero_jugador` INT(3), IN `p_goles_jugador` INT(4), IN `p_asistencias_jugador` INT(3), IN `p_posicion_jugador` VARCHAR(20), IN `p_amarillas_jugador` INT(3), IN `p_rojas_jugador` INT(3), IN `p_estado_jugador` VARCHAR(250), IN `p_foto_jugador` VARCHAR(100), IN `p_minutos_jugador` INT(5), IN `pi_equipo_jugador` INT(2))  NO SQL
INSERT INTO jugadores (nombre_jugador,apellido_jugador,email_jugador,pass_jugador,edad_jugador,numero_jugador,goles_jugador,asistencias_jugador,posicion_jugador,amarillas_jugador,rojas_jugador,estado_jugador,foto_jugador,minutos_jugador,equipo_jugador) values(p_nombre_jugador,p_apellido_jugador,p_email_jugador,p_pass_jugador,p_edad_jugador,p_numero_jugador,p_goles_jugador,p_asistencias_jugador,p_posicion_jugador,p_amarillas_jugador,p_rojas_jugador,p_estado_jugador,p_foto_jugador,p_minutos_jugador,pi_equipo_jugador)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarJugador` (IN `p_id_jugador` INT(11), IN `p_nombre_jugador` VARCHAR(35), IN `p_apellido_jugador` VARCHAR(20), IN `p_email_jugador` VARCHAR(50), IN `p_pass_jugador` VARCHAR(20), IN `p_edad_jugador` INT(2), IN `p_numero_jugador` INT(3), IN `p_goles_jugador` INT(4), IN `p_asistencias_jugador` INT(3), IN `p_posicion_jugador` VARCHAR(20), IN `p_amarillas_jugador` INT(3), IN `p_rojas_jugador` INT(3), IN `p_estado_jugador` VARCHAR(250), IN `p_foto_jugador` VARCHAR(100), IN `p_minutos_jugador` INT(5))  NO SQL
UPDATE jugadores SET nombre_jugador = p_nombre_jugador,apellido_jugador = p_apellido_jugador,email_jugador = p_email_jugador,pass_jugador = p_pass_jugador,edad_jugador = p_edad_jugador,numero_jugador = p_numero_jugador,goles_jugador = p_goles_jugador,asistencias_jugador = p_asistencias_jugador,posicion_jugador = p_posicion_jugador,amarillas_jugador = p_amarillas_jugador,rojas_jugador = p_rojas_jugador,estado_jugador = p_estado_jugador,foto_jugador = p_foto_jugador,minutos_jugador = p_minutos_jugador WHERE id_jugador = p_id_jugador$$


CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarJugador` (IN `pi_id_jugador` INT(11))  NO SQL
SELECT nombre_jugador,apellido_jugador,email_jugador,pass_jugador,edad_jugador,numero_jugador,goles_jugador,asistencias_jugador,posicion_jugador,amarillas_jugador,rojas_jugador,estado_jugador,foto_jugador,minutos_jugador FROM jugadores WHERE id_jugador = pi_id_jugador$$



--torneo

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarNuevoTorneo` (IN `pi_nombre_torneo` VARCHAR(100))  NO SQL
INSERT INTO torneo (nombre_torneo)VALUES(pi_nombre_torneo)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ModificarTorneo` (IN `pi_id_torneo` INT(4), IN `pi_nombre_torneo` VARCHAR(100))  NO SQL
UPDATE torneo SET nombre_torneo = pi_nombre_torneo WHERE id_torneo = pi_id_torneo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarCategoriasDeUnTorneo` (IN `pi_nombre_torneo` VARCHAR(100))  NO SQL
SELECT torneo.nombre_torneo, categorias.nombre_categoria 
FROM torneo 
INNER JOIN categorias ON torneo.id_torneo=categorias.id_torneo_categoria
WHERE torneo.nombre_torneo = pi_nombre_torneo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarEquiposDeTorneo` (IN `pi_nombre_torneo` VARCHAR(50))  NO SQL
SELECT torneo.nombre_torneo, categorias.nombre_categoria,equipos.nombre_equipo,equipos.escudo_equipo 
FROM torneo 
INNER JOIN categorias ON torneo.id_torneo=categorias.id_torneo_categoria
INNER JOIN equipos ON equipos.categoria_id_equipo = categorias.id_categoria
WHERE torneo.nombre_torneo = pi_nombre_torneo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarNoticiasDeUnTorneo` (IN `pi_nombre_torneo` INT(100))  NO SQL
SELECT torneo.nombre_torneo, noticias.titulo_noticia,noticias.subtitulo_noticia,noticias.foto_noticia 
FROM torneo 
INNER JOIN noticias ON torneo.id_torneo=noticias.id_torneo_noticia
WHERE torneo.nombre_torneo = pi_nombre_torneo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarSedesDeUnTorneo` (IN `pi_nombre_torneo` VARCHAR(100))  NO SQL
SELECT torneo.nombre_torneo, sedes.nombre_sede 
FROM torneo 
INNER JOIN sedes ON torneo.id_torneo=sedes.id_torneo_sede
WHERE torneo.nombre_torneo = pi_nombre_torneo$$

--





DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(4) NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL,
  `id_torneo_categoria` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `id_torneo_categoria`) VALUES
(1, 'categoria', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id_equipo` int(4) NOT NULL,
  `nombre_equipo` varchar(30) NOT NULL,
  `escudo_equipo` varchar(50) NOT NULL,
  `partidos_equipo` int(11) NOT NULL,
  `puntos_equipo` int(11) NOT NULL,
  `goles_equipo` int(11) NOT NULL,
  `categoria_id_equipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_equipo`, `nombre_equipo`, `escudo_equipo`, `partidos_equipo`, `puntos_equipo`, `goles_equipo`, `categoria_id_equipo`) VALUES
(2, 'MDB', 'mdb', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `id_jugador` int(11) NOT NULL,
  `nombre_jugador` varchar(35) NOT NULL,
  `apellido_jugador` varchar(20) NOT NULL,
  `email_jugador` varchar(50) NOT NULL,
  `pass_jugador` varchar(20) NOT NULL,
  `edad_jugador` int(2) NOT NULL,
  `numero_jugador` int(3) NOT NULL,
  `goles_jugador` int(4) NOT NULL,
  `asistencias_jugador` int(3) NOT NULL,
  `posicion_jugador` varchar(20) NOT NULL,
  `amarillas_jugador` int(3) NOT NULL,
  `rojas_jugador` int(3) NOT NULL,
  `estado_jugador` varchar(250) NOT NULL,
  `foto_jugador` varchar(100) NOT NULL,
  `minutos_jugador` int(5) NOT NULL,
  `equipo_jugador` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id_jugador`, `nombre_jugador`, `apellido_jugador`, `email_jugador`, `pass_jugador`, `edad_jugador`, `numero_jugador`, `goles_jugador`, `asistencias_jugador`, `posicion_jugador`, `amarillas_jugador`, `rojas_jugador`, `estado_jugador`, `foto_jugador`, `minutos_jugador`, `equipo_jugador`) VALUES
(1, 'Santiago', 'Vallespir', 'santivalles@gmail.com', 'santiagovallespir', 21, 1, 0, 0, 'Arquero', 0, 0, 'El arqueso', 'arqueso.png', 0, 0),
(2, 'Santiago', 'Vallespir', 'santivalles@gmail.com', 'santiagovallespir', 21, 1, 0, 0, 'Arquero', 0, 0, 'El arqueso', 'arqueso.png', 0, 0),
(3, 'asdasd', 'asdasd', 'asdasd', 'asdasd', 1, 1, 1, 1, 'asda', 1, 1, 'asdasd', 'asdasd', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `id_noticia` int(4) NOT NULL,
  `titulo_noticia` varchar(100) NOT NULL,
  `subtitulo_noticia` varchar(150) NOT NULL,
  `cuerpo_noticia` text NOT NULL,
  `foto_noticia` varchar(100) NOT NULL,
  `comentario_noticia` varchar(200) NOT NULL,
  `id_torneo_noticia` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id_noticia`, `titulo_noticia`, `subtitulo_noticia`, `cuerpo_noticia`, `foto_noticia`, `comentario_noticia`, `id_torneo_noticia`) VALUES
(1, 'Clima', 'Pronostico', 'Pronostico Pronostico Pronostico Pronostico Pronostico Pronostico Pronostico Pronostico', 'Pronostico.png', 'asdasdasd', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

CREATE TABLE `partidos` (
  `id_partido` int(5) NOT NULL,
  `fecha_partido` datetime NOT NULL,
  `id_equipo_1_partido` int(4) NOT NULL,
  `id_equipo_2_partido` int(4) NOT NULL,
  `id_sede_partido` int(11) NOT NULL,
  `resultado_equipo_1_partido` int(2) NOT NULL,
  `resultado_equipo_2_partido` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `id_sede` int(4) NOT NULL,
  `nombre_sede` varchar(50) NOT NULL,
  `direccion_sede` varchar(250) NOT NULL,
  `id_torneo_sede` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`id_sede`, `nombre_sede`, `direccion_sede`, `id_torneo_sede`) VALUES
(1, 'PM', 'qwe', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneo`
--

CREATE TABLE `torneo` (
  `id_torneo` int(4) NOT NULL,
  `nombre_torneo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Volcado de datos para la tabla `torneo`
--

INSERT INTO `torneo` (`id_torneo`, `nombre_torneo`) VALUES
(1, 'CNBA'),
(2, 'hola');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id_equipo`),
  ADD UNIQUE KEY `nombre_equipo` (`nombre_equipo`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`id_jugador`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id_noticia`);

--
-- Indices de la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD PRIMARY KEY (`id_partido`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`id_sede`);

--
-- Indices de la tabla `torneo`
--
ALTER TABLE `torneo`
  ADD PRIMARY KEY (`id_torneo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id_equipo` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `id_jugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id_noticia` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `partidos`
--
ALTER TABLE `partidos`
  MODIFY `id_partido` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `id_sede` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `torneo`
--
ALTER TABLE `torneo`
  MODIFY `id_torneo` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
