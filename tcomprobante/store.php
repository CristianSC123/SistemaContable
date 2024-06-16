<?php
include_once '../cone.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $codtipocomprobante = $_POST['codtipocomprobante'];
    $nocomprobante = $_POST['nocomprobante'];
    $fecha = $_POST['fecha'];
    $tc = $_POST['tc'];
    $senior = $_POST['senior'];
    $glosag = $_POST['glosag'];
    $estadoasiento = $_POST['estadoasiento'];

    $sql = "INSERT INTO tcomprobantes (codtipocomprobante, nocomprobante, fecha, tc, senior, glosag, estadoasiento)
            VALUES ('$codtipocomprobante', '$nocomprobante', '$fecha', '$tc', '$senior', '$glosag', '$estadoasiento')";

    if ($conn->query($sql) === TRUE) {
        $id_comprobante = $conn->insert_id;
        $cuentas = $_POST['cuenta'];
        $glosadetalles = $_POST['glosadetalles'];
        $debe = $_POST['debe'];
        $haber = $_POST['haber'];

        $detalles_exito = true;

        for ($i = 0; $i < count($cuentas); $i++) {
            $codcta = $cuentas[$i];
            $glosad = $glosadetalles[$i];
            $debeml = $debe[$i];
            $haberml = $haber[$i];

            $sql_detalle = "INSERT INTO tcomprobantes_ (codcomprobante, codcta, glosad, debeml, haberml)
                            VALUES ('$id_comprobante', '$codcta', '$glosad', '$debeml', '$haberml')";

            if (!$conn->query($sql_detalle)) {
                $detalles_exito = false;
                echo "<script>alert('Error: " . $sql_detalle . "<br>" . $conn->error . "'); window.location='create.php';</script>";
                break;
            }
        }

        if ($detalles_exito) {
            echo "<script>alert('Nuevo comprobante y sus detalles agregados exitosamente'); window.location='index.php';</script>";
        }
    } else {
        echo "<script>alert('Error: " . $sql . "<br>" . $conn->error . "'); window.location='create.php';</script>";
    }

    $conn->close();
}
