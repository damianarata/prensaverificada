﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Autor.aspx.cs" Inherits="PrensaVerificada2.Assets.Autor" %>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Perfil del Autor y Últimas Notas</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- Enlace a Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body class="bg-gray-100 flex flex-col min-h-screen">

  <!-- Contenedor para el Header -->
  <div id="header"></div>

  <!-- Contenido principal -->
  <div class="flex-grow">
    <!-- Sección de perfil del autor -->
    <div class="w-full max-w-5xl mx-auto bg-white shadow-md rounded-lg overflow-hidden mt-8 p-8">
      <div class="flex items-center">
        <img src="img/alconada.jpg" alt="Imagen del Autor" class="w-24 h-24 rounded-full object-cover">
        <div class="ml-6">
          <h1 class="text-3xl font-semibold text-gray-800">Hugo Alconada Mon</h1>
          <p class="text-gray-600 italic">LA NACIÓN</p>
        </div>
      </div>
      <div class="mt-4">
        <p class="text-gray-700 leading-relaxed">
          Rol: Prosecretario de Redacción. Abogado por la Universidad Nacional de La Plata, Argentina; máster en Artes Liberales por la Universidad de Navarra, España, y Visiting Scholar en la Universidad de Missouri-Columbia, EEUU. Becario de la Universidad de Stanford, del Programa Eisenhower y de las Naciones Unidas (ONU). Entre 1999 y 2001 trabajó para el diario El Día, de La Plata (Argentina). En 2002 ingresó en el diario La Nación, y entre 2005 y 2009 fue su corresponsal en los Estados Unidos. Sus notas y reportajes se han publicado en medios de Estados Unidos, Alemania, España y otra docena de países. Maestro de la Fundación Gabriel García Márquez para el Nuevo Periodismo Iberoamericano (FNPI) y profesor de cursos de postgrado de Columbia University. Desde 2017 es columnista del New York Times en español.
        </p>
        <div class="flex space-x-4 mt-4">
            <a href="https://x.com/halconada" class="text-gray-500 hover:text-gray-700"><i class="fab fa-twitter"></i></a>
            <a href="https://www.instagram.com/halconada/?hl=es" class="text-gray-500 hover:text-gray-700"><i class="fab fa-instagram"></i></a>
        </div>
      </div>
    </div>

    <!-- Sección de últimas notas -->
    <div class="w-full max-w-5xl mx-auto mt-8">
      <h2 class="text-2xl font-semibold text-gray-800">Últimas notas</h2>
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 mt-4">
        <!-- Nota 1 -->
        <div class="bg-white shadow-md rounded-lg overflow-hidden" onclick="window.location.href='./Publicacion.aspx'">
          <img src="img/chocolate.jpg" alt="Imagen Nota 1" class="w-full h-48 object-cover">
          <div class="p-4">
            <span class="text-sm text-blue-600">Política</span>
            <h3 class="mt-2 text-lg font-semibold text-gray-800">Caso Chocolate: ordenaron la inhibición general de todo el patrimonio de los Albini</h3>
            <p class="text-gray-600 text-sm mt-2">Hugo Alconada <span class="text-gray-400">4 de junio de 2024</span></p>
          </div>
        </div>

        <!-- Nota 2 -->
        <div class="bg-white shadow-md rounded-lg overflow-hidden" onclick="window.location.href='./Publicacion.aspx'">
          <img src="img/javier-karina.jpg" alt="Imagen Nota 2" class="w-full h-48 object-cover">
          <div class="p-4">
            <span class="text-sm text-blue-600">Política</span>
            <h3 class="mt-2 text-lg font-semibold text-gray-800">Resiliencia, dureza y tarot, el alma del ángel protector del Presidente</h3>
            <p class="text-gray-600 text-sm mt-2">Hugo Alconada <span class="text-gray-400">4 de junio de 2024</span></p>
          </div>
        </div>

        <!-- Nota 3 -->
        <div class="bg-white shadow-md rounded-lg overflow-hidden" onclick="window.location.href='./Publicacion.aspx'">
          <img src="img/cristobal.jpg" alt="Imagen Nota 3" class="w-full h-48 object-cover">
          <div class="p-4">
            <span class="text-sm text-blue-600">Política</span>
            <h3 class="mt-2 text-lg font-semibold text-gray-800">Empresarios que jugaban en offside a sabiendas de que el VAR los protegía</h3>
            <p class="text-gray-600 text-sm mt-2">Hugo Alconada <span class="text-gray-400">4 de junio de 2024</span></p>
          </div>
        </div>

        <!-- Nota 4 -->
        <div class="bg-white shadow-md rounded-lg overflow-hidden" onclick="window.location.href='./Publicacion.aspx'">
          <img src="img/karina-milei.jpg" alt="Imagen Nota 4" class="w-full h-48 object-cover">
          <div class="p-4">
            <span class="text-sm text-blue-600">Política</span>
            <h3 class="mt-2 text-lg font-semibold text-gray-800">Karina Milei manejó una sociedad en Miami que compró cuatro propiedades por unos US$2,7 millones</h3>
            <p class="text-gray-600 text-sm mt-2">Hugo Alconada <span class="text-gray-400">4 de junio de 2024</span></p>
          </div>
        </div>

        <!-- Nota 5 -->
        <div class="bg-white shadow-md rounded-lg overflow-hidden" onclick="window.location.href='./Publicacion.aspx'">
          <img src="img/srtabaco.jpg" alt="Imagen Nota 5" class="w-full h-48 object-cover">
          <div class="p-4">
            <span class="text-sm text-blue-600">Política</span>
            <h3 class="mt-2 text-lg font-semibold text-gray-800">Un duro informe de la UIF alertó sobre el crecimiento exponencial de la fortuna del “Señor del Tabaco”</h3>
            <p class="text-gray-600 text-sm mt-2">Hugo Alconada <span class="text-gray-400">4 de junio de 2024</span></p>
          </div>
        </div>

        <!-- Nota 6 -->
        <div class="bg-white shadow-md rounded-lg overflow-hidden" onclick="window.location.href='./Publicacion.aspx'">
          <img src="img/psa.jpg" alt="Imagen Nota 6" class="w-full h-48 object-cover">
          <div class="p-4">
            <span class="text-sm text-blue-600">Política</span>
            <h3 class="mt-2 text-lg font-semibold text-gray-800">Corrupción, narcotráfico y trata. La trama delictiva detrás del auto que usó Lijo, candidato de Milei a la Corte</h3>
            <p class="text-gray-600 text-sm mt-2">Hugo Alconada <span class="text-gray-400">4 de junio de 2024</span></p>
          </div>
        </div>
      </div>
      <div class="flex justify-center mt-6">
        <button type="button" class="px-6 py-3 text-white bg-blue-600 rounded-lg text-lg font-semibold hover:bg-blue-700 focus:ring-4 focus:ring-blue-300">Cargar más</button>
      </div>
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
  </script>

</body>
</html>
