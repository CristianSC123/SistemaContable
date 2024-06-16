<?php
include_once("../plantilla/inicio.php");
include_once('../cone.php');
?>
<div class="main p-3">
    <div class="container mt-5">
        <h2 class="mb-4">Agregar Detalle de Comprobante</h2>
        <form method="post" action="store.php">
            <div class="mb-3">
                <label for="codcomprobante" class="form-label">Código Comprobante</label>
                <select class="form-select" id="codcomprobante" name="codcomprobante" required>
                    <option value="" selected disabled>Selecciona el Código Comprobante</option>
                    <?php
                    $sql = "SELECT * FROM tcomprobantes";
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            echo "<option value='" . $row['idcomprobante'] . "'>" . $row['nocomprobante'] . "</option>";
                        }
                    }
                    ?>
                </select>
            </div>
            <div class="mb-3">
                <label for="codcta" class="form-label"> Cuenta</label>
                <select class="form-select" id="codcta" name="codcta" required>
                    <option value="" selected disabled>Selecciona la Cuenta</option>
                    <?php
                    $sql = "SELECT codigo, nombrecuenta FROM tcuentas WHERE nivel = 5";
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            echo "<option value='" . $row['codigo'] . "'>" . $row['codigo'] . " - " . $row['nombrecuenta'] . "</option>";
                        }
                    }
                    $conn->close();
                    ?>

                </select>
            </div>
            <div class="mb-3">
                <label for="glosad" class="form-label">Glosa Detallada</label>
                <input type="text" class="form-control" id="glosad" name="glosad" required>
            </div>
            <div class="mb-3">
                <label for="documento" class="form-label">Documento</label>
                <input type="text" class="form-control" id="documento" name="documento" required>
            </div>
            <div class="mb-3">
                <label for="debeml" class="form-label">Debe ML</label>
                <input type="text" class="form-control" id="debeml" name="debeml" required>
            </div>
            <div class="mb-3">
                <label for="haberml" class="form-label">Haber ML</label>
                <input type="text" class="form-control" id="haberml" name="haberml" required>
            </div>
            <button type="submit" class="btn btn-primary">Agregar</button>
            <a href="index.php" class="btn btn-secondary">Volver</a>
        </form>
    </div>
</div>
</div>
<?php
include_once("../plantilla/final.php");
?>