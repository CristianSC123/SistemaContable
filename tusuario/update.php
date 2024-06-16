<?php 
    include_once("../plantilla/inicio.php");
    
?>
        <div class="main p-3">
        <div class="container mt-5">
            <h2 class="mb-4">Editar Usuario</h2>
            <?php
            include_once '../cone.php';
   
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                $idusuario = $_POST['idusuario'];
                $nombre = $_POST['nombre'];
                $usuario = $_POST['usuario'];
                $password = $_POST['password'];

                $sql = "UPDATE tusuario SET nombre='$nombre', usuario='$usuario', password='$password' WHERE idusuario=$idusuario";

                if ($conn->query($sql) === TRUE) {
                    echo "<div class='alert alert-success' role='alert'>Registro actualizado exitosamente</div>";                                                            
                    echo "<a href='index.php'><button>Regresar</a>";
                    exit();
                } else {
                    echo "<div class='alert alert-danger' role='alert'>Error: " . $sql . "<br>" . $conn->error . "</div>";
                }
            }

            if (isset($_GET['id'])) {
                $idusuario = $_GET['id'];
                $sql = "SELECT * FROM tusuario WHERE idusuario=$idusuario";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    $row = $result->fetch_assoc();
                } else {
                    echo "<div class='alert alert-warning' role='alert'>No se encontró el registro</div>";
                }
            }
            
            ?>

            <form method="post" action="update.php">
                <input type="hidden" name="idusuario" value="<?php echo $row['idusuario']; ?>">
                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" value="<?php echo $row['nombre']; ?>" required>
                </div>
                <div class="mb-3">
                    <label for="usuario" class="form-label">Usuario</label>
                    <input type="text" class="form-control" id="usuario" name="usuario" value="<?php echo $row['usuario']; ?>" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="text" class="form-control" id="password" name="password" value="<?php echo $row['password']; ?>">
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