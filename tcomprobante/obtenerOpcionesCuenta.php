<?php
include_once("../cone.php"); // Asegúrate de incluir el archivo de conexión

$sql = "SELECT codigo, nombrecuenta FROM tcuentas";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<option value='" . $row['codigo'] . "'>" . $row['nombrecuenta'] . "</option>";
    }
}
$conn->close();
?>
