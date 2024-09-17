<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="PrensaVerificada2.Assets.Favoritos" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Favoritos</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

    <!-- Header Container -->
    <div id="header"></div>

    <!-- Contenido Principal -->
    <main class="container mx-auto px-4 py-16">
        <!-- Título de la página -->
        <h1 class="text-3xl font-bold text-gray-800 mb-8">Mis Favoritos</h1>

        <!-- Alerta -->
        <div class="bg-yellow-100 border-l-4 border-yellow-500 text-yellow-700 p-4" role="alert">
            <p class="font-bold">Alerta</p>
            <p>Todavía no tenés favoritos o no iniciaste sesión.</p>
        </div>
    </main>

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

               document.getElementById('faq-btn').addEventListener('click', function() {
                   window.location.href = './Faq.aspx';
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
