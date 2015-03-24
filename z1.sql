-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-03-2015 a las 03:25:42
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `z1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `usuario_idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idCliente`,`usuario_idUsuario`),
  KEY `fk_cliente_usuario1_idx` (`usuario_idUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombre`, `email`, `usuario_idUsuario`) VALUES
(3, 'nombre3', 'email3@gmail.com', 3),
(4, 'nombre4', 'email4@gmail.com', 4),
(5, 'nombre5', 'email5@gmail.com', 5),
(6, 'nombre6', 'email6@gmail.com', 6),
(7, 'nombre7', 'email7@gmail.com', 7),
(8, 'nombre8', 'email8@gmail.com', 8),
(9, 'nombre9', 'email9@gmail.com', 9),
(10, 'nombre10', 'email10@gmail.com', 10),
(11, 'nombre11', 'email11@gmail.com', 11),
(12, 'nombre12', 'email12@gmail.com', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email`
--

CREATE TABLE IF NOT EXISTS `email` (
  `idemail` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `usuario_idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idemail`,`usuario_idUsuario`),
  KEY `fk_email_usuario1_idx` (`usuario_idUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `email`
--

INSERT INTO `email` (`idemail`, `email`, `usuario_idUsuario`) VALUES
(3, 'francisco@gmail.com', 3),
(4, 'francisco@gmail.com', 3),
(5, 'francisco@hotmail.com', 3),
(6, 'francisco@hotmail.com', 3),
(7, 'matias@hotmail.com', 4),
(8, 'matias2@hotmail.com', 4),
(9, 'matias3@hotmail.com', 4),
(10, 'matias4@hotmail.com', 4),
(11, 'usuario31@hotmail.com', 5),
(12, 'usuario32@hotmail.com', 5),
(13, 'usuario33@hotmail.com', 5),
(14, 'usuario34@hotmail.com', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guestbook`
--

CREATE TABLE IF NOT EXISTS `guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT 'noemail@test.com',
  `comment` text CHARACTER SET latin1,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Volcado de datos para la tabla `guestbook`
--

INSERT INTO `guestbook` (`id`, `email`, `comment`, `created`) VALUES
(11, 'franciscorenef@gmail.com', NULL, '2015-03-24 01:25:33'),
(12, 'franciscorenef@gmail.com', NULL, '2015-03-24 01:26:09'),
(13, 'franciscorenef@gmail.com', 'comentario 13', '2015-03-24 01:26:51'),
(14, 'franciscorenef@gmail.com', 'comentario 14', '2015-03-24 02:37:44'),
(15, 'franciscorenef@gmail.com', 'comentario 15', '2015-03-24 02:39:37'),
(16, 'franciscorenef@gmail.com', 'comentario 16', '2015-03-24 02:40:43'),
(17, 'franciscorenef@gmail.com', 'comentario 17', '2015-03-24 02:44:17'),
(18, 'franciscorenef@gmail.com', 'comentario 18', '2015-03-24 02:49:50'),
(19, 'franciscorenef@gmail.com', 'comentario 1', '2015-03-24 02:52:44'),
(20, 'franciscorenef@gmail.com', 'comentario 20', '2015-03-24 03:00:21'),
(21, 'franciscorenef@gmail.com', 'comentario 21', '2015-03-24 03:18:45'),
(22, 'franciscorenef@gmail.com', 'comentario 22', '2015-03-24 03:19:47'),
(23, 'franciscorenef@gmail.com', 'comentario 23', '2015-03-24 03:21:39'),
(24, 'franciscorenef@gmail.com', 'comentario 24', '2015-03-24 03:25:05'),
(25, 'franciscorenef@gmail.com', 'comentario 25', '2015-03-24 03:47:52'),
(26, 'franciscorenef@gmail.com', 'comentario 26', '2015-03-24 03:49:23'),
(27, 'franciscorenef@gmail.com', 'COMENTARIO 27', '2015-03-24 03:50:34'),
(28, 'franciscorenef@gmail.com', 'COMENTARIO 27', '2015-03-24 03:54:28'),
(29, 'franciscorenef@gmail.com', 'COMENTARIO 28', '2015-03-24 03:55:13'),
(30, 'franciscorenef@gmail.com', 'COMENTARIO 30', '2015-03-24 03:56:21'),
(31, 'franciscorenef@gmail.com', 'comentaripo 31', '2015-03-24 03:58:04'),
(32, 'dfghfhfghgf@fgdf.cl', 'comentario 32', '2015-03-24 03:59:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guestbook_has_cliente`
--

CREATE TABLE IF NOT EXISTS `guestbook_has_cliente` (
  `guestbook_id` int(11) NOT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`guestbook_id`,`Cliente_idCliente`),
  KEY `fk_guestbook_has_Cliente_Cliente1_idx` (`Cliente_idCliente`),
  KEY `fk_guestbook_has_Cliente_guestbook1_idx` (`guestbook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `guestbook_has_cliente`
--

INSERT INTO `guestbook_has_cliente` (`guestbook_id`, `Cliente_idCliente`) VALUES
(11, 3),
(31, 3),
(32, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `like`
--

CREATE TABLE IF NOT EXISTS `like` (
  `idLike` int(11) NOT NULL AUTO_INCREMENT,
  `guestbook_id` int(11) NOT NULL,
  `cliente_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idLike`),
  KEY `fk_Like_guestbook1_idx` (`guestbook_id`),
  KEY `fk_Like_cliente1_idx` (`cliente_idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `password_salt` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `username`, `password`, `password_salt`) VALUES
(3, 'panshot', '954133sk8', NULL),
(4, 'mat', '123456', NULL),
(5, 'usuario3', '123456', ''),
(6, 'usuario4', '123456', ''),
(7, 'usuario5', '123456', ''),
(8, 'usuario6', '123456', ''),
(9, 'usuario7', '123456', ''),
(10, 'usuario8', '123456', ''),
(11, 'usuario9', '123456', ''),
(12, 'usuario10', '123456', ''),
(14, 'usuario10', '123456', NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `email`
--
ALTER TABLE `email`
  ADD CONSTRAINT `fk_email_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `guestbook_has_cliente`
--
ALTER TABLE `guestbook_has_cliente`
  ADD CONSTRAINT `fk_guestbook_has_Cliente_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_guestbook_has_Cliente_guestbook1` FOREIGN KEY (`guestbook_id`) REFERENCES `guestbook` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `like`
--
ALTER TABLE `like`
  ADD CONSTRAINT `fk_Like_cliente1` FOREIGN KEY (`cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Like_guestbook1` FOREIGN KEY (`guestbook_id`) REFERENCES `guestbook` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
