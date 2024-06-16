<?php
include_once '../cone.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Eliminar la cuenta
    $conn->query("SET FOREIGN_KEY_CHECKS=0");
    $sql_update_referencias = "UPDATE tcomprobantes_ SET codcta = NULL WHERE codcta = '$id'";
    $conn->query($sql_update_referencias);
    //
    $sql = "DELETE FROM tcuentas WHERE codigo='$id'";
    $sql_delete_cuenta = "DELETE FROM tcuentas WHERE codigo='$id'";
    if ($conn->query($sql) === TRUE) {
        echo "<script>alert('Cuenta eliminada exitosamente'); window.location='index.php';</script>";
    } else {
        echo "<script>alert('Error al eliminar la cuenta: " . $conn->error . "'); window.location='index.php';</script>";
    }
} else {
    echo "<script>alert('ID de cuenta no proporcionado'); window.location='index.php';</script>";
}

$conn->close();
?>
