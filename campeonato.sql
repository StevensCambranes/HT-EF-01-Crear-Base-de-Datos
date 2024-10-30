-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2024 a las 21:07:31
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `campeonato`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campeonato`
--

CREATE TABLE `campeonato` (
  `codTrofeo` int(11) NOT NULL,
  `nombreTrofeo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clubes`
--

CREATE TABLE `clubes` (
  `codClub` int(11) NOT NULL,
  `club` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `poblacion` int(11) DEFAULT NULL,
  `provincia` varchar(50) DEFAULT NULL,
  `codPostal` int(11) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `colores` varchar(50) DEFAULT NULL,
  `himno` varchar(250) DEFAULT NULL,
  `fax` varchar(200) DEFAULT NULL,
  `anioFundacion` date DEFAULT NULL,
  `presupuesto` int(11) DEFAULT NULL,
  `presidente` varchar(20) DEFAULT NULL,
  `vicepresidente` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `club_jug`
--

CREATE TABLE `club_jug` (
  `codClubJug` int(11) NOT NULL,
  `codClub` int(11) NOT NULL,
  `codJugador` int(11) NOT NULL,
  `liga` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `demarcacion`
--

CREATE TABLE `demarcacion` (
  `codDem` int(11) NOT NULL,
  `demarcacion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenadores`
--

CREATE TABLE `entrenadores` (
  `codEntren` int(11) NOT NULL,
  `entrenador` varchar(50) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `poblacion` int(11) DEFAULT NULL,
  `provincia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entren_clubes`
--

CREATE TABLE `entren_clubes` (
  `codEntrenClub` int(11) NOT NULL,
  `codClub` int(11) NOT NULL,
  `codEntren` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipacion`
--

