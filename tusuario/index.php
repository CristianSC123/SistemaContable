<?php 
    include_once("../plantilla/inicio.php");
    include '../cone.php';
    
?>
        <div class="main p-3">
            <div class="text-center">
            <h2 class="mb-4">Lista de Usuario</h2>
            <a href="create.php" class="btn btn-primary mb-3">Agregar Usuario</a>
            <?php                
                $sql = "SELECT * FROM tusuario";
                $result = $conn->query($sql);
                if ($result->num_rows > 0) {
                    echo "<table id='usuario' class='table table-striped table-bordered'>
                    <thead class='table-dark'>
                    <tr>
                        <th>ID usuario</th>
                        <th>Nombre </th>
                        <th>Usuario</th>
                        <th>Password</th>
                        <th>Editar</th>
                        <th>Eliminar</th>                        
                    </tr>
                    </thead>
                    <tbody>";

                    // Salida de los datos de cada fila
                    while($row = $result->fetch_assoc()) {
                        echo "<tr>
                        <td>" . $row["idusuario"]. "</td>
                        <td>" . $row["nombre"]. "</td>
                        <td>" . $row["usuario"]. "</td>
                        <td>" . $row["password"]. "</td>
                        <td>
                            <a href='update.php?id=".$row["idusuario"]."' class='btn btn-warning btn-sm'>Editar</a>
                        </td>
                        <td>
                            <a href='delete.php?id=".$row["idusuario"]."' class='btn btn-danger btn-sm'>Eliminar</a>
                        </td>

                        </tr>";
                    }
                    echo "</tbody></table>";
                } else {
                    echo "<div class='alert alert-warning' role='alert'>0 resultados</div>";
                }

                // Cerrar la conexión
                $conn->close();
                ?>
            </div>
        </div>
    </div>
    <?php 
    include_once("../plantilla/final.php");
?>
<script>
    $(document).ready(function() {
        $('#usuario').DataTable({
            "language": {
                "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json" 
            }
        });
    });
</script>