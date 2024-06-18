<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Título de tu página</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css"
        href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.dataTables.min.css">
    <link rel="stylesheet" href="../style.css">
    <style>
        .treeview-menu {
            display: none;
            list-style: none;
            padding-left: 20px;
        }

        .treeview-menu li {
            padding: 5px 0;
        }

        .treeview-menu li a {
            display: flex;
            align-items: center;
            padding: 0.5rem 1rem;
            color: #FFF;
            text-decoration: none;
            font-size: 0.9rem;
        }

        .treeview-menu li a:hover {
            background-color: rgba(255, 255, 255, .075);
        }

        .treeview-menu li a i {
            margin-right: 0.5rem;
        }

        .active {
            display: block !important;
        }

        .sidebar-link {
            cursor: pointer;
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <aside id="sidebar">
            <div class="d-flex">
                <button class="toggle-btn" type="button">
                    <img src="../img/logo.png" alt="" width="70" height="50">
                </button>
                <div class="sidebar-logo">
                    <a href="">Bienvenido</a>
                </div>
            </div>
            <ul class="sidebar-nav">
                <li class="sidebar-item">
                    <a href="../tcomprobante/index.php" class="sidebar-link">
                        <i class="lni lni-files"></i>
                        <span>Comprobante</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="../tcomprobante_/index.php" class="sidebar-link">
                        <i class="lni lni-files"></i>
                        <span>Comprobante_</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="../tcuentas/index.php" class="sidebar-link">
                        <i class="lni lni-wallet"></i>
                        <span>Cuentas</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="../tempresa/index.php" class="sidebar-link">
                        <i class="lni lni-briefcase"></i>
                        <span>Empresa</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="../tusuario/index.php" class="sidebar-link">
                        <i class="lni lni-users"></i>
                        <span>Usuario</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link">
                        <i class="lni lni-stats-up"></i>
                        <span>Informes</span>
                        <span class="pull-right-container">
                            <i class="lni lni-chevron-down"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="../Reportes/rCuentas.php"><i class="lni lni-book"></i> Cuentas</a></li>
                        <li><a href="../Reportes/rDiario.php"><i class="lni lni-book"></i> Libro Diario</a></li>
                        <li><a href="../Reportes/rComprobantes.php"><i class="lni lni-book"></i> Comprobantes</a></li>
                        <li><a href="../Reportes/rMayor.php"><i class="lni lni-book"></i> Libro Mayor</a></li>
                        <li><a href="../Reportes/rBSS.php"><i class="lni lni-calculator"></i> Balance de Sumas y Saldos</a></li>
                        <li><a href="../Reportes/rBG.php"><i class="lni lni-bar-chart"></i> Balance General</a></li>
                        <li><a href="../Reportes/rER.php"><i class="lni lni-graph"></i> Estado de Resultados </a></li>
                    </ul>
                </li>
            </ul>
            <div class="sidebar-footer">
                <a href="../index.php" class="sidebar-link">
                    <i class="lni lni-exit"></i>
                    <span>Logout</span>
                </a>
            </div>
        </aside>
        <script>
        document.addEventListener('DOMContentLoaded', function () {
            var sidebarLinks = document.querySelectorAll('.sidebar-link');

            sidebarLinks.forEach(function (link) {
                link.addEventListener('click', function () {
                    var currentlyActive = document.querySelector('.treeview-menu.active');
                    var treeviewMenu = this.nextElementSibling;

                    if (currentlyActive && currentlyActive !== treeviewMenu) {
                        currentlyActive.classList.remove('active');
                        currentlyActive.style.display = 'none';
                    }

                    if (treeviewMenu && (treeviewMenu.style.display === 'none' || treeviewMenu.style.display === '')) {
                        treeviewMenu.classList.add('active');
                        treeviewMenu.style.display = 'block';
                    } else if (treeviewMenu) {
                        treeviewMenu.classList.remove('active');
                        treeviewMenu.style.display = 'none';
                    }
                });
            });
        });
        </script>
