﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MisPublicaciones.aspx.cs" Inherits="PrensaVerificada2.Assets.MisPublicaciones" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tus Publicaciones</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 text-gray-800">

    <!-- Contenedor para el Header -->
    <div id="header"></div>

    <!-- Tabla de Publicaciones -->
    <section class="container mx-auto p-8">
        <h2 class="text-center text-3xl font-semibold mb-6">Tus publicaciones</h2>

        <!-- Tabla -->
        <div class="bg-white shadow overflow-hidden sm:rounded-lg">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Autor
                        </th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Título
                        </th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Fecha
                        </th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Categoría
                        </th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Estado
                        </th>
                        <th scope="col" class="relative px-6 py-3">
                            <span class="sr-only">Acciones</span>
                        </th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    <!-- Fila 1 -->
                    <tr>
                        <td class="px-6 py-4 whitespace-nowrap flex items-center">
                            <img src="img/dami.png" alt="Avatar" class="w-10 h-10 rounded-full mr-4">
                            <div class="text-sm font-medium text-gray-900">Damian Arata</div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">Argentina en la Copa América</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">02/07/2024</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Deportes</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm">
                            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-red-100 text-red-800">Suspendido</span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                            <div class="relative inline-block text-left">
                                <button type="button" class="inline-flex justify-center w-full rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50">
                                    Acciones
                                </button>
                                <!-- <div class="origin-top-right absolute right-0 mt-2 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none">
                                    <div class="py-1" role="menu" aria-orientation="vertical" aria-labelledby="options-menu">
                                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100" role="menuitem">Continuar editando</a>
                                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100" role="menuitem">Suspender</a>
                                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100" role="menuitem">Borrar</a>
                                    </div>
                                </div> -->
                            </div>
                        </td>
                    </tr>

                    <!-- Fila 2 -->
                    <tr>
                        <td class="px-6 py-4 whitespace-nowrap flex items-center">
                            <img src="img/dami.png" alt="Avatar" class="w-10 h-10 rounded-full mr-4">
                            <div class="text-sm font-medium text-gray-900">Damian Arata</div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">Nuevos refuerzos del fútbol local</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">15/10/2024</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">Deportes</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm">
                            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">Publicado</span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                            <div class="relative inline-block text-left">
                                <button type="button" class="inline-flex justify-center w-full rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50">
                                    Acciones
                                </button>
                                <!-- <div class="origin-top-right absolute right-0 mt-2 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none">
                                    <div class="py-1" role="menu" aria-orientation="vertical" aria-labelledby="options-menu">
                                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100" role="menuitem">Continuar editando</a>
                                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100" role="menuitem">Suspender</a>
                                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100" role="menuitem">Borrar</a>
                                    </div>
                                </div> -->
                            </div>
                        </td>
                    </tr>

                    <!-- Repite para más filas -->
                </tbody>
            </table>
        </div>
    </section>

    <!-- Contenedor para el Footer -->
    <div id="footer" class="mt-8"></div>

    <!-- Iconos de redes sociales -->
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
