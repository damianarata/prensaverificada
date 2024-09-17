<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PrensaVerificada2.Assets.Register" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrarse</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 flex flex-col min-h-screen">

    <!-- Contenedor para el Header -->
    <div id="header"></div>

    <!-- Contenido principal -->
    <div class="flex-grow flex items-center justify-center">
        <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-sm">
            <!-- Título -->
            <h2 class="text-2xl font-semibold text-gray-800 mb-2">Registrarse</h2>
            <p class="text-gray-600 mb-6">Regístrate para tener acceso al portal de noticias</p>

            <!-- Formulario de Registro -->
            <form action="#" method="POST" class="space-y-4">
                <div>
                    <label for="email" class="block text-gray-700">Email</label>
                    <input type="email" id="email" name="email" class="w-full mt-1 p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500" required>
                </div>
                <div>
                    <label for="password" class="block text-gray-700">Contraseña</label>
                    <input type="password" id="password" name="password" class="w-full mt-1 p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500" required>
                    <p class="text-gray-600 text-sm mt-1">Usar más de 8 caracteres que tengan símbolos, mayúsculas y números</p>
                </div>
                <div>
                    <label for="repeat-password" class="block text-gray-700">Repetir Contraseña</label>
                    <input type="password" id="repeat-password" name="repeat-password" class="w-full mt-1 p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500" required>
                    <p class="text-gray-600 text-sm mt-1">Usar más de 8 caracteres que tengan símbolos, mayúsculas y números</p>
                </div>

                <!-- Checkboxes -->
                <div class="space-y-2">
                    <div>
                        <label class="inline-flex items-center text-gray-700">
                            <input type="checkbox" class="form-checkbox text-indigo-600" required>
                            <span class="ml-2">Aceptar nuestros términos y condiciones</span>
                        </label>
                    </div>
                    <div>
                        <label class="inline-flex items-center text-gray-700">
                            <input type="checkbox" class="form-checkbox text-indigo-600">
                            <span class="ml-2">Recibir notificaciones de publicaciones</span>
                        </label>
                    </div>
                </div>

                <!-- reCAPTCHA -->
                <div class="mb-4">
                    <div class="flex items-center">
                        <input type="checkbox" id="recaptcha" name="recaptcha" class="mr-2">
                        <label for="recaptcha" class="text-gray-700">I'm not a robot</label>
                    </div>
                    <!-- Simulación del reCAPTCHA -->
                    <div class="mt-2">
                        <img src="img/recaptcha-icon.png" alt="reCAPTCHA" class="w-24 h-auto">
                    </div>
                </div>

                <!-- Botón de Registrarse -->
                <button type="submit" class="w-full py-3 mt-4 bg-gray-300 text-gray-600 rounded-full text-lg font-semibold" disabled>
                    Registrarse
                </button>
            </form>

            <!-- Enlace de Iniciar Sesión -->
            <p class="mt-4 text-center text-gray-600">¿Ya tienes cuenta? <a href="#" class="text-indigo-600 hover:underline">Iniciar sesión</a></p>
        </div>
    </div>

    <!-- Contenedor para el Footer -->
    <div id="footer" class="mt-8"></div>

    <script>
        // Cargar el Header
        fetch('header.html')
            .then(response => response.text())
            .then(data => {
                document.getElementById('header').innerHTML = data;

                // Dropdown Menu Logic
                var userMenuButton = document.getElementById('user-menu-button');
                var userMenu = document.getElementById('user-menu');

                userMenuButton.addEventListener('click', function () {
                    userMenu.classList.toggle('hidden');
                });

                document.addEventListener('click', function (event) {
                    var isClickInside = userMenuButton.contains(event.target);

                    if (!isClickInside) {
                        userMenu.classList.add('hidden');
                    }
                });

                document.getElementById('login-btn').addEventListener('click', function() {
                    window.location.href = './Login.aspx';
                });
            });

        // Cargar el Footer
        fetch('footer.html')
            .then(response => response.text())
            .then(data => {
                document.getElementById('footer').innerHTML = data;
            });
    </script>

</body>

</html>

