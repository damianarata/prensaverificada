<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reclamos.aspx.cs" Inherits="PrensaVerificada2.Assets.Reclamos" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Reclamos</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex flex-col min-h-screen">

    <!-- Contenedor para el Header -->
    <div id="header"></div>

    <!-- Contenido Principal -->
    <main class="container mx-auto px-4 py-16">
        <!-- Título de la página -->
        <h1 class="text-3xl font-bold text-gray-800 mb-8">Gestión de Reclamos</h1>

        <!-- Tabla de Reclamos -->
        <div class="bg-white p-6 rounded-lg shadow-md mb-8">
            <h2 class="text-xl font-bold text-gray-700 mb-4">Lista de Reclamos</h2>
            <div class="overflow-x-auto">
                <table class="min-w-full bg-white border border-gray-300">
                    <thead>
                        <tr>
                            <th class="py-2 px-4 border-b">ID</th>
                            <th class="py-2 px-4 border-b">Usuario</th>
                            <th class="py-2 px-4 border-b">Fecha</th>
                            <th class="py-2 px-4 border-b">Estado</th>
                            <th class="py-2 px-4 border-b">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="hover:bg-gray-100">
                            <td class="py-2 px-4 border-b">12345</td>
                            <td class="py-2 px-4 border-b">Juan Pérez</td>
                            <td class="py-2 px-4 border-b">18/08/2024</td>
                            <td class="py-2 px-4 border-b">
                                <span class="bg-yellow-500 text-white py-1 px-3 rounded-full text-xs">En Proceso</span>
                            </td>
                            <td class="py-2 px-4 border-b">
                                <button class="text-blue-500 hover:underline" onclick="verDetalles('12345')">Ver</button>
                                <button class="text-green-500 hover:underline ml-4" onclick="actualizarEstado('12345')">Actualizar</button>
                            </td>
                        </tr>
                        <tr class="hover:bg-gray-100">
                            <td class="py-2 px-4 border-b">12346</td>
                            <td class="py-2 px-4 border-b">María Gómez</td>
                            <td class="py-2 px-4 border-b">17/08/2024</td>
                            <td class="py-2 px-4 border-b">
                                <span class="bg-red-500 text-white py-1 px-3 rounded-full text-xs">Pendiente</span>
                            </td>
                            <td class="py-2 px-4 border-b">
                                <button class="text-blue-500 hover:underline" onclick="verDetalles('12346')">Ver</button>
                                <button class="text-green-500 hover:underline ml-4" onclick="actualizarEstado('12346')">Actualizar</button>
                            </td>
                        </tr>
                        <tr class="hover:bg-gray-100">
                            <td class="py-2 px-4 border-b">12347</td>
                            <td class="py-2 px-4 border-b">Carlos López</td>
                            <td class="py-2 px-4 border-b">16/08/2024</td>
                            <td class="py-2 px-4 border-b">
                                <span class="bg-green-500 text-white py-1 px-3 rounded-full text-xs">Resuelto</span>
                            </td>
                            <td class="py-2 px-4 border-b">
                                <button class="text-blue-500 hover:underline" onclick="verDetalles('12347')">Ver</button>
                                <button class="text-green-500 hover:underline ml-4" onclick="actualizarEstado('12347')">Actualizar</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Detalles del Reclamo -->
        <div id="detalles-reclamo" class="bg-white p-6 rounded-lg shadow-md hidden">
            <h2 class="text-xl font-bold text-gray-700 mb-4">Detalles del Reclamo</h2>
            <p class="text-gray-600 mb-4"><strong>ID Reclamo:</strong> <span id="detalles-id">12345</span></p>
            <p class="text-gray-600 mb-4"><strong>Usuario:</strong> <span id="detalles-usuario">Juan Pérez</span></p>
            <p class="text-gray-600 mb-4"><strong>Fecha:</strong> <span id="detalles-fecha">18/08/2024</span></p>
            <p class="text-gray-600 mb-4"><strong>Estado:</strong> <span id="detalles-estado">En Proceso</span></p>
            <p class="text-gray-600 mb-4"><strong>Descripción:</strong> <span id="detalles-descripcion">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span></p>
        </div>

        <!-- Formulario de Actualización de Estado -->
        <div id="form-actualizar" class="bg-white p-6 rounded-lg shadow-md hidden">
            <h2 class="text-xl font-bold text-gray-700 mb-4">Actualizar Estado</h2>
            <form action="#" method="POST">
                <div class="mb-4">
                    <label for="estado" class="block text-gray-600 mb-2">Nuevo Estado</label>
                    <select id="estado" name="estado" class="w-full border border-gray-300 rounded-lg px-3 py-2">
                        <option value="Pendiente">Pendiente</option>
                        <option value="En Proceso">En Proceso</option>
                        <option value="Resuelto">Resuelto</option>
                    </select>
                </div>
                <div class="mb-4">
                    <label for="comentarios" class="block text-gray-600 mb-2">Comentarios</label>
                    <textarea id="comentarios" name="comentarios" rows="4" class="w-full border border-gray-300 rounded-lg px-3 py-2"></textarea>
                </div>
                <button type="submit" class="bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-600">Actualizar</button>
            </form>
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

