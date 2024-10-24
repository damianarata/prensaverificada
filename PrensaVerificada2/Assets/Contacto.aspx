﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="PrensaVerificada2.Assets.Contacto" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contactanos</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 text-gray-800">

    <!-- Header Container -->
    <div id="header"></div>

    <!-- Formulario de contacto -->
    <section class="container mx-auto p-8">
        <h2 class="text-center text-3xl font-semibold mb-6">Contactanos</h2>
        <form class="bg-white p-8 rounded-lg shadow-md max-w-3xl mx-auto">
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 mb-6">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2" for="nombre">Nombre*</label>
                    <input type="text" id="nombre" class="w-full border border-gray-300 p-2 rounded" placeholder="Escribí acá.." required>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2" for="email">E-mail*</label>
                    <input type="email" id="email" class="w-full border border-gray-300 p-2 rounded" placeholder="Escribí acá.." required>
                </div>
            </div>
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 mb-6">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2" for="telefono">Teléfono</label>
                    <input type="text" id="telefono" class="w-full border border-gray-300 p-2 rounded" placeholder="Escribí acá..">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2" for="pais">País</label>
                    <select id="pais" class="w-full border border-gray-300 p-2 rounded">
                        <option>Selecciona tu país</option>
                        <!-- Opciones de países -->
                    </select>
                </div>
            </div>
            <div class="mb-6">
                <label class="block text-sm font-medium text-gray-700 mb-2" for="motivo">Motivo</label>
                <textarea id="motivo" class="w-full border border-gray-300 p-2 rounded" rows="4" placeholder="Escribí acá.."></textarea>
            </div>
            <div class="flex items-center justify-between">
                <button id="faq-btn" type="button" class="bg-blue-500 text-white px-4 py-2 rounded">Preguntas frecuentes</button>
                <button type="submit" class="bg-gray-300 text-gray-700 px-4 py-2 rounded">Enviar</button>
            </div>
        </form>
    </section>

    <!-- Footer Container -->
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
    </script>
</body>

</html>
