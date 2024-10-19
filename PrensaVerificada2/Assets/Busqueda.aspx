<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Busqueda.aspx.cs" Inherits="PrensaVerificada2.Assets.Busqueda" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Búsqueda Avanzada</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 text-gray-800">

    <!-- Contenedor para el Header -->
    <div id="header"></div>

    <!-- Búsqueda Avanzada -->
    <section class="container mx-auto p-8">
        <h2 class="text-center text-3xl font-semibold mb-6">Búsqueda Avanzada</h2>

        <!-- Filtros de búsqueda -->
        <div class="bg-white p-6 rounded-lg shadow-md mb-6">
            <div class="flex flex-wrap gap-4 items-center justify-center">
                <button class="px-4 py-2 bg-gray-100 text-gray-700 rounded">Hoy</button>
                <button class="px-4 py-2 bg-gray-100 text-gray-700 rounded">Ayer</button>
                <button class="px-4 py-2 bg-gray-100 text-gray-700 rounded">Últimos 7 días</button>
                <button class="px-4 py-2 bg-gray-100 text-gray-700 rounded">Último mes</button>
                <button class="px-4 py-2 bg-gray-100 text-gray-700 rounded">Último año</button>
                <input type="date" class="border border-gray-300 p-2 rounded" value="2022-02-08">
            </div>

            <div class="flex flex-wrap gap-4 items-center justify-center mt-4">
                <select class="border border-gray-300 p-2 rounded">
                    <option value="">Autores</option>
                </select>
                <input type="text" placeholder="Filtrar Autores" class="border border-gray-300 p-2 rounded">
                <input type="text" placeholder="Palabras clave" class="border border-gray-300 p-2 rounded">
                <select class="border border-gray-300 p-2 rounded">
                    <option value="">Categorías</option>
                </select>
                <input type="text" placeholder="Filtrar categorías" class="border border-gray-300 p-2 rounded">
                <select class="border border-gray-300 p-2 rounded">
                    <option value="">Etiquetas</option>
                </select>
                <input type="text" placeholder="Filtrar etiquetas" class="border border-gray-300 p-2 rounded">
            </div>

            <div class="flex justify-center mt-6">
                <button class="bg-gray-300 text-gray-700 px-4 py-2 rounded">Borrar</button>
                <button class="bg-blue-500 text-white px-4 py-2 ml-4 rounded">Buscar</button>
            </div>
        </div>

        <!-- Resultados de búsqueda -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="bg-white p-4 rounded-lg shadow-md">
                <img src="img/mbappe.jpg" alt="Imagen 1" class="rounded h-48 w-full mb-4">
                <span class="block text-blue-600 mb-2">Deportes</span>
                <h3 class="text-xl font-semibold mb-2">El contrato de Mbappé en el Real Madrid es impresionante</h3>
                <p class="text-gray-500">Ernie Smith &bull; 4 de junio de 2024</p>
            </div>
            <div class="bg-white p-4 rounded-lg shadow-md">
                <img src="img/netflix-peliculas-7jpg.jpg" alt="Imagen 2" class="rounded h-48 w-full mb-4">
                <span class="block text-blue-600 mb-2">Streaming</span>
                <h3 class="text-xl font-semibold mb-2">Está en Netflix, tiene a Brad Pitt y está basada en un best seller</h3>
                <p class="text-gray-500">Eric Smith &bull; 4 de junio de 2024</p>
            </div>
            <div class="bg-white p-4 rounded-lg shadow-md">
                <img src="./img/dolar.jpg" alt="Imagen 3" class="rounded h-48 w-full mb-4">
                <span class="block text-blue-600 mb-2">Economía</span>
                <h3 class="text-xl font-semibold mb-2">Fuerte suba del dólar blue de los financieros y se amplía la brecha con el oficial</h3>
                <p class="text-gray-500">Tracey Wilson &bull; 4 de junio de 2024</p>
            </div>
        </div>

        <!-- Botón de retorno -->
        <div class="flex justify-center mt-8">
            <button id="principal-btn" class="bg-gray-200 text-gray-600 px-6 py-2 rounded">Parece que no hay más, volver a inicio</button>
        </div>
    </section>

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
    </script>

</body>

</html>
