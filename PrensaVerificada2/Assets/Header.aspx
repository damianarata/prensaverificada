﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Header.aspx.cs" Inherits="PrensaVerificada2.Assets.Header" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Estilo para la lista de sugerencias */
        #suggestions {
            border: 1px solid #ddd;
            max-height: 200px;
            overflow-y: auto;
            position: absolute;
            background-color: white;
            width: 100%;
            z-index: 10;
        }

        #suggestions li {
            padding: 10px;
            cursor: pointer;
        }

        #suggestions li:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body class="bg-gray-100">
    <!-- Header -->
    <header class="bg-white shadow-md">
        <div class="container mx-auto px-4 py-4 flex justify-between items-center">
            <!-- Logo / Título -->
            <div>
                <a href="./Home.aspx" class="text-2xl font-bold text-gray-800">Prensa Verificada AR</a>
            </div>
    
            <!-- Navegación -->
            <nav class="space-x-4">
                <a href="./Index.aspx" class="text-gray-700 hover:text-blue-500">Principal</a>
                <a href="./Favoritos.aspx" class="text-gray-700 hover:text-blue-500">Favoritos</a>
                <a href="./Publicaciones.aspx" class="text-gray-700 hover:text-blue-500">Publicaciones</a>
                <a href="./Categorias.aspx" class="text-gray-700 hover:text-blue-500">Categorías</a>
                <a href="./Autores.aspx" class="text-gray-700 hover:text-blue-500">Autores</a>
                <button id="login-btn" class="ml-2 px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600">Iniciar sesion</button>
            </nav>

            <!-- Buscador -->
            <div class="relative">
                <input type="text" id="search" placeholder="Buscar..." class="px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">                
                <!-- Lista de Sugerencias -->
                <ul id="suggestions" class="hidden"></ul>
            </div>

            <nav class="space-x-4">
                <a href="./Busqueda.aspx" class="text-gray-700 hover:text-blue-500">Búsqueda avanzada</a>
            </nav>
    
            <!-- Perfil del Usuario con Dropdown -->
            <div class="relative">
                <button id="user-menu-button" class="flex items-center space-x-2 focus:outline-none">
                    <img src="img/dami.png" alt="Profile" class="w-8 h-8 rounded-full">
                    <span class="text-gray-700">Damian Arata</span>
                    <svg class="w-4 h-4 text-gray-500" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                    </svg>
                </button>
    
                <!-- Dropdown Menu -->
                <div id="user-menu" class="hidden absolute right-0 mt-2 w-48 bg-white border border-gray-200 rounded-lg shadow-lg z-10">
                    <a href="./Perfil.aspx" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Mi perfil</a>
                    <a href="./Editor.aspx" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Crear publicación</a>
                    <a href="./MisPublicaciones.aspx" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Mis publicaciones</a>
                    <a href="./Bitacora.aspx" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Bitacora</a>
                    <a href="./Reclamos.aspx" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Reclamos</a>
                    <a href="./Contacto.aspx" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Ayuda</a>
                    <a href="./Home.aspx?logout=true" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Cerrar sesión</a>
                </div>
            </div>
        </div>
    </header>
    
    <script>
        const searchInput = document.getElementById('search');
        const suggestionsBox = document.getElementById('suggestions');

        const suggestions = [
            "Economía",
            "Negocios",
            "Inversiones",
            "Política",
            "Tecnología",
            "Salud",
            "Educación",
            "Deportes",
            "Cultura",
            "Medio Ambiente"
        ];

        searchInput.addEventListener('input', function() {
            const query = this.value.toLowerCase();
            suggestionsBox.innerHTML = ''; // Clear previous suggestions

            if (query) {
                const filteredSuggestions = suggestions.filter(suggestion => 
                    suggestion.toLowerCase().includes(query)
                );

                filteredSuggestions.forEach(suggestion => {
                    const li = document.createElement('li');
                    li.textContent = suggestion;
                    li.addEventListener('click', function() {
                        searchInput.value = suggestion;
                        suggestionsBox.classList.add('hidden');
                    });
                    suggestionsBox.appendChild(li);
                });

                suggestionsBox.classList.remove('hidden');
            } else {
                suggestionsBox.classList.add('hidden');
            }
        });

        document.addEventListener('click', function(event) {
            if (!suggestionsBox.contains(event.target) && event.target !== searchInput) {
                suggestionsBox.classList.add('hidden');
            }
        });

        // Toggle Dropdown Menu
        document.getElementById('user-menu-button').addEventListener('click', function () {
            var menu = document.getElementById('user-menu');
            menu.classList.toggle('hidden');
        });
    
        // Close the dropdown if clicked outside
        document.addEventListener('click', function (event) {
            var isClickInside = document.getElementById('user-menu-button').contains(event.target);
            if (!isClickInside) {
                document.getElementById('user-menu').classList.add('hidden');
            }
        });

        document.getElementById('login-btn').addEventListener('click', function() {
            window.location.href = './login';
        });
    </script>
</body>
</html>

