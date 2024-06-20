<?php
include_once '../cone.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $codtipocomprobante = $_POST['codtipocomprobante'];
    $nocomprobante = $_POST['nocomprobante'];
    $fecha = $_POST['fecha'];
    $tc = $_POST['tc'];
    $senior = $_POST['senior'];
    $glosag = $_POST['glosag'];
    $estadoasiento = $_POST['estadoasiento'];

    $baseDir = 'respaldo/';

    // Ruta específica para el comprobante
    $comprobanteDir = $baseDir . $nocomprobante;

    // Crear directorio si no existe
    if (!file_exists($comprobanteDir)) {
        mkdir($comprobanteDir, 0777, true);
    }

    // Array para guardar rutas de archivos subidos
    $rutaArchivos = [];

    // Manejo de archivos subidos
    if (!empty($_FILES['documentos']['name'][0])) {
        for ($i = 0; $i < count($_FILES['documentos']['name']); $i++) {
            $fileName = $_FILES['documentos']['name'][$i];
            $fileTmpName = $_FILES['documentos']['tmp_name'][$i];
            $fileType = $_FILES['documentos']['type'][$i];
            $fileError = $_FILES['documentos']['error'][$i];
            $fileSize = $_FILES['documentos']['size'][$i];

            // Validar tipo de archivo
            $fileExt = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));
            $allowed = ['jpg', 'jpeg'];

            if (in_array($fileExt, $allowed)) {
                if ($fileError === 0) {
                    $newFileName = uniqid('', true) . "." . $fileExt;
                    $fileDestination = $comprobanteDir . '/' . $newFileName;

                    if (move_uploaded_file($fileTmpName, $fileDestination)) {
                        $rutaArchivos[] = $fileDestination;
                    } else {
                        echo "<script>alert('Error al mover el archivo $fileName'); window.location='create.php';</script>";
                        exit();
                    }
                } else {
                    echo "<script>alert('Error en el archivo $fileName: $fileError'); window.location='create.php';</script>";
                    exit();
                }
            } else {
                echo "<script>alert('Tipo de archivo no permitido: $fileName'); window.location='create.php';</script>";
                exit();
            }
        }
    }
    $rutaArchivosString = implode(',', $rutaArchivos);
    $sql = "INSERT INTO tcomprobantes (codtipocomprobante, nocomprobante, fecha, tc, senior, glosag, estadoasiento, ruta)
            VALUES ('$codtipocomprobante', '$nocomprobante', '$fecha', '$tc', '$senior', '$glosag', '$estadoasiento', '$rutaArchivosString')";

    if ($conn->query($sql) === TRUE) {
        $id_comprobante = $conn->insert_id;
        $cuentas = $_POST['cuenta'];
        $glosadetalles = $_POST['glosadetalles'];
        $debe = $_POST['debe'];
        $haber = $_POST['haber'];

        $detalles_exito = true;

        for ($i = 0; $i < count($cuentas); $i++) {
            $codcta = $cuentas[$i];
            $glosad = $glosadetalles[$i];
            $debeml = $debe[$i];
            $haberml = $haber[$i];

            $sql_detalle = "INSERT INTO tcomprobantes_ (codcomprobante, codcta, glosad, debeml, haberml)
                            VALUES ('$id_comprobante', '$codcta', '$glosad', '$debeml', '$haberml')";

            if (!$conn->query($sql_detalle)) {
                $detalles_exito = false;
                echo "<script>alert('Error: " . $sql_detalle . "<br>" . $conn->error . "'); window.location='create.php';</script>";
                break;
            }
        }

        if ($detalles_exito) {
            echo "<script>alert('Nuevo comprobante y sus detalles agregados exitosamente'); window.location='index.php';</script>";
        }
    } else {
        echo "<script>alert('Error: " . $sql . "<br>" . $conn->error . "'); window.location='create.php';</script>";
    }
    $conn->close();
}
?>
