<?php
require('../fpdf186/fpdf.php');

class PDF extends FPDF
{
    private $headerData = [];

    function setHeaderData($data)
    {
        $this->headerData = $data;
    }

    function Header()
    {
        $this->Image('../img/logo.png', 15, 8, 25);
        $this->SetFont('Arial', 'B', 18);
        $this->Cell(0, 10, 'Reporte de Comprobantes', 0, 1, 'C');
        $this->SetFont('Arial', '', 10);
        $this->Cell(0, 10, 'Fecha Inicio: ' . $this->headerData['fechaInicio'] . '  Fecha Fin: ' . $this->headerData['fechaFin'], 0, 1, 'C');
        $this->Ln(10);
        $this->SetFont('Arial', 'B', 10);
        $this->Cell(30, 10, 'Fecha', 1, 0, 'C');
        $this->Cell(40, 10, 'Tipo Comprobante', 1, 0, 'C');
        $this->Cell(40, 10, 'No Comprobante', 1, 0, 'C');
        $this->Cell(10, 10, 'TC', 1, 0, 'C');
        $this->Cell(45, 10, 'Senior(a)', 1, 0, 'C');
        $this->Cell(60, 10, 'Glosa', 1, 1, 'C');
    }

    function Footer()
    {
        $this->SetY(-15);
        $this->SetFont('Arial', 'I', 8);
        $this->Cell(0, 10, utf8_decode('Página ') . $this->PageNo() . '/{nb}', 0, 0, 'C');
    }
}

require_once "../cone.php";

$consulta_comprobantes = "
    SELECT * 
    FROM tcomprobantes 
    ORDER BY fecha, idcomprobante
";

$resultado = $conn->query($consulta_comprobantes);

if (!$resultado) {
    die('Error en la consulta: ' . $conn->error);
}

$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->setHeaderData([
    'fechaInicio' => '01/04/2024',
    'fechaFin' => '31/12/2024',
]);
$pdf->AddPage('L');
$pdf->SetFont('Arial', '', 10);

while ($row = $resultado->fetch_assoc()) {
    $alturaFecha = ceil($pdf->GetStringWidth($row['fecha']) / 30);
    $alturaTipoComprobante = ceil($pdf->GetStringWidth($row['codtipocomprobante']) / 40);
    $alturaNoComprobante = ceil($pdf->GetStringWidth($row['nocomprobante']) / 30);
    $alturaTC = ceil($pdf->GetStringWidth($row['tc']) / 10);
    $alturaSenior = ceil($pdf->GetStringWidth($row['senior']) / 45);
    $alturaGlosa = $pdf->GetStringWidth($row['glosag']) / 60;

    $alturaMaxima = max($alturaFecha, $alturaTipoComprobante, $alturaNoComprobante, $alturaTC, $alturaSenior, $alturaGlosa);

    $pdf->Cell(30, 10 * $alturaMaxima, $row['fecha'], 1, 0, 'C');
    $pdf->Cell(40, 10 * $alturaMaxima, $row['codtipocomprobante'], 1, 0, 'C');
    $pdf->Cell(40, 10 * $alturaMaxima, $row['nocomprobante'], 1, 0, 'C');
    $pdf->Cell(10, 10 * $alturaMaxima, $row['tc'], 1, 0, 'C');
    $pdf->Cell(45, 10 * $alturaMaxima, $row['senior'], 1, 0, 'C');
    $pdf->MultiCell(60, 10, $row['glosag'], 1, 'C');
}

$pdf->Output('I', 'ReporteComprobantes.pdf');
?>