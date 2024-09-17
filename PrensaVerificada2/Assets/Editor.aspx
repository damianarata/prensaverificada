﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Editor.aspx.cs" Inherits="PrensaVerificada2.Assets.Editor" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tu Publicación</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 text-gray-800">

    <!-- Contenedor para el Header -->
    <div id="header"></div>

    <!-- Área de edición de publicaciones -->
    <section class="container mx-auto p-8 bg-white shadow-lg rounded-lg mt-8">
        <h2 class="text-center text-3xl font-semibold mb-6">Tu publicación</h2>

        <!-- Barra de herramientas -->
        <div class="bg-gray-50 p-4 rounded-t-lg border-b border-gray-200">
            <div class="flex items-center space-x-4">
                <!-- Etiquetas -->
                <div class="flex items-center space-x-2">
                    <button class="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-md shadow-sm hover:bg-gray-50 focus:outline-none">
                        Etiquetas
                    </button>
                    <button class="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-md shadow-sm hover:bg-gray-50 focus:outline-none">
                        Editar
                    </button>
                    <button class="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-md shadow-sm hover:bg-gray-50 focus:outline-none">
                        Ver
                    </button>
                    <button class="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-md shadow-sm hover:bg-gray-50 focus:outline-none">
                        Insertar
                    </button>
                    <button class="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-md shadow-sm hover:bg-gray-50 focus:outline-none">
                        Formato
                    </button>
                    <button class="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-md shadow-sm hover:bg-gray-50 focus:outline-none">
                        Herramientas
                    </button>
                    <button class="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-md shadow-sm hover:bg-gray-50 focus:outline-none">
                        Ayuda
                    </button>
                </div>

                <!-- Opciones adicionales -->
                <div class="flex-grow flex justify-end items-center space-x-4">
                    <button class="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-md shadow-sm hover:bg-gray-50 focus:outline-none">
                        Previsualizar
                    </button>
                    <button class="px-4 py-2 text-sm font-medium text-white bg-blue-600 border border-transparent rounded-md shadow-sm hover:bg-blue-700 focus:outline-none">
                        Publicar
                    </button>
                </div>
            </div>
        </div>

        <!-- Editor de texto -->
        <div class="p-8">
            <h3 class="text-2xl font-semibold mb-4">Titulo</h3>
            <h4 class="text-xl font-medium mb-4">Subtitulo</h4>

            <!-- Lista de verificación -->
            <ul class="mb-4">
                <li class="flex items-center mb-2">
                    <input type="checkbox" class="h-4 w-4 text-blue-600 border-gray-300 rounded focus:ring-blue-500" checked>
                    <span class="ml-2 text-gray-700">Principales frases</span>
                </li>
                <li class="flex items-center mb-2">
                    <input type="checkbox" class="h-4 w-4 text-blue-600 border-gray-300 rounded focus:ring-blue-500">
                    <span class="ml-2 text-gray-700">Organize training sessions for working with rich text editor</span>
                </li>
                <li class="flex items-center mb-2">
                    <input type="checkbox" class="h-4 w-4 text-blue-600 border-gray-300 rounded focus:ring-blue-500">
                    <span class="ml-2 text-gray-700">Strategize the rich text editor component structure</span>
                </li>
            </ul>

            <!-- Lista de características -->
            <div class="grid grid-cols-2 gap-4 mb-8">
                <ul class="list-disc pl-5">
                    <li>Responsive design</li>
                    <li>WYSIWYG interface</li>
                    <li>Text alignment</li>
                    <li>Image insertion and editing</li>
                </ul>
                <ul class="list-disc pl-5">
                    <li>Rich-text formatting</li>
                    <li>Font styles and sizes</li>
                    <li>Bullet and numbered lists</li>
                    <li>Hyperlink creation</li>
                </ul>
                <ul class="list-disc pl-5">
                    <li>Real-time editing</li>
                    <li>Text color and highlighting</li>
                    <li>Undo/redo functionality</li>
                    <li>Dark and light mode</li>
                </ul>
            </div>

            <!-- Imagen -->
            <div class="mb-8">
                <img src="https://via.placeholder.com/800x400" alt="Imagen de ejemplo" class="w-full h-auto rounded-lg shadow-md">
            </div>
        </div>
    </section>

    <!-- Contenedor para el Footer -->
    <div id="footer" class="mt-8"></div>

    <!-- Iconos de redes sociales -->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
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