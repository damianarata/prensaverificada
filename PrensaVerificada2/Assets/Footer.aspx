<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Footer.aspx.cs" Inherits="PrensaVerificada2.Assets.Footer" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <!-- Footer -->
    <footer class="bg-white mt-12 shadow">
        <div class="container mx-auto p-4 flex flex-col md:flex-row justify-between items-center">
            <div class="text-gray-600 text-center md:text-left">
                <p><strong>Nosotros</strong></p>
                <p>Somos prensa verificada AR, un nuevo portal de noticias basado en la validación de nuestros profesionales que enriquecen nuestro contenido.</p>
                <p>Email: info@prensaverificada.com.ar</p>
                <p>Phone: 4905-2205</p>
            </div>
            <div class="text-gray-600 text-center mt-4 md:mt-0">
                <p><strong>Accesos</strong></p>
                <nav class="flex flex-col space-y-2">
                    <a href="#" class="text-gray-700 hover:text-blue-500">Principal</a>
                    <a href="#" class="text-gray-700 hover:text-blue-500">Nosotros</a>
                    <a href="#" class="text-gray-700 hover:text-blue-500">Categorías</a>
                    <a href="#" class="text-gray-700 hover:text-blue-500">Favoritos</a>
                    <a href="#" class="text-gray-700 hover:text-blue-500">Autor</a>
                    <a href="#" class="text-gray-700 hover:text-blue-500">Contacto</a>
                </nav>
            </div>
            <div class="text-gray-600 text-center mt-4 md:mt-0">
                <p><strong>Categorías</strong></p>
                <nav class="flex flex-col space-y-2">
                    <a href="#" class="text-gray-700 hover:text-blue-500">Política</a>
                    <a href="#" class="text-gray-700 hover:text-blue-500">Tecnología</a>
                    <a href="#" class="text-gray-700 hover:text-blue-500">Viajes</a>
                    <a href="#" class="text-gray-700 hover:text-blue-500">Negocio</a>
                    <a href="#" class="text-gray-700 hover:text-blue-500">Economía</a>
                    <a href="#" class="text-gray-700 hover:text-blue-500">Deportes</a>
                </nav>
            </div>
            <div class="text-gray-600 text-center mt-4 md:mt-0">
                <p><strong>Quiero suscribirme</strong></p>
                <input type="email" placeholder="Tu email" class="p-2 border border-gray-300 rounded w-full mb-2">
                <button class="bg-blue-500 text-white px-4 py-2 rounded w-full">Suscribirse</button>
            </div>
        </div>
    </footer>
</body>
</html>

