<?php 
    include_once("../plantilla/inicio.php");
    
?>
        <div class="main p-3">
        <div class="container mt-5">
            <h2 class="mb-4">Editar Empresa</h2>
            <?php
            include_once '../cone.php';
   
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                $idempresa = $_POST['idempresa'];
                $nit = $_POST['nit'];
                $nombreempresa = $_POST['nombreempresa'];
                $direccion = $_POST['direccion'];
                $telefono = $_POST['telefono'];
                $representante = $_POST['representante'];
                $anio = $_POST['anio'];
                $tipoempresa = $_POST['tipoempresa'];
                $fechai = $_POST['fechai'];
                $fechaf = $_POST['fechaf'];
                $sucursalnr = $_POST['sucursalnr'];

                $sql = "UPDATE tempresa SET nit='$nit', nombreempresa='$nombreempresa', direccion='$direccion', telefono='$telefono', representante='$representante', anio=$anio, tipoempresa='$tipoempresa', fechai='$fechai', fechaf='$fechaf', sucursalnr=$sucursalnr WHERE idempresa=$idempresa";

                if ($conn->query($sql) === TRUE) {
                    echo "<div class='alert alert-success' role='alert'>Registro actualizado exitosamente</div>";                                                            
                    echo "<a href='index.php'><button>Regresar</a>";
                    exit();
                } else {
                    echo "<div class='alert alert-danger' role='alert'>Error: " . $sql . "<br>" . $conn->error . "</div>";
                }
            }

            if (isset($_GET['id'])) {
                $idempresa = $_GET['id'];
                $sql = "SELECT * FROM tempresa WHERE idempresa=$idempresa";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                } else {
                    echo "<div class='alert alert-warning' role='alert'>No se encontró el registro</div>";
                }
            }
            
            ?>

            <form method="post" action="update.php">
                <input type="hidden" name="idempresa" value="<?php echo $row['idempresa']; ?>">
                <div class="mb-3">
                    <label for="nit" class="form-label">NIT</label>
                    <input type="text" class="form-control" id="nit" name="nit" value="<?php echo $row['nit']; ?>" required>
                </div>
                <div class="mb-3">
                    <label for="nombreempresa" class="form-label">Nombre de la Empresa</label>
                    <input type="text" class="form-control" id="nombreempresa" name="nombreempresa" value="<?php echo $row['nombreempresa']; ?>" required>
                </div>
                <div class="mb-3">
                    <label for="direccion" class="form-label">Dirección</label>
                    <input type="text" class="form-control" id="direccion" name="direccion" value="<?php echo $row['direccion']; ?>">
                </div>
                <div class="mb-3">
                    <label for="telefono" class="form-label">Teléfono</label>
                    <input type="text" class="form-control" id="telefono" name="telefono" value="<?php echo $row['telefono']; ?>">
                </div>
                <div class="mb-3">
                    <label for="representante" class="form-label">Representante</label>
                    <input type="text" class="form-control" id="representante" name="representante" value="<?php echo $row['representante']; ?>">
                </div>
                <div class="mb-3">
                    <label for="anio" class="form-label">Año</label>
                    <input type="number" class="form-control" id="anio" name="anio" value="<?php echo $row['anio']; ?>">
                </div>
                <div class="mb-3">
                    <label for="tipoempresa" class="form-label">Tipo de Empresa</label>
                    <input type="text" class="form-control" id="tipoempresa" name="tipoempresa" value="<?php echo $row['tipoempresa']; ?>">
                </div>
                <div class="mb-3">
                    <label for="fechai" class="form-label">Fecha de Inicio</label>
                    <input type="date" class="form-control" id="fechai" name="fechai" value="<?php echo $row['fechai']; ?>">
                </div>
                <div class="mb-3">
                    <label for="fechaf" class="form-label">Fecha de Fin</label>
                    <input type="date" class="form-control" id="fechaf" name="fechaf" value="<?php echo $row['fechaf']; ?>">
                </div>
                <div class="mb-3">
                    <label for="sucursalnr" class="form-label">Sucursal NR</label>
                    <input type="number" class="form-control" id="sucursalnr" name="sucursalnr" value="<?php echo $row['sucursalnr']; ?>">
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