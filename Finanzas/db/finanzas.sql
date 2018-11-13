-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-11-2018 a las 20:57:03
-- Versión del servidor: 5.7.23
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `finanzas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

DROP TABLE IF EXISTS `gastos`;
CREATE TABLE IF NOT EXISTS `gastos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monto` bigint(20) NOT NULL,
  `fecha` date NOT NULL,
  `comprobante` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_tipo_gasto` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_g` (`id_tipo_gasto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
CREATE TABLE IF NOT EXISTS `ingresos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monto` bigint(20) NOT NULL,
  `fecha` date NOT NULL,
  `observaciones` varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Sin Observaciones',
  `id_tipo_ingreso` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_i` (`id_tipo_ingreso`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_gasto`
--

DROP TABLE IF EXISTS `tipo_gasto`;
CREATE TABLE IF NOT EXISTS `tipo_gasto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_ingreso`
--

DROP TABLE IF EXISTS `tipo_ingreso`;
CREATE TABLE IF NOT EXISTS `tipo_ingreso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_ingreso`
--

INSERT INTO `tipo_ingreso` (`id`, `descripcion`) VALUES
(1, 'Sueldo'),
(2, 'Trabajos Clientes'),
(3, 'Aguinaldos');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
