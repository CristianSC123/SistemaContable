<?php
include_once '../cone.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $sql = "SELECT * FROM tcomprobantes WHERE idcomprobante = $id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $ruta = $row['ruta'];
        $rutaArray = explode(',', $ruta);
    } else {
        echo "<div class='alert alert-danger' role='alert'>Comprobante no encontrado.</div>";
        exit();
    }
} else {
    echo "<div class='alert alert-danger' role='alert'>ID de comprobante no proporcionado.</div>";
    exit();
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ver Documentos</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.css">
    <style>
        .carousel-item img {
            max-height: 500px; 
            object-fit: contain; 
            margin: auto;
            transition: transform 0.2s; 
            cursor: zoom-in; 
        }

        .carousel-item img:hover {
            transform: scale(1.1);
        }
    </style>
</head>

<body>
    <div class="container mt-5">
        <h2>Documentos Adjuntos</h2>
        <a href="index.php" class="btn btn-primary mb-3">Volver a la Lista</a>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <?php
                foreach ($rutaArray as $index => $ruta) {
                    $activeClass = ($index === 0) ? 'active' : '';
                    echo "<li data-target='#carouselExampleIndicators' data-slide-to='$index' class='$activeClass'></li>";
                }
                ?>
            </ol>
            <div class="carousel-inner">
                <?php
                foreach ($rutaArray as $index => $ruta) {
                    $activeClass = ($index === 0) ? 'active' : '';
                    echo "<div class='carousel-item $activeClass'>
                            <a href='$ruta' data-fancybox='gallery'>
                                <img src='$ruta' class='d-block w-100' alt='Documento'>
                            </a>
                            <div class='carousel-caption d-none d-md-block'>
                                <p>" . basename($ruta) . "</p>
                            </div>
                          </div>";
                }
                ?>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Anterior</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Siguiente</span>
            </a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
