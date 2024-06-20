<?php 
    include_once("../plantilla/inicio.php");
    include '../cone.php';
?>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f3f4f6;
    }
    .main {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        padding: 20px;
    }
    .container {
        max-width: 800px;
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .container h2 {
        font-size: 2.5rem;
        font-weight: bold;
        color: #333;
        text-align: center;
        margin-bottom: 20px;
    }
    .container p {
        font-size: 1.2rem;
        font-weight: 600;
        color: #666;
        text-align: center;
        margin-bottom: 30px;
    }
    .container img {
        display: block;
        margin: 0 auto;
        max-width: 100%;
        height: auto;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }
    .container ul {
        padding: 0;
        margin: 0;
    }
    .container ul li {
        font-size: 1.1rem;
        margin-bottom: 12px;
        color: #555;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .container ul li strong {
        font-weight: bold;
        width: 40%;
    }
    .container .copyright {
        text-align: right;
        color: #888;
        margin-top: 20px;
        font-size: 0.9rem;
    }
</style>
<div class="main">
    <div class="container">
        <h2>Acerca del desarrollador</h2>
        <p>Sistema web para contabilidad Basica</p>
        <img src="../img/logo.jpg" alt="Logo" style="width: 200px; height: auto;">
        <section id="acerca-de" class="mb-4">
            <ul>
                <li><strong>Aplicación:</strong> Contable (Web)</li>
                <li><strong>Versión:</strong> 1.0 - 2024</li>
                <li><strong>Desarrollado por:</strong> Jhonatan Cristian Santa Cruz</li>
                <li><strong>Descripcion:</strong> Sistema contable para estudiantes</li>
                <li><strong>Docente:</strong> Pablo Deyby Canaviri Maydana</li>
                <li><strong>Celular docente:</strong> 72017756</li>
                <li><strong>Contacto Desarrollador:</strong> 65673891 - cristiaansantacruz@gmail.com</li>
            </ul>
        </section>
        <p class="copyright">&copy; BalancePerfecto</p>
    </div>
</div>
<?php 
    include_once("../plantilla/final.php");
?>