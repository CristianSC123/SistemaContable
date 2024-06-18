<?php 
    include_once("../plantilla/inicio.php");
    include_once '../cone.php';
    
?>
        <div class="main p-3">
        <div class="container mt-5">
            <h2 class="mb-4">Lista de Comprobantes</h2>
            <a href="create.php" class="btn btn-primary mb-3">Agregar Comprobante</a>
            <?php
            
            $sql = "SELECT * FROM tcomprobantes";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                echo "<table id='tcomprobante' class='table table-striped table-bordered'>
                <thead class='table-dark'>
                <tr>
                    <th>ID Comprobante</th>
                    <th>Tipo Comprobante</th>
                    <th>Número Comprobante</th>
                    <th>Fecha</th>
                    <th>TC</th>
                    <th>Senior</th>
                    <th>Glosa General</th>
                    <th>Estado Asiento</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>";

                while($row = $result->fetch_assoc()) {
                    echo "<tr>
                    <td>" . $row["idcomprobante"]. "</td>
                    <td>" . $row["codtipocomprobante"]. "</td>
                    <td>" . $row["nocomprobante"]. "</td>
                    <td>" . $row["fecha"]. "</td>
                    <td>" . $row["tc"]. "</td>
                    <td>" . $row["senior"]. "</td>
                    <td>" . $row["glosag"]. "</td>
                    <td>" . $row["estadoasiento"]. "</td>
                    <td>
                        <a href='update.php?id=".$row["idcomprobante"]."' class='btn btn-warning btn-sm'>Editar</a>
                        <a href='delete.php?id=".$row["idcomprobante"]."' class='btn btn-danger btn-sm'>Eliminar</a>
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
    <?php 
    include_once("../plantilla/final.php");
?>
<script>
    $(document).ready(function() {
        $('#tcomprobante').DataTable({
            "language": {
                "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json" 
            }
        });
    });
</script>