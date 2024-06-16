<?php 
    include_once("../plantilla/inicio.php");
    include_once ('../cone.php');

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $codigo = $_POST['codigo'];
        $nombrecuenta = $_POST['nombrecuenta'];
        $descripcion = $_POST['descripcion'];
        $nivel = $_POST['nivel'];
        $agrupado = $_POST['agrupado'];
        $tipoactualizacion = $_POST['tipoactualizacion'];
        $habilitado = $_POST['habilitado'];

        $sql = "UPDATE tcuentas  SET codigo='$codigo' ,nombrecuenta='$nombrecuenta', descripcion='$descripcion', nivel=$nivel, agrupado='$agrupado', tipoactualizacion='$tipoactualizacion', habilitado='$habilitado' WHERE codigo='$codigo'";

        if ($conn->query($sql) === TRUE) {
            echo "<script>alert('Registro actualizado exitosamente'); window.location='index.php';</script>";
        } else {
            echo "<script>alert('Error: " . $sql . "<br>" . $conn->error . "'); window.location='update.php?id=$codigo';</script>";
        }

        $conn->close();
    }
        
?>
        <div class="main p-3">
        <div class="container mt-5">
            <h2 class="mb-4">Editar Cuenta</h2>
            <?php            

            if (isset($_GET['id'])) {
                $codigo = $_GET['id'];
                $sql = "SELECT * FROM tcuentas WHERE codigo='$codigo'";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                } else {
                    echo "<div class='alert alert-warning' role='alert'>No se encontró el registro</div>";
                }
            }
            
            ?>

            <form method="post" action="update.php">
                <input type="hidden" name="codigo" value="<?php echo $row['codigo']; ?>">
                <div class="mb-3">
                    <label for="nombrecuenta" class="form-label">Nombre de Cuenta</label>
                    <input type="text" class="form-control" id="nombrecuenta" name="nombrecuenta" value="<?php echo $row['nombrecuenta']; ?>" required>
                </div>
                <div class="mb-3">
                    <label for="descripcion" class="form-label">Descripción</label>
                    <textarea class="form-control" id="descripcion" name="descripcion" required><?php echo $row['descripcion']; ?></textarea>
                </div>
                <div class="mb-3">
                    <label for="nivel" class="form-label">Nivel</label>
                    <input type="number" class="form-control" id="nivel" name="nivel" value="<?php echo $row['nivel']; ?>" required>
                </div>
                <div class="mb-3">
                    <label for="agrupado" class="form-label">Agrupado</label>
                    <input type="text" class="form-control" id="agrupado" name="agrupado" value="<?php echo $row['agrupado']; ?>" required>
                </div>
                <div class="mb-3">
                    <label for="tipoactualizacion" class="form-label">Tipo de Actualización</label>
                    <input type="text" class="form-control" id="tipoactualizacion" name="tipoactualizacion" value="<?php echo $row['tipoactualizacion']; ?>" required>
                </div>
                <div class="mb-3">
                    <label for="habilitado" class="form-label">Habilitado</label>
                    <input type="text" class="form-control" id="habilitado" name="habilitado" value="<?php echo $row['habilitado']; ?>" required>
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