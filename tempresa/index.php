<?php 
    include_once("../plantilla/inicio.php");
    include '../cone.php';
    
?>
        <div class="main p-3">
            <div class="text-center">
            <h2 class="mb-4">Lista de Empresa</h2>
            <a href="create.php" class="btn btn-primary mb-3">Agregar Empresa</a>
            <?php                
                $sql = "SELECT * FROM tempresa";
                $result = $conn->query($sql);
                if ($result->num_rows > 0) {
                    echo "<table class='table table-striped table-bordered'>
                    <thead class='table-dark'>
                    <tr>
                        <th>ID Empresa</th>
                        <th>NIT</th>
                        <th>Nombre de la Empresa</th>
                        <th>Dirección</th>
                        <th>Teléfono</th>
                        <th>Representante</th>
                        <th>Año</th>
                        <th>Tipo de Empresa</th>
                        <th>Fecha de Inicio</th>
                        <th>Fecha de Fin</th>
                        <th>Sucursal NR</th>
                        <th>Editar</th>
                        <th>Eliminar</th>                        
                    </tr>
                    </thead>
                    <tbody>";

                    // Salida de los datos de cada fila
                    while($row = $result->fetch_assoc()) {
                        echo "<tr>
                        <td>" . $row["idempresa"]. "</td>
                        <td>" . $row["nit"]. "</td>
                        <td>" . $row["nombreempresa"]. "</td>
                        <td>" . $row["direccion"]. "</td>
                        <td>" . $row["telefono"]. "</td>
                        <td>" . $row["representante"]. "</td>
                        <td>" . $row["anio"]. "</td>
                        <td>" . $row["tipoempresa"]. "</td>
                        <td>" . $row["fechai"]. "</td>
                        <td>" . $row["fechaf"]. "</td>
                        <td>" . $row["sucursalnr"]. "</td>
                        <td>
                            <a href='update.php?id=".$row["idempresa"]."' class='btn btn-warning btn-sm'>Editar</a>
                        </td>
                        <td>
                            <a href='delete.php?id=".$row["idempresa"]."' class='btn btn-danger btn-sm'>Eliminar</a>
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