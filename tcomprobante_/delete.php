<?php
include '../cone.php';

if (isset($_GET['id'])) {
    $idcomprobante_ = $_GET['id'];

    $sql = "DELETE FROM tcomprobantes_ WHERE idcomprobante_='$idcomprobante_'";

    if ($conn->query($sql) === TRUE) {
        echo "<script>alert('Registro eliminado exitosamente'); window.location='index.php';</script>";
    } else {
        echo "<script>alert('Error: " . $sql . "<br>" . $conn->error . "'); window.location='index.php';</script>";
    }

    $conn->close();
}
?>
