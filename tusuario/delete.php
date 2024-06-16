<?php
if (isset($_GET['id'])) {
    include_once '../cone.php';

    $idempresa = $_GET['id'];

    // Intentar eliminar el registro
    $sql = "DELETE FROM tusuario WHERE idusuario=$idusuario";

    if ($conn->query($sql) === TRUE) {
        echo "<script>alert('Registro eliminado exitosamente'); window.location='index.php';</script>";
    } else {
        echo "<script>alert('Error al eliminar el registro: " . $conn->error . "'); window.location='index.php';</script>";
    }

    $conn->close();
} else {
    echo "<script>alert('ID de empresa no proporcionado'); window.location='index.php';</script>";
}
?>
