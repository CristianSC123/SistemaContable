-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-04-2025 a las 20:44:24
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_contable`
--

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cbg`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cbg` (
`cod1` varchar(255)
,`NombreCuenta` varchar(255)
,`SumaDeSaldoEF` double
,`Nivel` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cbss`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cbss` (
`codcta` varchar(255)
,`NombreCuenta` varchar(255)
,`SumaDeDebeML` double
,`SumaDeHaberML` double
,`saldod` double
,`saldoh` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cbss1`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cbss1` (
`codcta` varchar(255)
,`nombrecuenta` varchar(255)
,`SumaDeDebeML` double
,`SumaDeHaberML` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cdiario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cdiario` (
`idcomprobante` int(11)
,`fecha` date
,`codtipocomprobante` varchar(255)
,`nocomprobante` int(11)
,`tc` double
,`senior` varchar(255)
,`glosag` varchar(255)
,`codcta` varchar(255)
,`nombrecuenta` varchar(255)
,`glosad` varchar(255)
,`debeml` double
,`haberml` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ceeff0`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ceeff0` (
`codcta` varchar(255)
,`NombreCuenta` varchar(255)
,`SumaDeDebeML` double
,`SumaDeHaberML` double
,`SaldoEF` double
,`cod1` decimal(20,0)
,`cod2` decimal(20,0)
,`cod3` decimal(20,0)
,`cod4` decimal(20,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ceeff1`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ceeff1` (
`cod1` decimal(20,0)
,`SumaDeSaldoEF` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ceeff2`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ceeff2` (
`cod2` decimal(20,0)
,`SumaDeSaldoEF` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ceeff3`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ceeff3` (
`cod3` decimal(20,0)
,`SumaDeSaldoEF` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ceeff4`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ceeff4` (
`cod4` decimal(20,0)
,`SumaDeSaldoEF` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ceeff5`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ceeff5` (
`codcta` varchar(255)
,`SumaDeSaldoEF` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ceeffg`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ceeffg` (
`cod1` varchar(255)
,`SumaDeSaldoEF` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cer`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cer` (
`cod1` varchar(255)
,`NombreCuenta` varchar(255)
,`SumaDeSaldoEF` double
,`Nivel` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cmayores`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cmayores` (
`codcta` varchar(255)
,`nombrecuenta` varchar(255)
,`fecha` date
,`idcomprobante` int(11)
,`codTipoComprobante` varchar(255)
,`NoComprobante` int(11)
,`TC` double
,`GlosaD` varchar(255)
,`DebeML` double
,`HaberML` double
,`saldo` varchar(1)
,`SaldoML` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cresultado`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cresultado` (
`Resultado` double
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcomprobantes`
--

CREATE TABLE `tcomprobantes` (
  `idcomprobante` int(11) NOT NULL,
  `codtipocomprobante` varchar(255) NOT NULL,
  `nocomprobante` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tc` double NOT NULL,
  `senior` varchar(255) NOT NULL,
  `glosag` varchar(255) NOT NULL,
  `estadoasiento` varchar(255) NOT NULL,
  `ruta` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tcomprobantes`
--

INSERT INTO `tcomprobantes` (`idcomprobante`, `codtipocomprobante`, `nocomprobante`, `fecha`, `tc`, `senior`, `glosag`, `estadoasiento`, `ruta`) VALUES
(15, 'Traspaso', 1, '2024-01-01', 7, 'Cristian Santa Cruz Laura', 'La empresa empieza con un aporte del socio A en efectivo de Bs10000, muebles por Bs 12000 y maquinas por Bs 8000; el socio B aporta Bs 15000 en efectivo.', 'MOVIMIENTO', ''),
(16, 'Egreso', 2, '2024-01-05', 7, 'Cristian Santa Cruz Laura', 'Se inician tramites en SEPREC por Bs700; 455 nos entregan factura y Bs 245 son el pago al tramitador sin factura.', 'MOVIMIENTO', ''),
(17, 'Egreso', 3, '2024-01-10', 7, 'Cristian Santa Cruz Laura', 'Se adquieren 200 muebles para la venta por Bs 100 cada uno; Bs 18000 se pagan en efectivo y el resto a crédito.', 'MOVIMIENTO', ''),
(18, 'Ingreso', 4, '2024-01-15', 7, 'Cristian Santa Cruz Laura', 'Se venden 100 unidades en efectivo por Bs 150 cada uno.', 'MOVIMIENTO', ''),
(19, 'Traspaso', 5, '2024-01-20', 7, 'Cristian Santa Cruz Laura', 'Se venden 50 unidades en crédito a Bs160 cada uno.', 'MOVIMIENTO', ''),
(20, 'Traspaso', 6, '2024-01-30', 7, 'Cristian Santa Cruz Laura', 'Nos llega la factura por electricidad por Bs 420, Bs agua por Bs 80, alquiler por Bs 2500.', 'MOVIMIENTO', ''),
(21, 'Traspaso', 6, '2024-01-31', 7, 'Cristian Santa Cruz Laura', 'Calcule el costo de ventas y depreciación.', 'MOVIMIENTO', ''),
(22, 'Egreso', 7, '2024-02-10', 7, 'Cristian Santa Cruz Laura', 'Se adquiere 100 muebles para la venta por Bs 100 cada uno; 50% al contado y 50% al crédito.', 'MOVIMIENTO', ''),
(24, 'Egreso', 8, '2024-02-15', 7, 'Cristian Santa Cruz Laura', 'Se pagan impuestos del mes.', 'MOVIMIENTO', ''),
(25, 'Ingreso', 9, '2024-02-20', 7, 'Cristian Santa Cruz Laura', 'Se venden 100 muebles por Bs 150 cada uno en efectivo.', 'MOVIMIENTO', ''),
(26, 'Ingreso', 10, '2024-02-25', 7, 'Cristian Santa Cruz Laura', 'El socio B presta Bs 20,000 a la empresa a un 15% anual.', 'MOVIMIENTO', ''),
(27, 'Traspaso', 11, '2024-02-28', 7, 'Cristian Santa Cruz Laura', 'Calcule el costo de ventas y depreciación.', 'MOVIMIENTO', ''),
(28, 'Egreso', 12, '2024-02-28', 7, 'Cristian Santa Cruz Laura', 'Se pagan las deudas pendientes de enero.', 'MOVIMIENTO', ''),
(29, 'Traspaso', 13, '2024-02-28', 7, 'Cristian Santa Cruz Laura', 'Nos llega la factura de luz por Bs 500, agua por Bs100 y alquiler por Bs2500.', 'MOVIMIENTO', ''),
(30, 'Egreso', 14, '2024-03-10', 7, 'Cristian Santa Cruz Laura', 'Se adquieren 120 unidades para la venta por Bs 100 cada una en efectivo.', 'MOVIMIENTO', ''),
(31, 'Egreso', 15, '2024-03-15', 7, 'Cristian Santa Cruz Laura', 'Se paga IVA e IT en efectivo.', 'MOVIMIENTO', ''),
(32, 'Egreso', 16, '2024-03-20', 7, 'Cristian Santa Cruz Laura', 'Se pagan las deudas pendientes de febrero.', 'MOVIMIENTO', ''),
(33, 'Ingreso', 17, '2024-03-25', 7, 'Cristian Santa Cruz Laura', 'Se venden 110 unidades por Bs 180 cada una en efectivo.', 'MOVIMIENTO', ''),
(34, 'Traspaso', 18, '2024-03-30', 7, 'Cristian Santa Cruz Laura', 'Calcule el costo de ventas y depreciación.', 'MOVIMIENTO', ''),
(35, 'Egreso', 20, '2024-03-30', 7, 'Cristian Santa Cruz Laura', 'Se devuelve Bs 15000 del préstamo recibido e intereses. ', 'MOVIMIENTO', ''),
(41, 'Traspaso', 27, '2024-06-20', 7, 'Cristian Santa Cruz', 'Ejemplo final', 'movimiento', 'respaldo/27/6673fd4eddc268.12846267.jpeg,respaldo/27/6673fd4ede0b03.74833369.jpg,respaldo/27/6673fd4ede4737.38038927.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcomprobantes_`
--

CREATE TABLE `tcomprobantes_` (
  `idcomprobante_` int(11) NOT NULL,
  `codcomprobante` int(11) NOT NULL,
  `codcta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `glosad` varchar(255) NOT NULL,
  `debeml` double NOT NULL,
  `haberml` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tcomprobantes_`
--

INSERT INTO `tcomprobantes_` (`idcomprobante_`, `codcomprobante`, `codcta`, `glosad`, `debeml`, `haberml`) VALUES
(30, 15, '11101003', 'Ejemplo', 25000, 0),
(31, 15, '12202001', 'Ejemplo', 12000, 0),
(32, 15, '12207001', 'Ejemplo', 8000, 0),
(33, 15, '31101001', 'Ejemplo', 0, 30000),
(34, 15, '31101002', 'Ejemplo', 0, 15000),
(35, 16, '52203003', 'a', 395.85, 0),
(36, 16, '11301001', 'a', 59.15, 0),
(37, 16, '52203003', 'a', 291.69, 0),
(38, 16, '21203001', 'a', 0, 37.92),
(39, 16, '21203002', 'a', 0, 8.75),
(40, 16, '11101003', 'a', 0, 245),
(41, 16, '21101001', 'a', 0, 455),
(42, 17, '11401001', 'a', 21739.13, 0),
(43, 17, '21203002', 'a', 0, 652.17),
(44, 17, '21203003', 'a', 0, 1086.96),
(45, 17, '11101003', 'a', 0, 18000),
(46, 17, '21101001', 'a', 0, 2000),
(47, 18, '41101001', '', 0, 13050),
(48, 18, '11101003', '', 15000, 0),
(49, 18, '21201001', '', 0, 1950),
(50, 18, '51302001', '', 450, 0),
(51, 18, '21202001', '', 0, 450),
(52, 19, '11201001', '', 8000, 0),
(53, 19, '41101001', '', 0, 6960),
(54, 19, '21201001', '', 0, 1040),
(55, 19, '51302001', '', 240, 0),
(56, 19, '21202001', '', 0, 240),
(57, 20, '51202002', '', 365.4, 0),
(58, 20, '11301001', '', 54.6, 0),
(59, 20, '21101002', '', 0, 420),
(60, 20, '51202002', '', 69.6, 0),
(61, 20, '11301001', '', 10.4, 0),
(62, 20, '21101002', '', 0, 80),
(63, 20, '52203002', '', 2175, 0),
(64, 20, '11301001', '', 325, 0),
(65, 20, '22202003', '', 0, 2500),
(66, 21, '51101001', '', 16303.5, 0),
(67, 21, '11401001', '', 0, 16303.5),
(68, 21, '12202002', '', 100, 0),
(69, 21, '51204002', '', 0, 100),
(70, 21, '12207002', '', 83.33, 0),
(71, 21, '51204007', '', 0, 83.33),
(72, 22, '11401001', '', 10869.56, 0),
(73, 22, '21203002', '', 0, 326.09),
(74, 22, '21203003', '', 0, 543.48),
(75, 22, '11101003', '', 0, 5000),
(76, 22, '21101001', '', 0, 5000),
(84, 24, '21201001', '', 2990, 0),
(85, 24, '11301001', '', 0, 508.35),
(86, 24, '21202001', '', 690, 0),
(87, 24, '21203002', '', 660.92, 0),
(88, 24, '21203003', '', 1086.96, 0),
(89, 24, '21203001', '', 37.92, 0),
(90, 24, '11101003', '', 0, 4957.45),
(91, 25, '11101003', '', 15000, 0),
(92, 25, '51302001', '', 450, 0),
(93, 25, '41101001', '', 0, 13050),
(94, 25, '21201001', '', 0, 1950),
(95, 25, '21202001', '', 0, 450),
(96, 26, '11101003', '', 20000, 0),
(97, 26, '21102001', '', 0, 20000),
(98, 27, '51101001', '', 10870.13, 0),
(99, 27, '11401001', '', 0, 10870.13),
(100, 27, '51204002', '', 100, 0),
(101, 27, '51204007', '', 83.33, 0),
(102, 27, '12202002', '', 0, 100),
(103, 27, '12207002', '', 0, 83.33),
(104, 28, '21101001', '', 2455, 0),
(105, 28, '21101002', '', 3000, 0),
(106, 28, '11101003', '', 0, 5455),
(107, 29, '51202002', '', 435, 0),
(108, 29, '11301001', '', 65, 0),
(109, 29, '21101002', '', 0, 500),
(110, 29, '51202002', '', 87, 0),
(111, 29, '11301001', '', 13, 0),
(112, 29, '21101002', '', 0, 100),
(113, 29, '52203002', '', 2175, 0),
(114, 29, '11301001', '', 325, 0),
(115, 29, '21101002', '', 0, 2500),
(116, 30, '11401001', '', 13043.48, 0),
(117, 30, '21203002', '', 0, 391.3),
(118, 30, '21203003', '', 0, 652.18),
(119, 30, '11101003', '', 0, 12000),
(120, 31, '21201001', '', 1950, 0),
(121, 31, '11301001', '', 0, 403),
(122, 31, '21202001', '', 450, 0),
(123, 31, '11101003', '', 0, 1997),
(124, 32, '21101001', '', 5000, 0),
(125, 32, '21101002', '', 3100, 0),
(126, 32, '11101003', '', 0, 8100),
(127, 33, '11101003', '', 19800, 0),
(128, 33, '51302001', '', 594, 0),
(129, 33, '41101001', '', 0, 17226),
(130, 33, '21201001', '', 0, 2574),
(131, 33, '21202001', '', 0, 594),
(132, 34, '51101001', '', 11956.71, 0),
(133, 34, '11401001', '', 0, 11956.71),
(134, 34, '51204002', '', 100, 0),
(135, 34, '51204007', '', 83.33, 0),
(136, 34, '12202002', '', 0, 100),
(137, 34, '12207002', '', 0, 83.33),
(138, 35, '11101003', '', 0, 20291.67),
(139, 35, '21102001', '', 20000, 0),
(140, 35, '52203002', '', 291.67, 0),
(146, 41, '11102002', '', 1000, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcuentas`
--

CREATE TABLE `tcuentas` (
  `codigo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombrecuenta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) NOT NULL,
  `nivel` int(11) NOT NULL,
  `agrupado` varchar(255) NOT NULL,
  `tipoactualizacion` varchar(255) NOT NULL,
  `habilitado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tcuentas`
--

INSERT INTO `tcuentas` (`codigo`, `nombrecuenta`, `descripcion`, `nivel`, `agrupado`, `tipoactualizacion`, `habilitado`) VALUES
('10000000', 'ACTIVO', '', 1, 'control', 'ninguno', 1),
('11000000', 'ACTIVO CORRIENTE', '', 2, 'control', 'ninguno', 1),
('11100000', 'DISPONIBLE', '', 3, 'control', 'ninguno', 1),
('11101000', 'CAJA', '', 4, 'control', 'ninguno', 1),
('11101001', 'CAJA CHICA', '', 5, 'detalle', 'mn', 1),
('11101002', 'FONDO FIJO', '', 5, 'detalle', 'mn', 1),
('11101003', 'CAJA MN', '', 5, 'detalle', 'mn', 1),
('11101004', 'CAJA ME', '', 5, 'detalle', 'me', 1),
('11102000', 'BANCOS', '', 4, 'control', 'ninguno', 1),
('11102001', 'BANCO BNB MN', '', 5, 'detalle', 'mn', 1),
('11102002', 'BANCO BISA ME', '', 5, 'detalle', 'me', 1),
('11102003', 'BANCO MSC MN', '', 5, 'detalle', 'mn', 1),
('11102004', 'BANCO UNION ME', '', 5, 'detalle', 'me', 1),
('11200000', 'INVERSIONES TEMPORALES', '', 3, 'control', 'ninguno', 1),
('11201000', 'CLIENTES', '', 4, 'control', 'ninguno', 1),
('11201001', 'CLIENTES MN', '', 5, 'detalle', 'mn', 1),
('11201002', 'CLIENTES ME', '', 5, 'detalle', 'me', 1),
('11202000', 'VALORES DE RENTA FIJA', '', 4, 'control', 'ninguno', 1),
('11202001', 'LETRAS POR COBRAR', '', 5, 'detalle', 'mn', 1),
('11202002', 'DFP POR COBRAR', '', 5, 'detalle', 'mn', 1),
('11203000', 'VALORES DE RENTA VARIABLE', '', 4, 'control', 'ninguno', 1),
('11203001', 'ACCIONES POR COBRAR', '', 5, 'detalle', 'mn', 1),
('11300000', 'EXIGIBLE', '', 3, 'control', 'ninguno', 1),
('11301000', 'IMPUESTOS A RECUPERAR', '', 4, 'control', 'ninguno', 1),
('11301001', 'CREDITO FISCAL IVA', '', 5, 'detalle', 'mn', 1),
('11301002', 'IUE A COMPENSAR', '', 5, 'detalle', 'mn', 1),
('11302000', 'OTRAS CUENTAS POR COBRAR', '', 4, 'control', 'ninguno', 1),
('11302001', 'ANTICIPO DE PROVEEDORES', '', 5, 'detalle', 'mn', 1),
('11302002', 'ANTICIPO DE SUELDOS', '', 5, 'detalle', 'mn', 1),
('11302003', 'OTROS ANTICIPOS', '', 5, 'detalle', 'mn', 1),
('11400000', 'REALIZABLE', '', 3, 'control', 'ninguno', 1),
('11401000', 'INVENTARIOS FINALES', '', 4, 'control', 'ninguno', 1),
('11401001', 'INVENTARIO FINAL PROD A', '', 5, 'detalle', 'ufvs', 1),
('11401002', 'INVENTARIO FINAL PROD B', '', 5, 'detalle', 'ufvs', 1),
('11402000', 'INVENTARIOS EN PROCESO', '', 4, 'control', 'ninguno', 1),
('11402001', 'PRODUCTOS EN PROCESO', '', 5, 'detalle', 'ufvs', 1),
('11403000', 'INVENTARIOS EN TRANSITO', '', 4, 'control', 'ninguno', 1),
('11403001', 'MERCADERIA EN TRANSITO', '', 5, 'detalle', 'ufvs', 1),
('11500000', 'CARGOS DIFERIDOS', '', 3, 'control', 'ninguno', 1),
('11501000', 'GASTOS PAGADOS POR ADELANTADO', '', 4, 'control', 'ninguno', 1),
('11501001', 'SEGUROS PAGADOS POR ADELANTADO', '', 5, 'detalle', 'ufvs', 1),
('11501002', 'OTROS GASTOS POR ADELANTADO', '', 5, 'detalle', 'ufvs', 1),
('11502000', 'GASTOS DE ORGANIZACION', '', 4, 'control', 'ninguno', 1),
('11502001', 'GASTOS DE ORGANIZACION', '', 5, 'detalle', 'ufvs', 1),
('11502002', 'AMORT. AC. GASTOS DE ORG.', '', 5, 'detalle', 'ufvs', 1),
('11503000', 'OTROS GASTOS DIFERIDOS', '', 4, 'control', 'ninguno', 1),
('11503001', 'OTROS GASTOS DIFERIDOS', '', 5, 'detalle', 'ufvs', 1),
('12000000', 'ACTIVO NO CORRIENTE', '', 2, 'control', 'ninguno', 1),
('12100000', 'INVERSIONES PERMANENTES', '', 3, 'control', 'ninguno', 1),
('12101000', 'VALORES DE RENTA FIJA', '', 4, 'control', 'ninguno', 1),
('12101001', 'LETRAS POR COBRAR', '', 5, 'detalle', 'mn', 1),
('12101002', 'DPF POR COBRAR', '', 5, 'detalle', 'mn', 1),
('12102000', 'VALORES DE RENTA VARIABLE', '', 4, 'control', 'ninguno', 1),
('12102001', 'ACCIONES POR COBRAR', '', 5, 'detalle', 'mn', 1),
('12200000', 'ACTIVOS FIJOS', '', 3, 'control', 'ninguno', 1),
('12201000', 'EDIFICIOS, VALOR NETO', '', 4, 'control', 'ninguno', 1),
('12201001', 'EDIFICIOS', '', 5, 'detalle', 'ufvs', 1),
('12201002', 'DEP. AC. EDIFICIOS', '', 5, 'detalle', 'ufvs', 1),
('12202000', 'MUEBLES Y ENSERES, NETO', '', 4, 'control', 'ninguno', 1),
('12202001', 'MUEBLES', '', 5, 'detalle', 'ufvs', 1),
('12202002', 'DEP. AC. MUEBLES', '', 5, 'detalle', 'ufvs', 1),
('12203000', 'VEHICULOS, NETO', '', 4, 'control', 'ninguno', 1),
('12203001', 'VEHICULOS', '', 5, 'detalle', 'ufvs', 1),
('12203002', 'DEP. AC VEHICULOS', '', 5, 'detalle', 'ufvs', 1),
('12204000', 'EQUIPO DE COMPUTACION, NETO', '', 4, 'control', 'ninguno', 1),
('12204001', 'EQUIPO DE COMPUTACION', '', 5, 'detalle', 'ufvs', 1),
('12204002', 'DEP AC EQUIPO DE COMPUTACION', '', 5, 'detalle', 'ufvs', 1),
('12205000', 'EQUIPO DE COMUNICACION, NETO', '', 4, 'control', 'ninguno', 1),
('12205001', 'EQUIPO DE COMUNICACION', '', 5, 'detalle', 'ufvs', 1),
('12205002', 'DEP AC EQUIPO DE COMUNICACION', '', 5, 'detalle', 'ufvs', 1),
('12206000', 'HERRAMIENTAS, NETO', '', 4, 'control', 'ninguno', 1),
('12206001', 'HERRAMIENTAS', '', 5, 'detalle', 'ufvs', 1),
('12206002', 'DEP AC HERRAMIENTAS', '', 5, 'detalle', 'ufvs', 1),
('12207000', 'MAQUINARIA', '', 4, 'SI', 'NO', 1),
('12207001', 'MAQUINARIA', '', 5, 'SI', 'NO', 1),
('12207002', 'DEP. AC. MAQUINARIA', '', 5, 'SI', 'NO', 1),
('12300000', 'CARGOS DIFERIDOS', '', 3, 'control', 'ninguno', 1),
('12301000', 'GASTOS PAGADOS POR ADELANTADO', '', 4, 'control', 'ninguno', 1),
('12301001', 'SEGUROS PAGADOS POR ADELANTADO', '', 5, 'detalle', 'ufvs', 1),
('12301002', 'OTROS GASTOS POR ADELANTADO', '', 5, 'detalle', 'ufvs', 1),
('12302000', 'GASTOS DE ORGANIZACION', '', 4, 'control', 'ninguno', 1),
('12302001', 'GASTOS DE ORGANIZACION', '', 5, 'detalle', 'u', 1),
('12302002', 'AMORT AC GASTOS DE ORG', '', 5, 'detalle', 'u', 1),
('12303000', 'OTROS GASTOS DIFERIDOS', '', 4, 'control', 'ninguno', 1),
('12303001', 'OTROS GASTOS DIFERIDOS', '', 5, 'detalle', 'u', 1),
('20000000', 'PASIVO', '', 1, 'control', 'ninguno', 1),
('21000000', 'PASIVO CORRIENTE', '', 2, 'control', 'ninguno', 1),
('21100000', 'DEUDAS COMERCIALES', '', 3, 'control', 'ninguno', 1),
('21101000', 'PROVEEDORES', '', 4, 'control', 'ninguno', 1),
('21101001', 'PROVEEDORES COMERCIALES', '', 5, 'detalle', 'mn', 1),
('21101002', 'SERVICIOS POR PAGAR', '', 5, 'detalle', 'mn', 1),
('21101003', 'HONORARIOS POR PAGAR', '', 5, 'detalle', 'mn', 1),
('21102000', 'OTRAS CUENTAS POR PAGAR', '', 4, 'control', 'ninguno', 1),
('21102001', 'CTA SOCIOS POR PAGAR', '', 5, 'detalle', 'mn', 1),
('21102002', 'OTRAS CUENTAS POR PAGAR', '', 5, 'detalle', 'mn', 1),
('21200000', 'DEUDAS TRIBUTARIAS', '', 3, 'control', 'ninguno', 1),
('21201000', 'IVA POR PAGAR', '', 4, 'control', 'ninguno', 1),
('21201001', 'DEBITO FISCAL IVA ', '', 5, 'detalle', 'mn', 1),
('21202000', 'IT POR PAGAR', '', 4, 'control', 'ninguno', 1),
('21202001', 'IT POR PAGAR', '', 5, 'detalle', 'mn', 1),
('21203000', 'RETENCIONES POR PAGAR', '', 4, 'control', 'ninguno', 1),
('21203001', 'RETENCION RCIVA', '', 5, 'detalle', 'mn', 1),
('21203002', 'RETENCION IT', '', 5, 'detalle', 'mn', 1),
('21203003', 'RETENCION IUE', '', 5, 'detalle', 'mn', 1),
('21204000', 'IUE POR PAGAR', '', 4, 'control', 'ninguno', 1),
('21204001', 'IUE POR PAGAR', '', 5, 'detalle', 'mn', 1),
('21300000', 'DEUDAS SOCIALES', '', 3, 'control', 'ninguno', 1),
('21301000', 'SUELDOS POR PAGAR', '', 4, 'control', 'ninguno', 1),
('21301001', 'SUELDO EMPLEADO A POR PAGAR', '', 5, 'detalle', 'mn', 1),
('21301002', 'SUELDO EMPLEADO B POR PAGAR', '', 5, 'detalle', 'mn', 1),
('21302000', 'CARGAS POR PAGAR', '', 4, 'control', 'ninguno', 1),
('21302001', 'CNS POR PAGAR', '', 5, 'detalle', 'mn', 1),
('21302002', 'GESTORA POR PAGAR', '', 5, 'detalle', 'mn', 1),
('21303000', 'BENEFICIOS POR PAGAR', '', 4, 'control', 'ninguno', 1),
('21303001', 'AGUINALDOS POR PAGAR', '', 5, 'detalle', 'mn', 1),
('21400000', 'DEUDAS FINANCIERAS', '', 3, 'control', 'ninguno', 1),
('21401000', 'INTERESES POR PAGAR', '', 4, 'control', 'ninguno', 1),
('21401001', 'INTERESES BANCARIOS POR PAGAR', '', 5, 'detalle', 'mn', 1),
('21402000', 'RECARGOS POR PAGAR', '', 4, 'control', 'ninguno', 1),
('21402001', 'GASTOS FINANCIEROS POR PAGAR', '', 5, 'detalle', 'mn', 1),
('21402002', 'MULTAS FINANCIERAS POR PAGAR', '', 5, 'detalle', 'mn', 1),
('21402003', 'OTROS RECARGOS POR PAGAR', '', 5, 'detalle', 'mn', 1),
('22000000', 'PASIVO NO CORRIENTE', '', 2, 'control', 'ninguno', 1),
('22100000', 'DEUDAS SOCIALES', '', 3, 'control', 'ninguno', 1),
('22101000', 'PREVISION PARA INDEMNIZACIONES', '', 4, 'control', 'ninguno', 1),
('22101001', 'PREVISION PARA INDEMNIZACIONES', '', 5, 'detalle', 'mn', 1),
('22200000', 'DEUDAS FINANCIERAS', '', 3, 'control', 'ninguno', 1),
('22201000', 'INTERESES POR PAGAR', '', 4, 'control', 'ninguno', 1),
('22201001', 'INTERESES BANCARIOS POR PAGAR', '', 5, 'detalle', 'mn', 1),
('22202000', 'RECARGOS POR PAGAR', '', 4, 'control', 'ninguno', 1),
('22202001', 'GASTOS FINANCIEROS POR PAGAR', '', 5, 'detalle', 'mn', 1),
('22202002', 'MULTAS FINANCIERAS POR PAGAR', '', 5, 'detalle', 'mn', 1),
('22202003', 'OTROS RECARGOS POR PAGAR', '', 5, 'detalle', 'mn', 1),
('30000000', 'PATRIMONIO', '', 1, 'control', 'ninguno', 1),
('31000000', 'PATRIMONIO INSTITUCIONAL', '', 2, 'control', 'ninguno', 1),
('31100000', 'CAPITAL', '', 3, 'control', 'ninguno', 1),
('31101000', 'APORTES SOCIOS', '', 4, 'control', 'ninguno', 1),
('31101001', 'APORTE SOCIO A', '', 5, 'detalle', 'capital', 1),
('31101002', 'APORTE SOCIO B', '', 5, 'detalle', 'capital', 1),
('31101003', 'APORTE SOCIO C', '', 5, 'detalle', 'capital', 1),
('31102000', 'AJUSTE DE CAPITAL', '', 4, 'control', 'ninguno', 1),
('31102001', 'AJUSTE DE CAPITAL', '', 5, 'detalle', 'capital', 1),
('31200000', 'RESERVAS', '', 3, 'control', 'ninguno', 1),
('31201000', 'RESERVA LEGAL', '', 4, 'control', 'ninguno', 1),
('31201001', 'RESERVA LEGAL', '', 5, 'detalle', 'reservas', 1),
('31202000', 'RESERVA ESTATUTARIA', '', 4, 'control', 'ninguno', 1),
('31202001', 'RESERVA POR INCREMENTO DE CAPITAL', '', 5, 'detalle', 'reservas', 1),
('31202002', 'REVALORIZACION DE ACTIVOS FIJIOS', '', 5, 'detalle', 'reservas', 1),
('31203000', 'AJUSTE DE RESERVAS', '', 4, 'control', 'ninguno', 1),
('31203001', 'AJUSTE DE RESERVAS PATRIMONIALES', '', 5, 'detalle', 'reservas', 1),
('31300000', 'RESULTADOS ACUMULADOS', '', 5, 'control', 'ninguno', 1),
('31301000', 'RESULTADO GESTIONES ANTERIORES', '', 4, 'control', 'ninguno', 1),
('31301001', 'RESULTADO GESTION 2021', '', 5, 'detalle', 'resultados acumulados', 1),
('31301002', 'RESULTADO GESTION 2021', '', 5, 'detalle', 'resultados acumulados', 1),
('31301003', 'RESULTADOS ACUMULADOS', '', 5, 'detalle', 'resultados acumulados', 1),
('31302000', 'AJUSTE DE RESULTADOS ACUMULADOS', '', 4, 'control', 'ninguno', 1),
('31302001', 'RESULTADOS ACUMULADOS', '', 5, 'detalle', 'resultados acumulados', 1),
('40000000', 'INGRESOS', '', 1, 'control', 'ninguno', 1),
('41000000', 'INGRESOS OPERATIVOS', '', 2, 'control', 'ninguno', 1),
('41100000', 'VENTA DE BIENES', '', 3, 'control', 'ninguno', 1),
('41101000', 'VENTA DE BIENES REALIZADOS', '', 4, 'control', 'ninguno', 1),
('41101001', 'VENTA DE BIENES REALIZADOS', '', 5, 'detalle', 'ufvs', 1),
('41102000', 'VENTA DE BIENES EN CURSO', '', 4, 'control', 'ninguno', 1),
('41102001', 'VENTA DE BIENES EN CURSO', '', 5, 'detalle', 'ufvs', 1),
('41200000', 'VENTA DE SERVICIOS', '', 3, 'control', 'ninguno', 1),
('41201000', 'VENTA DE SERVICIOS REALIZADOS', '', 4, 'control', 'ninguno', 1),
('41201001', 'VENTA DE SERVICIOS REALIZADOS', '', 5, 'detalle', 'ufvs', 1),
('41202000', 'VENTA DE SERVICIOS EN CURSO', '', 4, 'control', 'ninguno', 1),
('41202001', 'VENTA DE SERVICIOS EN CURSO', '', 5, 'detalle', 'ufvs', 1),
('42000000', 'INGRESOS NO OPERATIVOS', '', 2, 'control', 'ninguno', 1),
('42100000', 'REEXPRESION MONETARIA', '', 3, 'control', 'ninguno', 1),
('42101000', 'AJUSTE POR INFLACION ', '', 4, 'control', 'ninguno', 1),
('42101001', 'AJUSTE POR INFLACION', '', 5, 'detalle', 'ufvs', 1),
('42102000', 'DIFERENCIA DE CAMBIO', '', 4, 'control', 'ninguno', 1),
('42102001', 'DIFERENCIA DE CAMBIO', '', 5, 'detalle', 'ufvs', 1),
('42103000', 'MANTENIMIENTO DE VALOR', '', 4, 'control', 'ninguno', 1),
('42103001', 'MANTENIMIENTO DE VALOR', '', 5, 'detalle', 'ufvs', 1),
('42200000', 'OTROS INGRESOS', '', 3, 'control', 'ninguno', 1),
('42201000', 'GANANCIA EN INVERSIONES', '', 4, 'control', 'ninguno', 1),
('42201001', 'GANANCIA EN INVERSIONES', '', 5, 'detalle', 'ufvs', 1),
('42202000', 'GANANCIA EN VENTA DE ACTIVOS FIJOS', '', 4, 'control', 'ninguno', 1),
('42202001', 'GANANCIA EN VENTA DE ACTIVOS FIJOS', '', 5, 'detalle', 'ufvs', 1),
('42203000', 'OTROS INGRESOS', '', 4, 'control', 'ninguno', 1),
('42203001', 'OTROS INGRESOS', '', 5, 'detalle', 'ufvs', 1),
('50000000', 'EGRESOS', '', 1, 'control', 'ninguno', 1),
('51000000', 'EGRESOS OPERATIVOS', '', 2, 'control', 'ninguno', 1),
('51100000', 'COSTO DE VENTAS', '', 3, 'control', 'ninguno', 1),
('51101000', 'COSTOS DE VENTA', '', 4, 'control', 'ninguno', 1),
('51101001', 'COSTOS DE VENTA', '', 5, 'detalle', 'ufvs', 1),
('51200000', 'GASTOS ADMINISTRATIVOS', '', 3, 'control', 'ninguno', 1),
('51201000', 'REMUNERACION', '', 4, 'control', 'ninguno', 1),
('51201001', 'SUELDOS Y SALARIOS', '', 5, 'detalle', 'ufvs', 1),
('51201002', 'CARGAS SOCIALES', '', 5, 'detalle', 'ufvs', 1),
('51201003', 'BENEFICIOS SOCIALES', '', 5, 'detalle', 'ufvs', 1),
('51201004', 'OTROS GASTOS EN PERSONAL', '', 5, 'detalle', 'ufvs', 1),
('51202000', 'MATERIALES Y SUMINISTROS', '', 4, 'control', 'ninguno', 1),
('51202001', 'MATERIALES Y SUMINISTROS', '', 5, 'detalle', 'ufvs', 1),
('51202002', 'SERVICIOS BASICOS', '', 5, 'SI', 'NO', 1),
('51203000', 'SEGUROS PAGADOS', '', 4, 'control', 'ninguno', 1),
('51203001', 'SEGUROS PAGADOS', '', 5, 'detalle', 'ufvs', 1),
('51204000', 'DEPRECIACION', '', 4, 'control', 'ninguno', 1),
('51204001', 'DEPRECIACION EDIFICIOS', '', 5, 'detalle', 'ufvs', 1),
('51204002', 'DEPRECIACION MUEBLES', '', 5, 'detalle', 'ufvs', 1),
('51204003', 'DEPRECIACION VEHICULOS', '', 5, 'detalle', 'ufvs', 1),
('51204004', 'DEPRECIACION EQUIPO DE COMPUTACION', '', 5, 'detalle', 'ufvs', 1),
('51204005', 'DEPRECIACION EQUIPO DE COMUNICACION', '', 5, 'detalle', 'ufvs', 1),
('51204006', 'DEPRECIACION HERRAMIENTAS', '', 5, 'detalle', 'ufvs', 1),
('51204007', 'DEPRECIACION MAQUINARIA', '', 5, 'SI', 'NO', 1),
('51205000', 'OTROS GASTOS ADMINISTRATIVOS', '', 4, 'control', 'ninguno', 1),
('51205001', 'OTROS GASTOS ADMINISTRATIVOS', '', 5, 'detalle', 'ufvs', 1),
('51300000', 'GASTOS DE COMERCIALIZACION', '', 3, 'control', 'ninguno', 1),
('51301000', 'REMUNERACION', '', 4, 'control', 'ninguno', 1),
('51301001', 'SUELDOS Y SALARIOS', '', 5, 'detalle', 'ufvs', 1),
('51301002', 'CARGAS SOCIALES', '', 5, 'detalle', 'ufvs', 1),
('51301003', 'BENEFICIOS SOCIALES', '', 5, 'detalle', 'ufvs', 1),
('51301004', 'OTROS GASTOS EN PERSONAL', '', 5, 'detalle', 'ufvs', 1),
('51302000', 'IMPUESTOS PAGADOS', '', 4, 'control', 'ninguno', 1),
('51302001', 'IMPUESTO A LAS TRANSACCIONES', '', 5, 'detalle', 'ufvs', 1),
('51303000', 'PUBLICIDAD Y PROMOCION', '', 4, 'control', 'ninguno', 1),
('51303001', 'PROPAGANDA', '', 5, 'detalle', 'ufvs', 1),
('51304000', 'OTROS GASTOS COMERCIALES', '', 4, 'control', 'ninguno', 1),
('51304001', 'MATERIAL PUBLICITARIO', '', 5, 'detalle', 'ufvs', 1),
('51304002', 'DOMINIO PAGINA WEB', '', 5, 'detalle', 'ufvs', 1),
('51304003', 'HOSTING PAGINA WEB', '', 5, 'detalle', 'ufvs', 1),
('51304004', 'OTROS GASTOS PUBLICITARIOS', '', 5, 'detalle', 'ufvs', 1),
('51400000', 'GASTOS FINANCIEROS', '', 3, 'control', 'ninguno', 1),
('51401000', 'GASTOS BANCARIOS', '', 4, 'control', 'ninguno', 1),
('51401001', 'INTERESES BANCARIOS', '', 5, 'detalle', 'ufvs', 1),
('51401002', 'COMISIONES BANCARIOS', '', 5, 'detalle', 'ufvs', 1),
('51402000', 'RECARGOS FINANCIEROS', '', 4, 'control', 'ninguno', 1),
('51402001', 'OTROS GASTOS FINANCIEROS', '', 5, 'detalle', 'ufvs', 1),
('52000000', 'EGRESOS NO OPERATIVOS', '', 2, 'control', 'ninguno', 1),
('52100000', 'REEXPRESION MONETARIA', '', 3, 'control', 'ninguno', 1),
('52101000', 'AJUSTE POR INFLACION ', '', 4, 'control', 'ninguno', 1),
('52101001', 'AJUSTE POR INFLACION', '', 5, 'detalle', 'ufvs', 1),
('52102000', 'DIFERENCIA DE CAMBIO', '', 4, 'control', 'ninguno', 1),
('52102001', 'DIFERENCIA DE CAMBIO', '', 5, 'detalle', 'ufvs', 1),
('52103000', 'MANTENIMIENTO DE VALOR', '', 4, 'control', 'ninguno', 1),
('52103001', 'MANTENIMIENTO DE VALOR', '', 5, 'detalle', 'ufvs', 1),
('52200000', 'OTROS EGRESOS', '', 3, 'control', 'ninguno', 1),
('52201000', 'PERDIDA EN INVERSIONES', '', 4, 'control', 'ninguno', 1),
('52201001', 'PERDIDA EN INVERSIONES', '', 5, 'detalle', 'ufvs', 1),
('52202000', 'PERDIDA EN VENTA DE ACTIVOS FIJOS', '', 4, 'control', 'ninguno', 1),
('52202001', 'PERDIDA EN VENTA DE ACTIVOS FIJOS', '', 5, 'detalle', 'ufvs', 1),
('52203000', 'OTROS EGRESOS', '', 4, 'control', 'ninguno', 1),
('52203001', 'GASTOS NO DEDUCIBLES', '', 5, 'detalle', 'ufvs', 1),
('52203002', 'OTROS GASTOS', '', 5, 'detalle', 'ufvs', 1),
('52203003', 'GASTOS LEGALES', '', 5, 'SI', 'NO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tempresa`
--

CREATE TABLE `tempresa` (
  `idempresa` int(11) NOT NULL,
  `nit` int(11) NOT NULL,
  `nombreempresa` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `representante` varchar(255) NOT NULL,
  `anio` int(11) NOT NULL,
  `tipoempresa` varchar(255) NOT NULL,
  `fechai` date NOT NULL,
  `fechaf` date NOT NULL,
  `sucursalnr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tusuario`
--

CREATE TABLE `tusuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tusuario`
--

INSERT INTO `tusuario` (`idusuario`, `nombre`, `usuario`, `password`) VALUES
(3, 'Cristian', 'criss', '13693493');

-- --------------------------------------------------------

--
-- Estructura para la vista `cbg`
--
DROP TABLE IF EXISTS `cbg`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cbg`  AS SELECT `ceeffg`.`cod1` AS `cod1`, `tcuentas`.`nombrecuenta` AS `NombreCuenta`, `ceeffg`.`SumaDeSaldoEF` AS `SumaDeSaldoEF`, `tcuentas`.`nivel` AS `Nivel` FROM (`ceeffg` join `tcuentas` on(`ceeffg`.`cod1` = `tcuentas`.`codigo`)) WHERE `ceeffg`.`cod1` between 10000000 and 39999999 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `cbss`
--
DROP TABLE IF EXISTS `cbss`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cbss`  AS SELECT `cbss1`.`codcta` AS `codcta`, `cbss1`.`nombrecuenta` AS `NombreCuenta`, `cbss1`.`SumaDeDebeML` AS `SumaDeDebeML`, `cbss1`.`SumaDeHaberML` AS `SumaDeHaberML`, if(`cbss1`.`SumaDeDebeML` - `cbss1`.`SumaDeHaberML` > 0,`cbss1`.`SumaDeDebeML` - `cbss1`.`SumaDeHaberML`,0) AS `saldod`, if(`cbss1`.`SumaDeHaberML` - `cbss1`.`SumaDeDebeML` > 0,`cbss1`.`SumaDeHaberML` - `cbss1`.`SumaDeDebeML`,0) AS `saldoh` FROM `cbss1` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `cbss1`
--
DROP TABLE IF EXISTS `cbss1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cbss1`  AS SELECT `tcomprobantes_`.`codcta` AS `codcta`, `tcuentas`.`nombrecuenta` AS `nombrecuenta`, sum(`tcomprobantes_`.`debeml`) AS `SumaDeDebeML`, sum(`tcomprobantes_`.`haberml`) AS `SumaDeHaberML` FROM (`tcuentas` join (`tcomprobantes` join `tcomprobantes_` on(`tcomprobantes`.`idcomprobante` = `tcomprobantes_`.`codcomprobante`)) on(`tcuentas`.`codigo` = `tcomprobantes_`.`codcta`)) GROUP BY `tcomprobantes_`.`codcta`, `tcuentas`.`nombrecuenta` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `cdiario`
--
DROP TABLE IF EXISTS `cdiario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cdiario`  AS SELECT `tcomprobantes`.`idcomprobante` AS `idcomprobante`, `tcomprobantes`.`fecha` AS `fecha`, `tcomprobantes`.`codtipocomprobante` AS `codtipocomprobante`, `tcomprobantes`.`nocomprobante` AS `nocomprobante`, `tcomprobantes`.`tc` AS `tc`, `tcomprobantes`.`senior` AS `senior`, `tcomprobantes`.`glosag` AS `glosag`, `tcomprobantes_`.`codcta` AS `codcta`, `tcuentas`.`nombrecuenta` AS `nombrecuenta`, `tcomprobantes_`.`glosad` AS `glosad`, `tcomprobantes_`.`debeml` AS `debeml`, `tcomprobantes_`.`haberml` AS `haberml` FROM (`tcuentas` join (`tcomprobantes` join `tcomprobantes_` on(`tcomprobantes`.`idcomprobante` = `tcomprobantes_`.`codcomprobante`)) on(`tcuentas`.`codigo` = `tcomprobantes_`.`codcta`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ceeff0`
--
DROP TABLE IF EXISTS `ceeff0`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ceeff0`  AS SELECT `cbss1`.`codcta` AS `codcta`, `cbss1`.`nombrecuenta` AS `NombreCuenta`, `cbss1`.`SumaDeDebeML` AS `SumaDeDebeML`, `cbss1`.`SumaDeHaberML` AS `SumaDeHaberML`, if(left(`cbss1`.`codcta`,1) = '1' or left(`cbss1`.`codcta`,1) = '5',`cbss1`.`SumaDeDebeML` - `cbss1`.`SumaDeHaberML`,`cbss1`.`SumaDeHaberML` - `cbss1`.`SumaDeDebeML`) AS `SaldoEF`, cast(concat(left(`cbss1`.`codcta`,1),'0000000') as unsigned) AS `cod1`, cast(concat(left(`cbss1`.`codcta`,2),'000000') as unsigned) AS `cod2`, cast(concat(left(`cbss1`.`codcta`,3),'00000') as unsigned) AS `cod3`, cast(concat(left(`cbss1`.`codcta`,5),'000') as unsigned) AS `cod4` FROM `cbss1`union select 31303001 AS `31303001`,'Resultado' AS `Resultado`,0 AS `0`,0 AS `0`,`cresultado`.`Resultado` AS `resultado`,30000000 AS `30000000`,31000000 AS `31000000`,31300000 AS `31300000`,31303000 AS `31303000` from `cresultado`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ceeff1`
--
DROP TABLE IF EXISTS `ceeff1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ceeff1`  AS SELECT `ceeff0`.`cod1` AS `cod1`, sum(`ceeff0`.`SaldoEF`) AS `SumaDeSaldoEF` FROM `ceeff0` GROUP BY `ceeff0`.`cod1` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ceeff2`
--
DROP TABLE IF EXISTS `ceeff2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ceeff2`  AS SELECT `ceeff0`.`cod2` AS `cod2`, sum(`ceeff0`.`SaldoEF`) AS `SumaDeSaldoEF` FROM `ceeff0` GROUP BY `ceeff0`.`cod2` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ceeff3`
--
DROP TABLE IF EXISTS `ceeff3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ceeff3`  AS SELECT `ceeff0`.`cod3` AS `cod3`, sum(`ceeff0`.`SaldoEF`) AS `SumaDeSaldoEF` FROM `ceeff0` GROUP BY `ceeff0`.`cod3` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ceeff4`
--
DROP TABLE IF EXISTS `ceeff4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ceeff4`  AS SELECT `ceeff0`.`cod4` AS `cod4`, sum(`ceeff0`.`SaldoEF`) AS `SumaDeSaldoEF` FROM `ceeff0` GROUP BY `ceeff0`.`cod4` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ceeff5`
--
DROP TABLE IF EXISTS `ceeff5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ceeff5`  AS SELECT `ceeff0`.`codcta` AS `codcta`, sum(`ceeff0`.`SaldoEF`) AS `SumaDeSaldoEF` FROM `ceeff0` GROUP BY `ceeff0`.`codcta` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ceeffg`
--
DROP TABLE IF EXISTS `ceeffg`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ceeffg`  AS SELECT `ceeff1`.`cod1` AS `cod1`, `ceeff1`.`SumaDeSaldoEF` AS `SumaDeSaldoEF` FROM `ceeff1`union select `ceeff2`.`cod2` AS `cod2`,`ceeff2`.`SumaDeSaldoEF` AS `SumaDeSaldoEF` from `ceeff2` union select `ceeff3`.`cod3` AS `cod3`,`ceeff3`.`SumaDeSaldoEF` AS `SumaDeSaldoEF` from `ceeff3` union select `ceeff4`.`cod4` AS `cod4`,`ceeff4`.`SumaDeSaldoEF` AS `SumaDeSaldoEF` from `ceeff4` union select `ceeff5`.`codcta` AS `codcta`,`ceeff5`.`SumaDeSaldoEF` AS `SumaDeSaldoEF` from `ceeff5`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `cer`
--
DROP TABLE IF EXISTS `cer`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cer`  AS SELECT `ceeffg`.`cod1` AS `cod1`, `tcuentas`.`nombrecuenta` AS `NombreCuenta`, `ceeffg`.`SumaDeSaldoEF` AS `SumaDeSaldoEF`, `tcuentas`.`nivel` AS `Nivel` FROM (`ceeffg` join `tcuentas` on(`ceeffg`.`cod1` = `tcuentas`.`codigo`)) WHERE `ceeffg`.`cod1` between 40000000 and 59999999 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `cmayores`
--
DROP TABLE IF EXISTS `cmayores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cmayores`  AS SELECT `tcomprobantes_`.`codcta` AS `codcta`, `tcuentas`.`nombrecuenta` AS `nombrecuenta`, `tcomprobantes`.`fecha` AS `fecha`, `tcomprobantes`.`idcomprobante` AS `idcomprobante`, `tcomprobantes`.`codtipocomprobante` AS `codTipoComprobante`, `tcomprobantes`.`nocomprobante` AS `NoComprobante`, `tcomprobantes`.`tc` AS `TC`, `tcomprobantes_`.`glosad` AS `GlosaD`, `tcomprobantes_`.`debeml` AS `DebeML`, `tcomprobantes_`.`haberml` AS `HaberML`, if(left(`tcomprobantes_`.`codcta`,1) = '1' or left(`tcomprobantes_`.`codcta`,1) = '5','D','A') AS `saldo`, if(if(left(`tcomprobantes_`.`codcta`,1) = '1' or left(`tcomprobantes_`.`codcta`,1) = '5','D','A') = 'D',`tcomprobantes_`.`debeml` - `tcomprobantes_`.`haberml`,`tcomprobantes_`.`haberml` - `tcomprobantes_`.`debeml`) AS `SaldoML` FROM (`tcuentas` join (`tcomprobantes` join `tcomprobantes_` on(`tcomprobantes`.`idcomprobante` = `tcomprobantes_`.`codcomprobante`)) on(`tcuentas`.`codigo` = `tcomprobantes_`.`codcta`)) ORDER BY `tcomprobantes_`.`codcta` ASC, `tcomprobantes`.`fecha` ASC, `tcomprobantes`.`idcomprobante` ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `cresultado`
--
DROP TABLE IF EXISTS `cresultado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cresultado`  AS SELECT sum(`tcomprobantes_`.`haberml` - `tcomprobantes_`.`debeml`) AS `Resultado` FROM `tcomprobantes_` WHERE `tcomprobantes_`.`codcta` between 40000000 and 59999999 ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tcomprobantes`
--
ALTER TABLE `tcomprobantes`
  ADD PRIMARY KEY (`idcomprobante`);

--
-- Indices de la tabla `tcomprobantes_`
--
ALTER TABLE `tcomprobantes_`
  ADD PRIMARY KEY (`idcomprobante_`),
  ADD KEY `codcomprobante` (`codcomprobante`),
  ADD KEY `codcta` (`codcta`);

--
-- Indices de la tabla `tcuentas`
--
ALTER TABLE `tcuentas`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `tempresa`
--
ALTER TABLE `tempresa`
  ADD PRIMARY KEY (`idempresa`);

--
-- Indices de la tabla `tusuario`
--
ALTER TABLE `tusuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tcomprobantes`
--
ALTER TABLE `tcomprobantes`
  MODIFY `idcomprobante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `tcomprobantes_`
--
ALTER TABLE `tcomprobantes_`
  MODIFY `idcomprobante_` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT de la tabla `tempresa`
--
ALTER TABLE `tempresa`
  MODIFY `idempresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tusuario`
--
ALTER TABLE `tusuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tcomprobantes_`
--
ALTER TABLE `tcomprobantes_`
  ADD CONSTRAINT `tcomprobantes__ibfk_2` FOREIGN KEY (`codcta`) REFERENCES `tcuentas` (`codigo`),
  ADD CONSTRAINT `tcomprobantes__ibfk_3` FOREIGN KEY (`codcomprobante`) REFERENCES `tcomprobantes` (`idcomprobante`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
