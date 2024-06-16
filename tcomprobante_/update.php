<?php 
    include_once("../plantilla/inicio.php");
    
?>
        <div class="main p-3">
        <body>
<div class="container mt-5">
    <h2 class="mb-4">Editar Detalle de Comprobante</h2>
    <?php
    include '../cone.php';

    if (isset($_GET['id'])) {
        $idcomprobante_ = $_GET['id'];        
        $sql = "SELECT * FROM tcomprobantes_ WHERE idcomprobante_='$idcomprobante_'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
        } else {
            echo "<div class='alert alert-warning' role='alert'>No se encontró el registro</div>";
            exit();
        }
    } else {
        echo "<div class='alert alert-warning' role='alert'>No se especificó un ID</div>";
        exit();
    }

    // Obtener la lista de comprobantes
    $sql_comprobantes = "SELECT * FROM tcomprobantes";
    $result_comprobantes = $conn->query($sql_comprobantes);

    // Obtener la lista de cuentas
    $sql_cuentas = "SELECT * FROM tcuentas";
    $result_cuentas = $conn->query($sql_cuentas);
    ?>

    <form method="post" action="update_process.php">
        <input type="hidden" name="idcomprobante_" value="<?php echo $row['idcomprobante_']; ?>">

        <div class="mb-3">
            <label for="codcomprobante" class="form-label">Código Comprobante</label>
            <select class="form-select" id="codcomprobante" name="codcomprobante" required>
                <option value="" selected disabled>Selecciona el Código Comprobante</option>
                <?php
                if ($result_comprobantes->num_rows > 0) {
                    while ($row_comprobantes = $result_comprobantes->fetch_assoc()) {
                        $selected = $row_comprobantes['codtipocomprobante'] == $row['codcomprobante'] ? 'selected' : '';
                        echo "<option value='" . $row_comprobantes['idcomprobante'] . "' $selected>" . $row_comprobantes['nocomprobante'] . "</option>";
                    }
                }
                ?>
            </select>
        </div>

        <div class="mb-3">
    <label for="codcta" class="form-label">Código Cuenta</label>
    <select class="form-select" id="codcta" name="codcta" required>
        <option value="" selected disabled>Selecciona el Código Cuenta</option>
        <?php
        // Suponiendo que $result_cuentas es el resultado de una consulta SQL que contiene las cuentas
        // y $row es la fila actual que estamos editando/modificando
        if ($result_cuentas->num_rows > 0) {
            while ($row_cuentas = $result_cuentas->fetch_assoc()) {
                $codigo = $row_cuentas['codigo'];
                $nombre = $row_cuentas['nombrecuenta'];
                $selected = $codigo == $row['codcta'] ? 'selected' : '';
                echo "<option value='$codigo' $selected>($codigo) $nombre</option>";
            }
        }
        ?>
    </select>
</div>



        <div class="mb-3">
            <label for="glosad" class="form-label">Glosa Detallada</label>
            <input type="text" class="form-control" id="glosad" name="glosad" value="<?php echo $row['glosad']; ?>" required>
        </div>
        <div class="mb-3">
            <label for="documento" class="form-label">Documento</label>
            <input type="text" class="form-control" id="documento" name="documento" value="<?php echo $row['documento']; ?>" required>
        </div>
        <div class="mb-3">
            <label for="debeml" class="form-label">Debe ML</label>
            <input type="text" class="form-control" id="debeml" name="debeml" value="<?php echo $row['debeml']; ?>" required>
        </div>
        <div class="mb-3">
            <label for="haberml" class="form-label">Haber ML</label>
            <input type="text" class="form-control" id="haberml" name="haberml" value="<?php echo $row['haberml']; ?>" required>
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