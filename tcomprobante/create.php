<?php
include_once("../plantilla/inicio.php");
include_once('../cone.php');
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Comprobante</title>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <style>
        .main {
            padding: 20px;
        }

        .form-label {
            font-weight: bold;
        }
    </style>
</head>

<body>
    <div class="main p-3">
        <div class="container mt-5">
            <h2 class="mb-4">Crear Comprobante</h2>
            <form method="post" action="store.php" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="codtipocomprobante" class="form-label">Tipo de Comprobante:</label>
                        <select class="form-control" id="codtipocomprobante" name="codtipocomprobante" required>
                            <option value="Ingreso">Ingreso</option>
                            <option value="Egreso">Egreso</option>
                            <option value="Traspaso">Traspaso</option>
                        </select>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="senior" class="form-label">Señor(a):</label>
                        <input type="text" class="form-control" id="senior" name="senior" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="nocomprobante" class="form-label">Número de Comprobante:</label>
                        <input type="text" class="form-control" id="nocomprobante" name="nocomprobante" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="tc" class="form-label">Tipo de Cambio:</label>
                        <input type="text" class="form-control" id="tc" name="tc" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="fecha" class="form-label">Fecha:</label>
                        <input type="date" class="form-control" id="fecha" name="fecha" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="glosag" class="form-label">Glosa:</label>
                        <input type="text" class="form-control" id="glosag" name="glosag" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="estadoasiento" class="form-label">Estado Asiento:</label>
                        <input type="text" class="form-control" id="estadoasiento" name="estadoasiento" enctype="multipart/form-data" required>
                    </div>
                    <div class="mb-3">
                        <label for="documentos" class="form-label">Documentos Adjuntos (JPG, JPEG):</label>
                        <input type="file" class="form-control" id="documentos" name="documentos[]" accept=".jpg, .jpeg" multiple>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="detalle" class="form-label">Agregar cuentas:</label>
                    <table class="table table-bordered">
                        <thead class='table-primary'>
                            <tr>
                                <th>#</th>
                                <th>Cuenta</th>
                                <th>Glosa</th>
                                <th>Debe</th>
                                <th>Haber</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="detalles">
                            <tr>
                                <td>1</td>
                                <td>
                                    <select class="form-control cuenta-select" name="cuenta[]" required>
                                        <option value="">Seleccione...</option>
                                        <?php
                                        $sql = "SELECT codigo, nombrecuenta FROM tcuentas WHERE nivel = 5";
                                        $result = $conn->query($sql);
                                        if ($result->num_rows > 0) {
                                            while ($row = $result->fetch_assoc()) {
                                                echo "<option value='" . $row['codigo'] . "'>" . $row['codigo'] . " - " . $row['nombrecuenta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </td>
                                <td><input type="text" class="form-control" name="glosadetalles[]"></td>
                                <td><input type="decimal" class="form-control" name="debe[]" value="0" required></td>
                                <td><input type="decimal" class="form-control" name="haber[]" value="0" required></td>
                                <td><button type="button" class="btn btn-danger" onclick="eliminarDetalle(this)">Eliminar</button></td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th colspan="3" class="text-right">Total:</th>
                                <th><input type="decimal" class="form-control" id="totaldebe" name="totaldebe" value="0" readonly></th>
                                <th><input type="decimal" class="form-control" id="totalhaber" name="totalhaber" value="0" readonly></th>
                                <th></th>
                            </tr>
                        </tfoot>
                    </table>
                    <button type="button" class="btn btn-secondary" onclick="agregarDetalle()">Agregar Detalle</button>
                </div>
                <button type="submit" class="btn btn-primary mt-3">Crear Comprobante</button>
            </form>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        var $j = jQuery.noConflict();
        $j(document).ready(function() {
            $j('.cuenta-select').select2({
                width: '350px' // Establecer el ancho deseado para el Select2
            });

            window.agregarDetalle = function() {
                const table = document.getElementById('detalles');
                const rowCount = table.rows.length;
                const row = table.insertRow(rowCount);
                row.innerHTML = `
                    <td>${rowCount + 1}</td>
                    <td>
                        <select class="form-control cuenta-select" name="cuenta[]" required>
                            <option value="">Seleccione...</option>
                            <?php
                            $sql = "SELECT codigo, nombrecuenta FROM tcuentas WHERE nivel = 5";
                            $result = $conn->query($sql);
                            if ($result->num_rows > 0) {
                                while ($row = $result->fetch_assoc()) {
                                    echo "<option value='" . $row['codigo'] . "'>" . $row['codigo'] . " - " . $row['nombrecuenta'] . "</option>";
                                }
                            }
                            ?>
                        </select>
                    </td>
                    <td><input type="text" class="form-control" name="glosadetalles[]"></td>
                    <td><input type="decimal" class="form-control" name="debe[]" value="0" required></td>
                    <td><input type="decimal" class="form-control" name="haber[]" value="0" required></td>
                    <td><button type="button" class="btn btn-danger" onclick="eliminarDetalle(this)">Eliminar</button></td>
                `;
                $j('.cuenta-select').select2({
                    width: '350px' // Reaplicar Select2 con el ancho deseado después de agregar nueva fila
                });
            };

            window.eliminarDetalle = function(button) {
                const row = button.parentNode.parentNode;
                row.parentNode.removeChild(row);
                actualizarTotales();
            };

            function actualizarTotales() {
                let totalDebe = 0;
                let totalHaber = 0;

                const debeInputs = document.querySelectorAll('input[name="debe[]"]');
                debeInputs.forEach(input => {
                    totalDebe += parseFloat(input.value) || 0;
                });

                const haberInputs = document.querySelectorAll('input[name="haber[]"]');
                haberInputs.forEach(input => {
                    totalHaber += parseFloat(input.value) || 0;
                });

                document.getElementById('totaldebe').value = totalDebe;
                document.getElementById('totalhaber').value = totalHaber;
            }

            document.addEventListener('input', actualizarTotales);
        });
    </script>
</body>

</html>

<?php
include_once("../plantilla/final.php");
?>