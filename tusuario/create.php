<?php 
    include_once("../plantilla/inicio.php");
?>
        <div class="main p-3">
            <div class="text-center">
            <div class="container mt-5">
                <h2 class="mb-4">Agregar Usuario</h2>
                <?php
                if ($_SERVER["REQUEST_METHOD"] == "POST") {
                    include_once '../cone.php';

                    
                    $nombre = $_POST['nombre'];
                    $usuario = $_POST['usuario'];
                    $password = $_POST['password'];
                   

                    $sql = "INSERT INTO tusuario (nombre, usuario, password)
                            VALUES ('$nombre', '$usuario', '$password')";

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
                <input type="hidden" name="idusuario" value="<?php echo $row['idusuario']; ?>">
                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" required>
                </div>
                <div class="mb-3">
                    <label for="usuario" class="form-label">Usuario</label>
                    <input type="text" class="form-control" id="usuario" name="usuario"  required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="text" class="form-control" id="password" name="password" >
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