﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecoverPass.aspx.cs" Inherits="PrensaVerificada2.Assets.RecoverPass" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recupero de Contraseña</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex flex-col min-h-screen">

    <!-- Contenedor para el Header -->
    <div id="header"></div>

    <!-- Contenido principal -->
    <div class="flex-grow flex items-center justify-center">
        <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-sm">
            <!-- Título -->
            <h2 class="text-2xl font-semibold text-gray-800 mb-2">Recupero</h2>
            <p class="text-gray-600 mb-6">Recupera tu contraseña con el siguiente procedimiento</p>

            <!-- Formulario de Recupero -->
            <form action="#" method="POST" class="space-y-4">
                <div>
                    <label for="email" class="block text-gray-700">Email</label>
                    <input type="email" id="email" name="email" class="w-full mt-1 p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500" required>
                </div>
                <div>
                    <label for="repeat-email" class="block text-gray-700">Repetir Email</label>
                    <input type="email" id="repeat-email" name="repeat-email" class="w-full mt-1 p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500" required>
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

                <!-- Botón de Enviar (deberia ser submit) -->
                <button id="recover-btn" type="button" class="w-full py-3 mt-4 bg-gray-300 text-gray-600 rounded-full text-lg font-semibold">
                    Enviar correo
                </button>
            </form>
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

                userMenuButton.addEventListener('click', function (event) {
                    event.preventDefault(); // Evita comportamiento de enlace predeterminado
                    userMenu.classList.toggle('hidden');
                });

                document.addEventListener('click', function (event) {
                    var isClickInside = userMenuButton.contains(event.target) || userMenu.contains(event.target);

                    if (!isClickInside) {
                        userMenu.classList.add('hidden');
                    }
                });

                document.getElementById('login-btn').addEventListener('click', function (event) {
                    event.preventDefault(); // Asegura que no se recargue la página
                    window.location.href = './Login.aspx';
                });
            });

        // Cargar el Footer
        fetch('footer.html')
            .then(response => response.text())
            .then(data => {
                document.getElementById('footer').innerHTML = data;
            });
        document.getElementById('recover-btn').addEventListener('click', function() {
            window.location.href = './NewPass.aspx';
        });
    </script>

</body>
</html>

