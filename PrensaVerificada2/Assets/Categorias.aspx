<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categorias.aspx.cs" Inherits="PrensaVerificada2.Assets.Categorias" %>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Nuestras Categorías</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- Enlace a Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body class="bg-gray-100">

  <div id="header"></div>

  <section class="container mx-auto py-16">
    <h2 class="text-3xl font-bold text-center mb-8">Nuestras Categorías</h2>
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4">
      
      <!-- Politica -->
      <div class="bg-white rounded-lg shadow-md">
        <img src="./img/casa-rosada.jpg" alt="Política" class="w-full h-48 object-cover rounded-t-lg">
        <div class="p-4">
          <h3 class="text-xl font-semibold">Política</h3>
        </div>
      </div>
      
      <!-- Tecnologia -->
      <div class="bg-white rounded-lg shadow-md">
        <img src="img/robot.webp" alt="Tecnología" class="w-full h-48 object-cover rounded-t-lg">
        <div class="p-4">
          <h3 class="text-xl font-semibold">Tecnología</h3>
        </div>
      </div>
      
      <!-- Viajes -->
      <div class="bg-white rounded-lg shadow-md">
          <img src="img/viajes.jpeg" alt="Viajes" class="w-full h-48 object-cover rounded-t-lg">
          <div class="p-4">
            <h3 class="text-xl font-semibold">Viajes</h3>
          </div>
      </div>

      <!-- Negocio -->
      <div class="bg-white rounded-lg shadow-md">
        <img src="img/acciones.jpeg" alt="Negocio" class="w-full h-48 object-cover rounded-t-lg">
        <div class="p-4">
          <h3 class="text-xl font-semibold">Negocio</h3>
        </div>
      </div>

      <!-- Economia -->
      <div class="bg-white rounded-lg shadow-md">
        <img src="img/dolar2.webp" alt="Economia" class="w-full h-48 object-cover rounded-t-lg">
        <div class="p-4">
          <h3 class="text-xl font-semibold">Economía</h3>
        </div>
      </div>

      <!-- Deportes -->
      <div class="bg-white rounded-lg shadow-md">
        <img src="img/messi.webp" alt="Deportes" class="w-full h-48 object-cover rounded-t-lg">
        <div class="p-4">
          <h3 class="text-xl font-semibold">Deportes</h3>
        </div>
      </div>  
      </div>
    <div class="flex justify-center mt-8">
      <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Cargar más</button>
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
