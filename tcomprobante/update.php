<?php 
    include_once("../plantilla/inicio.php");
    include_once '../cone.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $idcomprobante = $_POST['idcomprobante'];
    $codtipocomprobante = $_POST['codtipocomprobante'];
    $nocomprobante = $_POST['nocomprobante'];
    $fecha = $_POST['fecha'];
    $tc = $_POST['tc'];
    $senior = $_POST['senior'];
    $glosag = $_POST['glosag'];
    $estadoasiento = $_POST['estadoasiento'];

    $sql = "UPDATE tcomprobantes SET codtipocomprobante='$codtipocomprobante', nocomprobante='$nocomprobante', fecha='$fecha', tc='$tc', senior='$senior', glosag='$glosag', estadoasiento='$estadoasiento' WHERE idcomprobante='$idcomprobante'";

    if ($conn->query($sql) === TRUE) {
        echo "<script>alert('Registro actualizado exitosamente'); window.location='index.php';</script>";
    } else {
        echo "<script>alert('Error: " . $sql . "<br>" . $conn->error . "'); window.location='update.php?id=$idcomprobante';</script>";
    }    
}
?>
        <div class="main p-3">
        <div class="container mt-5">
            <h2 class="mb-4">Editar Comprobante</h2>
            <?php
            

            if (isset($_GET['id'])) {
                $idcomprobante = $_GET['id'];
                $sql = "SELECT * FROM tcomprobantes WHERE idcomprobante='$idcomprobante'";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                } else {
                    echo "<div class='alert alert-warning' role='alert'>No se encontró el registro</div>";
                }
            }
            
            ?>

            <form method="post" action="update.php">
                <input type="hidden" name="idcomprobante" value="<?php echo $row['idcomprobante']; ?>">
                <div class="mb-3">
                    <label for="codtipocomprobante" class="form-label">Código Tipo Comprobante</label>
                    <input type="text" class="form-control" id="codtipocomprobante" name="codtipocomprobante" value="<?php echo $row['codtipocomprobante']; ?>" required>
                </div>
                <div class="mb-3">
                    <label for="nocomprobante" class="form-label">Número Comprobante</label>
                    <input type="text" class="form-control" id="nocomprobante" name="nocomprobante" value="<?php echo $row['nocomprobante']; ?>" required>
                </div>
                <div class="mb-3">
                    <label for="fecha" class="form-label">Fecha</label>
                    <input type="date" class="form-control" id="fecha" name="fecha" value="<?php echo $row['fecha']; ?>" required>
                </div>
                <div class="mb-3">
                    <label for="tc" class="form-label">TC</label>
                    <input type="text" class="form-control" id="tc" name="tc" value="<?php echo $row['tc']; ?>" required>
                </div>
                <div class="mb-3">
                    <label for="senior" class="form-label">Senior</label>
                    <input type="text" class="form-control" id="senior" name="senior" value="<?php echo $row['senior']; ?>" required>
                </div>
                <div class="mb-3">
                    <label for="glosag" class="form-label">Glosa General</label>
                    <input type="text" class="form-control" id="glosag" name="glosag" value="<?php echo $row['glosag']; ?>" required>
                </div>
                <div class="mb-3">
                    <label for="estadoasiento" class="form-label">Estado Asiento</label>
                    <input type="text" class="form-control" id="estadoasiento" name="estadoasiento" value="<?php echo $row['estadoasiento']; ?>" required>
                </div>
                <button type="submit" class="btn btn-primary">Actualizar</button>
                <a href="index.php" class="btn btn-secondary">Cancelar</a>
            </form>
        </div>
        </div>
    </div>
    <?php 
    include_once("../plantilla/final.php");
?>