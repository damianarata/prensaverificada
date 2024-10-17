<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bitacora.aspx.cs" Inherits="PrensaVerificada2.Assets.Bitacora" %>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Consultar Bitácora</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex flex-col min-h-screen">

  <!-- Contenedor para el Header -->
  <div id="header"></div>

  <!-- Contenido principal -->
  <div class="flex-grow flex flex-col">
    <div class="w-full max-w-4xl mx-auto bg-white shadow-md rounded-lg overflow-hidden mt-8">
      <div class="px-4 pt-6 pb-8">
        <h1 class="text-2xl font-semibold text-gray-800">Consultar Bitácora</h1>

        <div class="mt-4">
          <p class="text-gray-700">Filtrar por Fecha</p>
          <div class="grid grid-cols-2 gap-4 mt-2">
            <div>
              <label for="start-date" class="block text-sm font-medium text-gray-700">Fecha de Inicio</label>
              <input type="date" id="start-date" name="start-date" class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
            </div>
            <div>
              <label for="end-date" class="block text-sm font-medium text-gray-700">Fecha de Fin</label>
              <input type="date" id="end-date" name="end-date" class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
            </div>
          </div>
        </div>

        <div class="mt-4">
          <p class="text-gray-700">Filtrar por Usuario</p>
          <input type="text" id="username" name="username" placeholder="Ingrese nombre de usuario" class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
        </div>

        <div class="mt-4">
          <button type="button" class="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 focus:ring-4 focus:ring-blue-500">Buscar</button>
        </div>

        <div class="mt-6">
          <p class="text-gray-700">Resultados de la Bitácora</p>
          <div class="overflow-x-auto mt-4">
            <table class="min-w-full bg-white">
              <thead class="bg-gray-100">
                <tr>
                  <th class="py-2 text-left text-sm font-semibold text-gray-600">Fecha</th>
                  <th class="py-2 text-left text-sm font-semibold text-gray-600">Usuario</th>
                  <th class="py-2 text-left text-sm font-semibold text-gray-600">Acción</th>
                </tr>
              </thead>
              <tbody class="text-gray-700">
                <tr>
                  <td class="py-2 border-b border-gray-200">2023-08-16</td>
                  <td class="py-2 border-b border-gray-200">usuario971</td>
                  <td class="py-2 border-b border-gray-200">Inició sesión</td>
                </tr>
                <tr>
                  <td class="py-2 border-b border-gray-200">2023-08-15</td>
                  <td class="py-2 border-b border-gray-200">usuario971</td>
                  <td class="py-2 border-b border-gray-200">Actualizó perfil</td>
                </tr>
                <!-- Más filas de bitácora -->
              </tbody>
            </table>
          </div>
        </div>
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
