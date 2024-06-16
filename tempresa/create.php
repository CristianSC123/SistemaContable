<?php 
    include_once("../plantilla/inicio.php");
?>
        <div class="main p-3">
            <div class="text-center">
            <div class="container mt-5">
                <h2 class="mb-4">Agregar Empresa</h2>
                <?php
                if ($_SERVER["REQUEST_METHOD"] == "POST") {
                    include_once '../cone.php';

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

                    $sql = "INSERT INTO tempresa (nit, nombreempresa, direccion, telefono, representante, anio, tipoempresa, fechai, fechaf, sucursalnr)
                            VALUES ('$nit', '$nombreempresa', '$direccion', '$telefono', '$representante', $anio, '$tipoempresa', '$fechai', '$fechaf', $sucursalnr)";

                    if ($conn->query($sql) === TRUE) {
                        echo "<div class='alert alert-success' role='alert'>Nuevo registro creado exitosamente</div>";
                        echo "<a href='index.php'><button>Regresar</a>";
                        exit();
                    } else {
                        echo "<div class='alert alert-danger' role='alert'>Error: " . $sql . "<br>" . $conn->error . "</div>";
                    }

                    $conn->close();
                }
                ?>
                <form method="post" action="create.php">
                    <div class="mb-3">
                        <label for="nit" class="form-label">NIT</label>
                        <input type="text" class="form-control" id="nit" name="nit" required>
                    </div>
                    <div class="mb-3">
                        <label for="nombreempresa" class="form-label">Nombre de la Empresa</label>
                        <input type="text" class="form-control" id="nombreempresa" name="nombreempresa" required>
                    </div>
                    <div class="mb-3">
                        <label for="direccion" class="form-label">Dirección</label>
                        <input type="text" class="form-control" id="direccion" name="direccion">
                    </div>
                    <div class="mb-3">
                        <label for="telefono" class="form-label">Teléfono</label>
                        <input type="text" class="form-control" id="telefono" name="telefono">
                    </div>
                    <div class="mb-3">
                        <label for="representante" class="form-label">Representante</label>
                        <input type="text" class="form-control" id="representante" name="representante">
                    </div>
                    <div class="mb-3">
                        <label for="anio" class="form-label">Año</label>
                        <input type="number" class="form-control" id="anio" name="anio">
                    </div>
                    <div class="mb-3">
                        <label for="tipoempresa" class="form-label">Tipo de Empresa</label>
                        <input type="text" class="form-control" id="tipoempresa" name="tipoempresa">
                    </div>
                    <div class="mb-3">
                        <label for="fechai" class="form-label">Fecha de Inicio</label>
                        <input type="date" class="form-control" id="fechai" name="fechai">
                    </div>
                    <div class="mb-3">
                        <label for="fechaf" class="form-label">Fecha de Fin</label>
                        <input type="date" class="form-control" id="fechaf" name="fechaf">
                    </div>
                    <div class="mb-3">
                        <label for="sucursalnr" class="form-label">Sucursal NR</label>
                        <input type="number" class="form-control" id="sucursalnr" name="sucursalnr">
                    </div>
                    <button type="submit" class="btn btn-primary">Guardar</button>
                    <a href="index.php" class="btn btn-secondary">Cancelar</a>
                </form>
            </div>
            </div>
        </div>
    </div>
    <?php 
    include_once("../plantilla/final.php");
?>