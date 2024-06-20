<?php
require('../fpdf186/fpdf.php');

class PDF extends FPDF
{
    function Header()
    {
        if ($this->PageNo() == 1) {
            $this->Image('../img/logo.jpg', 10, 6, 30);
            $this->SetFont('Arial', 'B', 16);
            $this->Cell(0, 20, 'Balance General', 0, 1, 'C');
        }
    }

    function Footer()
    {
        $this->SetY(-15);
        $this->SetFont('Arial', 'I', 8);
        $this->Cell(0, 10, 'Página ' . $this->PageNo() . '/{nb}', 0, 0, 'C');
    }

    function PrintBalanceGeneral($title, $data)
    {
        $this->SetFont('Arial', 'B', 14);
        $this->Cell(0, 10, $title, 0, 1, 'C');

        $this->SetFont('Arial', 'B', 12);
        $this->Cell(30, 10, 'Codigo', 1, 0, 'C');
        $this->Cell(100, 10, 'Cuenta', 1, 0, 'C');
        $this->Cell(30, 10, 'Sumas', 1, 1, 'C');

        foreach ($data as $section) {
            $this->SetFont('Arial', 'B', 12);
            $this->Cell(30, 10, $section['codigo'], 1, 0, 'C');
            $this->Cell(100, 10, $section['nombre'], 1, 0, 'C');
            $this->Cell(30, 10, number_format($section['total'], 2), 1, 1, 'R');

            $this->SetFont('Arial', '', 10);
            foreach ($section['cuentas'] as $account) {
                if ($account['SumaDeSaldoEF'] != 0) {
                    $this->Cell(30, 10, $account['cod1'], 1, 0, 'C');
                    $this->Cell(100, 10, $account['NombreCuenta'], 1, 0, 'C');
                    $this->Cell(30, 10, number_format($account['SumaDeSaldoEF'], 2), 1, 1, 'R');
                }
            }
        }
    }
}

$pdf = new PDF();
$pdf->AliasNbPages();

require_once "../cone.php";

// Consulta SQL para cuentas de activo
$query_activo = "
    SELECT `ceeffg`.`cod1` AS `cod1`, `bd_contable`.`tcuentas`.`nombrecuenta` AS `NombreCuenta`, `ceeffg`.`SumaDeSaldoEF` AS `SumaDeSaldoEF`, `bd_contable`.`tcuentas`.`nivel` AS `Nivel`
    FROM `bd_contable`.`ceeffg`
    JOIN `bd_contable`.`tcuentas` ON `ceeffg`.`cod1` = `bd_contable`.`tcuentas`.`codigo`
    WHERE (`ceeffg`.`cod1` BETWEEN '10000001' AND '12999999')
      AND `bd_contable`.`tcuentas`.`nivel` = 5
    ORDER BY `ceeffg`.`cod1` ASC
";
$result_activo = $conn->query($query_activo);

if (!$result_activo) {
    die('Error en la consulta: ' . $conn->error);
}

$accounts_activo = [];
while ($row = $result_activo->fetch_assoc()) {
    $row['cod1'] = intval($row['cod1']);
    $row['SumaDeSaldoEF'] = floatval($row['SumaDeSaldoEF']);
    $accounts_activo[] = $row;
}

$data_activo = [
    [
        'codigo' => '10000000',
        'nombre' => 'ACTIVO',
        'cuentas' => [],
        'total' => 0
    ],
    [
        'codigo' => '11000000',
        'nombre' => 'ACTIVO CORRIENTE',
        'cuentas' => [],
        'total' => 0
    ],
    [
        'codigo' => '12000000',
        'nombre' => 'ACTIVO NO CORRIENTE',
        'cuentas' => [],
        'total' => 0
    ]
];

foreach ($accounts_activo as $account) {
    if ($account['cod1'] > 11000000 && $account['cod1'] < 12000000) {
        $data_activo[1]['cuentas'][] = $account;
        $data_activo[1]['total'] += $account['SumaDeSaldoEF'];
    } elseif ($account['cod1'] >= 12000001 && $account['cod1'] <= 12999999) {
        $data_activo[2]['cuentas'][] = $account;
        $data_activo[2]['total'] += $account['SumaDeSaldoEF'];
    }
}

$data_activo[0]['total'] = $data_activo[1]['total'] + $data_activo[2]['total'];

