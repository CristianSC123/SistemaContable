<?php
$servername = "localhost"; 
$username = "root";        
$password = "";            
$dbname = "bd_contable"; 

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
} 
?>
