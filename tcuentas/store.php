<?php
include_once '../cone.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $codigo = $_POST['codigo'];
    $nombrecuenta = $_POST['nombrecuenta'];
    $descripcion = $_POST['descripcion'];
    $nivel = $_POST['nivel'];
    $agrupado = $_POST['agrupado'];
    $tipoactualizacion = $_POST['tipoactualizacion'];
    $habilitado = $_POST['habilitado'];

    $sql = "INSERT INTO tcuentas (codigo, nombrecuenta, descripcion, nivel, agrupado, tipoactualizacion, habilitado)
            VALUES ('$codigo', '$nombrecuenta', '$descripcion', $nivel, '$agrupado', '$tipoactualizacion', '$habilitado')";

    if ($conn->query($sql) === TRUE) {
        echo "<script>alert('Nueva cuenta agregada exitosamente'); window.location='index.php';</script>";
        echo "<a href='index.php'><button>Regresar</a>";
        exit();
    } else {
        echo "<script>alert('Error: " . $sql . "<br>" . $conn->error . "'); window.location='create.php';</script>";
    }

    $conn->close();
}
?>