// Consulta SQL para cuentas de pasivo
$query_pasivo = "
    SELECT `ceeffg`.`cod1` AS `cod1`, `bd_contable`.`tcuentas`.`nombrecuenta` AS `NombreCuenta`, `ceeffg`.`SumaDeSaldoEF` AS `SumaDeSaldoEF`, `bd_contable`.`tcuentas`.`nivel` AS `Nivel`
    FROM `bd_contable`.`ceeffg`
    JOIN `bd_contable`.`tcuentas` ON `ceeffg`.`cod1` = `bd_contable`.`tcuentas`.`codigo`
    WHERE (`ceeffg`.`cod1` BETWEEN '20000001' AND '22999999')
      AND `bd_contable`.`tcuentas`.`nivel` = 5
    ORDER BY `ceeffg`.`cod1` ASC
";
$result_pasivo = $conn->query($query_pasivo);

if (!$result_pasivo) {
    die('Error en la consulta: ' . $conn->error);
}

$accounts_pasivo = [];
while ($row = $result_pasivo->fetch_assoc()) {
    $row['cod1'] = intval($row['cod1']);
    $row['SumaDeSaldoEF'] = floatval($row['SumaDeSaldoEF']);
    $accounts_pasivo[] = $row;
}

$data_pasivo = [
    [
        'codigo' => '20000000',
        'nombre' => 'PASIVO',
        'cuentas' => [],
        'total' => 0
    ],
    [
        'codigo' => '21000000',
        'nombre' => 'PASIVO CORRIENTE',
        'cuentas' => [],
        'total' => 0
    ],
    [
        'codigo' => '22000000',
        'nombre' => 'PASIVO NO CORRIENTE',
        'cuentas' => [],
        'total' => 0
    ]
];

foreach ($accounts_pasivo as $account) {
    if ($account['cod1'] > 21000000 && $account['cod1'] < 22000000) {
        $data_pasivo[1]['cuentas'][] = $account;
        $data_pasivo[1]['total'] += $account['SumaDeSaldoEF'];
    } elseif ($account['cod1'] >= 22000001 && $account['cod1'] <= 22999999) {
        $data_pasivo[2]['cuentas'][] = $account;
        $data_pasivo[2]['total'] += $account['SumaDeSaldoEF'];
    }
}

$data_pasivo[0]['total'] = $data_pasivo[1]['total'] + $data_pasivo[2]['total'];

// Consulta SQL para cuentas de patrimonio
$query_patrimonio = "
    SELECT `ceeffg`.`cod1` AS `cod1`, `bd_contable`.`tcuentas`.`nombrecuenta` AS `NombreCuenta`, `ceeffg`.`SumaDeSaldoEF` AS `SumaDeSaldoEF`, `bd_contable`.`tcuentas`.`nivel` AS `Nivel`
    FROM `bd_contable`.`ceeffg`
    JOIN `bd_contable`.`tcuentas` ON `ceeffg`.`cod1` = `bd_contable`.`tcuentas`.`codigo`
    WHERE (`ceeffg`.`cod1` BETWEEN '30000001' AND '32999999')
      AND `bd_contable`.`tcuentas`.`nivel` = 5
    ORDER BY `ceeffg`.`cod1` ASC
";
$result_patrimonio = $conn->query($query_patrimonio);

if (!$result_patrimonio) {
    die('Error en la consulta: ' . $conn->error);
}

$accounts_patrimonio = [];
while ($row = $result_patrimonio->fetch_assoc()) {
    $row['cod1'] = intval($row['cod1']);
    $row['SumaDeSaldoEF'] = floatval($row['SumaDeSaldoEF']);
    $accounts_patrimonio[] = $row;
}

$data_patrimonio = [
    [
        'codigo' => '30000000',
        'nombre' => 'PATRIMONIO',
        'cuentas' => $accounts_patrimonio,
        'total' => array_sum(array_column($accounts_patrimonio, 'SumaDeSaldoEF'))
    ]
];

// Agregar los datos al PDF
$pdf->AddPage();

$pdf->PrintBalanceGeneral('ACTIVO', $data_activo);
$pdf->Ln(); // Espacio entre secciones
$pdf->PrintBalanceGeneral('PASIVO', $data_pasivo);
$pdf->Ln(); // Espacio entre secciones
$pdf->PrintBalanceGeneral('PATRIMONIO', $data_patrimonio);

$pdf->Output();
