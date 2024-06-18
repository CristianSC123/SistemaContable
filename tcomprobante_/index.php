<?php 
    include_once("../plantilla/inicio.php");
    
?>
        <div class="main p-3">
        <div class="container mt-5">
            <h2 class="mb-4"> Lista de Comprobantes_</h2>
            <?php
            include_once '../cone.php';

            $sql = "SELECT * FROM tcomprobantes_";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                echo "<table id='tcomprobante_' class='table table-striped table-bordered'>
                <thead class='table-dark'>
                <tr>
                    <th>ID Comprobante</th>
                    <th>Código Comprobante</th>
                    <th>Código Cuenta</th>
                    <th>Glosa Detallada</th>
                    <th>Debe ML</th>
                    <th>Haber ML</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>";

                while($row = $result->fetch_assoc()) {
                    echo "<tr>
                    <td>" . $row["idcomprobante_"]. "</td>
                    <td>" . $row["codcomprobante"]. "</td>
                    <td>" . $row["codcta"]. "</td>
                    <td>" . $row["glosad"]. "</td>
                    <td>" . $row["debeml"]. "</td>
                    <td>" . $row["haberml"]. "</td>
                    <td>
                        <a href='update.php?id=".$row["idcomprobante_"]."' class='btn btn-warning btn-sm'>Editar</a>
                        <a href='delete.php?id=".$row["idcomprobante_"]."' class='btn btn-danger btn-sm'>Eliminar</a>
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
        $('#tcomprobante_').DataTable({
            "language": {
                "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json" 
            }
        });
    });
</script>