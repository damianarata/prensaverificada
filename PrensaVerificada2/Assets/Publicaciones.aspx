
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Publicaciones.aspx.cs" Inherits="PrensaVerificada2.Assets.Publicaciones" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Publicaciones</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">

    <!-- Contenedor para el Header -->
    <div id="header"></div>

    <!-- Contenido Principal -->
    <main class="container mx-auto px-4 py-16">
        <!-- Título de la página -->
        <h1 class="text-3xl font-bold text-gray-800 mb-8">Publicaciones</h1>

        <!-- Sección de Rankings -->
        <div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-2 xl:grid-cols-3 gap-8">

            <!-- Publicaciones más leídas -->
            <div class="bg-white p-6 rounded-lg shadow-md">
                <h2 class="text-xl font-bold text-gray-700 mb-4">Publicaciones más leídas</h2>
                <ul class="space-y-4">
                    <li class="flex items-center space-x-4" onclick="window.location.href='./Publicacion.aspx'">
                        <img src="img/diputados.jpg" alt="Publicación 1" class="w-16 h-16 rounded-md object-cover">
                        <a href="#" class="text-blue-500 hover:underline">Diputados se suben el sueldo y pasarán a cobrar más de $2,2 millones</a>
                    </li>
                    <li class="flex items-center space-x-4">
                        <img src="img/cristobal.jpg" alt="Publicación 2" class="w-16 h-16 rounded-md object-cover">
                        <a href="#" class="text-blue-500 hover:underline">Empresarios que jugaban en offside a sabiendas de que el VAR los protegía</a>
                    </li>
                </ul>
            </div>

            <!-- Últimas publicaciones -->
            <div class="bg-white p-6 rounded-lg shadow-md">
                <h2 class="text-xl font-bold text-gray-700 mb-4">Últimas publicaciones</h2>
                <ul class="space-y-4">
                    <li class="flex items-center space-x-4">
                        <img src="img/beach.jpg" alt="Última publicación 1" class="w-16 h-16 rounded-md object-cover">
                        <a href="#" class="text-blue-500 hover:underline">Estas son las playas paradisíacas y los destinos invernales que corren riesgo de desaparición por el cambio climático</a>
                    </li>
                    <li class="flex items-center space-x-4">
                        <img src="img/dolar.jpg" alt="Última publicación 2" class="w-16 h-16 rounded-md object-cover">
                        <a href="#" class="text-blue-500 hover:underline">Fuerte suba del dólar blue de los financieros y se amplía la brecha con el oficial</a>
                    </li>
                    <li class="flex items-center space-x-4">
                        <img src="img/chocolate.jpg" alt="Última publicación 3" class="w-16 h-16 rounded-md object-cover">
                        <a href="#" class="text-blue-500 hover:underline">Caso Chocolate: ordenaron la inhibición general de todo el patrimonio de los Albini</a>
                    </li>
                </ul>
            </div>

            <!-- Autores más leídos -->
            <div class="bg-white p-6 rounded-lg shadow-md">
                <h2 class="text-xl font-bold text-gray-700 mb-4">Autores más leídos</h2>
                <ul class="space-y-4">
                    <li class="flex items-center space-x-4" onclick="window.location.href='./Autor.aspx'">
                        <img src="./img/alconada.jpg" alt="Autor 1" class="w-16 h-16 rounded-full object-cover">
                        <a href="#" class="text-blue-500 hover:underline">Hugo Alconda Mon</a>
                    </li>
                    <li class="flex items-center space-x-4" onclick="window.location.href='./Autor.aspx'">
                        <img src="img/Soledad-Larghi-Revista-GENTE-10.jpg.jpg" alt="Autor 2" class="w-16 h-16 rounded-full object-cover">
                        <a href="#" class="text-blue-500 hover:underline">Soledad Larghi</a>
                    </li>
                    <li class="flex items-center space-x-4" onclick="window.location.href='./Autor.aspx'">
                        <img src="img/tenembaum.jpg" alt="Autor 3" class="w-16 h-16 rounded-full object-cover">
                        <a href="#" class="text-blue-500 hover:underline">Ernesto Tenembaum</a>
                    </li>
                    <li class="flex items-center space-x-4" onclick="window.location.href='./Autor.aspx'">
                        <img src="img/carlospagni.avif" alt="Autor 4" class="w-16 h-16 rounded-full object-cover">
                        <a href="#" class="text-blue-500 hover:underline">Carlos Pagni</a>
                    </li>
                </ul>
            </div>

            <!-- Tendencias -->
            <div class="bg-white p-6 rounded-lg shadow-md">
                <h2 class="text-xl font-bold text-gray-700 mb-4">Tendencias</h2>
                <ul class="space-y-4">
                    <li class="flex items-center space-x-4" onclick="window.location.href='./Publicacion.aspx'">
                        <img src="img/diputados.jpg" alt="Publicación 1" class="w-16 h-16 rounded-md object-cover">
                        <a href="#" class="text-blue-500 hover:underline">Diputados se suben el sueldo y pasarán a cobrar más de $2,2 millones</a>
                    </li>
                    <li class="flex items-center space-x-4" onclick="window.location.href='./Publicacion.aspx'">
                        <img src="img/sele-arg.jpg" alt="Tendencia 2" class="w-16 h-16 rounded-md object-cover">
                        <a href="#" class="text-blue-500 hover:underline">Copa América 2024: La Selección argentina, con Lionel Messi, tuvo su primer entrenamiento en Estados Unidos</a>
                    </li>
                </ul>
            </div>

            <!-- Más compartidos -->
            <div class="bg-white p-6 rounded-lg shadow-md">
                <h2 class="text-xl font-bold text-gray-700 mb-4">Más compartidos</h2>
                <ul class="space-y-4">
                    <li class="flex items-center space-x-4" onclick="window.location.href='./Publicacion.aspx'">
                        <img src="img/diputados.jpg" alt="Publicación 1" class="w-16 h-16 rounded-md object-cover">
                        <a href="#" class="text-blue-500 hover:underline">Diputados se suben el sueldo y pasarán a cobrar más de $2,2 millones</a>
                    </li>
                    <li class="flex items-center space-x-4">
                        <img src="img/apple.jpg" alt="Compartido 2" class="w-16 h-16 rounded-md object-cover">
                        <a href="#" class="text-blue-500 hover:underline">Apple quiere aprovechar las bondades de ChatGPT y firma un acuerdo con OpenAI para potenciar el futuro iPhone 16</a>
                    </li>
                    </li>
                </ul>
            </div>

        </div>
    </main>

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
