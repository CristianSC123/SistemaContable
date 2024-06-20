<?php
require('../fpdf186/fpdf.php');

class PDF extends FPDF
{
    private $ingresosTotal;
    private $egresosTotal;
    private $cuentasEgreso;

    function Header()
    {
        $this->Image('../img/logo.jpg', 10, 6, 30);
        $this->SetFont('Arial', 'B', 15);
        $this->Cell(0, 10, 'Estado de Resultados', 0, 1, 'C');
        $this->SetFont('Arial', '', 12);
        $this->Cell(0, 10, 'Fecha Inicio: 02/05/24   Fecha Fin: 02/05/24', 0, 1, 'C');
        $this->Ln(10);
    }

    function Footer()
    {
        $this->SetY(-15);
        $this->SetFont('Arial', 'I', 8);
        $this->Cell(0, 10, date('Y-m-d H:i:s'), 0, 0, 'L');
    }

    function EstadoResultados($ingresosOperativos, $ingresosNoOperativos, $egresosOperativos, $egresosNoOperativos, $resultado)
    {
        $this->SetFont('Arial', '', 12);

        // Cabecera de la tabla
        $this->SetFont('Arial', 'B', 12);
        $this->Cell(0, 10, 'Ingresos', 0, 1);

        $this->SetFont('Arial', 'B', 12);
        $this->Cell(0, 10, 'Ingresos Operativos', 0, 1);
        foreach ($ingresosOperativos as $key => $value) {
            $this->SetFont('Arial', '', 12);
            $this->Cell(100, 10, $key, 0);
            $this->Cell(30, 10, number_format($value, 2), 0, 1, 'R');
        }
        $this->Cell(100, 10, 'Total Ingresos Operativos', 1);
        $this->Cell(30, 10, number_format(array_sum($ingresosOperativos), 2), 1, 1, 'R');

        $this->SetFont('Arial', 'B', 12);
        $this->Cell(0, 10, 'Ingresos No Operativos', 0, 1);
        foreach ($ingresosNoOperativos as $key => $value) {
            $this->SetFont('Arial', '', 12);
            $this->Cell(100, 10, $key, 0);
            $this->Cell(30, 10, number_format($value, 2), 0, 1, 'R');
        }
        $this->Cell(100, 10, 'Total Ingresos No Operativos', 1);
        $this->Cell(30, 10, number_format(array_sum($ingresosNoOperativos), 2), 1, 1, 'R');

        $totalIngresos = array_sum($ingresosOperativos) + array_sum($ingresosNoOperativos);
        $this->SetFont('Arial', 'B', 12);
        $this->Cell(100, 10, 'Total Ingresos', 1);
        $this->Cell(30, 10, number_format($totalIngresos, 2), 1, 1, 'R');

        $this->Ln(5);

        $this->Cell(0, 10, 'Egresos', 0, 1);

        $this->SetFont('Arial', 'B', 12);
        $this->Cell(0, 10, 'Egresos Operativos', 0, 1);
        foreach ($egresosOperativos as $key => $value) {
            $this->SetFont('Arial', '', 12);
            $this->Cell(100, 10, $key, 0);
            $this->Cell(30, 10, number_format($value, 2), 0, 1, 'R');
        }
        $this->Cell(100, 10, 'Total Egresos Operativos', 1);
        $this->Cell(30, 10, number_format(array_sum($egresosOperativos), 2), 1, 1, 'R');

        $this->SetFont('Arial', 'B', 12);
        $this->Cell(0, 10, 'Egresos No Operativos', 0, 1);
        foreach ($egresosNoOperativos as $key => $value) {
            $this->SetFont('Arial', '', 12);
            $this->Cell(100, 10, $key, 0);
            $this->Cell(30, 10, number_format($value, 2), 0, 1, 'R');
        }
        $this->Cell(100, 10, 'Total Egresos No Operativos', 1);
        $this->Cell(30, 10, number_format(array_sum($egresosNoOperativos), 2), 1, 1, 'R');

        $totalEgresos = array_sum($egresosOperativos) + array_sum($egresosNoOperativos);
        $this->SetFont('Arial', 'B', 12);
        $this->Cell(100, 10, 'Total Egresos', 1);
        $this->Cell(30, 10, number_format($totalEgresos, 2), 1, 1, 'R');

        $this->Ln(10);
        $this->SetFont('Arial', 'B', 12);
        if ($resultado < 0) {
            $this->Cell(0, 10, 'Pérdida Neta', 0, 1, 'C');
        } else {
            $this->Cell(0, 10, 'Utilidad Neta', 0, 1, 'C');
        }
        $this->Cell(100, 10, 'Resultado Neto', 1);
        $this->Cell(30, 10, number_format($resultado, 2), 1, 1, 'R');
    }
}

require_once "../cone.php";
$sql = "SELECT tcuentas.codigo AS cod1, tcuentas.nombrecuenta, SUM( IF(LEFT(tcuentas.codigo, 1) = 1 OR LEFT(tcuentas.codigo, 1) = 5, tcomprobantes_.DebeML - tcomprobantes_.HaberML, tcomprobantes_.HaberML - tcomprobantes_.DebeML ) ) AS SumaDeSaldoEF, tcuentas.Nivel FROM tcuentas INNER JOIN tcomprobantes_ ON tcuentas.Codigo = tcomprobantes_.codcta WHERE tcuentas.Codigo BETWEEN 40000000 AND 59999999 GROUP BY tcuentas.Codigo, tcuentas.NombreCuenta, tcuentas.Nivel";

$result = $conn->query($sql);

$ingresosOperativos = array();
$egresosOperativos = array();
$egresosNoOperativos = array();
$ingresosNoOperativos = array();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $nombreCuenta = $row['nombrecuenta'];
        $saldo = floatval($row['SumaDeSaldoEF']);
        $codigo = $row['cod1'];


        if ($codigo >= 40000000 && $codigo < 41000000) {
            $ingresosOperativos[$nombreCuenta] = $saldo;
        } elseif ($codigo >= 41000000 && $codigo < 50000000) { 
            $ingresosOperativos[$nombreCuenta] = $saldo;
        } elseif ($codigo >= 51000000 && $codigo < 52000000) {
            $egresosOperativos[$nombreCuenta] = $saldo;
        } elseif ($codigo >= 52000000 && $codigo < 53000000) {
            $egresosNoOperativos[$nombreCuenta] = $saldo;
        }
    }
}


$totalIngresos = array_sum($ingresosOperativos) + array_sum($ingresosNoOperativos);
$totalEgresos = array_sum($egresosOperativos) + array_sum($egresosNoOperativos);
$resultado = $totalIngresos - $totalEgresos;

$pdf = new PDF();
$pdf->AddPage();
$pdf->SetFont('Arial', '', 12);

$pdf->EstadoResultados($ingresosOperativos, $ingresosNoOperativos, $egresosOperativos, $egresosNoOperativos, $resultado);

$pdf->Output();

$conn->close();
