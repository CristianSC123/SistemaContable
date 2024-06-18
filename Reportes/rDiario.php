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
        $this->Cell(0, 10, 'Libro Diario', 0, 1, 'C');
        $this->SetFont('Arial', '', 10);
        $this->Cell(0, 10, 'Fecha Inicio: ' . $this->headerData['fechaInicio'] . '  Fecha Fin: ' . $this->headerData['fechaFin'], 0, 1, 'C');
    }

    function Footer()
    {
        $this->SetY(-15);
        $this->SetFont('Arial', 'I', 8);
        $this->Cell(0, 10, utf8_decode('Página ') . $this->PageNo() . '/{nb}', 0, 0, 'C');
    }

    function AddComprobanteHeader($data)
    {
        $this->SetFont('Arial', 'B', 10);
        $this->Cell(45, 10, 'Tipo de Comprobante:', 0, 0);
        $this->Cell(80, 10, $data['tipoComprobante'], 0, 0);
        $this->Cell(25, 10, utf8_decode('Señor(a):'), 0, 0);
        $this->Cell(10, 10, $data['senior'], 0, 1);
        $this->Cell(45, 10, 'Numero de Comprobante:', 0, 0);
        $this->Cell(80, 10, $data['nocomprobante'], 0, 0);
        $this->Cell(30, 10, 'Tipo de Cambio:', 0, 0);
        $this->Cell(60, 10, $data['tc'], 0, 1);
        $this->Cell(45, 10, 'Fecha:', 0, 0);
        $this->Cell(80, 10, $data['fecha'], 0, 1);
        $this->Cell(45, 10, 'Glosa:', 0, 0);
        $this->MultiCell(0, 10, $data['glosag'], 0, 1);
        $this->SetFont('Arial', 'B', 10);
        $this->Cell(40, 10, 'CUENTA', 1, 0, 'C');
        $this->Cell(60, 10, 'NOMBRE CUENTA', 1, 0, 'C');
        $this->Cell(30, 10, 'DEBE', 1, 0, 'C');
        $this->Cell(30, 10, 'HABER', 1, 1, 'C');
    }
}

require_once "../cone.php";

$consulta_mayor = "SELECT * FROM cdiario";

$resultado = $conn->query($consulta_mayor);

if (!$resultado) {
    die('Error en la consulta: ' . $conn->error);
}

$tipos = [];

while ($row = $resultado->fetch_assoc()) {
    $tipos[$row['idcomprobante']][] = $row;
}

$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->setHeaderData([
    'fechaInicio' => '01/04/2024',
    'fechaFin' => '31/12/2024',
]);
$pdf->AddPage();

foreach ($tipos as $idcomprobante => $rows) {
    $pdf->AddComprobanteHeader([
        'tipoComprobante' => $rows[0]['codtipocomprobante'],
        'senior' => $rows[0]['senior'],
        'nocomprobante' => $rows[0]['nocomprobante'],
        'tc' => $rows[0]['tc'],
        'fecha' => $rows[0]['fecha'],
        'glosag' => $rows[0]['glosag']
    ]);
    $pdf->SetFont('Arial', '', 10);
    $totalDebe = 0;
    $totalHaber = 0;

    foreach ($rows as $row) {
        $pdf->Cell(40, 10, $row['codcta'], 1, 0, 'C');
        $pdf->Cell(60, 10, $row['nombrecuenta'], 1, 0, 'C');
        $pdf->Cell(30, 10, number_format($row['debeml'], 2, ',', '.'), 1, 0, 'C');
        $pdf->Cell(30, 10, number_format($row['haberml'], 2, ',', '.'), 1, 1, 'C');
        $totalDebe += $row['debeml'];
        $totalHaber += $row['haberml'];
    }

    $pdf->SetFont('Arial', 'B', 10);
    $pdf->Cell(100, 10, 'TOTAL', 1, 0, 'R');
    $pdf->Cell(30, 10, number_format($totalDebe, 2, ',', '.'), 1, 0, 'C');
    $pdf->Cell(30, 10, number_format($totalHaber, 2, ',', '.'), 1, 1, 'C');
    $pdf->Ln(10);
}

$pdf->Output('I', 'LibroDiario.pdf');
