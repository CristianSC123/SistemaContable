<?php
session_start();
include './cone.php'; 

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST['nombre'];
    $usuario = $_POST['usuario'];
    $password = $_POST['password'];
    $confirmar_password = $_POST['confirmar_password'];

 
    if ($password !== $confirmar_password) {
        echo "<script>alert('Las contraseñas no coinciden'); window.location='index.php';</script>";
        exit();
    }

    
    $sql = $conn->prepare("SELECT idusuario FROM tusuario WHERE usuario = ?");
    $sql->bind_param("s", $usuario);
    $sql->execute();
    $result = $sql->get_result();
    if ($result->num_rows > 0) {
        echo "<script>alert('El nombre de usuario ya está en uso'); window.location='index.php';</script>";
        exit();
    }

    $sql = $conn->prepare("INSERT INTO tusuario (nombre, usuario, password) VALUES (?, ?, ?)");
    $sql->bind_param("sss", $nombre, $usuario, $password);

    if ($sql->execute()) {
        echo "<script>alert('Usuario registrado exitosamente'); window.location='index.php';</script>";
    } else {
        echo "<script>alert('Error al registrar el usuario'); window.location='index.php';</script>";
    }

    $sql->close();
}
$conn->close();
?>