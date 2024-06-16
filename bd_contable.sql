-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-06-2024 a las 04:35:09
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tcomprobantes`
--

INSERT INTO `tcomprobantes` (`idcomprobante`, `codtipocomprobante`, `nocomprobante`, `fecha`, `tc`, `senior`, `glosag`, `estadoasiento`) VALUES
(7, 'Egreso', 1, '2024-06-14', 7, 'ghyjgh', 'ewr', 'm'),
(8, 'Egreso', 2, '2024-06-14', 7, 'ghyjgh', 'grrwg', 'm'),
(9, 'Traspaso', 1, '2024-06-14', 7, 'dsf', 'hjkjhk', 'm'),
(10, 'Traspaso', 1, '2024-06-14', 7, 'dsf', 'hjkjhk', 'm'),
(11, 'Egreso', 2, '2024-06-14', 7, 'ghyjgh', 'hgj', 'fgh');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcomprobantes_`
--

CREATE TABLE `tcomprobantes_` (
  `idcomprobante_` int(11) NOT NULL,
  `codcomprobante` int(11) NOT NULL,
  `codcta` int(11) NOT NULL,
  `glosad` varchar(255) NOT NULL,
  `debeml` double NOT NULL,
  `haberml` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tcuentas`
--

INSERT INTO `tcuentas` (`codigo`, `nombrecuenta`, `descripcion`, `nivel`, `agrupado`, `tipoactualizacion`, `habilitado`) VALUES
(10000000, 'ACTIVO', '', 1, 'control', 'ninguno', 1),
(11000000, 'ACTIVO CORRIENTE', '', 2, 'control', 'ninguno', 1),
(11100000, 'DISPONIBLE', '', 3, 'control', 'ninguno', 1),
(11101000, 'CAJA', '', 4, 'control', 'ninguno', 1),
(11101001, 'CAJA CHICA', '', 5, 'detalle', 'mn', 1),
(11101002, 'FONDO FIJO', '', 5, 'detalle', 'mn', 1),
(11101003, 'CAJA MN', '', 5, 'detalle', 'mn', 1),
(11101004, 'CAJA ME', '', 5, 'detalle', 'me', 1),
(11102000, 'BANCOS', '', 4, 'control', 'ninguno', 1),
(11102001, 'BANCO BNB MN', '', 5, 'detalle', 'mn', 1),
(11102002, 'BANCO BISA ME', '', 5, 'detalle', 'me', 1),
(11102003, 'BANCO MSC MN', '', 5, 'detalle', 'mn', 1),
(11102004, 'BANCO UNION ME', '', 5, 'detalle', 'me', 1),
(11200000, 'INVERSIONES TEMPORALES', '', 3, 'control', 'ninguno', 1),
(11201000, 'CLIENTES', '', 4, 'control', 'ninguno', 1),
(11201001, 'CLIENTES MN', '', 5, 'detalle', 'mn', 1),
(11201002, 'CLIENTES ME', '', 5, 'detalle', 'me', 1),
(11202000, 'VALORES DE RENTA FIJA', '', 4, 'control', 'ninguno', 1),
(11202001, 'LETRAS POR COBRAR', '', 5, 'detalle', 'mn', 1),
(11202002, 'DFP POR COBRAR', '', 5, 'detalle', 'mn', 1),
(11203000, 'VALORES DE RENTA VARIABLE', '', 4, 'control', 'ninguno', 1),
(11203001, 'ACCIONES POR COBRAR', '', 5, 'detalle', 'mn', 1),
(11300000, 'EXIGIBLE', '', 3, 'control', 'ninguno', 1),
(11301000, 'IMPUESTOS A RECUPERAR', '', 4, 'control', 'ninguno', 1),
(11301001, 'CREDITO FISCAL IVA', '', 5, 'detalle', 'mn', 1),
(11301002, 'IUE A COMPENSAR', '', 5, 'detalle', 'mn', 1),
(11302000, 'OTRAS CUENTAS POR COBRAR', '', 4, 'control', 'ninguno', 1),
(11302001, 'ANTICIPO DE PROVEEDORES', '', 5, 'detalle', 'mn', 1),
(11302002, 'ANTICIPO DE SUELDOS', '', 5, 'detalle', 'mn', 1),
(11302003, 'OTROS ANTICIPOS', '', 5, 'detalle', 'mn', 1),
(11400000, 'REALIZABLE', '', 3, 'control', 'ninguno', 1),
(11401000, 'INVENTARIOS FINALES', '', 4, 'control', 'ninguno', 1),
(11401001, 'INVENTARIO FINAL PROD A', '', 5, 'detalle', 'ufvs', 1),
(11401002, 'INVENTARIO FINAL PROD B', '', 5, 'detalle', 'ufvs', 1),
(11402000, 'INVENTARIOS EN PROCESO', '', 4, 'control', 'ninguno', 1),
(11402001, 'PRODUCTOS EN PROCESO', '', 5, 'detalle', 'ufvs', 1),
(11403000, 'INVENTARIOS EN TRANSITO', '', 4, 'control', 'ninguno', 1),
(11403001, 'MERCADERIA EN TRANSITO', '', 5, 'detalle', 'ufvs', 1),
(11500000, 'CARGOS DIFERIDOS', '', 3, 'control', 'ninguno', 1),
(11501000, 'GASTOS PAGADOS POR ADELANTADO', '', 4, 'control', 'ninguno', 1),
(11501001, 'SEGUROS PAGADOS POR ADELANTADO', '', 5, 'detalle', 'ufvs', 1),
(11501002, 'OTROS GASTOS POR ADELANTADO', '', 5, 'detalle', 'ufvs', 1),
(11502000, 'GASTOS DE ORGANIZACION', '', 4, 'control', 'ninguno', 1),
(11502001, 'GASTOS DE ORGANIZACION', '', 5, 'detalle', 'ufvs', 1),
(11502002, 'AMORT. AC. GASTOS DE ORG.', '', 5, 'detalle', 'ufvs', 1),
(11503000, 'OTROS GASTOS DIFERIDOS', '', 4, 'control', 'ninguno', 1),
(11503001, 'OTROS GASTOS DIFERIDOS', '', 5, 'detalle', 'ufvs', 1),
(12000000, 'ACTIVO NO CORRIENTE', '', 2, 'control', 'ninguno', 1),
(12100000, 'INVERSIONES PERMANENTES', '', 3, 'control', 'ninguno', 1),
(12101000, 'VALORES DE RENTA FIJA', '', 4, 'control', 'ninguno', 1),
(12101001, 'LETRAS POR COBRAR', '', 5, 'detalle', 'mn', 1),
(12101002, 'DPF POR COBRAR', '', 5, 'detalle', 'mn', 1),
(12102000, 'VALORES DE RENTA VARIABLE', '', 4, 'control', 'ninguno', 1),
(12102001, 'ACCIONES POR COBRAR', '', 5, 'detalle', 'mn', 1),
(12200000, 'ACTIVOS FIJOS', '', 3, 'control', 'ninguno', 1),
(12201000, 'EDIFICIOS, VALOR NETO', '', 4, 'control', 'ninguno', 1),
(12201001, 'EDIFICIOS', '', 5, 'detalle', 'ufvs', 1),
(12201002, 'DEP. AC. EDIFICIOS', '', 5, 'detalle', 'ufvs', 1),
(12202000, 'MUEBLES Y ENSERES, NETO', '', 4, 'control', 'ninguno', 1),
(12202001, 'MUEBLES', '', 5, 'detalle', 'ufvs', 1),
(12202002, 'DEP. AC. MUEBLES', '', 5, 'detalle', 'ufvs', 1),
(12203000, 'VEHICULOS, NETO', '', 4, 'control', 'ninguno', 1),
(12203001, 'VEHICULOS', '', 5, 'detalle', 'ufvs', 1),
(12203002, 'DEP. AC VEHICULOS', '', 5, 'detalle', 'ufvs', 1),
(12204000, 'EQUIPO DE COMPUTACION, NETO', '', 4, 'control', 'ninguno', 1),
(12204001, 'EQUIPO DE COMPUTACION', '', 5, 'detalle', 'ufvs', 1),
(12204002, 'DEP AC EQUIPO DE COMPUTACION', '', 5, 'detalle', 'ufvs', 1),
(12205000, 'EQUIPO DE COMUNICACION, NETO', '', 4, 'control', 'ninguno', 1),
(12205001, 'EQUIPO DE COMUNICACION', '', 5, 'detalle', 'ufvs', 1),
(12205002, 'DEP AC EQUIPO DE COMUNICACION', '', 5, 'detalle', 'ufvs', 1),
(12206000, 'HERRAMIENTAS, NETO', '', 4, 'control', 'ninguno', 1),
(12206001, 'HERRAMIENTAS', '', 5, 'detalle', 'ufvs', 1),
(12206002, 'DEP AC HERRAMIENTAS', '', 5, 'detalle', 'ufvs', 1),
(12300000, 'CARGOS DIFERIDOS', '', 3, 'control', 'ninguno', 1),
(12301000, 'GASTOS PAGADOS POR ADELANTADO', '', 4, 'control', 'ninguno', 1),
(12301001, 'SEGUROS PAGADOS POR ADELANTADO', '', 5, 'detalle', 'ufvs', 1),
(12301002, 'OTROS GASTOS POR ADELANTADO', '', 5, 'detalle', 'ufvs', 1),
(12302000, 'GASTOS DE ORGANIZACION', '', 4, 'control', 'ninguno', 1),
(12302001, 'GASTOS DE ORGANIZACION', '', 5, 'detalle', 'u', 1),
(12302002, 'AMORT AC GASTOS DE ORG', '', 5, 'detalle', 'u', 1),
(12303000, 'OTROS GASTOS DIFERIDOS', '', 4, 'control', 'ninguno', 1),
(12303001, 'OTROS GASTOS DIFERIDOS', '', 5, 'detalle', 'u', 1),
(20000000, 'PASIVO', '', 1, 'control', 'ninguno', 1),
(21000000, 'PASIVO CORRIENTE', '', 2, 'control', 'ninguno', 1),
(21100000, 'DEUDAS COMERCIALES', '', 3, 'control', 'ninguno', 1),
(21101000, 'PROVEEDORES', '', 4, 'control', 'ninguno', 1),
(21101001, 'PROVEEDORES COMERCIALES', '', 5, 'detalle', 'mn', 1),
(21101002, 'SERVICIOS POR PAGAR', '', 5, 'detalle', 'mn', 1),
(21101003, 'HONORARIOS POR PAGAR', '', 5, 'detalle', 'mn', 1),
(21102000, 'OTRAS CUENTAS POR PAGAR', '', 4, 'control', 'ninguno', 1),
(21102001, 'CTA SOCIOS POR PAGAR', '', 5, 'detalle', 'mn', 1),
(21102002, 'OTRAS CUENTAS POR PAGAR', '', 5, 'detalle', 'mn', 1),
(21200000, 'DEUDAS TRIBUTARIAS', '', 3, 'control', 'ninguno', 1),
(21201000, 'IVA POR PAGAR', '', 4, 'control', 'ninguno', 1),
(21201001, 'DEBITO FISCAL IVA ', '', 5, 'detalle', 'mn', 1),
(21202000, 'IT POR PAGAR', '', 4, 'control', 'ninguno', 1),
(21202001, 'IT POR PAGAR', '', 5, 'detalle', 'mn', 1),
(21203000, 'RETENCIONES POR PAGAR', '', 4, 'control', 'ninguno', 1),
(21203001, 'RETENCION RCIVA', '', 5, 'detalle', 'mn', 1),
(21203002, 'RETENCION IT', '', 5, 'detalle', 'mn', 1),
(21203003, 'RETENCION IUE', '', 5, 'detalle', 'mn', 1),
(21204000, 'IUE POR PAGAR', '', 4, 'control', 'ninguno', 1),
(21204001, 'IUE POR PAGAR', '', 5, 'detalle', 'mn', 1),
(21300000, 'DEUDAS SOCIALES', '', 3, 'control', 'ninguno', 1),
(21301000, 'SUELDOS POR PAGAR', '', 4, 'control', 'ninguno', 1),
(21301001, 'SUELDO EMPLEADO A POR PAGAR', '', 5, 'detalle', 'mn', 1),
(21301002, 'SUELDO EMPLEADO B POR PAGAR', '', 5, 'detalle', 'mn', 1),
(21302000, 'CARGAS POR PAGAR', '', 4, 'control', 'ninguno', 1),
(21302001, 'CNS POR PAGAR', '', 5, 'detalle', 'mn', 1),
(21302002, 'GESTORA POR PAGAR', '', 5, 'detalle', 'mn', 1),
(21303000, 'BENEFICIOS POR PAGAR', '', 4, 'control', 'ninguno', 1),
(21303001, 'AGUINALDOS POR PAGAR', '', 5, 'detalle', 'mn', 1),
(21400000, 'DEUDAS FINANCIERAS', '', 3, 'control', 'ninguno', 1),
(21401000, 'INTERESES POR PAGAR', '', 4, 'control', 'ninguno', 1),
(21401001, 'INTERESES BANCARIOS POR PAGAR', '', 5, 'detalle', 'mn', 1),
(21402000, 'RECARGOS POR PAGAR', '', 4, 'control', 'ninguno', 1),
(21402001, 'GASTOS FINANCIEROS POR PAGAR', '', 5, 'detalle', 'mn', 1),
(21402002, 'MULTAS FINANCIERAS POR PAGAR', '', 5, 'detalle', 'mn', 1),
(21402003, 'OTROS RECARGOS POR PAGAR', '', 5, 'detalle', 'mn', 1),
(22000000, 'PASIVO NO CORRIENTE', '', 2, 'control', 'ninguno', 1),
(22100000, 'DEUDAS SOCIALES', '', 3, 'control', 'ninguno', 1),
(22101000, 'PREVISION PARA INDEMNIZACIONES', '', 4, 'control', 'ninguno', 1),
(22101001, 'PREVISION PARA INDEMNIZACIONES', '', 5, 'detalle', 'mn', 1),
(22200000, 'DEUDAS FINANCIERAS', '', 3, 'control', 'ninguno', 1),
(22201000, 'INTERESES POR PAGAR', '', 4, 'control', 'ninguno', 1),
(22201001, 'INTERESES BANCARIOS POR PAGAR', '', 5, 'detalle', 'mn', 1),
(22202000, 'RECARGOS POR PAGAR', '', 4, 'control', 'ninguno', 1),
(22202001, 'GASTOS FINANCIEROS POR PAGAR', '', 5, 'detalle', 'mn', 1),
(22202002, 'MULTAS FINANCIERAS POR PAGAR', '', 5, 'detalle', 'mn', 1),
(22202003, 'OTROS RECARGOS POR PAGAR', '', 5, 'detalle', 'mn', 1),
(30000000, 'PATRIMONIO', '', 1, 'control', 'ninguno', 1),
(31000000, 'PATRIMONIO INSTITUCIONAL', '', 2, 'control', 'ninguno', 1),
(31100000, 'CAPITAL', '', 3, 'control', 'ninguno', 1),
(31101000, 'APORTES SOCIOS', '', 4, 'control', 'ninguno', 1),
(31101001, 'APORTE SOCIO A', '', 5, 'detalle', 'capital', 1),
(31101002, 'APORTE SOCIO B', '', 5, 'detalle', 'capital', 1),
(31101003, 'APORTE SOCIO C', '', 5, 'detalle', 'capital', 1),
(31102000, 'AJUSTE DE CAPITAL', '', 4, 'control', 'ninguno', 1),
(31102001, 'AJUSTE DE CAPITAL', '', 5, 'detalle', 'capital', 1),
(31200000, 'RESERVAS', '', 3, 'control', 'ninguno', 1),
(31201000, 'RESERVA LEGAL', '', 4, 'control', 'ninguno', 1),
(31201001, 'RESERVA LEGAL', '', 5, 'detalle', 'reservas', 1),
(31202000, 'RESERVA ESTATUTARIA', '', 4, 'control', 'ninguno', 1),
(31202001, 'RESERVA POR INCREMENTO DE CAPITAL', '', 5, 'detalle', 'reservas', 1),
(31202002, 'REVALORIZACION DE ACTIVOS FIJIOS', '', 5, 'detalle', 'reservas', 1),
(31203000, 'AJUSTE DE RESERVAS', '', 4, 'control', 'ninguno', 1),
(31203001, 'AJUSTE DE RESERVAS PATRIMONIALES', '', 5, 'detalle', 'reservas', 1),
(31300000, 'RESULTADOS ACUMULADOS', '', 3, 'control', 'ninguno', 1),
(31301000, 'RESULTADO GESTIONES ANTERIORES', '', 4, 'control', 'ninguno', 1),
(31301001, 'RESULTADO GESTION 2021', '', 5, 'detalle', 'resultados acumulados', 1),
(31301002, 'RESULTADO GESTION 2021', '', 5, 'detalle', 'resultados acumulados', 1),
(31301003, 'RESULTADOS ACUMULADOS', '', 5, 'detalle', 'resultados acumulados', 1),
(31302000, 'AJUSTE DE RESULTADOS ACUMULADOS', '', 4, 'control', 'ninguno', 1),
(31302001, 'RESULTADOS ACUMULADOS', '', 5, 'detalle', 'resultados acumulados', 1),
(40000000, 'INGRESOS', '', 1, 'control', 'ninguno', 1),
(41000000, 'INGRESOS OPERATIVOS', '', 2, 'control', 'ninguno', 1),
(41100000, 'VENTA DE BIENES', '', 3, 'control', 'ninguno', 1),
(41101000, 'VENTA DE BIENES REALIZADOS', '', 4, 'control', 'ninguno', 1),
(41101001, 'VENTA DE BIENES REALIZADOS', '', 5, 'detalle', 'ufvs', 1),
(41102000, 'VENTA DE BIENES EN CURSO', '', 4, 'control', 'ninguno', 1),
(41102001, 'VENTA DE BIENES EN CURSO', '', 5, 'detalle', 'ufvs', 1),
(41200000, 'VENTA DE SERVICIOS', '', 3, 'control', 'ninguno', 1),
(41201000, 'VENTA DE SERVICIOS REALIZADOS', '', 4, 'control', 'ninguno', 1),
(41201001, 'VENTA DE SERVICIOS REALIZADOS', '', 5, 'detalle', 'ufvs', 1),
(41202000, 'VENTA DE SERVICIOS EN CURSO', '', 4, 'control', 'ninguno', 1),
(41202001, 'VENTA DE SERVICIOS EN CURSO', '', 5, 'detalle', 'ufvs', 1),
(42000000, 'INGRESOS NO OPERATIVOS', '', 2, 'control', 'ninguno', 1),
(42100000, 'REEXPRESION MONETARIA', '', 3, 'control', 'ninguno', 1),
(42101000, 'AJUSTE POR INFLACION ', '', 4, 'control', 'ninguno', 1),
(42101001, 'AJUSTE POR INFLACION', '', 5, 'detalle', 'ufvs', 1),
(42102000, 'DIFERENCIA DE CAMBIO', '', 4, 'control', 'ninguno', 1),
(42102001, 'DIFERENCIA DE CAMBIO', '', 5, 'detalle', 'ufvs', 1),
(42103000, 'MANTENIMIENTO DE VALOR', '', 4, 'control', 'ninguno', 1),
(42103001, 'MANTENIMIENTO DE VALOR', '', 5, 'detalle', 'ufvs', 1),
(42200000, 'OTROS INGRESOS', '', 3, 'control', 'ninguno', 1),
(42201000, 'GANANCIA EN INVERSIONES', '', 4, 'control', 'ninguno', 1),
(42201001, 'GANANCIA EN INVERSIONES', '', 5, 'detalle', 'ufvs', 1),
(42202000, 'GANANCIA EN VENTA DE ACTIVOS FIJOS', '', 4, 'control', 'ninguno', 1),
(42202001, 'GANANCIA EN VENTA DE ACTIVOS FIJOS', '', 5, 'detalle', 'ufvs', 1),
(42203000, 'OTROS INGRESOS', '', 4, 'control', 'ninguno', 1),
(42203001, 'OTROS INGRESOS', '', 5, 'detalle', 'ufvs', 1),
(50000000, 'EGRESOS', '', 1, 'control', 'ninguno', 1),
(51000000, 'EGRESOS OPERATIVOS', '', 2, 'control', 'ninguno', 1),
(51100000, 'COSTO DE VENTAS', '', 3, 'control', 'ninguno', 1),
(51101000, 'COSTOS DE EXPLOTACION', '', 4, 'control', 'ninguno', 1),
(51101001, 'COSTOS DE EXPLOTACION', '', 5, 'detalle', 'ufvs', 1),
(51200000, 'GASTOS ADMINISTRATIVOS', '', 3, 'control', 'ninguno', 1),
(51201000, 'REMUNERACION', '', 4, 'control', 'ninguno', 1),
(51201001, 'SUELDOS Y SALARIOS', '', 5, 'detalle', 'ufvs', 1),
(51201002, 'CARGAS SOCIALES', '', 5, 'detalle', 'ufvs', 1),
(51201003, 'BENEFICIOS SOCIALES', '', 5, 'detalle', 'ufvs', 1),
(51201004, 'OTROS GASTOS EN PERSONAL', '', 5, 'detalle', 'ufvs', 1),
(51202000, 'MATERIALES Y SUMINISTROS', '', 4, 'control', 'ninguno', 1),
(51202001, 'MATERIALES Y SUMINISTROS', '', 5, 'detalle', 'ufvs', 1),
(51203000, 'SEGUROS PAGADOS', '', 4, 'control', 'ninguno', 1),
(51203001, 'SEGUROS PAGADOS', '', 5, 'detalle', 'ufvs', 1),
(51204000, 'DEPRECIACION', '', 4, 'control', 'ninguno', 1),
(51204001, 'DEPRECIACION EDIFICIOS', '', 5, 'detalle', 'ufvs', 1),
(51204002, 'DEPRECIACION MUEBLES', '', 5, 'detalle', 'ufvs', 1),
(51204003, 'DEPRECIACION VEHICULOS', '', 5, 'detalle', 'ufvs', 1),
(51204004, 'DEPRECIACION EQUIPO DE COMPUTACION', '', 5, 'detalle', 'ufvs', 1),
(51204005, 'DEPRECIACION EQUIPO DE COMUNICACION', '', 5, 'detalle', 'ufvs', 1),
(51204006, 'DEPRECIACION HERRAMIENTAS', '', 5, 'detalle', 'ufvs', 1),
(51205000, 'OTROS GASTOS ADMINISTRATIVOS', '', 4, 'control', 'ninguno', 1),
(51205001, 'OTROS GASTOS ADMINISTRATIVOS', '', 5, 'detalle', 'ufvs', 1),
(51300000, 'GASTOS DE COMERCIALIZACION', '', 3, 'control', 'ninguno', 1),
(51301000, 'REMUNERACION', '', 4, 'control', 'ninguno', 1),
(51301001, 'SUELDOS Y SALARIOS', '', 5, 'detalle', 'ufvs', 1),
(51301002, 'CARGAS SOCIALES', '', 5, 'detalle', 'ufvs', 1),
(51301003, 'BENEFICIOS SOCIALES', '', 5, 'detalle', 'ufvs', 1),
(51301004, 'OTROS GASTOS EN PERSONAL', '', 5, 'detalle', 'ufvs', 1),
(51302000, 'IMPUESTOS PAGADOS', '', 4, 'control', 'ninguno', 1),
(51302001, 'IMPUESTO A LAS TRANSACCIONES', '', 5, 'detalle', 'ufvs', 1),
(51303000, 'PUBLICIDAD Y PROMOCION', '', 4, 'control', 'ninguno', 1),
(51303001, 'PROPAGANDA', '', 5, 'detalle', 'ufvs', 1),
(51304000, 'OTROS GASTOS COMERCIALES', '', 4, 'control', 'ninguno', 1),
(51304001, 'MATERIAL PUBLICITARIO', '', 5, 'detalle', 'ufvs', 1),
(51304002, 'DOMINIO PAGINA WEB', '', 5, 'detalle', 'ufvs', 1),
(51304003, 'HOSTING PAGINA WEB', '', 5, 'detalle', 'ufvs', 1),
(51304004, 'OTROS GASTOS PUBLICITARIOS', '', 5, 'detalle', 'ufvs', 1),
(51400000, 'GASTOS FINANCIEROS', '', 3, 'control', 'ninguno', 1),
(51401000, 'GASTOS BANCARIOS', '', 4, 'control', 'ninguno', 1),
(51401001, 'INTERESES BANCARIOS', '', 5, 'detalle', 'ufvs', 1),
(51401002, 'COMISIONES BANCARIOS', '', 5, 'detalle', 'ufvs', 1),
(51402000, 'RECARGOS FINANCIEROS', '', 4, 'control', 'ninguno', 1),
(51402001, 'OTROS GASTOS FINANCIEROS', '', 5, 'detalle', 'ufvs', 1),
(52000000, 'EGRESOS NO OPERATIVOS', '', 2, 'control', 'ninguno', 1),
(52100000, 'REEXPRESION MONETARIA', '', 3, 'control', 'ninguno', 1),
(52101000, 'AJUSTE POR INFLACION ', '', 4, 'control', 'ninguno', 1),
(52101001, 'AJUSTE POR INFLACION', '', 5, 'detalle', 'ufvs', 1),
(52102000, 'DIFERENCIA DE CAMBIO', '', 4, 'control', 'ninguno', 1),
(52102001, 'DIFERENCIA DE CAMBIO', '', 5, 'detalle', 'ufvs', 1),
(52103000, 'MANTENIMIENTO DE VALOR', '', 4, 'control', 'ninguno', 1),
(52103001, 'MANTENIMIENTO DE VALOR', '', 5, 'detalle', 'ufvs', 1),
(52200000, 'OTROS EGRESOS', '', 3, 'control', 'ninguno', 1),
(52201000, 'PERDIDA EN INVERSIONES', '', 4, 'control', 'ninguno', 1),
(52201001, 'PERDIDA EN INVERSIONES', '', 5, 'detalle', 'ufvs', 1),
(52202000, 'PERDIDA EN VENTA DE ACTIVOS FIJOS', '', 4, 'control', 'ninguno', 1),
(52202001, 'PERDIDA EN VENTA DE ACTIVOS FIJOS', '', 5, 'detalle', 'ufvs', 1),
(52203000, 'OTROS EGRESOS', '', 4, 'control', 'ninguno', 1),
(52203001, 'GASTOS NO DEDUCIBLES', '', 5, 'detalle', 'ufvs', 1),
(52203002, 'OTROS GASTOS', '', 5, 'detalle', 'ufvs', 1);

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
  MODIFY `idcomprobante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tcomprobantes_`
--
ALTER TABLE `tcomprobantes_`
  MODIFY `idcomprobante_` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `tcuentas`
--
ALTER TABLE `tcuentas`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52203003;

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
  ADD CONSTRAINT `tcomprobantes__ibfk_2` FOREIGN KEY (`codcta`) REFERENCES `tcuentas` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
