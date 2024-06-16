<?php 
    include_once("../plantilla/inicio.php");
    
?>
        <div class="main p-3">
        <div class="container mt-5">
    <h2 class="mb-4">Lista de Cuentas</h2>
    <a href="create.php" class="btn btn-primary mb-3">Agregar Cuenta</a>
    <?php
    include_once '../cone.php';

    $sql = "SELECT * FROM tcuentas WHERE nivel = 5";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        echo "<table id='usuarios' class='table table-striped table-bordered  table-responsive' >
        <thead class='table-dark'>
        <tr>
            <th>Código</th>
            <th>Nombre de Cuenta</th>
            <th>Descripción</th>
            <th>Nivel</th>
            <th>Agrupado</th>
            <th>Tipo de Actualización</th>
            <th>Habilitado</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>";

        while($row = $result->fetch_assoc()) {
            echo "<tr>
            <td>" . $row["codigo"]. "</td>
            <td>" . $row["nombrecuenta"]. "</td>
            <td>" . $row["descripcion"]. "</td>
            <td>" . $row["nivel"]. "</td>
            <td>" . $row["agrupado"]. "</td>
            <td>" . $row["tipoactualizacion"]. "</td>
            <td>" . $row["habilitado"]. "</td>
            <td>
                <a href='update.php?id=".$row["codigo"]."' class='btn btn-warning btn-sm'>Editar</a>
                <a href='delete.php?id=".$row["codigo"]."' class='btn btn-danger btn-sm'>Eliminar</a>
            </td>
            </tr>";
        }
        echo "</tbody></table>";
    } else {
        echo "<div class='alert alert-warning' role='alert'>0 resultados</div>";
    }

    $conn->close();
    ?>
</div>
        </div>
    </div>
    <script>
        	
new DataTable('#usuarios');
    </script>
    <?php 
    include_once("../plantilla/final.php");
?>