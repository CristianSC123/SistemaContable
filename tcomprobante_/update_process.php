<?php
include '../cone.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $idcomprobante_ = $_POST['idcomprobante_'];
    $codcomprobante = $_POST['codcomprobante'];
    $codcta = $_POST['codcta'];
    
    $glosad = $_POST['glosad'];
    $documento = $_POST['documento'];
    $debeml = $_POST['debeml'];
    $haberml = $_POST['haberml'];
    echo "codcomprobante".$codcomprobante;
    echo "codcta".$codcta;
    $sql = "UPDATE tcomprobantes_ SET codcomprobante='$codcomprobante', codcta='$codcta', glosad='$glosad', documento='$documento', debeml='$debeml', haberml='$haberml' WHERE idcomprobante_='$idcomprobante_'";

    if ($conn->query($sql) === TRUE) {
        echo "<script>alert('Registro actualizado exitosamente'); window.location='index.php';</script>";
    } else {
        echo "<script>alert('Error: " . $sql . "<br>" . $conn->error . "'); window.location='update.php?id=$idcomprobante_';</script>";
    }

    $conn->close();
}
?>
