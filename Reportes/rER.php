<?php
require('../fpdf186/fpdf.php');

class PDF extends FPDF
{
    function setHeaderData($data)
    {
        $this->headerData = $data;
    }

    function Header()
    {
        $this->Image('../img/logo.png',10,8,33);
        $this->SetFont('Arial', 'B', 18);
        $this->Cell(0, 10, 'Estado de Resultados', 0, 1, 'C');
        $this->SetFont('Arial', '', 10);

        $this->Ln(10);
        $this->SetFont('Arial', 'B', 10);
        $this->Cell(30, 10, 'Codigo', 1, 0, 'C');
        $this->Cell(80, 10, 'Nombre Cuenta', 1, 0, 'C');
        $this->Cell(50, 10, 'Debe', 1, 0, 'C');
        $this->Cell(50, 10, 'Haber', 1, 1, 'C');
    }

    function Footer()
    {
        $this->SetY(-15);
        $this->SetFont('Arial', 'I', 8);
        $this->Cell(0, 10, utf8_decode('Página ') . $this->PageNo() . '/{nb}', 0, 0, 'C');
    }

    function TotalsTable($Ingreso, $Egreso, $ER)
    {
        $this->Ln(10);
        $this->SetFont('Arial', 'B', 10);
        $this->Cell(160, 10, 'Total Ingresos', 1, 0, 'R');
        $this->Cell(50, 10, number_format($Ingreso, 2, ',', '.'), 1, 1, 'R');
        $this->Cell(160, 10, 'Total Egresos', 1, 0, 'R');
        $this->Cell(50, 10, number_format($Egreso, 2, ',', '.'), 1, 1, 'R');
        $this->Cell(160, 10, 'Resultado del Ejercicio', 1, 0, 'R');
        $this->Cell(50, 10, number_format($ER, 2, ',', '.'), 1, 1, 'R');
    }
}

require_once "../cone.php";

try {
    $query = "
        SELECT 
            tcuentas.codigo, 
            tcuentas.nombrecuenta, 
            SUM(tcomprobantes_.debeml) AS debe, 
            SUM(tcomprobantes_.haberml) AS haber
        FROM 
            tcomprobantes_
        JOIN 
            tcuentas ON tcomprobantes_.codcta = tcuentas.codigo
        GROUP BY 
            tcuentas.codigo, tcuentas.nombrecuenta
    ";

    $resultado = $conn->query($query);
    $balances = $resultado->fetch_all(MYSQLI_ASSOC);

    $totalDeudor = 0;
    $totalAcreedor = 0;
    $Activo = 0;
    $Ingreso = 0;
    $Egreso = 0;
    $GastosO = 0;
    $GastosA = 0;
    $GastosC = 0;
    $GastosF = 0;
    $OtrosE = 0;
    $Monto = 0;
    $ER = 0;

    foreach ($balances as $balance) {
        if ($balance['debe'] > $balance['haber']) {
            $totalDeudor += $balance['debe'] - $balance['haber'];
        } else {
            $totalAcreedor += $balance['haber'] - $balance['debe'];
        }

        if ($balance['codigo'] > 41101001 && $balance['codigo'] < 51101001) {
            $Monto = abs($balance['debe'] - $balance['haber']);
            $Ingreso += $Monto;
        } elseif ($balance['codigo'] > 50000000) {
            $Monto = abs($balance['debe'] - $balance['haber']);
            if ($balance['codigo'] > 50000000 && $balance['codigo'] < 51101002) {
                $GastosO += $Monto;
            } elseif ($balance['codigo'] > 51101001 && $balance['codigo'] < 51300000) {
                $GastosA += $Monto;
            } elseif ($balance['codigo'] > 51300000 && $balance['codigo'] < 51400000) {
                $GastosC += $Monto;
            } elseif ($balance['codigo'] > 51400000 && $balance['codigo'] < 51500000) {
                $GastosF += $Monto;
            } elseif ($balance['codigo'] > 51500000) {
                $OtrosE += $Monto;
            }
        }
    }

    $Egreso = $GastosO + $GastosA + $GastosC + $GastosF + $OtrosE;
    $ER = $Ingreso - $Egreso;

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();

$pdf->SetFont('Arial', '', 10);

foreach ($balances as $row) {
    $pdf->Cell(30, 10, $row['codigo'], 1, 0, 'C');
    $pdf->Cell(80, 10, utf8_decode($row['nombrecuenta']), 1, 0, 'L');
    $pdf->Cell(50, 10, number_format($row['debe'], 2, ',', '.'), 1, 0, 'R');
    $pdf->Cell(50, 10, number_format($row['haber'], 2, ',', '.'), 1, 1, 'R');
}

$pdf->TotalsTable($Ingreso, $Egreso, $ER);

$pdf->Output('I', 'EstadoResultados.pdf');
?>
