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
        $this->Cell(0, 10, 'Informe de Cuentas', 0, 1, 'C');
        $this->SetFont('Arial', '', 10);
        $this->Cell(0, 10, 'Fecha Inicio: ' . $this->headerData['fechaInicio'] . '  Fecha Fin: ' . $this->headerData['fechaFin'], 0, 1, 'C');
    }

    function Footer()
    {
        $this->SetY(-15);
        $this->SetFont('Arial', 'I', 8);
        $this->Cell(0, 10, utf8_decode('Página ') . $this->PageNo() . '/{nb}', 0, 0, 'C');
    }

    function AddCuentaHeader($data)
    {
        $this->SetFont('Arial', 'B', 10);
        $this->Cell(27, 10, 'Codigo', 1, 0, 'C');
        $this->Cell(75, 10, 'Nombre Cuenta', 1, 0, 'C');
        $this->Cell(20, 10, 'Nivel', 1, 0, 'C');
        $this->Cell(20, 10, 'Agrupado', 1, 0, 'C');
        $this->Cell(35, 10, 'Tipo Actualizacion', 1, 0, 'C');
        $this->Cell(20, 10, 'Habilitado', 1, 1, 'C');
    }
}

require_once "../cone.php";

$consulta_cuentas = "SELECT * FROM tcuentas ORDER BY codigo ASC";

$resultado = $conn->query($consulta_cuentas);

if (!$resultado) {
    die('Error en la consulta: ' . $conn->error);
}

$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->setHeaderData([
    'fechaInicio' => '01/04/2024',
    'fechaFin' => '31/12/2024',
]);
$pdf->AddPage();

$pdf->AddCuentaHeader([]);

$pdf->SetFont('Arial', '', 10);

while ($row = $resultado->fetch_assoc()) {
    $pdf->Cell(27, 10, $row['codigo'], 1, 0, 'C');
    $pdf->Cell(75, 10, $row['nombrecuenta'], 1, 0, 'C');
    $pdf->Cell(20, 10, $row['nivel'], 1, 0, 'C');
    $pdf->Cell(20, 10, $row['agrupado'], 1, 0, 'C');
    $pdf->Cell(35, 10, $row['tipoactualizacion'], 1, 0, 'C');
    $pdf->Cell(20, 10, $row['habilitado'], 1, 1, 'C');
}

$pdf->Output('I', 'InformeCuentas.pdf');
