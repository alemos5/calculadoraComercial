-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 24-09-2017 a las 19:34:37
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
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
`id_estado` int(11) NOT NULL,
  `id_pais` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus`
--

CREATE TABLE IF NOT EXISTS `estatus` (
`id_estatus` int(11) NOT NULL,
  `estatus` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estatus`
--

INSERT INTO `estatus` (`id_estatus`, `estatus`) VALUES
(0, 'Inactivo'),
(1, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus_operacion`
--

CREATE TABLE IF NOT EXISTS `estatus_operacion` (
`id_estatus_operacion` int(11) NOT NULL,
  `estatus_operacion` varchar(250) NOT NULL,
  `observacion` longtext,
  `estatus` int(11) NOT NULL DEFAULT '1',
  `id_usuario_sistema_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ip_reg` varchar(20) NOT NULL,
  `id_usuario_sistema_mod` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `ip_mod` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estatus_operacion`
--

INSERT INTO `estatus_operacion` (`id_estatus_operacion`, `estatus_operacion`, `observacion`, `estatus`, `id_usuario_sistema_reg`, `fecha_reg`, `ip_reg`, `id_usuario_sistema_mod`, `fecha_mod`, `ip_mod`) VALUES
(2, 'Señal del Día', '', 1, 4, '2017-09-23 19:56:11', '::1', 4, '2017-09-24 09:20:50', '::1'),
(3, 'prueba', '', 1, 4, '2017-09-23 19:58:29', '192.168.1.107', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exchange`
--

CREATE TABLE IF NOT EXISTS `exchange` (
`id_exchange` int(11) NOT NULL,
  `exchange` varchar(250) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1',
  `id_usuario_sistema_reg` int(11) DEFAULT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  `ip_reg` varchar(20) DEFAULT NULL,
  `id_usuario_sistema_mod` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `ip_mod` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `exchange`
--

INSERT INTO `exchange` (`id_exchange`, `exchange`, `estatus`, `id_usuario_sistema_reg`, `fecha_reg`, `ip_reg`, `id_usuario_sistema_mod`, `fecha_mod`, `ip_mod`) VALUES
(1, 'BITTREX', 1, 4, '2017-09-23 00:00:00', '127.0.0.1', 4, '2017-09-23 00:00:00', '127.0.0.1'),
(2, 'POLONIEX', 1, 4, '2017-09-23 00:00:00', '127.0.0.1', 4, '2017-09-23 00:00:00', '127.0.0.1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_sistema`
--

CREATE TABLE IF NOT EXISTS `menu_sistema` (
`id_menu_sistema` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ruta` varchar(200) NOT NULL,
  `padre` int(11) DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  `style` varchar(200) DEFAULT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `menu_sistema`
--

INSERT INTO `menu_sistema` (`id_menu_sistema`, `nombre`, `ruta`, `padre`, `nivel`, `style`, `estatus`) VALUES
(1, 'Inicio', '/site/index', 0, 1, '', 1),
(2, 'Credenciales', '/usuario/index', 0, 97, '', 1),
(3, 'Perfil', '/perfil/index', 2, 4, '', 1),
(5, 'Menu', '/menu/index', 2, 2, '', 1),
(6, 'Usuario', '/usuario/index', 2, 111, '', 1),
(7, 'Asignar Perfil-Menu', '/perfil/perfilmenu', 2, 5, '', 1),
(10, 'Administradores', '/admin', 0, 98, '', 1),
(11, 'Estado', '/estado/index', 10, 5, '', 0),
(12, 'Municipio', '/municipio/index', 10, 6, '', 0),
(13, 'Parroquia', '/parroquia/index', 10, 7, '', 0),
(39, 'País', 'pais/index', 10, 1, NULL, 0),
(40, 'Estatus Operación', 'estatusOperacion/index', 10, 5, NULL, 1),
(41, 'Exchange', 'exchange/index', 10, 6, NULL, 1),
(42, 'Monedas', 'moneda/index', 10, 7, NULL, 1),
(43, 'Operaciones', 'operacion/index', 0, 2, NULL, 1),
(44, 'Tipos de Operaciones', 'tipoOperacion/index', 10, 8, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

CREATE TABLE IF NOT EXISTS `moneda` (
`id_moneda` int(11) NOT NULL,
  `id_exchange` int(11) NOT NULL,
  `moneda` varchar(250) DEFAULT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1',
  `id_usuario_sistema_reg` int(11) DEFAULT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  `ip_reg` varchar(20) DEFAULT NULL,
  `id_usuario_sistema_mod` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `ip_mod` varchar(20) DEFAULT NULL,
  `abv` varchar(100) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `moneda`
--

INSERT INTO `moneda` (`id_moneda`, `id_exchange`, `moneda`, `estatus`, `id_usuario_sistema_reg`, `fecha_reg`, `ip_reg`, `id_usuario_sistema_mod`, `fecha_mod`, `ip_mod`, `abv`, `url`) VALUES
(1, 1, 'FirstBlood', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', '1ST', 'https://bittrex.com/Market/Index?MarketName=BTC-1ST'),
(2, 1, '2GIVE', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', '2GIVE', 'https://bittrex.com/Market/Index?MarketName=BTC-2GIVE'),
(3, 1, 'ArtByte', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'ABY', 'https://bittrex.com/Market/Index?MarketName=BTC-ABY'),
(4, 1, 'adToken', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'ADT', 'https://bittrex.com/Market/Index?MarketName=BTC-ADT'),
(5, 1, 'AdEx', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'ADX', 'https://bittrex.com/Market/Index?MarketName=BTC-ADX'),
(6, 1, 'Aeon', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'AEON', 'https://bittrex.com/Market/Index?MarketName=BTC-AEON'),
(7, 1, 'IDNI Agoras', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'AGRS', 'https://bittrex.com/Market/Index?MarketName=BTC-AGRS'),
(8, 1, 'AMP', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'AMP', 'https://bittrex.com/Market/Index?MarketName=BTC-AMP'),
(9, 1, 'Aragon', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'ANT', 'https://bittrex.com/Market/Index?MarketName=BTC-ANT'),
(10, 1, 'Apx', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'APX', 'https://bittrex.com/Market/Index?MarketName=BTC-APX'),
(11, 1, 'Ardor', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'ARDR', 'https://bittrex.com/Market/Index?MarketName=BTC-ARDR'),
(12, 1, 'Ark', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'ARK', 'https://bittrex.com/Market/Index?MarketName=BTC-ARK'),
(13, 1, 'AuroraCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'AUR', 'https://bittrex.com/Market/Index?MarketName=BTC-AUR'),
(14, 1, 'Basic Attention Token', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BAT', 'https://bittrex.com/Market/Index?MarketName=BTC-BAT'),
(15, 1, 'BitBay', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BAY', 'https://bittrex.com/Market/Index?MarketName=BTC-BAY'),
(16, 1, 'Bitcoin Cash', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BCC', 'https://bittrex.com/Market/Index?MarketName=BTC-BCC'),
(17, 1, 'BitCrystals', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BCY', 'https://bittrex.com/Market/Index?MarketName=BTC-BCY'),
(18, 1, 'BitBean', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BITB', 'https://bittrex.com/Market/Index?MarketName=BTC-BITB'),
(19, 1, 'Blitzcash', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BLITZ', 'https://bittrex.com/Market/Index?MarketName=BTC-BLITZ'),
(20, 1, 'BlackCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BLK', 'https://bittrex.com/Market/Index?MarketName=BTC-BLK'),
(21, 1, 'BlockNet', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BLOCK', 'https://bittrex.com/Market/Index?MarketName=BTC-BLOCK'),
(22, 1, 'Bancor', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BNT', 'https://bittrex.com/Market/Index?MarketName=BTC-BNT'),
(23, 1, 'Breakout', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BRK', 'https://bittrex.com/Market/Index?MarketName=BTC-BRK'),
(24, 1, 'Breakout Stake', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BRX', 'https://bittrex.com/Market/Index?MarketName=BTC-BRX'),
(25, 1, 'BitSend', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BSD', 'https://bittrex.com/Market/Index?MarketName=BTC-BSD'),
(26, 1, 'Bata', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BTA', 'https://bittrex.com/Market/Index?MarketName=BTC-BTA'),
(27, 1, 'BitcoinDark', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BTCD', 'https://bittrex.com/Market/Index?MarketName=BTC-BTCD'),
(28, 1, 'BitShares', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BTS', 'https://bittrex.com/Market/Index?MarketName=BTC-BTS'),
(29, 1, 'BURSTCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BURST', 'https://bittrex.com/Market/Index?MarketName=BTC-BURST'),
(30, 1, 'Bytecent', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BYC', 'https://bittrex.com/Market/Index?MarketName=BTC-BYC'),
(31, 1, 'CannabisCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'CANN', 'https://bittrex.com/Market/Index?MarketName=BTC-CANN'),
(32, 1, 'Cofound.it', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'CFI', 'https://bittrex.com/Market/Index?MarketName=BTC-CFI'),
(33, 1, 'CLAMs', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'CLAM', 'https://bittrex.com/Market/Index?MarketName=BTC-CLAM'),
(34, 1, 'CloakCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'CLOAK', 'https://bittrex.com/Market/Index?MarketName=BTC-CLOAK'),
(35, 1, 'ClubCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'CLUB', 'https://bittrex.com/Market/Index?MarketName=BTC-CLUB'),
(36, 1, 'Circuits of Value', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'COVAL', 'https://bittrex.com/Market/Index?MarketName=BTC-COVAL'),
(37, 1, 'CapriCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'CPC', 'https://bittrex.com/Market/Index?MarketName=BTC-CPC'),
(38, 1, 'CreditBit', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'CRB', 'https://bittrex.com/Market/Index?MarketName=BTC-CRB'),
(39, 1, 'Crown', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'CRW', 'https://bittrex.com/Market/Index?MarketName=BTC-CRW'),
(40, 1, 'CureCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'CURE', 'https://bittrex.com/Market/Index?MarketName=BTC-CURE'),
(41, 1, 'Civic', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'CVC', 'https://bittrex.com/Market/Index?MarketName=BTC-CVC'),
(42, 1, 'Darcrus', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'DAR', 'https://bittrex.com/Market/Index?MarketName=BTC-DAR'),
(43, 1, 'Dash', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'DASH', 'https://bittrex.com/Market/Index?MarketName=BTC-DASH'),
(44, 1, 'Decred', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'DCR', 'https://bittrex.com/Market/Index?MarketName=BTC-DCR'),
(45, 1, 'DECENT', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'DCT', 'https://bittrex.com/Market/Index?MarketName=BTC-DCT'),
(46, 1, 'Digibyte', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'DGB', 'https://bittrex.com/Market/Index?MarketName=BTC-DGB'),
(47, 1, 'DigixDAO', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'DGD', 'https://bittrex.com/Market/Index?MarketName=BTC-DGD'),
(48, 1, 'Diamond', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'DMD', 'https://bittrex.com/Market/Index?MarketName=BTC-DMD'),
(49, 1, 'Dogecoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'DOGE', 'https://bittrex.com/Market/Index?MarketName=BTC-DOGE'),
(50, 1, 'DopeCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'DOPE', 'https://bittrex.com/Market/Index?MarketName=BTC-DOPE'),
(51, 1, 'DT Token', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'DRACO', 'https://bittrex.com/Market/Index?MarketName=BTC-DRACO'),
(52, 1, 'Databits', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'DTB', 'https://bittrex.com/Market/Index?MarketName=BTC-DTB'),
(53, 1, 'Dynamic', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'DYN', 'https://bittrex.com/Market/Index?MarketName=BTC-DYN'),
(54, 1, 'eBoost', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'EBST', 'https://bittrex.com/Market/Index?MarketName=BTC-EBST'),
(55, 1, 'Edgeless', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'EDG', 'https://bittrex.com/Market/Index?MarketName=BTC-EDG'),
(56, 1, 'ElectronicGulden', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'EFL', 'https://bittrex.com/Market/Index?MarketName=BTC-EFL'),
(57, 1, 'EverGreenCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'EGC', 'https://bittrex.com/Market/Index?MarketName=BTC-EGC'),
(58, 1, 'EmerCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'EMC', 'https://bittrex.com/Market/Index?MarketName=BTC-EMC'),
(59, 1, 'Einsteinium', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'EMC2', 'https://bittrex.com/Market/Index?MarketName=BTC-EMC2'),
(60, 1, 'EnergyCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'ENRG', 'https://bittrex.com/Market/Index?MarketName=BTC-ENRG'),
(61, 1, 'EuropeCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'ERC', 'https://bittrex.com/Market/Index?MarketName=BTC-ERC'),
(62, 1, 'Ethereum Classic', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'ETC', 'https://bittrex.com/Market/Index?MarketName=BTC-ETC'),
(63, 1, 'Ethereum', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'ETH', 'https://bittrex.com/Market/Index?MarketName=BTC-ETH'),
(64, 1, 'ExclusiveCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'EXCL', 'https://bittrex.com/Market/Index?MarketName=BTC-EXCL'),
(65, 1, 'Expanse', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'EXP', 'https://bittrex.com/Market/Index?MarketName=BTC-EXP'),
(66, 1, 'FairCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'FAIR', 'https://bittrex.com/Market/Index?MarketName=BTC-FAIR'),
(67, 1, 'Factom', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'FCT', 'https://bittrex.com/Market/Index?MarketName=BTC-FCT'),
(68, 1, 'FoldingCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'FLDC', 'https://bittrex.com/Market/Index?MarketName=BTC-FLDC'),
(69, 1, 'Florin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'FLO', 'https://bittrex.com/Market/Index?MarketName=BTC-FLO'),
(70, 1, 'Feathercoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'FTC', 'https://bittrex.com/Market/Index?MarketName=BTC-FTC'),
(71, 1, 'FunFair', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'FUN', 'https://bittrex.com/Market/Index?MarketName=BTC-FUN'),
(72, 1, 'Gambit', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'GAM', 'https://bittrex.com/Market/Index?MarketName=BTC-GAM'),
(73, 1, 'GameCredits', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'GAME', 'https://bittrex.com/Market/Index?MarketName=BTC-GAME'),
(74, 1, 'GBG', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'GBG', 'https://bittrex.com/Market/Index?MarketName=BTC-GBG'),
(75, 1, 'Bytes', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'GBYTE', 'https://bittrex.com/Market/Index?MarketName=BTC-GBYTE'),
(76, 1, 'GlobalCurrencyReserve', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'GCR', 'https://bittrex.com/Market/Index?MarketName=BTC-GCR'),
(77, 1, 'GeoCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'GEO', 'https://bittrex.com/Market/Index?MarketName=BTC-GEO'),
(78, 1, 'GoldCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'GLD', 'https://bittrex.com/Market/Index?MarketName=BTC-GLD'),
(79, 1, 'Gnosis', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'GNO', 'https://bittrex.com/Market/Index?MarketName=BTC-GNO'),
(80, 1, 'Golem', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'GNT', 'https://bittrex.com/Market/Index?MarketName=BTC-GNT'),
(81, 1, 'Golos', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'GOLOS', 'https://bittrex.com/Market/Index?MarketName=BTC-GOLOS'),
(82, 1, 'GridCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'GRC', 'https://bittrex.com/Market/Index?MarketName=BTC-GRC'),
(83, 1, 'Groestlcoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'GRS', 'https://bittrex.com/Market/Index?MarketName=BTC-GRS'),
(84, 1, 'Guppy', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'GUP', 'https://bittrex.com/Market/Index?MarketName=BTC-GUP'),
(85, 1, 'Humaniq', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'HMQ', 'https://bittrex.com/Market/Index?MarketName=BTC-HMQ'),
(86, 1, 'Incent', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'INCNT', 'https://bittrex.com/Market/Index?MarketName=BTC-INCNT'),
(87, 1, 'InfluxCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'INFX', 'https://bittrex.com/Market/Index?MarketName=BTC-INFX'),
(88, 1, 'I/OCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'IOC', 'https://bittrex.com/Market/Index?MarketName=BTC-IOC'),
(89, 1, 'Ion', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'ION', 'https://bittrex.com/Market/Index?MarketName=BTC-ION'),
(90, 1, 'Internet Of People', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'IOP', 'https://bittrex.com/Market/Index?MarketName=BTC-IOP'),
(91, 1, 'Komodo', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'KMD', 'https://bittrex.com/Market/Index?MarketName=BTC-KMD'),
(92, 1, 'KoreCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'KORE', 'https://bittrex.com/Market/Index?MarketName=BTC-KORE'),
(93, 1, 'LBRY Credits', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'LBC', 'https://bittrex.com/Market/Index?MarketName=BTC-LBC'),
(94, 1, 'Legends', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'LGD', 'https://bittrex.com/Market/Index?MarketName=BTC-LGD'),
(95, 1, 'Lomocoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'LMC', 'https://bittrex.com/Market/Index?MarketName=BTC-LMC'),
(96, 1, 'Lisk', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'LSK', 'https://bittrex.com/Market/Index?MarketName=BTC-LSK'),
(97, 1, 'Litecoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'LTC', 'https://bittrex.com/Market/Index?MarketName=BTC-LTC'),
(98, 1, 'Lunyr', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'LUN', 'https://bittrex.com/Market/Index?MarketName=BTC-LUN'),
(99, 1, 'MaidSafe', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'MAID', 'https://bittrex.com/Market/Index?MarketName=BTC-MAID'),
(100, 1, 'Monaco', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'MCO', 'https://bittrex.com/Market/Index?MarketName=BTC-MCO'),
(101, 1, 'Memetic', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'MEME', 'https://bittrex.com/Market/Index?MarketName=BTC-MEME'),
(102, 1, 'Melon', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'MLN', 'https://bittrex.com/Market/Index?MarketName=BTC-MLN'),
(103, 1, 'MonaCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'MONA', 'https://bittrex.com/Market/Index?MarketName=BTC-MONA'),
(104, 1, 'Metal', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'MTL', 'https://bittrex.com/Market/Index?MarketName=BTC-MTL'),
(105, 1, 'MonetaryUnit', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'MUE', 'https://bittrex.com/Market/Index?MarketName=BTC-MUE'),
(106, 1, 'Musicoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'MUSIC', 'https://bittrex.com/Market/Index?MarketName=BTC-MUSIC'),
(107, 1, 'Mysterium', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'MYST', 'https://bittrex.com/Market/Index?MarketName=BTC-MYST'),
(108, 1, 'NAVCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'NAV', 'https://bittrex.com/Market/Index?MarketName=BTC-NAV'),
(109, 1, 'Nubits', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'NBT', 'https://bittrex.com/Market/Index?MarketName=BTC-NBT'),
(110, 1, 'Neo', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'NEO', 'https://bittrex.com/Market/Index?MarketName=BTC-NEO'),
(111, 1, 'NeosCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'NEOS', 'https://bittrex.com/Market/Index?MarketName=BTC-NEOS'),
(112, 1, 'Gulden', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'NLG', 'https://bittrex.com/Market/Index?MarketName=BTC-NLG'),
(113, 1, 'Numeraire', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'NMR', 'https://bittrex.com/Market/Index?MarketName=BTC-NMR'),
(114, 1, 'Nexium', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'NXC', 'https://bittrex.com/Market/Index?MarketName=BTC-NXC'),
(115, 1, 'Nexus', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'NXS', 'https://bittrex.com/Market/Index?MarketName=BTC-NXS'),
(116, 1, 'NXT', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'NXT', 'https://bittrex.com/Market/Index?MarketName=BTC-NXT'),
(117, 1, 'OkCash', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'OK', 'https://bittrex.com/Market/Index?MarketName=BTC-OK'),
(118, 1, 'OmiseGO', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'OMG', 'https://bittrex.com/Market/Index?MarketName=BTC-OMG'),
(119, 1, 'OMNI', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'OMNI', 'https://bittrex.com/Market/Index?MarketName=BTC-OMNI'),
(120, 1, 'Particl', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'PART', 'https://bittrex.com/Market/Index?MarketName=BTC-PART'),
(121, 1, 'TenX Pay Token', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'PAY', 'https://bittrex.com/Market/Index?MarketName=BTC-PAY'),
(122, 1, 'Project Decorum', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'PDC', 'https://bittrex.com/Market/Index?MarketName=BTC-PDC'),
(123, 1, 'PinkCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'PINK', 'https://bittrex.com/Market/Index?MarketName=BTC-PINK'),
(124, 1, 'Pivx', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'PIVX', 'https://bittrex.com/Market/Index?MarketName=BTC-PIVX'),
(125, 1, 'ParkByte', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'PKB', 'https://bittrex.com/Market/Index?MarketName=BTC-PKB'),
(126, 1, 'PotCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'POT', 'https://bittrex.com/Market/Index?MarketName=BTC-POT'),
(127, 1, 'Peercoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'PPC', 'https://bittrex.com/Market/Index?MarketName=BTC-PPC'),
(128, 1, 'PesetaCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'PTC', 'https://bittrex.com/Market/Index?MarketName=BTC-PTC'),
(129, 1, 'Patientory', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'PTOY', 'https://bittrex.com/Market/Index?MarketName=BTC-PTOY'),
(130, 1, 'Quantum Resistant Ledger', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'QRL', 'https://bittrex.com/Market/Index?MarketName=BTC-QRL'),
(131, 1, 'Qtum', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'QTUM', 'https://bittrex.com/Market/Index?MarketName=BTC-QTUM'),
(132, 1, 'Qwark', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'QWARK', 'https://bittrex.com/Market/Index?MarketName=BTC-QWARK'),
(133, 1, 'Radium', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'RADS', 'https://bittrex.com/Market/Index?MarketName=BTC-RADS'),
(134, 1, 'RubyCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'RBY', 'https://bittrex.com/Market/Index?MarketName=BTC-RBY'),
(135, 1, 'ReddCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'RDD', 'https://bittrex.com/Market/Index?MarketName=BTC-RDD'),
(136, 1, 'Augur', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'REP', 'https://bittrex.com/Market/Index?MarketName=BTC-REP'),
(137, 1, 'Rise', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'RISE', 'https://bittrex.com/Market/Index?MarketName=BTC-RISE'),
(138, 1, 'iEx.ec', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'RLC', 'https://bittrex.com/Market/Index?MarketName=BTC-RLC'),
(139, 1, 'SafeExchangeCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SAFEX', 'https://bittrex.com/Market/Index?MarketName=BTC-SAFEX'),
(140, 1, 'SteemDollars', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SBD', 'https://bittrex.com/Market/Index?MarketName=BTC-SBD'),
(141, 1, 'Siacoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SC', 'https://bittrex.com/Market/Index?MarketName=BTC-SC'),
(142, 1, 'Sequence', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SEQ', 'https://bittrex.com/Market/Index?MarketName=BTC-SEQ'),
(143, 1, 'Shift', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SHIFT', 'https://bittrex.com/Market/Index?MarketName=BTC-SHIFT'),
(144, 1, 'Siberian Chervonets', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SIB', 'https://bittrex.com/Market/Index?MarketName=BTC-SIB'),
(145, 1, 'SolarCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SLR', 'https://bittrex.com/Market/Index?MarketName=BTC-SLR'),
(146, 1, 'SaluS', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SLS', 'https://bittrex.com/Market/Index?MarketName=BTC-SLS'),
(147, 1, 'SingularDTV', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SNGLS', 'https://bittrex.com/Market/Index?MarketName=BTC-SNGLS'),
(148, 1, 'Synergy', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SNRG', 'https://bittrex.com/Market/Index?MarketName=BTC-SNRG'),
(149, 1, 'Status Network Token', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SNT', 'https://bittrex.com/Market/Index?MarketName=BTC-SNT'),
(150, 1, 'Sphere', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SPHR', 'https://bittrex.com/Market/Index?MarketName=BTC-SPHR'),
(151, 1, 'SpreadCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SPR', 'https://bittrex.com/Market/Index?MarketName=BTC-SPR'),
(152, 1, 'StartCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'START', 'https://bittrex.com/Market/Index?MarketName=BTC-START'),
(153, 1, 'STEEM', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'STEEM', 'https://bittrex.com/Market/Index?MarketName=BTC-STEEM'),
(154, 1, 'Storj', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'STORJ', 'https://bittrex.com/Market/Index?MarketName=BTC-STORJ'),
(155, 1, 'Stratis', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'STRAT', 'https://bittrex.com/Market/Index?MarketName=BTC-STRAT'),
(156, 1, 'Bitswift', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SWIFT', 'https://bittrex.com/Market/Index?MarketName=BTC-SWIFT'),
(157, 1, 'Swarm City Token', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SWT', 'https://bittrex.com/Market/Index?MarketName=BTC-SWT'),
(158, 1, 'Syndicate', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SYNX', 'https://bittrex.com/Market/Index?MarketName=BTC-SYNX'),
(159, 1, 'SysCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SYS', 'https://bittrex.com/Market/Index?MarketName=BTC-SYS'),
(160, 1, 'HempCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'THC', 'https://bittrex.com/Market/Index?MarketName=BTC-THC'),
(161, 1, 'Chronobank Time', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'TIME', 'https://bittrex.com/Market/Index?MarketName=BTC-TIME'),
(162, 1, 'TokenCard', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'TKN', 'https://bittrex.com/Market/Index?MarketName=BTC-TKN'),
(163, 1, 'Tokes', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'TKS', 'https://bittrex.com/Market/Index?MarketName=BTC-TKS'),
(164, 1, 'TRIG Token', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'TRIG', 'https://bittrex.com/Market/Index?MarketName=BTC-TRIG'),
(165, 1, 'Trustcoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'TRST', 'https://bittrex.com/Market/Index?MarketName=BTC-TRST'),
(166, 1, 'TrustPlus', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'TRUST', 'https://bittrex.com/Market/Index?MarketName=BTC-TRUST'),
(167, 1, 'TransferCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'TX', 'https://bittrex.com/Market/Index?MarketName=BTC-TX'),
(168, 1, 'Ubiq', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'UBQ', 'https://bittrex.com/Market/Index?MarketName=BTC-UBQ'),
(169, 1, 'UnbreakableCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'UNB', 'https://bittrex.com/Market/Index?MarketName=BTC-UNB'),
(170, 1, 'Unobtanium', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'UNO', 'https://bittrex.com/Market/Index?MarketName=BTC-UNO'),
(171, 1, 'ViaCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'VIA', 'https://bittrex.com/Market/Index?MarketName=BTC-VIA'),
(172, 1, 'Voxels', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'VOX', 'https://bittrex.com/Market/Index?MarketName=BTC-VOX'),
(173, 1, 'VeriCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'VRC', 'https://bittrex.com/Market/Index?MarketName=BTC-VRC'),
(174, 1, 'Verium', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'VRM', 'https://bittrex.com/Market/Index?MarketName=BTC-VRM'),
(175, 1, 'Vertcoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'VTC', 'https://bittrex.com/Market/Index?MarketName=BTC-VTC'),
(176, 1, 'vTorrent', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'VTR', 'https://bittrex.com/Market/Index?MarketName=BTC-VTR'),
(177, 1, 'Waves', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'WAVES', 'https://bittrex.com/Market/Index?MarketName=BTC-WAVES'),
(178, 1, 'Wings DAO', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'WINGS', 'https://bittrex.com/Market/Index?MarketName=BTC-WINGS'),
(179, 1, 'Xaurum', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XAUR', 'https://bittrex.com/Market/Index?MarketName=BTC-XAUR'),
(180, 1, 'Counterparty', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XCP', 'https://bittrex.com/Market/Index?MarketName=BTC-XCP'),
(181, 1, 'DigitalNote', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XDN', 'https://bittrex.com/Market/Index?MarketName=BTC-XDN'),
(182, 1, 'Elastic', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XEL', 'https://bittrex.com/Market/Index?MarketName=BTC-XEL'),
(183, 1, 'NewEconomyMovement', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XEM', 'https://bittrex.com/Market/Index?MarketName=BTC-XEM'),
(184, 1, 'Lumen', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XLM', 'https://bittrex.com/Market/Index?MarketName=BTC-XLM'),
(185, 1, 'Magi', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XMG', 'https://bittrex.com/Market/Index?MarketName=BTC-XMG'),
(186, 1, 'Monero', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XMR', 'https://bittrex.com/Market/Index?MarketName=BTC-XMR'),
(187, 1, 'Myriad', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XMY', 'https://bittrex.com/Market/Index?MarketName=BTC-XMY'),
(188, 1, 'Ripple', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XRP', 'https://bittrex.com/Market/Index?MarketName=BTC-XRP'),
(189, 1, 'StealthCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XST', 'https://bittrex.com/Market/Index?MarketName=BTC-XST'),
(190, 1, 'Vcash', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XVC', 'https://bittrex.com/Market/Index?MarketName=BTC-XVC'),
(191, 1, 'Verge', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XVG', 'https://bittrex.com/Market/Index?MarketName=BTC-XVG'),
(192, 1, 'WhiteCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XWC', 'https://bittrex.com/Market/Index?MarketName=BTC-XWC'),
(193, 1, 'ZCoin', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XZC', 'https://bittrex.com/Market/Index?MarketName=BTC-XZC'),
(194, 1, 'Zclassic', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'ZCL', 'https://bittrex.com/Market/Index?MarketName=BTC-ZCL'),
(195, 1, 'Zcash', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'ZEC', 'https://bittrex.com/Market/Index?MarketName=BTC-ZEC'),
(196, 1, 'Zencash', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'ZEN', 'https://bittrex.com/Market/Index?MarketName=BTC-ZEN'),
(197, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', '1ST', 'https://www.poloniex.com/exchange#btc_'),
(198, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'AMP', 'https://www.poloniex.com/exchange#btc_'),
(199, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'ARDR', 'https://www.poloniex.com/exchange#btc_'),
(200, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BCH', 'https://www.poloniex.com/exchange#btc_'),
(201, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BCN', 'https://www.poloniex.com/exchange#btc_'),
(202, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BCY', 'https://www.poloniex.com/exchange#btc_'),
(203, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BELA', 'https://www.poloniex.com/exchange#btc_'),
(204, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BLK', 'https://www.poloniex.com/exchange#btc_'),
(205, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BTCD', 'https://www.poloniex.com/exchange#btc_'),
(206, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BTM', 'https://www.poloniex.com/exchange#btc_'),
(207, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BTS', 'https://www.poloniex.com/exchange#btc_'),
(208, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'BURST', 'https://www.poloniex.com/exchange#btc_'),
(209, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'CLAM', 'https://www.poloniex.com/exchange#btc_'),
(210, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'CVC', 'https://www.poloniex.com/exchange#btc_'),
(211, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'DASH', 'https://www.poloniex.com/exchange#btc_'),
(212, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'DCR', 'https://www.poloniex.com/exchange#btc_'),
(213, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'DGB', 'https://www.poloniex.com/exchange#btc_'),
(214, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'DOGE', 'https://www.poloniex.com/exchange#btc_'),
(215, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'EMC2', 'https://www.poloniex.com/exchange#btc_'),
(216, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'ETC', 'https://www.poloniex.com/exchange#btc_'),
(217, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'ETH', 'https://www.poloniex.com/exchange#btc_'),
(218, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'EXP', 'https://www.poloniex.com/exchange#btc_'),
(219, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'FCT', 'https://www.poloniex.com/exchange#btc_'),
(220, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'FLDC', 'https://www.poloniex.com/exchange#btc_'),
(221, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'FLO', 'https://www.poloniex.com/exchange#btc_'),
(222, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'GAME', 'https://www.poloniex.com/exchange#btc_'),
(223, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'GAS', 'https://www.poloniex.com/exchange#btc_'),
(224, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'GNO', 'https://www.poloniex.com/exchange#btc_'),
(225, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'GNT', 'https://www.poloniex.com/exchange#btc_'),
(226, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'GRC', 'https://www.poloniex.com/exchange#btc_'),
(227, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'HUC', 'https://www.poloniex.com/exchange#btc_'),
(228, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'LBC', 'https://www.poloniex.com/exchange#btc_'),
(229, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'LSK', 'https://www.poloniex.com/exchange#btc_'),
(230, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'LTC', 'https://www.poloniex.com/exchange#btc_'),
(231, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'MAID', 'https://www.poloniex.com/exchange#btc_'),
(232, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'NAUT', 'https://www.poloniex.com/exchange#btc_'),
(233, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'NAV', 'https://www.poloniex.com/exchange#btc_'),
(234, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'NEOS', 'https://www.poloniex.com/exchange#btc_'),
(235, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'NMC', 'https://www.poloniex.com/exchange#btc_'),
(236, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'NOTE', 'https://www.poloniex.com/exchange#btc_'),
(237, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'NXC', 'https://www.poloniex.com/exchange#btc_'),
(238, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'NXT', 'https://www.poloniex.com/exchange#btc_'),
(239, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'OMG', 'https://www.poloniex.com/exchange#btc_'),
(240, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'OMNI', 'https://www.poloniex.com/exchange#btc_'),
(241, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'PASC', 'https://www.poloniex.com/exchange#btc_'),
(242, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'PINK', 'https://www.poloniex.com/exchange#btc_'),
(243, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'POT', 'https://www.poloniex.com/exchange#btc_'),
(244, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'PPC', 'https://www.poloniex.com/exchange#btc_'),
(245, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'RADS', 'https://www.poloniex.com/exchange#btc_'),
(246, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'REP', 'https://www.poloniex.com/exchange#btc_'),
(247, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'RIC', 'https://www.poloniex.com/exchange#btc_'),
(248, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SBD', 'https://www.poloniex.com/exchange#btc_'),
(249, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SC', 'https://www.poloniex.com/exchange#btc_'),
(250, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SJCX', 'https://www.poloniex.com/exchange#btc_'),
(251, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'STEEM', 'https://www.poloniex.com/exchange#btc_'),
(252, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'STR', 'https://www.poloniex.com/exchange#btc_'),
(253, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'STRAT', 'https://www.poloniex.com/exchange#btc_'),
(254, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'SYS', 'https://www.poloniex.com/exchange#btc_'),
(255, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'VIA', 'https://www.poloniex.com/exchange#btc_'),
(256, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'VRC', 'https://www.poloniex.com/exchange#btc_'),
(257, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'VTC', 'https://www.poloniex.com/exchange#btc_'),
(258, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XBC', 'https://www.poloniex.com/exchange#btc_'),
(259, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XCP', 'https://www.poloniex.com/exchange#btc_'),
(260, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XEM', 'https://www.poloniex.com/exchange#btc_'),
(261, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XMR', 'https://www.poloniex.com/exchange#btc_'),
(262, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XPM', 'https://www.poloniex.com/exchange#btc_'),
(263, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XRP', 'https://www.poloniex.com/exchange#btc_'),
(264, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'XVC', 'https://www.poloniex.com/exchange#btc_'),
(265, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'ZEC', 'https://www.poloniex.com/exchange#btc_'),
(266, 2, '', 1, 4, '2043-00-01 00:00:00', '127.0.0.1', 0, '0000-00-00 00:00:00', '', 'ZRX', 'https://www.poloniex.com/exchange#btc_');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE IF NOT EXISTS `municipio` (
`id_municipio` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `venta_en` decimal(10,10) NOT NULL,
  `target1` decimal(10,10) NOT NULL,
  `target11` decimal(10,10) NOT NULL,
  `porcentaje1` decimal(3,2) NOT NULL,
  `estado1` int(11) NOT NULL DEFAULT '0',
  `target2` decimal(10,10) NOT NULL,
  `target22` decimal(10,10) NOT NULL,
  `porcentaje2` decimal(3,2) NOT NULL,
  `estado2` int(11) NOT NULL DEFAULT '0',
  `target3` decimal(10,10) NOT NULL,
  `target33` decimal(10,10) NOT NULL,
  `porcentaje3` decimal(3,2) NOT NULL,
  `estado3` int(11) NOT NULL DEFAULT '0',
  `target4` decimal(10,10) NOT NULL,
  `target44` decimal(10,10) NOT NULL,
  `porcentaje4` decimal(3,2) NOT NULL,
  `estado4` int(11) NOT NULL DEFAULT '0',
  `target5` decimal(10,10) NOT NULL,
  `target55` decimal(10,10) NOT NULL,
  `porcentaje5` decimal(3,2) NOT NULL,
  `estado5` int(11) NOT NULL DEFAULT '0',
  `stop_loss` decimal(10,10) NOT NULL,
  `observacion` longtext NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1',
  `id_usuario_sistema_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ip_reg` varchar(20) NOT NULL,
  `id_usuario_sistema_mod` int(11) NOT NULL,
  `fecha_mod` datetime NOT NULL,
  `ip_mod` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
`id_pais` int(11) NOT NULL,
  `pais` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id_pais`, `pais`) VALUES
(1, 'Colombia'),
(2, 'Venezuela');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parroquia`
--

CREATE TABLE IF NOT EXISTS `parroquia` (
`id_parroquia` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_menu`
--

CREATE TABLE IF NOT EXISTS `perfil_menu` (
  `id_perfil_sistema` int(11) NOT NULL,
  `id_menu_sistema` int(11) NOT NULL,
  `crear` int(11) NOT NULL DEFAULT '0',
  `modificar` int(11) NOT NULL DEFAULT '0',
  `consultar` int(11) NOT NULL DEFAULT '0',
  `eliminar` int(11) NOT NULL DEFAULT '0',
  `imprimir` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfil_menu`
--

INSERT INTO `perfil_menu` (`id_perfil_sistema`, `id_menu_sistema`, `crear`, `modificar`, `consultar`, `eliminar`, `imprimir`) VALUES
(1, 1, 0, 0, 0, 0, 0),
(1, 2, 1, 1, 1, 1, 1),
(1, 3, 1, 1, 1, 1, 1),
(1, 5, 1, 1, 1, 1, 1),
(1, 6, 1, 1, 1, 1, 1),
(1, 7, 1, 1, 1, 1, 1),
(1, 10, 1, 1, 1, 1, 1),
(1, 11, 1, 1, 1, 1, 1),
(1, 12, 1, 1, 1, 1, 1),
(1, 13, 1, 1, 1, 1, 1),
(1, 39, 1, 1, 1, 1, 1),
(1, 40, 1, 1, 1, 1, 1),
(1, 41, 1, 1, 1, 1, 1),
(1, 42, 1, 1, 1, 1, 1),
(1, 43, 1, 1, 1, 1, 1),
(1, 44, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_sistema`
--

CREATE TABLE IF NOT EXISTS `perfil_sistema` (
`id_perfil_sistema` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfil_sistema`
--

INSERT INTO `perfil_sistema` (`id_perfil_sistema`, `nombre`, `estatus`) VALUES
(1, 'Administrator', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_operacion`
--

CREATE TABLE IF NOT EXISTS `tipo_operacion` (
`id_tipo_operacion` int(11) NOT NULL,
  `tipo_operacion` varchar(250) NOT NULL,
  `observacion` longtext NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1',
  `id_usuario_sistema_reg` int(11) DEFAULT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  `id_usuario_sistema_mod` int(11) DEFAULT NULL,
  `ip_reg` varchar(20) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `ip_mod` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_operacion`
--

INSERT INTO `tipo_operacion` (`id_tipo_operacion`, `tipo_operacion`, `observacion`, `estatus`, `id_usuario_sistema_reg`, `fecha_reg`, `id_usuario_sistema_mod`, `ip_reg`, `fecha_mod`, `ip_mod`) VALUES
(1, 'Publicada', 'Prueba', 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_sistema`
--

CREATE TABLE IF NOT EXISTS `usuario_sistema` (
`id_usuario_sistema` int(11) NOT NULL,
  `cedula` varchar(15) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `primer_nombre` varchar(20) NOT NULL,
  `segundo_nombre` varchar(20) DEFAULT NULL,
  `primer_apellido` varchar(20) NOT NULL,
  `segundo_apellido` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` varchar(1) NOT NULL,
  `observacion_personal` varchar(200) DEFAULT NULL,
  `contrasena` varchar(200) NOT NULL,
  `fecha_registro` date NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT '1',
  `estatus_contrasena` int(11) NOT NULL DEFAULT '1',
  `id_perfil_sistema` int(11) DEFAULT NULL,
  `direccion_ip` varchar(20) NOT NULL,
  `id_registrador` int(11) NOT NULL,
  `id_sociedad` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_sistema`
--

INSERT INTO `usuario_sistema` (`id_usuario_sistema`, `cedula`, `usuario`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `fecha_nacimiento`, `sexo`, `observacion_personal`, `contrasena`, `fecha_registro`, `estatus`, `estatus_contrasena`, `id_perfil_sistema`, `direccion_ip`, `id_registrador`, `id_sociedad`) VALUES
(4, '2', 'admin', 'Administrator', '', 'Administrator', '', '2014-08-14', 'M', '', 'e10adc3949ba59abbe56e057f20f883e', '2014-08-14', 1, 1, 1, '::1', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
 ADD PRIMARY KEY (`id_estado`), ADD KEY `pais_estado_fk` (`id_pais`);

--
-- Indices de la tabla `estatus`
--
ALTER TABLE `estatus`
 ADD PRIMARY KEY (`id_estatus`);

--
-- Indices de la tabla `estatus_operacion`
--
ALTER TABLE `estatus_operacion`
 ADD PRIMARY KEY (`id_estatus_operacion`);

--
-- Indices de la tabla `exchange`
--
ALTER TABLE `exchange`
 ADD PRIMARY KEY (`id_exchange`);

--
-- Indices de la tabla `menu_sistema`
--
ALTER TABLE `menu_sistema`
 ADD PRIMARY KEY (`id_menu_sistema`);

--
-- Indices de la tabla `moneda`
--
ALTER TABLE `moneda`
 ADD PRIMARY KEY (`id_moneda`), ADD KEY `exchange_moneda_fk` (`id_exchange`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
 ADD PRIMARY KEY (`id_municipio`), ADD KEY `estado_municipio_fk` (`id_estado`);

--
-- Indices de la tabla `operacion`
--
ALTER TABLE `operacion`
 ADD PRIMARY KEY (`id_operacion`), ADD KEY `estatus_operacion_operacion_fk` (`id_estatus_operacion`), ADD KEY `exchange_operacion_fk` (`id_exchange`), ADD KEY `moneda_operacion_fk` (`id_moneda`), ADD KEY `tipo_operacion_operacion_fk` (`id_tipo_operacion`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
 ADD PRIMARY KEY (`id_pais`);

--
-- Indices de la tabla `parroquia`
--
ALTER TABLE `parroquia`
 ADD PRIMARY KEY (`id_parroquia`), ADD KEY `municipio_parroquia_fk` (`id_municipio`);

--
-- Indices de la tabla `perfil_menu`
--
ALTER TABLE `perfil_menu`
 ADD PRIMARY KEY (`id_perfil_sistema`,`id_menu_sistema`), ADD KEY `perfil_menu_id_menu_sistema_fkey` (`id_menu_sistema`);

--
-- Indices de la tabla `perfil_sistema`
--
ALTER TABLE `perfil_sistema`
 ADD PRIMARY KEY (`id_perfil_sistema`);

--
-- Indices de la tabla `tipo_operacion`
--
ALTER TABLE `tipo_operacion`
 ADD PRIMARY KEY (`id_tipo_operacion`);

--
-- Indices de la tabla `usuario_sistema`
--
ALTER TABLE `usuario_sistema`
 ADD PRIMARY KEY (`id_usuario_sistema`), ADD UNIQUE KEY `usuario_sistema_cedula_ukey` (`cedula`) USING BTREE, ADD UNIQUE KEY `usuario_sistema_usuario_ukey` (`usuario`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estatus`
--
ALTER TABLE `estatus`
MODIFY `id_estatus` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `estatus_operacion`
--
ALTER TABLE `estatus_operacion`
MODIFY `id_estatus_operacion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `exchange`
--
ALTER TABLE `exchange`
MODIFY `id_exchange` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `menu_sistema`
--
ALTER TABLE `menu_sistema`
MODIFY `id_menu_sistema` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT de la tabla `moneda`
--
ALTER TABLE `moneda`
MODIFY `id_moneda` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=267;
--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `operacion`
--
ALTER TABLE `operacion`
MODIFY `id_operacion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
MODIFY `id_pais` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `parroquia`
--
ALTER TABLE `parroquia`
MODIFY `id_parroquia` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `perfil_sistema`
--
ALTER TABLE `perfil_sistema`
MODIFY `id_perfil_sistema` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipo_operacion`
--
ALTER TABLE `tipo_operacion`
MODIFY `id_tipo_operacion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `usuario_sistema`
--
ALTER TABLE `usuario_sistema`
MODIFY `id_usuario_sistema` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estado`
--
ALTER TABLE `estado`
ADD CONSTRAINT `pais_estado_fk` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `moneda`
--
ALTER TABLE `moneda`
ADD CONSTRAINT `exchange_moneda_fk` FOREIGN KEY (`id_exchange`) REFERENCES `exchange` (`id_exchange`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
ADD CONSTRAINT `estado_municipio_fk` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `operacion`
--
ALTER TABLE `operacion`
ADD CONSTRAINT `estatus_operacion_operacion_fk` FOREIGN KEY (`id_estatus_operacion`) REFERENCES `estatus_operacion` (`id_estatus_operacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `exchange_operacion_fk` FOREIGN KEY (`id_exchange`) REFERENCES `exchange` (`id_exchange`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `moneda_operacion_fk` FOREIGN KEY (`id_moneda`) REFERENCES `moneda` (`id_moneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `tipo_operacion_operacion_fk` FOREIGN KEY (`id_tipo_operacion`) REFERENCES `tipo_operacion` (`id_tipo_operacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `parroquia`
--
ALTER TABLE `parroquia`
ADD CONSTRAINT `municipio_parroquia_fk` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id_municipio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `perfil_menu`
--
ALTER TABLE `perfil_menu`
ADD CONSTRAINT `perfil_menu_id_menu_sistema_fkey` FOREIGN KEY (`id_menu_sistema`) REFERENCES `menu_sistema` (`id_menu_sistema`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `perfil_menu_id_perfil_sistema_fkey` FOREIGN KEY (`id_perfil_sistema`) REFERENCES `perfil_sistema` (`id_perfil_sistema`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
