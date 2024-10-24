﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="PrensaVerificada2.Assets.Perfil" %>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tu Perfil</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex flex-col min-h-screen">

  <!-- Contenedor para el Header -->
  <div id="header"></div>

  <!-- Contenido principal -->
  <div class="flex-grow flex justify-center items-center">
    <div class="w-full max-w-4xl bg-white shadow-md rounded-lg p-8 mt-8">
      <h1 class="text-center text-2xl font-semibold text-gray-800 mb-4">Tu perfil</h1>
      <p class="text-lg text-gray-600 mb-8">Bienvenido, Damian</p>
      
      <!-- Formulario de perfil -->
      <div class="flex space-x-8">
        <!-- Imagen de perfil y nombre -->
        <div class="flex-shrink-0 flex flex-col items-center">
          <img src="img/dami.png" alt="Imagen de perfil" class="w-24 h-24 rounded-full object-cover mb-4">
          <h2 class="text-lg font-semibold text-gray-800">Damian Arata</h2>
          <p class="text-gray-600">usuario971</p>
        </div>

        <!-- Campos de perfil -->
        <div class="flex-grow">
          <div class="grid grid-cols-2 gap-4 mb-4">
            <div>
              <label for="nombre" class="text-gray-700">Nombre</label>
              <input type="text" id="nombre" placeholder="Escribí acá.." class="w-full mt-2 p-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500">
            </div>
            <div>
              <label for="apellido" class="text-gray-700">Apellido</label>
              <input type="text" id="apellido" placeholder="Escribí acá.." class="w-full mt-2 p-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500">
            </div>
            <div>
              <label for="telefono" class="text-gray-700">Telefono</label>
              <input type="text" id="telefono" placeholder="Escribí acá.." class="w-full mt-2 p-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500">
            </div>
            <div>
              <label for="pais" class="text-gray-700">País</label>
              <input type="text" id="pais" placeholder="Escribí acá.." class="w-full mt-2 p-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500">
            </div>
            <div>
              <label for="lenguaje" class="text-gray-700">Lenguaje</label>
              <input type="text" id="lenguaje" placeholder="Escribí acá.." class="w-full mt-2 p-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500">
            </div>
            <div>
              <label for="timezone" class="text-gray-700">Time Zone</label>
              <input type="text" id="timezone" placeholder="Escribí acá.." class="w-full mt-2 p-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500">
            </div>
          </div>

          <div class="flex justify-end space-x-4">
            <button type="button" class="px-4 py-2 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300 focus:ring-4 focus:ring-gray-300">Cancelar</button>
            <button type="button" class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 focus:ring-4 focus:ring-blue-300">Guardar</button>
          </div>
        </div>
      </div>

      <!-- Sección de emails -->
      <div class="mt-8">
        <h3 class="text-lg font-semibold text-gray-800">Mis emails</h3>
        <div class="flex items-center space-x-4 mt-4">
          <input type="checkbox" id="email1" checked class="h-5 w-5 text-blue-600 border-gray-300 rounded focus:ring-blue-500">
          <label for="email1" class="text-gray-700 flex-grow">Damian.Arata@gmail.com <span class="text-gray-400">(1 month ago)</span></label>
        </div>
        <button type="button" class="mt-4 px-4 py-2 text-blue-600 bg-blue-100 rounded-lg hover:bg-blue-200 focus:ring-4 focus:ring-blue-300">+ Agregar Email</button>
      </div>

      <!-- Botón para eliminar cuenta -->
      <div class="mt-8">
        <button id="open-modal" type="button" class="w-full py-3 bg-red-500 text-white rounded-lg text-lg font-semibold hover:bg-red-700 focus:ring-4 focus:ring-red-300">Eliminar cuenta</button>
        <div class="bg-white rounded-lg p-6 w-full max-w-sm relative">
          <!-- Cerrar Modal -->
          <button id="close-modal" class="hidden absolute top-2 right-2 text-gray-600 hover:text-gray-800 focus:outline-none">
              &times;
          </button>
          
          <!-- Contenido del Modal -->
          <!-- <div class="text-center">
              <div class="mb-4 text-blue-500">
                  <svg class="w-12 h-12 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m4 0h-1v-4h-1m-5 8V7h8v9m5 4H5a2 2 0 01-2-2V7a2 2 0 012-2h2.5l1-2h7l1 2H19a2 2 0 012 2v11a2 2 0 01-2 2z"></path>
                  </svg>
              </div>
              <h2 class="text-lg font-semibold text-gray-800">Estamos verificando unas cosas</h2>
              <p class="text-sm text-gray-600 mt-2">Para eliminar tu cuenta te pedimos que ingreses la contraseña y realices el captcha.</p>

              <!- Formulario -->
              <!-- <div class="mt-4">
                  <input type="password" placeholder="Contraseña" class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                  <div class="mt-4">
                      <div class="g-recaptcha" data-sitekey="your-site-key"></div>
                  </div>
              </div>
          </div> --> 

          <!-- Botones de acción -->
          <!-- <div class="mt-6 flex justify-between">
              <button id="cancel" class="text-gray-600 hover:text-gray-800">Cancelar</button>
              <button class="px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600">Eliminar cuenta</button>
          </div> -->
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
        document.getElementById('open-modal').addEventListener('click', function() {
            document.getElementById('delete-account-modal').classList.remove('hidden');
        });

        document.getElementById('close-modal').addEventListener('click', function() {
            document.getElementById('delete-account-modal').classList.add('hidden');
        });

        document.getElementById('cancel').addEventListener('click', function() {
            document.getElementById('delete-account-modal').classList.add('hidden');
        });

        document.addEventListener('click', function(event) {
            var modal = document.getElementById('delete-account-modal');
            if (event.target === modal) {
                modal.classList.add('hidden');
            }
        });
  </script>

</body>
</html>

