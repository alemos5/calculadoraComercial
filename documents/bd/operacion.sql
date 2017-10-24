-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 28-09-2017 a las 09:41:44
-- Versión del servidor: 5.5.54-0+deb8u1
-- Versión de PHP: 5.6.29-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `tradingSignal`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operacion`
--

CREATE TABLE IF NOT EXISTS `operacion` (
`id_operacion` int(11) NOT NULL,
  `id_exchange` int(11) NOT NULL,
  `id_moneda` int(11) NOT NULL,
  `id_estatus_operacion` int(11) NOT NULL,
  `id_tipo_operacion` int(11) NOT NULL,
  `compra1` decimal(10,8) DEFAULT NULL,
  `compra2` decimal(10,8) DEFAULT NULL,
  `venta_en` decimal(10,8) DEFAULT NULL,
  `target1` decimal(10,8) DEFAULT NULL,
  `target11` decimal(10,8) DEFAULT NULL,
  `porcentaje1` decimal(10,2) DEFAULT NULL,
  `estado1` int(11) DEFAULT '0',
  `target2` decimal(10,8) DEFAULT NULL,
  `target22` decimal(10,8) DEFAULT NULL,
  `porcentaje2` decimal(10,2) DEFAULT NULL,
  `estado2` int(11) DEFAULT '0',
  `target3` decimal(10,8) DEFAULT NULL,
  `target33` decimal(10,8) DEFAULT NULL,
  `porcentaje3` decimal(10,2) DEFAULT NULL,
  `estado3` int(11) DEFAULT '0',
  `target4` decimal(10,8) DEFAULT NULL,
  `target44` decimal(10,8) DEFAULT NULL,
  `porcentaje4` decimal(10,2) DEFAULT NULL,
  `estado4` int(11) DEFAULT '0',
  `target5` decimal(10,8) DEFAULT NULL,
  `target55` decimal(10,8) DEFAULT NULL,
  `porcentaje5` decimal(10,2) DEFAULT NULL,
  `estado5` int(11) DEFAULT '0',
  `stop_loss` decimal(10,8) NOT NULL,
  `observacion` longtext NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1',
  `id_usuario_sistema_reg` int(11) DEFAULT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  `ip_reg` varchar(20) DEFAULT NULL,
  `id_usuario_sistema_mod` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `ip_mod` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `operacion`
--
ALTER TABLE `operacion`
 ADD PRIMARY KEY (`id_operacion`), ADD KEY `estatus_operacion_operacion_fk` (`id_estatus_operacion`), ADD KEY `exchange_operacion_fk` (`id_exchange`), ADD KEY `moneda_operacion_fk` (`id_moneda`), ADD KEY `tipo_operacion_operacion_fk` (`id_tipo_operacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `operacion`
--
ALTER TABLE `operacion`
MODIFY `id_operacion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `operacion`
--
ALTER TABLE `operacion`
ADD CONSTRAINT `estatus_operacion_operacion_fk` FOREIGN KEY (`id_estatus_operacion`) REFERENCES `estatus_operacion` (`id_estatus_operacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `exchange_operacion_fk` FOREIGN KEY (`id_exchange`) REFERENCES `exchange` (`id_exchange`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `moneda_operacion_fk` FOREIGN KEY (`id_moneda`) REFERENCES `moneda` (`id_moneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `tipo_operacion_operacion_fk` FOREIGN KEY (`id_tipo_operacion`) REFERENCES `tipo_operacion` (`id_tipo_operacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
