<?php
require('../fpdf186/fpdf.php');

class PDF extends FPDF
{
    function Header()
    {
        $this->Image('../img/logo.png', 10, 8, 33);
        $this->SetFont('Arial', 'B', 18);
        $this->Cell(80);
        $this->Cell(30, 10, 'Libro Mayor', 0, 0, 'C');
        $this->Ln(20);
    }

    function Footer()
    {
        $this->SetY(-15);
        $this->SetFont('Arial', 'I', 8);
        $this->Cell(0, 10, utf8_decode('Página ') . $this->PageNo() . '/{nb}', 0, 0, 'C');
    }
}

require_once "../cone.php";

$consulta_mayor = "SELECT tcomprobantes_.codcta, tcuentas.nombrecuenta, tcomprobantes.fecha, tcomprobantes.idcomprobante, tcomprobantes.codtipocomprobante, 
tcomprobantes.nocomprobante, tcomprobantes.tc, tcomprobantes_.glosad, tcomprobantes_.debeml, tcomprobantes_.haberml,
IF(LEFT(tcomprobantes_.codcta, 1) = '1' OR LEFT(tcomprobantes_.codcta, 1) = '5', 'd', 'a') AS saldo,
IF(IF(LEFT(tcomprobantes_.codcta, 1) = '1' OR LEFT(tcomprobantes_.codcta, 1) = '5', 'd', 'a') = 'd',
    tcomprobantes_.debeml - tcomprobantes_.haberml,
    tcomprobantes_.haberml - tcomprobantes_.debeml
) AS saldoml
FROM tcuentas INNER JOIN tcomprobantes_ ON tcuentas.codigo = tcomprobantes_.codcta INNER JOIN tcomprobantes ON tcomprobantes.idcomprobante = tcomprobantes_.codcomprobante 
ORDER BY tcomprobantes_.codcta, tcomprobantes.fecha, tcomprobantes.idcomprobante";
$resultado = $conn->query($consulta_mayor);

$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('Arial', '', 12);

$cuentaactual = '';
$counter = 0;

while ($row = $resultado->fetch_assoc()) {
    if ($cuentaactual != $row['codcta']) {
        $counter++;
        if($counter==1){
        }else{
            $pdf->Ln();
            $pdf->Ln();
        }
        
        $cuentaactual = $row['codcta'];
        $pdf->SetFont('Arial', 'b', 12);
        $pdf->Cell(0, 10, 'Nombre Cuenta: ' . $row['nombrecuenta'], 0, 1);
        $pdf->Cell(0, 10, utf8_decode('Código de Cuenta: ') . $row['codcta'], 0, 1);
        //$pdf->Ln();
        $pdf->SetFont('Arial', 'b', 12);
        $pdf->Cell(30, 10, 'Fecha', 1, 0, 'C');
        $pdf->Cell(30, 10, 'Tipo', 1, 0, 'C'); 
        $pdf->Cell(15, 10, 'No', 1, 0, 'C');
        $pdf->Cell(15, 10, 'TC', 1, 0, 'C');
        $pdf->Cell(25, 10, 'Debe', 1, 0, 'C');
        $pdf->Cell(25, 10, 'Haber', 1, 0, 'C');
        $pdf->Cell(25, 10, 'Saldo', 1, 0, 'C');
        $pdf->Ln();
        
    }
    $pdf->SetFont('Arial', '', 12);

    $pdf->Cell(30, 10, $row['fecha'], 1, 0, 'C');
    $pdf->Cell(30, 10, $row['codtipocomprobante'], 1, 0, 'C'); 
    $pdf->Cell(15, 10, $row['nocomprobante'], 1, 0, 'C');
    $pdf->Cell(15, 10, $row['tc'], 1, 0, 'C');
    $pdf->Cell(25, 10, number_format($row['debeml'], 2, ',', '.'), 1, 0, 'C');
    $pdf->Cell(25, 10, number_format($row['haberml'], 2, ',', '.'), 1, 0, 'C');
    $pdf->Cell(25, 10, number_format($row['saldoml'], 2, ',', '.'), 1, 0, 'C');
    $pdf->Ln();
}

$pdf->Output();
