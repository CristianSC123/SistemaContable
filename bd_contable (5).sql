-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2024 a las 05:23:29
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

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
  `estadoasiento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tcomprobantes`
--

INSERT INTO `tcomprobantes` (`idcomprobante`, `codtipocomprobante`, `nocomprobante`, `fecha`, `tc`, `senior`, `glosag`, `estadoasiento`) VALUES
(1, 'traspaso', 1, '2023-10-15', 6, 'Juan', 'ninguno', 'm'),
(2, 'traspaso', 2, '2023-10-17', 6, 'Juan', 'ninguno', 'm'),
(3, 'traspaso', 3, '2023-10-20', 6, 'jose', 'ninguno', 'm'),
(4, 'egreso', 1, '2023-10-30', 6, 'jose', 'ninguno', 'm'),
(5, 'egreso', 2, '2023-10-31', 6, 'jose', 'ninguno', 'm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcomprobantes_`
--

CREATE TABLE `tcomprobantes_` (
  `idcomprobante_` int(11) NOT NULL,
  `codcomprobante` int(11) NOT NULL,
  `codcta` int(11) NOT NULL,
  `glosad` varchar(255) NOT NULL,
  `documento` varchar(255) NOT NULL,
  `debeml` int(11) NOT NULL,
  `haberml` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tcomprobantes_`
--

INSERT INTO `tcomprobantes_` (`idcomprobante_`, `codcomprobante`, `codcta`, `glosad`, `documento`, `debeml`, `haberml`) VALUES
(1, 1, 11101001, 'n', 'n', 12000, 0),
(2, 1, 12202001, 'n', 'n', 10000, 0),
(3, 1, 12204000, 'n', 'n', 10000, 0),
(4, 1, 11401001, 'n', 'n', 7000, 0),
(5, 1, 31101007, 'n', 'n', 0, 15000),
(6, 1, 31101002, 'n', 'n', 0, 14000),
(7, 1, 31101009, 'n', 'n', 0, 10000),
(8, 2, 11401000, 'n', 'n', 3261, 0),
(9, 2, 11101001, 'n', 'n', 0, 3000),
(10, 2, 21203002, 'n', 'n', 0, 98),
(11, 2, 21203003, 'n', 'n', 0, 163),
(12, 3, 11401000, 'n', 'n', 5220, 0),
(13, 3, 11301006, 'n', 'n', 780, 0),
(14, 3, 21101006, 'n', 'n', 0, 6000),
(15, 4, 11301006, 'n', 'n', 23, 0),
(16, 4, 51202002, 'n', 'n', 157, 0),
(17, 4, 21101005, 'n', 'n', 0, 180),
(18, 4, 11301006, 'n', 'n', 14, 0),
(19, 4, 51202002, 'n', 'n', 96, 0),
(20, 4, 21101005, 'n', 'n', 0, 110),
(21, 5, 21101003, 'n', 'n', 0, 400),
(22, 5, 11301006, 'n', 'n', 130, 0),
(23, 5, 51215001, 'n', 'n', 870, 0),
(24, 5, 11101001, 'n', 'n', 0, 600);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcuentas`
--

CREATE TABLE `tcuentas` (
  `codigo` int(11) NOT NULL,
  `nombrecuenta` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `nivel` int(11) NOT NULL,
  `agrupado` varchar(255) NOT NULL,
  `tipoactualizacion` varchar(255) NOT NULL,
  `habilitado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tcuentas`
--

INSERT INTO `tcuentas` (`codigo`, `nombrecuenta`, `descripcion`, `nivel`, `agrupado`, `tipoactualizacion`, `habilitado`) VALUES
(10000000, 'ACTIVO', '', 1, 'control', 'ninguno', 1),
(11000000, 'ACTIVO CORRIENTE', '', 2, 'control', 'ninguno', 1),
(11100000, 'DISPONIBLE', '', 3, 'control', 'ninguno', 1),
(11101000, 'CAJA', '', 4, 'control', 'ninguno', 1),
(11101001, 'CAJA GENERAL', '', 5, 'control', 'ninguno', 1),
(11101002, 'CAJA CHICA', '', 5, 'control', 'ninguno', 1),
(11102000, 'BANCOS', '', 4, 'control', 'ninguno', 1),
(11102001, 'BANCO X CTA CTE', '', 5, 'control', 'ninguno', 1),
(11102002, 'BANCO Y CTA CTE', '', 5, 'control', 'ninguno', 1),
(11200000, 'INVERSIONES TEMPORALES', '', 3, 'control', 'ninguno', 1),
(11201000, 'CLIENTES', '', 4, 'control', 'ninguno', 1),
(11201001, 'CLIENTE A', '', 5, 'control', 'ninguno', 1),
(11201002, 'CLIENTE B', '', 5, 'control', 'ninguno', 1),
(11202000, 'VALORES DE RENTA FIJA', '', 4, 'control', 'ninguno', 1),
(11202001, 'BONOS DEL TESORO', '', 5, 'control', 'ninguno', 1),
(11202002, 'LETRAS DEL TESORO', '', 5, 'control', 'ninguno', 1),
(11203000, 'VALORES DE RENTA VARIABLE', '', 4, 'control', 'ninguno', 1),
(11203001, 'ACCIONES EMPRESA A', '', 5, 'control', 'ninguno', 1),
(11203002, 'ACCIONES EMPRESA B', '', 5, 'control', 'ninguno', 1),
(11300000, 'EXIGIBLE', '', 3, 'control', 'ninguno', 1),
(11301000, 'IMPUESTOS A RECUPERAR', '', 4, 'control', 'ninguno', 1),
(11301001, 'IVA POR RECUPERAR', '', 5, 'control', 'ninguno', 1),
(11301002, 'IT POR RECUPERAR', '', 5, 'control', 'ninguno', 1),
(11301006, 'CREDITO FISCAL IVA', '.', 5, 'control', 'ninguno', 1),
(11302000, 'OTRAS CUENTAS POR COBRAR', '', 4, 'control', 'ninguno', 1),
(11302001, 'CXC A EMPLEADO X', '', 5, 'control', 'ninguno', 1),
(11302002, 'CXC A EMPLEADO Y', '', 5, 'control', 'ninguno', 1),
(11400000, 'REALIZABLE', '', 3, 'control', 'ninguno', 1),
(11401000, 'INVENTARIOS FINALES', '', 4, 'control', 'ninguno', 1),
(11401001, 'MERCADERIAS A', '', 5, 'control', 'ninguno', 1),
(11401002, 'MERCADERIAS B', '', 5, 'control', 'ninguno', 1),
(11401009, 'INVENTARIO FINAL PROD A', '.', 5, 'control', 'ninguno', 1),
(11402000, 'INVENTARIOS EN PROCESO', '', 4, 'control', 'ninguno', 1),
(11402001, 'PROCESO DE FABRICACION A', '', 5, 'control', 'ninguno', 1),
(11402002, 'PROCESO DE FABRICACION B', '', 5, 'control', 'ninguno', 1),
(11403000, 'INVENTARIOS EN TRANSITO', '', 4, 'control', 'ninguno', 1),
(11403001, 'MERCADERIAS EN TRANSITO A', '', 5, 'control', 'ninguno', 1),
(11403002, 'MERCADERIAS EN TRANSITO B', '', 5, 'control', 'ninguno', 1),
(11500000, 'CARGOS DIFERIDOS', '', 3, 'control', 'ninguno', 1),
(11501000, 'GASTOS PAGADOS POR ADELANTADO', '', 4, 'control', 'ninguno', 1),
(11501001, 'SEGUROS PAGADOS POR ADELANTADO', '', 5, 'control', 'ninguno', 1),
(11501002, 'ALQUILERES PAGADOS POR ADELANTADO', '', 5, 'control', 'ninguno', 1),
(11502000, 'GASTOS DE ORGANIZACION', '', 4, 'control', 'ninguno', 1),
(11502001, 'GASTOS DE CONSTITUCION', '', 5, 'control', 'ninguno', 1),
(11502002, 'GASTOS DE INSTALACION', '', 5, 'control', 'ninguno', 1),
(11503000, 'OTROS GASTOS DIFERIDOS', '', 4, 'control', 'ninguno', 1),
(11503001, 'GASTOS DE PUBLICIDAD', '', 5, 'control', 'ninguno', 1),
(11503002, 'GASTOS DE CAPACITACION', '', 5, 'control', 'ninguno', 1),
(11503003, 'GASTOS DE REPRESENTACIÓN', '', 5, 'control', 'ninguno', 1),
(11503004, 'GASTOS DE INVESTIGACIÓN Y DESARROLLO', '', 5, 'control', 'ninguno', 1),
(12000000, 'ACTIVO NO CORRIENTE', '', 2, 'control', 'ninguno', 1),
(12100000, 'INVERSIONES PERMANENTES', '', 3, 'control', 'ninguno', 1),
(12101000, 'VALORES DE RENTA FIJA', '', 4, 'control', 'ninguno', 1),
(12101001, 'BONOS CORPORATIVOS', '', 5, 'control', 'ninguno', 1),
(12101002, 'ACCIONES CORPORATIVAS', '', 5, 'control', 'ninguno', 1),
(12102000, 'VALORES DE RENTA VARIABLE', '', 4, 'control', 'ninguno', 1),
(12200000, 'ACTIVOS FIJOS', '', 3, 'control', 'ninguno', 1),
(12201000, 'EDIFICIOS, VALOR NETO', '', 4, 'control', 'ninguno', 1),
(12201001, 'EDIFICIO PRINCIPAL', '', 5, 'control', 'ninguno', 1),
(12201002, 'EDIFICIO SECUNDARIO', '', 5, 'control', 'ninguno', 1),
(12202000, 'MUEBLES Y ENSERES, NETO', '', 4, 'control', 'ninguno', 1),
(12202001, 'MUEBLES DE OFICINA', '', 5, 'control', 'ninguno', 1),
(12202002, 'MUEBLES DE TIENDA', '', 5, 'control', 'ninguno', 1),
(12203000, 'VEHICULOS, NETO', '', 4, 'control', 'ninguno', 1),
(12203001, 'VEHICULO SEDAN', '', 5, 'control', 'ninguno', 1),
(12203002, 'VEHICULO CAMIONETA', '', 5, 'control', 'ninguno', 1),
(12204000, 'EQUIPO DE COMPUTACION, NETO', '', 4, 'control', 'ninguno', 1),
(12204001, 'SERVIDOR PRINCIPAL', '', 5, 'control', 'ninguno', 1),
(12204002, 'EQUIPO DE OFICINA', '', 5, 'control', 'ninguno', 1),
(12204003, 'EQUIPO DE COMPUTO', '', 5, 'control', 'ninguno', 1),
(12205000, 'EQUIPO DE COMUNICACION, NETO', '', 4, 'control', 'ninguno', 1),
(12205001, 'CENTRAL TELEFONICA', '', 5, 'control', 'ninguno', 1),
(12205002, 'RADIOS COMUNICADORES', '', 5, 'control', 'ninguno', 1),
(12205003, 'EQUIPO DE COMUNICACIÓN', '', 5, 'control', 'ninguno', 1),
(12206000, 'HERRAMIENTAS, NETO', '', 4, 'control', 'ninguno', 1),
(12206001, 'HERRAMIENTAS MANUALES', '', 5, 'control', 'ninguno', 1),
(12206002, 'HERRAMIENTAS ELECTRICAS', '', 5, 'control', 'ninguno', 1),
(12206003, 'EQUIPO DE SEGURIDAD', '', 5, 'control', 'ninguno', 1),
(12300000, 'CARGOS DIFERIDOS', '', 3, 'control', 'ninguno', 1),
(12301000, 'GASTOS PAGADOS POR ADELANTADO', '', 4, 'control', 'ninguno', 1),
(12301001, 'SEGUROS PAGADOS POR ADELANTADO', '', 5, 'control', 'ninguno', 1),
(12301002, 'ALQUILERES PAGADOS POR ADELANTADO', '', 5, 'control', 'ninguno', 1),
(12302000, 'GASTOS DE ORGANIZACION', '', 4, 'control', 'ninguno', 1),
(12302001, 'GASTOS DE CONSTITUCION', '', 5, 'control', 'ninguno', 1),
(12302002, 'GASTOS DE INSTALACION', '', 5, 'control', 'ninguno', 1),
(12303000, 'OTROS GASTOS DIFERIDOS', '', 4, 'control', 'ninguno', 1),
(12303001, 'GASTOS DE PUBLICIDAD', '', 5, 'control', 'ninguno', 1),
(12303002, 'GASTOS DE CAPACITACION', '', 5, 'control', 'ninguno', 1),
(12303003, 'DERECHOS DE AUTOR', '', 5, 'control', 'ninguno', 1),
(12304001, 'PATENTE EMPRESARIAL', '', 5, 'control', 'ninguno', 1),
(12304002, 'PATENTE TECNOLOGICA', '', 5, 'control', 'ninguno', 1),
(12304003, 'LICENCIAS DE SOFTWARE', '', 5, 'control', 'ninguno', 1),
(12401001, 'ACCIONES CORPORATIVAS', '', 5, 'control', 'ninguno', 1),
(12401002, 'BONOS CORPORATIVOS', '', 5, 'control', 'ninguno', 1),
(20000000, 'PASIVO', '', 1, 'control', 'ninguno', 1),
(21000000, 'PASIVO CORRIENTE', '', 2, 'control', 'ninguno', 1),
(21100000, 'DEUDAS COMERCIALES', '', 3, 'control', 'ninguno', 1),
(21101000, 'PROVEEDORES', '', 4, 'control', 'ninguno', 1),
(21101001, 'CXP A PROVEEDOR A', '', 5, 'control', 'ninguno', 1),
(21101002, 'CXP A PROVEEDOR B', '', 5, 'control', 'ninguno', 1),
(21101003, 'HONORARIOS POR PAGAR', '.', 5, 'control', 'ninguno', 1),
(21101005, 'SERVICIOS POR PAGAR', '.', 5, 'control', 'ninguno', 1),
(21101006, 'PROVEEDORES COMERCIALES', '.', 5, 'control', 'ninguno', 1),
(21102000, 'OTRAS CUENTAS POR PAGAR', '', 4, 'control', 'ninguno', 1),
(21102001, 'PROVEEDOR DE SERVICIOS A', '', 5, 'control', 'ninguno', 1),
(21102002, 'PROVEEDOR DE SERVICIOS B', '', 5, 'control', 'ninguno', 1),
(21200000, 'DEUDAS TRIBUTARIAS', '', 3, 'control', 'ninguno', 1),
(21201000, 'IVA POR PAGAR', '', 4, 'control', 'ninguno', 1),
(21201001, 'IMPUESTOS POR PAGAR', '', 5, 'control', 'ninguno', 1),
(21201002, 'RETENCIONES POR PAGAR', '', 5, 'control', 'ninguno', 1),
(21202000, 'IT POR PAGAR', '', 4, 'control', 'ninguno', 1),
(21203000, 'RETENCIONES POR PAGAR', '', 4, 'control', 'ninguno', 1),
(21203002, 'RETENCION IT', '.', 5, 'control', 'ninguno', 1),
(21203003, 'RETENCION IUE BIENES', '.', 5, 'control', 'ninguno', 1),
(21204000, 'IUE POR PAGAR', '', 4, 'control', 'ninguno', 1),
(21300000, 'DEUDAS SOCIALES', '', 3, 'control', 'ninguno', 1),
(21301000, 'SUELDOS POR PAGAR', '', 4, 'control', 'ninguno', 1),
(21301001, 'SUELDOS POR PAGAR', '', 5, 'control', 'ninguno', 1),
(21301002, 'AGUINALDOS POR PAGAR', '', 5, 'control', 'ninguno', 1),
(21302000, 'AGUINALDOS POR PAGAR', '', 4, 'control', 'ninguno', 1),
(21302001, 'OTROS BENEFICIOS SOCIALES POR PAGAR', '', 5, 'control', 'ninguno', 1),
(21303000, 'OTROS BENEFICIOS SOCIALES POR PAGAR', '', 4, 'control', 'ninguno', 1),
(21304000, 'BONOS POR PAGAR', '', 4, 'control', 'ninguno', 1),
(21305000, 'PROVISIONES PARA DEMANDAS', '', 4, 'control', 'ninguno', 1),
(21400000, 'DEUDAS FINANCIERAS', '', 3, 'control', 'ninguno', 1),
(21401000, 'PRESTAMOS BANCARIOS', '', 4, 'control', 'ninguno', 1),
(21401001, 'PRESTAMOS BANCARIOS', '', 5, 'control', 'ninguno', 1),
(21402000, 'DEUDA A LARGO PLAZO', '', 4, 'control', 'ninguno', 1),
(22000000, 'PASIVO NO CORRIENTE', '', 2, 'control', 'ninguno', 1),
(22100000, 'DEUDAS SOCIALES', '', 3, 'control', 'ninguno', 1),
(22101000, 'OTROS PASIVOS A LARGO PLAZO', '', 4, 'control', 'ninguno', 1),
(22101001, 'OTROS PASIVOS A LARGO PLAZO', '', 5, 'control', 'ninguno', 1),
(22102000, 'OBLIGACIONES LABORALES', '', 4, 'control', 'ninguno', 1),
(22200000, 'DEUDAS FINANCIERAS', '', 3, 'control', 'ninguno', 1),
(30000000, 'PATRIMONIO', '', 1, 'control', 'ninguno', 1),
(31000000, 'PATRIMONIO INSTITUCIONAL', '', 2, 'control', 'ninguno', 1),
(31100000, 'CAPITAL', '', 3, 'control', 'ninguno', 1),
(31101000, 'CAPITAL SOCIAL', '', 4, 'control', 'ninguno', 1),
(31101001, 'CAPITAL SOCIAL', '', 5, 'control', 'ninguno', 1),
(31101002, 'APORTE B', '.', 5, 'control', 'ninguno', 1),
(31101007, 'APORTE A', '.', 1, 'control', 'ninguno', 1),
(31101009, 'APORTE C', '.', 5, 'control', 'ninguno', 1),
(31200000, 'RESERVAS', '', 3, 'control', 'ninguno', 1),
(31201000, 'RESERVA LEGAL', '', 4, 'control', 'ninguno', 1),
(31201001, 'RESERVA LEGAL', '', 5, 'control', 'ninguno', 1),
(31201002, 'RESERVA VOLUNTARIA', '', 5, 'control', 'ninguno', 1),
(31202000, 'RESERVA VOLUNTARIA', '', 4, 'control', 'ninguno', 1),
(31203000, 'RESERVA PARA CONTINGENCIAS', '', 4, 'control', 'ninguno', 1),
(31300000, 'RESULTADOS ACUMULADOS', '', 3, 'control', 'ninguno', 1),
(31301000, 'RESULTADOS DE EJERCICIOS ANTERIORES', '', 4, 'control', 'ninguno', 1),
(31301001, 'RESULTADOS DE EJERCICIOS ANTERIORES', '', 5, 'control', 'ninguno', 1),
(31302000, 'RESULTADO DEL EJERCICIO', '', 4, 'control', 'ninguno', 1),
(40000000, 'INGRESOS', '', 1, 'control', 'ninguno', 1),
(41000000, 'INGRESOS OPERATIVOS', '', 2, 'control', 'ninguno', 1),
(41100000, 'VENTA DE BIENES', '', 3, 'control', 'ninguno', 1),
(41101000, 'VENTAS LOCALES', '', 4, 'control', 'ninguno', 1),
(41101001, 'VENTAS LOCALES', '', 5, 'control', 'ninguno', 1),
(41102000, 'EXPORTACIONES', '', 4, 'control', 'ninguno', 1),
(41102001, 'EXPORTACIONES', '', 5, 'control', 'ninguno', 1),
(41103000, 'VENTAS DE PRODUCTOS TERMINADOS', '', 4, 'control', 'ninguno', 1),
(41200000, 'VENTA DE SERVICIOS', '', 3, 'control', 'ninguno', 1),
(41201000, 'SERVICIOS LOCALES', '', 4, 'control', 'ninguno', 1),
(41201001, 'SERVICIOS LOCALES', '', 5, 'control', 'ninguno', 1),
(41202000, 'SERVICIOS DE EXPORTACION', '', 4, 'control', 'ninguno', 1),
(41202001, 'SERVICIOS DE EXPORTACION', '', 5, 'control', 'ninguno', 1),
(41203000, 'SERVICIOS DE CONSULTORÍA', '', 4, 'control', 'ninguno', 1),
(42000000, 'INGRESOS NO OPERATIVOS', '', 2, 'control', 'ninguno', 1),
(42100000, 'REEXPRESION MONETARIA', '', 3, 'control', 'ninguno', 1),
(42101000, 'REEXPRESION MONETARIA POSITIVA', '', 4, 'control', 'ninguno', 1),
(42101001, 'REEXPRESION MONETARIA POSITIVA', '', 5, 'control', 'ninguno', 1),
(42200000, 'OTROS INGRESOS', '', 3, 'control', 'ninguno', 1),
(42201000, 'OTROS INGRESOS', '', 4, 'control', 'ninguno', 1),
(42201001, 'OTROS INGRESOS', '', 5, 'control', 'ninguno', 1),
(42202000, 'INGRESOS POR ARRENDAMIENTO', '', 4, 'control', 'ninguno', 1),
(42203000, 'INGRESOS POR REGALÍAS', '', 4, 'control', 'ninguno', 1),
(50000000, 'EGRESOS', '', 1, 'control', 'ninguno', 1),
(51000000, 'EGRESOS OPERATIVOS', '', 2, 'control', 'ninguno', 1),
(51100000, 'COSTO DE VENTAS', '', 3, 'control', 'ninguno', 1),
(51101000, 'COSTO DE MERCADERIAS VENDIDAS', '', 4, 'control', 'ninguno', 1),
(51101001, 'COSTO DE MERCADERIAS VENDIDAS', '', 5, 'control', 'ninguno', 1),
(51102000, 'COSTO DE PRODUCCION VENDIDA', '', 4, 'control', 'ninguno', 1),
(51102001, 'COSTO DE PRODUCCION VENDIDA', '', 5, 'control', 'ninguno', 1),
(51103000, 'COSTO DE SERVICIOS VENDIDOS', '', 4, 'control', 'ninguno', 1),
(51103001, 'COSTO DE SERVICIOS VENDIDOS', '', 5, 'control', 'ninguno', 1),
(51104000, 'COSTO DE MATERIA PRIMA', '', 4, 'control', 'ninguno', 1),
(51105000, 'COSTO DE PRODUCTOS TERMINADOS', '', 4, 'control', 'ninguno', 1),
(51200000, 'GASTOS ADMINISTRATIVOS', '', 3, 'control', 'ninguno', 1),
(51201000, 'GASTOS DE ADMINISTRACION', '', 4, 'control', 'ninguno', 1),
(51201001, 'GASTOS DE ADMINISTRACION', '', 5, 'control', 'ninguno', 1),
(51202000, 'GASTOS DE VENTAS', '', 4, 'control', 'ninguno', 1),
(51202001, 'GASTOS DE VENTAS', '', 5, 'control', 'ninguno', 1),
(51202002, 'SERVICIOS BASICOS', '.', 5, 'control', 'ninguno', 1),
(51203000, 'GASTOS DE DISTRIBUCION', '', 4, 'control', 'ninguno', 1),
(51203001, 'GASTOS DE DISTRIBUCION', '', 5, 'control', 'ninguno', 1),
(51204000, 'GASTOS DE PERSONAL', '', 4, 'control', 'ninguno', 1),
(51204001, 'GASTOS DE PERSONAL', '', 5, 'control', 'ninguno', 1),
(51205000, 'GASTOS DE MANTENIMIENTO', '', 4, 'control', 'ninguno', 1),
(51205001, 'GASTOS DE MANTENIMIENTO', '', 5, 'control', 'ninguno', 1),
(51206000, 'GASTOS LEGALES', '', 4, 'control', 'ninguno', 1),
(51207000, 'GASTOS DE AUDITORÍA', '', 4, 'control', 'ninguno', 1),
(51215001, 'HONORARIOS', '.', 5, 'control', 'ninguno', 1),
(51300000, 'GASTOS DE COMERCIALIZACION', '', 3, 'control', 'ninguno', 1),
(51301000, 'GASTOS DE MARKETING', '', 4, 'control', 'ninguno', 1),
(51301001, 'GASTOS DE MARKETING', '', 5, 'control', 'ninguno', 1),
(51302000, 'GASTOS DE PUBLICIDAD', '', 4, 'control', 'ninguno', 1),
(51302001, 'GASTOS DE PUBLICIDAD', '', 5, 'control', 'ninguno', 1),
(51303000, 'GASTOS DE RELACIONES PÚBLICAS', '', 4, 'control', 'ninguno', 1),
(51400000, 'GASTOS FINANCIEROS', '', 3, 'control', 'ninguno', 1),
(51401000, 'INTERESES POR PAGAR', '', 4, 'control', 'ninguno', 1),
(51401001, 'INTERESES POR PAGAR', '', 5, 'control', 'ninguno', 1),
(51402000, 'GASTOS DE COMISIONES', '', 4, 'control', 'ninguno', 1),
(51402001, 'GASTOS DE COMISIONES', '', 5, 'control', 'ninguno', 1),
(51403000, 'GASTOS BANCARIOS', '', 4, 'control', 'ninguno', 1),
(51403001, 'GASTOS BANCARIOS', '', 5, 'control', 'ninguno', 1),
(51404000, 'GASTOS POR DIFERENCIA DE CAMBIO', '', 4, 'control', 'ninguno', 1),
(51404001, 'GASTOS POR DIFERENCIA DE CAMBIO', '', 5, 'control', 'ninguno', 1),
(51405000, 'GASTOS DE SEGUROS', '', 4, 'control', 'ninguno', 1),
(51406000, 'GASTOS DE TRANSPORTE', '', 4, 'control', 'ninguno', 1),
(52000000, 'EGRESOS NO OPERATIVOS', '', 2, 'control', 'ninguno', 1),
(52100000, 'REEXPRESION MONETARIA', '', 3, 'control', 'ninguno', 1),
(52101000, 'REEXPRESION MONETARIA NEGATIVA', '', 4, 'control', 'ninguno', 1),
(52101001, 'REEXPRESION MONETARIA NEGATIVA', '', 5, 'control', 'ninguno', 1),
(52201001, 'OTROS EGRESOS', '', 5, 'control', 'ninguno', 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tusuario`
--

CREATE TABLE `tusuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tusuario`
--

INSERT INTO `tusuario` (`idusuario`, `nombre`, `usuario`, `password`) VALUES
(2, 'Juan Manuel ', 'admin', '123');

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
  MODIFY `idcomprobante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tcomprobantes_`
--
ALTER TABLE `tcomprobantes_`
  MODIFY `idcomprobante_` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `tcuentas`
--
ALTER TABLE `tcuentas`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52201002;

--
-- AUTO_INCREMENT de la tabla `tempresa`
--
ALTER TABLE `tempresa`
  MODIFY `idempresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tusuario`
--
ALTER TABLE `tusuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tcomprobantes_`
--
ALTER TABLE `tcomprobantes_`
  ADD CONSTRAINT `tcomprobantes__ibfk_1` FOREIGN KEY (`codcomprobante`) REFERENCES `tcomprobantes` (`idcomprobante`),
  ADD CONSTRAINT `tcomprobantes__ibfk_2` FOREIGN KEY (`codcta`) REFERENCES `tcuentas` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
