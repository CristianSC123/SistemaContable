<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión · BalancePerfecto</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    
    <style>
        html, body {
            height: 100%;
            background-color: #f5f5f5;
        }

        body {
            display: flex;
            align-items: center;
            justify-content: center;
            padding-top: 40px;
            padding-bottom: 40px;
        }

        .form-signin {
            max-width: 450px;
            padding: 15px;
            margin: auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-signin .form-floating:focus-within {
            z-index: 2;
        }

        .form-signin input[type="email"],
        .form-signin input[type="password"],
        .form-signin input[type="text"] {
            margin-bottom: 20px;
            border-radius: 10px;
            width: 100%;
            padding: 15px;
        }

        .form-signin img {
            width: 150px;
            height: auto;
            margin-bottom: 30px;
        }

        .btn-group {
            display: flex;
            justify-content: center;
            flex-direction: column;
            gap: 10px;
            margin-top: 20px;
        }

        .btn-group button {
            width: 100%;
            padding: 15px;
            font-size: 1rem;
        }

        .hidden {
            display: none;
        }

        .logo-text {
            font-family: Arial, sans-serif;
            font-size: 2.5rem;
            font-weight: bold;
            color: #ff0000 ;
            text-align: center;
            margin-bottom: 30px;
        }

        .logo-text span {
            color: black;
        }
    </style>
</head>
<body class="text-center">
    <main class="form-signin">
        <div class="logo-text">
        <span>BalancePerfecto</span>
        </div>
        <div id="signin-form">
            <form method="post" action="login_process.php">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" placeholder="Usuario" name="usuario" required>
                    <label for="floatingInput">Usuario</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="floatingPassword" placeholder="password" name="password" required>
                    <label for="floatingPassword">Password</label>
                </div>

                <div class="btn-group">
                <button class="btn btn-primary" type="submit">Iniciar Sesión</button>          
                </div>
            </form>
        </div>


        <div id="register-form" class="hidden">
            <form method="post" action="login_process1.php">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingName" placeholder="Nombre" name="nombre" required>
                    <label for="floatingName">Nombre</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingUser" placeholder="Usuario" name="usuario" required>
                    <label for="floatingUser">Usuario</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="floatingPassword" placeholder="Contraseña" name="password" required>
                    <label for="floatingPassword">Contraseña</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="floatingConfirmPassword" placeholder="Confirmar Contraseña" name="confirmar_password" required>
                    <label for="floatingConfirmPassword">Confirmar Contraseña</label>
                </div>
            </form>
        </div>
    </main>
</body>
</html>