CREATE TABLE `equipacion` (
  `codEquip` int(11) NOT NULL,
  `encasa` varchar(50) DEFAULT NULL,
  `codClub` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `esponsor`
--

CREATE TABLE `esponsor` (
  `codSponsor` int(11) NOT NULL,
  `sponsor` varchar(50) DEFAULT NULL,
  `codClub` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadios`
--

CREATE TABLE `estadios` (
  `codEstadio` int(11) NOT NULL,
  `estadio` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `codPostal` varchar(50) DEFAULT NULL,
  `poblacion` int(11) DEFAULT NULL,
  `provincia` varchar(50) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `inaugaracion` date DEFAULT NULL,
  `dimensiones` decimal(10,2) DEFAULT NULL,
  `codClub` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `codJugador` int(11) NOT NULL,
  `club` varchar(50) DEFAULT NULL,
  `jugador` varchar(50) DEFAULT NULL,
  `dorsal` int(11) DEFAULT NULL,
  `codPais` int(11) NOT NULL,
  `codDem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `codPais` int(11) NOT NULL,
  `nombrePais` varchar(50) DEFAULT NULL,
  `comunitario` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `palmares`
--

CREATE TABLE `palmares` (
  `codPalmares` int(11) NOT NULL,
  `anio` date DEFAULT NULL,
  `codClub` int(11) NOT NULL,
  `codTrofeo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE `socios` (
  `codSocios` int(11) NOT NULL,
  `codClub` int(11) NOT NULL,
  `codPostal` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `provincia` varchar(50) DEFAULT NULL,
  `fechaAlta` date DEFAULT NULL,
  `cuotaActual` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `campeonato`
--
ALTER TABLE `campeonato`
  ADD PRIMARY KEY (`codTrofeo`);

--
-- Indices de la tabla `clubes`
--
ALTER TABLE `clubes`
  ADD PRIMARY KEY (`codClub`);

--
-- Indices de la tabla `club_jug`
--
ALTER TABLE `club_jug`
  ADD PRIMARY KEY (`codClubJug`),
  ADD KEY `FK_codClubJugador` (`codClub`),
  ADD KEY `FK_codJugador` (`codJugador`);

--
-- Indices de la tabla `demarcacion`
--
ALTER TABLE `demarcacion`
  ADD PRIMARY KEY (`codDem`);

--
-- Indices de la tabla `entrenadores`
--
ALTER TABLE `entrenadores`
  ADD PRIMARY KEY (`codEntren`);

--
-- Indices de la tabla `entren_clubes`
--
ALTER TABLE `entren_clubes`
  ADD PRIMARY KEY (`codEntrenClub`),
  ADD KEY `FK_codClubEntren` (`codClub`),
  ADD KEY `FK_codEntren` (`codEntren`);

--
-- Indices de la tabla `equipacion`
--
ALTER TABLE `equipacion`
  ADD PRIMARY KEY (`codEquip`),
  ADD KEY `FK_codClubEquip` (`codClub`);

--
-- Indices de la tabla `esponsor`
--
ALTER TABLE `esponsor`
  ADD PRIMARY KEY (`codSponsor`),
  ADD KEY `FK_codClubSponsor` (`codClub`);

--
-- Indices de la tabla `estadios`
--
ALTER TABLE `estadios`
  ADD PRIMARY KEY (`codEstadio`),
  ADD KEY `FK_codClub` (`codClub`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`codJugador`),
  ADD KEY `FK_codPais` (`codPais`),
  ADD KEY `FK_codDem` (`codDem`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`codPais`);

--
-- Indices de la tabla `palmares`
--
ALTER TABLE `palmares`
  ADD PRIMARY KEY (`codPalmares`),
  ADD KEY `FK_codClubPalmares` (`codClub`),
  ADD KEY `FK_codTrofeo` (`codTrofeo`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`codSocios`),
  ADD KEY `FK_codClubSocios` (`codClub`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `campeonato`
--
ALTER TABLE `campeonato`
  MODIFY `codTrofeo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clubes`
--
ALTER TABLE `clubes`
  MODIFY `codClub` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `club_jug`
--
ALTER TABLE `club_jug`
  MODIFY `codClubJug` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `demarcacion`
--
ALTER TABLE `demarcacion`
  MODIFY `codDem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entrenadores`
--
ALTER TABLE `entrenadores`
  MODIFY `codEntren` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entren_clubes`
--
ALTER TABLE `entren_clubes`
  MODIFY `codEntrenClub` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `equipacion`
--
ALTER TABLE `equipacion`
  MODIFY `codEquip` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `esponsor`
--
ALTER TABLE `esponsor`
  MODIFY `codSponsor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estadios`
--
ALTER TABLE `estadios`
  MODIFY `codEstadio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `codJugador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `codPais` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `palmares`
--
ALTER TABLE `palmares`
  MODIFY `codPalmares` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `socios`
--
ALTER TABLE `socios`
  MODIFY `codSocios` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `club_jug`
--
ALTER TABLE `club_jug`
  ADD CONSTRAINT `FK_codClubJugador` FOREIGN KEY (`codClub`) REFERENCES `clubes` (`codClub`),
  ADD CONSTRAINT `FK_codJugador` FOREIGN KEY (`codJugador`) REFERENCES `jugadores` (`codJugador`);

--
-- Filtros para la tabla `entren_clubes`
--
ALTER TABLE `entren_clubes`
  ADD CONSTRAINT `FK_codClubEntren` FOREIGN KEY (`codClub`) REFERENCES `clubes` (`codClub`),
  ADD CONSTRAINT `FK_codEntren` FOREIGN KEY (`codEntren`) REFERENCES `entrenadores` (`codEntren`);

--
-- Filtros para la tabla `equipacion`
--
ALTER TABLE `equipacion`
  ADD CONSTRAINT `FK_codClubEquip` FOREIGN KEY (`codClub`) REFERENCES `clubes` (`codClub`);

--
-- Filtros para la tabla `esponsor`
--
ALTER TABLE `esponsor`
  ADD CONSTRAINT `FK_codClubSponsor` FOREIGN KEY (`codClub`) REFERENCES `clubes` (`codClub`);

--
-- Filtros para la tabla `estadios`
--
ALTER TABLE `estadios`
  ADD CONSTRAINT `FK_codClub` FOREIGN KEY (`codClub`) REFERENCES `clubes` (`codClub`);

--
-- Filtros para la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `FK_codDem` FOREIGN KEY (`codDem`) REFERENCES `demarcacion` (`codDem`),
  ADD CONSTRAINT `FK_codPais` FOREIGN KEY (`codPais`) REFERENCES `paises` (`codPais`);

--
-- Filtros para la tabla `palmares`
--
ALTER TABLE `palmares`
  ADD CONSTRAINT `FK_codClubPalmares` FOREIGN KEY (`codClub`) REFERENCES `clubes` (`codClub`),
  ADD CONSTRAINT `FK_codTrofeo` FOREIGN KEY (`codTrofeo`) REFERENCES `campeonato` (`codTrofeo`);

--
-- Filtros para la tabla `socios`
--
ALTER TABLE `socios`
  ADD CONSTRAINT `FK_codClubSocios` FOREIGN KEY (`codClub`) REFERENCES `clubes` (`codClub`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
