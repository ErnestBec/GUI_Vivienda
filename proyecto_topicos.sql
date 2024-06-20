-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 20, 2024 at 01:46 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyecto_topicos`
--

-- --------------------------------------------------------

--
-- Table structure for table `Empleado`
--

CREATE TABLE `Empleado` (
  `EmpleadoID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `ViviendaID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Oficio`
--

CREATE TABLE `Oficio` (
  `OficioID` int(11) NOT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Oficio_Empleado`
--

CREATE TABLE `Oficio_Empleado` (
  `OficioEmpleadoID` int(11) NOT NULL,
  `EmpleadoID` int(11) DEFAULT NULL,
  `OficioID` int(11) DEFAULT NULL,
  `FechaAsignacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Vivienda`
--

CREATE TABLE `Vivienda` (
  `ViviendaID` int(11) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Ciudad` varchar(100) NOT NULL,
  `Estado` varchar(100) NOT NULL,
  `CodigoPostal` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Empleado`
--
ALTER TABLE `Empleado`
  ADD PRIMARY KEY (`EmpleadoID`),
  ADD KEY `ViviendaID` (`ViviendaID`);

--
-- Indexes for table `Oficio`
--
ALTER TABLE `Oficio`
  ADD PRIMARY KEY (`OficioID`);

--
-- Indexes for table `Oficio_Empleado`
--
ALTER TABLE `Oficio_Empleado`
  ADD PRIMARY KEY (`OficioEmpleadoID`),
  ADD KEY `EmpleadoID` (`EmpleadoID`),
  ADD KEY `OficioID` (`OficioID`);

--
-- Indexes for table `Vivienda`
--
ALTER TABLE `Vivienda`
  ADD PRIMARY KEY (`ViviendaID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Empleado`
--
ALTER TABLE `Empleado`
  ADD CONSTRAINT `Empleado_ibfk_1` FOREIGN KEY (`ViviendaID`) REFERENCES `Vivienda` (`ViviendaID`);

--
-- Constraints for table `Oficio_Empleado`
--
ALTER TABLE `Oficio_Empleado`
  ADD CONSTRAINT `Oficio_Empleado_ibfk_1` FOREIGN KEY (`EmpleadoID`) REFERENCES `Empleado` (`EmpleadoID`),
  ADD CONSTRAINT `Oficio_Empleado_ibfk_2` FOREIGN KEY (`OficioID`) REFERENCES `Oficio` (`OficioID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
