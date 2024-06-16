<?php
include_once '../cone.php';

if (isset($_GET['id'])) {
    $idcomprobante = $_GET['id'];
    //
    $conn->query("SET FOREIGN_KEY_CHECKS=0");
    $sql_update_referencias = "UPDATE tcomprobantes_ SET codcomprobante = NULL WHERE codcomprobante = '$idcomprobante'";
    $conn->query($sql_update_referencias);
    //
    $sql = "DELETE FROM tcomprobantes WHERE idcomprobante='$idcomprobante'";

    if ($conn->query($sql) === TRUE) {
        echo "<script>alert('Registro eliminado exitosamente'); window.location='index.php';</script>";
    } else {
        echo "<script>alert('Error: " . $sql . "<br>" . $conn->error . "'); window.location='index.php';</script>";
    }

    $conn->close();
}
?>
