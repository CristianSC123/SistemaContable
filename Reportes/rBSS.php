<?php
require('../fpdf186/fpdf.php');

class PDF extends FPDF
{
    private $headerData = [];
    public $sumaDebe = 0;
    public $sumaHaber = 0;
    public $sumaDeudor = 0;
    public $sumaAcreedor = 0;

    function setHeaderData($data)
    {
        $this->headerData = $data;
    }

    function getSuma($tipo)
    {
        switch ($tipo) {
            case 'Debe':
                return $this->sumaDebe;
            case 'Haber':
                return $this->sumaHaber;
            case 'Deudor':
                return $this->sumaDeudor;
            case 'Acreedor':
                return $this->sumaAcreedor;
            default:
                return 0;
        }
    }

    function Header()
    {
        $this->Image('../img/logo.jpg',10,0,33);
        $this->SetFont('Arial', 'B', 18);
        $this->Cell(0, 10, 'Informe de Balance de Sumas y saldos', 0, 1, 'C');
        $this->SetFont('Arial', '', 10);

        $this->Ln(10);
        $this->SetFont('Arial', 'B', 10);
        $this->Cell(30, 10, 'Codigo', 1, 0, 'C');
        $this->Cell(70, 10, 'Nombre Cuenta', 1, 0, 'C');
        $this->Cell(20, 10, 'Debe', 1, 0, 'C');
        $this->Cell(20, 10, 'Haber', 1, 0, 'C');
        $this->Cell(20, 10, 'Deudor', 1, 0, 'C');
        $this->Cell(20, 10, 'Acreedor', 1, 1, 'C');
    }

    function Footer()
    {
        $this->SetY(-15);
        $this->SetFont('Arial', 'I', 8);
        $this->Cell(0, 10, utf8_decode('Página ') . $this->PageNo() . '/{nb}', 0, 0, 'C');
    }
}

require_once "../cone.php";


$consulta_mayor = "
    SELECT codigo AS Codigo, nombrecuenta AS 'Nombre Cuenta', 
           SUM(COALESCE(debeml, 0)) AS Debe, 
           SUM(COALESCE(haberml, 0)) AS Haber, 
           SUM(COALESCE(debeml, 0)) - SUM(COALESCE(haberml, 0)) AS Deudor, 
           0 AS Acreedor 
    FROM tcuentas 
    LEFT JOIN tcomprobantes_ ON tcuentas.codigo = tcomprobantes_.codcta 
    GROUP BY codigo, nombrecuenta 
    HAVING Deudor > 0 
    UNION ALL 
    SELECT codigo AS Codigo, nombrecuenta AS 'Nombre Cuenta', 
           SUM(COALESCE(debeml, 0)) AS Debe, 
           SUM(COALESCE(haberml, 0)) AS Haber, 
           0 AS Deudor, 
           SUM(COALESCE(haberml, 0)) - SUM(COALESCE(debeml, 0)) AS Acreedor 
    FROM tcuentas 
    LEFT JOIN tcomprobantes_ ON tcuentas.codigo = tcomprobantes_.codcta 
    GROUP BY codigo, nombrecuenta 
    HAVING Acreedor > 0";

$resultado = $conn->query($consulta_mayor);

$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();


$headerData = [];
$pdf->setHeaderData($headerData);

$pdf->SetFont('Arial', '', 10);

while ($row = $resultado->fetch_assoc()) {
    $pdf->Cell(30, 10, $row['Codigo'], 1, 0, 'C');
    $pdf->Cell(70, 10, $row['Nombre Cuenta'], 1, 0, 'C');
    $pdf->Cell(20, 10, number_format($row['Debe'], 2, ',', '.'), 1, 0, 'R');
    $pdf->Cell(20, 10, number_format($row['Haber'], 2, ',', '.'), 1, 0, 'R');
    $pdf->Cell(20, 10, number_format($row['Deudor'], 2, ',', '.'), 1, 0, 'R');
    $pdf->Cell(20, 10, number_format($row['Acreedor'], 2, ',', '.'), 1, 1, 'R');

    // Actualizar las sumas
       // Actualizar las sumas
       $pdf->sumaDebe += $row['Debe'];
       $pdf->sumaHaber += $row['Haber'];
       $pdf->sumaDeudor += $row['Deudor'];
       $pdf->sumaAcreedor += $row['Acreedor'];
   }
   
   // Sumas al final
   $pdf->Cell(100, 10, 'TOTALES:', 1, 0, 'R');
   $pdf->Cell(20, 10, number_format($pdf->getSuma('Debe'), 2, ',', '.'), 1, 0, 'R');
   $pdf->Cell(20, 10, number_format($pdf->getSuma('Haber'), 2, ',', '.'), 1, 0, 'R');
   $pdf->Cell(20, 10, number_format($pdf->getSuma('Deudor'), 2, ',', '.'), 1, 0, 'R');
   $pdf->Cell(20, 10, number_format($pdf->getSuma('Acreedor'), 2, ',', '.'), 1, 1, 'R');
   
   $pdf->Output('I', 'rBSS.pdf');
   ?>
   
