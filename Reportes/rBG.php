<?php
require('../fpdf186/fpdf.php');

class PDF extends FPDF
{
    function Header()
    {
        // Logo
        $this->Image('../img/logo.png', 150, 8, 33);
        // Título del documento
        $this->SetFont('Arial', 'B', 18);
        $this->Cell(0, 10, 'Balance General', 0, 1, 'C');
        // Nombre de la empresa
        $this->SetFont('Arial', 'B', 12);
        $this->Cell(0, 10, 'TusCuentas', 0, 1, 'R');
        // Fechas de inicio y fin (puedes ajustar según tus necesidades)
        $this->SetFont('Arial', '', 10);
        $this->Cell(0, 10, 'Fecha Inicio: 02/05/24    Fecha Fin: 02/05/24', 0, 1, 'L');
        $this->Ln(5);
        // Encabezados de la tabla
        $this->SetFont('Arial', 'B', 10);
        $this->Cell(30, 10, 'Codigo', 1, 0, 'C');
        $this->Cell(80, 10, 'Cuenta', 1, 0, 'C');
        $this->Cell(50, 10, 'Sumas', 1, 1, 'C');
    }

    function Footer()
    {
        // Posición en pie de página: a 1.5 cm del final
        $this->SetY(-15);
        // Arial italic 8
        $this->SetFont('Arial', 'I', 8);
        // Número de página
        $this->Cell(0, 10, 'Página ' . $this->PageNo() . '/{nb}', 0, 0, 'C');
    }

    function BasicTable($data)
    {
        // Contenido de la tabla
        $this->SetFont('Arial', '', 10);
        foreach ($data as $row) {
            $this->Cell(30, 10, $row['codigo'], 1, 0, 'C');
            $this->Cell(80, 10, utf8_decode($row['nombrecuenta']), 1, 0, 'L');
            $this->Cell(50, 10, number_format($row['saldo'], 2, ',', '.'), 1, 1, 'R');
        }
    }
}

require_once "../cone.php"; // Archivo de configuración de conexión

try {
    // Consulta para obtener los saldos por cuentas
    $query = "
        SELECT 
            tcuentas.codigo, 
            tcuentas.nombrecuenta, 
            SUM(tcomprobantes_.debeml - tcomprobantes_.haberml) AS saldo
        FROM 
            tcomprobantes_
        JOIN 
            tcuentas ON tcomprobantes_.codcta = tcuentas.codigo
        GROUP BY 
            tcuentas.codigo, tcuentas.nombrecuenta
        ORDER BY 
            tcuentas.codigo
    ";

    $resultado = $conn->query($query);
    $balances = $resultado->fetch_all(MYSQLI_ASSOC);

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();

$pdf->BasicTable($balances);

// Salida del documento PDF
$pdf->Output('I', 'BalanceGeneral.pdf');
?>
