-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: dbChatbot-mysql.services.clever-cloud.com:3306
-- Generation Time: Jul 22, 2022 at 02:54 AM
-- Server version: 8.0.22-13
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbChatbot`
--
DROP DATABASE IF EXISTS `dbChatbot`;
CREATE DATABASE IF NOT EXISTS `dbChatbot` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dbChatbot`;

-- --------------------------------------------------------

--
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
CREATE TABLE IF NOT EXISTS `citas` (
  `dni` int NOT NULL,
  `fecha` timestamp NOT NULL,
  `errorId` int NOT NULL,
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `error`
--

DROP TABLE IF EXISTS `error`;
CREATE TABLE IF NOT EXISTS `error` (
  `option_key` varchar(500) DEFAULT NULL,
  `descError` varchar(500) DEFAULT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `error`
--

INSERT INTO `error` (`option_key`, `descError`, `id`) VALUES
('STEP_1', 'No logro entenderte, espero que tambien me estes saludando', 1),
('STEP_2', 'Lo sentimos, al parecer el documento ingresado no es correcto o no se encuentra registrado. Inténtelo de nuevo', 2),
('STEP_4', 'Se agendará una cita para que un técnico se acerque a su domicilio', 3);

-- --------------------------------------------------------

--
-- Table structure for table `initial`
--

DROP TABLE IF EXISTS `initial`;
CREATE TABLE IF NOT EXISTS `initial` (
  `option_key` varchar(500) DEFAULT NULL,
  `keywords` varchar(45) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `initial`
--

INSERT INTO `initial` (`option_key`, `keywords`, `id`) VALUES
('STEP_1', 'Hola,hola,ola,inicio,buenas', 2),
('STEP_2', 'cursos,info,curso', 3),
('STEP_2_1', 'angular', 4),
('STEP_2_2', 'node', 5),
('STEP_2_3', 'ngrx', 6),
('STEP_2_4', 'aws', 7),
('STEP_3', 'asesor', 8),
('STEP_4', 'muchas gracias,gracias,vale gracias', 9);

-- --------------------------------------------------------

--
-- Table structure for table `optionDesc`
--

DROP TABLE IF EXISTS `optionDesc`;
CREATE TABLE IF NOT EXISTS `optionDesc` (
  `desc` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id` int NOT NULL,
  `parent` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `optionDesc`
--

INSERT INTO `optionDesc` (`desc`, `id`, `parent`) VALUES
('1. Problema con Internet Hogar', 1, NULL),
('2. Problema con Internet móvil', 2, NULL),
('3. Otro problema', 3, NULL),
('A. Problema con señal Wi-fi', 4, 1),
('B. No hay conexión a internet', 5, 1),
('C. Problemas con el router', 6, 1),
('A. Sin señal', 7, 2),
('B. Sin megas', 8, 2),
('C. Cambiar de plan', 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `response`
--

DROP TABLE IF EXISTS `response`;
CREATE TABLE IF NOT EXISTS `response` (
  `id` int NOT NULL AUTO_INCREMENT,
  `option_key` varchar(45) DEFAULT NULL,
  `replyMessage` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `trigger` varchar(45) DEFAULT NULL,
  `media` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `response`
--

INSERT INTO `response` (`id`, `option_key`, `replyMessage`, `trigger`, `media`) VALUES
(1, 'STEP_1', 'Soy el bot que te ayudará en lo que necesites.', NULL, NULL),
(2, 'STEP_2', 'Por favor ingrese su documento de identidad antes de realizar cualquier consulta.', NULL, 'https://s2.q4cdn.com/175719177/files/doc_presentations/Placeholder-PDF.pdf'),
(3, 'STEP_4', 'Es bueno saberlo. Gracias por comunicarse con nosotros', NULL, NULL),
(4, 'STEP_5', 'Para resolver el problema. Siga los pasos de la siguiente página', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resultados`
--

DROP TABLE IF EXISTS `resultados`;
CREATE TABLE IF NOT EXISTS `resultados` (
  `DNI` int NOT NULL,
  `Apellidos_Nombres` varchar(45) NOT NULL,
  `Atencion` varchar(45) NOT NULL,
  `A_Tiempo` varchar(45) NOT NULL,
  `N_Satisfaccion` int NOT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resultados`
--

INSERT INTO `resultados` (`DNI`, `Apellidos_Nombres`, `Atencion`, `A_Tiempo`, `N_Satisfaccion`) VALUES
(7397179, 'Arias Flores Janeth Silvia', 'Sí', 'Sí', 8),
(7451231, 'Hurtado Aro Magdiel Ana', 'Sí', 'Sí', 5),
(8500134, 'Montenegro Baños Juan Antonio', 'Sí', 'Sí', 9),
(62449823, 'Diaz Huerta Pedro Juan', 'Sí', 'No', 8),
(64509912, 'Herrera Cruz Maria Nicol', 'Sí', 'Sí', 6),
(70763457, 'Martinez Maldonado Erick Matias', 'Sí', 'Sí', 10),
(71250558, 'Aquino Papaffava Jeremy Lian', 'Sí', 'Sí', 9),
(72266082, 'Montenegro Arias Tomas Antonio', 'Sí', 'Sí', 8),
(72266090, 'Montenegro Arias Juan Sebastian', 'Sí', 'Sí', 9),
(84405671, 'Solis Castro Renato Eduardo', 'Sí', 'Sí', 8);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `DNI` int NOT NULL,
  `Apellidos_Nombres` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Edad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`DNI`, `Apellidos_Nombres`, `Edad`) VALUES
(7397179, 'Arias Flores Janeth Silvia', 60),
(7451231, 'Hurtado Aro Magdiel Ana', 58),
(8500134, 'Montenegro Baños Juan Antonio', 62),
(62449823, 'Diaz Huerta Pedro Juan', 32),
(64509912, 'Herrera Cruz Maria Nicol', 30),
(70763457, 'Martinez Maldonado Erick Matias', 26),
(71250558, 'Aquino Papaffava Jeremy Lian', 24),
(72266082, 'Montenegro Arias Tomas Antonio', 25),
(72266090, 'Montenegro Arias Juan Sebastian', 24),
(84405671, 'Solis Castro Renato Eduardo', 22);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
