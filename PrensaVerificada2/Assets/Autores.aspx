<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Autores.aspx.cs" Inherits="PrensaVerificada2.Assets.Autores" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nuestros Autores</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Enlace a Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body class="bg-gray-100 text-gray-800">

    <!-- Contenedor para el Header -->
    <div id="header"></div>

    <!-- Sección de autores -->
    <section class="container mx-auto p-8 mt-8 bg-white shadow-lg rounded-lg">
        <h2 class="text-center text-3xl font-semibold mb-4">Nuestros autores</h2>
        <p class="text-center text-gray-600 mb-8">Estos son los periodistas que colaboran con nuestro portal y enriquecen nuestra comunidad</p>

        <!-- Tarjetas de autores -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
            <!-- Autor 1 -->
            <div class="bg-white p-4 rounded-lg shadow-md" onclick="window.location.href='./Autor.aspx'">
                <img src="img/alconada.jpg" alt="Autor 1" class="rounded-lg h-48 w-full">
                <h3 class="text-lg font-bold mt-4">Hugo Alconda Mon</h3>
                <p class="text-sm text-gray-500">La Nacion</p>
                <p class="text-sm text-gray-700 mt-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.</p>
                <div class="flex space-x-4 mt-4">
                    <a href="https://x.com/halconada" class="text-gray-500 hover:text-gray-700"><i class="fab fa-twitter"></i></a>
                    <a href="https://www.instagram.com/halconada/?hl=es" class="text-gray-500 hover:text-gray-700"><i class="fab fa-instagram"></i></a>
                </div>
            </div>

            <!-- Autor 2 -->
            <div class="bg-white p-4 rounded-lg shadow-md" onclick="window.location.href='./Autor.aspx'">
                <img src="img/Soledad-Larghi-Revista-GENTE-10.jpg.jpg" alt="Autor 2" class="rounded-lg h-48 w-full ">
                <h3 class="text-lg font-bold mt-4">Soledad Larghi</h3>
                <p class="text-sm text-gray-500">America Noticias</p>
                <p class="text-sm text-gray-700 mt-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.</p>
                <div class="flex space-x-4 mt-4">
                    <a href="https://www.facebook.com/SoledadLarghi/" class="text-gray-500 hover:text-gray-700"><i class="fab fa-facebook-f"></i></a>
                    <a href="https://twitter.com/SoledadLarghi" class="text-gray-500 hover:text-gray-700"><i class="fab fa-twitter"></i></a>
                    <a href="https://www.instagram.com/solelarghi/" class="text-gray-500 hover:text-gray-700"><i class="fab fa-instagram"></i></a>
                    <a href="https://www.youtube.com/user/SoledadLarghi" class="text-gray-500 hover:text-gray-700"><i class="fab fa-youtube"></i></a>
                </div>
            </div>

            <!-- Autor 3 -->
            <div class="bg-white p-4 rounded-lg shadow-md" onclick="window.location.href='./Autor.aspx'">
                <img src="img/tenembaum.jpg" alt="Autor 3" class="rounded-lg h-48 w-full">
                <h3 class="text-lg font-bold mt-4">Ernesto Tenembaum</h3>
                <p class="text-sm text-gray-500">Infobae</p>
                <p class="text-sm text-gray-700 mt-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.</p>
                <div class="flex space-x-4 mt-4">
                    <a href="https://www.instagram.com/ernesto_tenembaum/" class="text-gray-500 hover:text-gray-700"><i class="fab fa-instagram"></i></a>
                    <a href="https://twitter.com/ertenembaum" class="text-gray-500 hover:text-gray-700"><i class="fab fa-twitter"></i></a>
                </div>
            </div>

            <!-- Autor 4 -->
            <div class="bg-white p-4 rounded-lg shadow-md" onclick="window.location.href='./Autor.aspx'">
                <img src="img/carlospagni.avif" alt="Autor 4" class="rounded-lg h-48 w-full">
                <h3 class="text-lg font-bold mt-4">Carlos Pagni</h3>
                <p class="text-sm text-gray-500">La Nacion</p>
                <p class="text-sm text-gray-700 mt-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.</p>
                <div class="flex space-x-4 mt-4">
                    <a href="https://www.facebook.com/carlospagniLn/" class="text-gray-500 hover:text-gray-700"><i class="fab fa-facebook-f"></i></a>
                    <a href="https://twitter.com/CarlosPagniOKK" class="text-gray-500 hover:text-gray-700"><i class="fab fa-twitter"></i></a>
                    <a href="https://www.instagram.com/carlospagni/" class="text-gray-500 hover:text-gray-700"><i class="fab fa-instagram"></i></a>
                    <a href="https://ar.linkedin.com/in/carlos-pagni-b50329117" class="text-gray-500 hover:text-gray-700"><i class="fab fa-linkedin"></i></a>
                </div>
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
