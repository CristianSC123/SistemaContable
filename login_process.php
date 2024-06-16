<?php
session_start();
include './cone.php'; // Asegúrate de ajustar la ruta a tu archivo de conexión

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usuario = $_POST['usuario'];
    $password = $_POST['password'];
    echo $usuario;
    echo $password;
    // Preparar y ejecutar la consulta SQL
    $sql = $conn->prepare("SELECT idusuario, nombre, password FROM tusuario WHERE usuario = ?");
    $sql->bind_param("s", $usuario);
    $sql->execute();
    $result = $sql->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo  $row['password'];
        if ($password = $row['password']) {
            
            $_SESSION['idusuario'] = $row['idusuario'];
            $_SESSION['nombre'] = $row['nombre'];
            header("Location: ./tcuentas/index.php");
        } else {
            echo "<script>alert('Contraseña incorrecta'); window.location='index.php';</script>";
        }
    } else {
        echo "<script>alert('Usuario no encontrado'); window.location='index.php';</script>";
    }
    $sql->close();
}
$conn->close();
?>
