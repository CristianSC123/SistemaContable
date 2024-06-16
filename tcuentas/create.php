<?php 
    include_once("../plantilla/inicio.php");
    
?>
        <div class="main p-3">
                <div class="container mt-5">
                    <h2 class="mb-4">Agregar Cuenta</h2>
                    <form method="post" action="store.php">
                    <div class="mb-3">
                            <label for="codigo" class="form-label">Codigo</label>
                            <input type="text" class="form-control" id="codigo" name="codigo" required>
                        </div>
                        <div class="mb-3">
                            <label for="nombrecuenta" class="form-label">Nombre de Cuenta</label>
                            <input type="text" class="form-control" id="nombrecuenta" name="nombrecuenta" required>
                        </div>
                        <div class="mb-3">
                            <label for="descripcion" class="form-label">Descripción</label>
                            <textarea class="form-control" id="descripcion" name="descripcion"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="nivel" class="form-label">Nivel</label>
                            <input type="number" class="form-control" id="nivel" name="nivel" required>
                        </div>
                        <div class="mb-3">
                            <label for="agrupado" class="form-label">Agrupado</label>
                            <input type="text" class="form-control" id="agrupado" name="agrupado" required>
                        </div>
                        <div class="mb-3">
                            <label for="tipoactualizacion" class="form-label">Tipo de Actualización</label>
                            <input type="text" class="form-control" id="tipoactualizacion" name="tipoactualizacion" required>
                        </div>
                        <div class="mb-3">
                            <label for="habilitado" class="form-label">Habilitado</label>
                            <input type="text" class="form-control" id="habilitado" name="habilitado" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Agregar</button>
                        <a href="index.php" class="btn btn-secondary">Volver</a>
                    </form>
                </div>
        </div>
    </div>
    <?php 
    include_once("../plantilla/final.php");
?>