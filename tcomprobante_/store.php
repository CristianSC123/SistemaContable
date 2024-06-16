<?php
include '../cone.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $codcomprobante = $_POST['codcomprobante'];
    $codcta = $_POST['codcta'];
    $glosad = $_POST['glosad'];
    $documento = $_POST['documento'];
    $debeml = $_POST['debeml'];
    $haberml = $_POST['haberml'];

    $sql = "INSERT INTO tcomprobantes_ (codcomprobante, codcta, glosad, documento, debeml, haberml)
            VALUES ('$codcomprobante', '$codcta', '$glosad', '$documento', '$debeml', '$haberml')";

    if ($conn->query($sql) === TRUE) {
        echo "<script>alert('Nuevo detalle agregado exitosamente'); window.location='index.php';</script>";
    } else {
        echo "<script>alert('Error: " . $sql . "<br>" . $conn->error . "'); window.location='create.php';</script>";
    }

    $conn->close();
}
?>
