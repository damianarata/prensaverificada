<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginRedes.aspx.cs" Inherits="PrensaVerificada2.Assets.LoginRedes" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar sesión</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex flex-col min-h-screen">

    <!-- Contenedor para el Header -->
    <div id="header"></div>

    <!-- Contenido principal -->
    <div class="flex-grow flex items-center justify-center flex-col">
        <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-sm text-center">
            <!-- Ícono de usuario -->
            <div class="w-16 h-16 bg-gray-200 rounded-full mx-auto mb-4"></div>

            <!-- Título -->
            <h2 class="text-2xl font-semibold text-gray-800 mb-2">Iniciar sesión</h2>
            <p class="text-gray-600 mb-6">Podés usar todos estos servicios</p>

            <!-- Botones de redes sociales -->
            <div class="space-y-3">
                <button id="facebookButton" class="w-full flex items-center justify-center border border-gray-300 py-2 rounded-full text-gray-700">
                    <img src="https://img.icons8.com/color/48/facebook-new.png" class="w-6 h-6 mr-2"/> 
                    Continuar con Facebook
                </button>
                <button id="googleButton" class="w-full flex items-center justify-center border border-gray-300 py-2 rounded-full text-gray-700">
                    <img src="https://img.icons8.com/color/48/google-logo.png" class="w-6 h-6 mr-2"/> 
                    Continuar con Google
                </button>
                <button id="appleButton" class="w-full flex items-center justify-center border border-gray-300 py-2 rounded-full text-gray-700">
                    <img src="https://img.icons8.com/color/48/apple-logo.png" class="w-6 h-6 mr-2"/> 
                    Continuar con Apple
                </button>
                <button id="twitterButton" class="w-full flex items-center justify-center border border-gray-300 py-2 rounded-full text-gray-700">
                    <img src="https://img.icons8.com/color/48/twitter.png" class="w-6 h-6 mr-2"/> 
                    Continuar con Twitter
                </button>
                <button id="phoneButton" class="w-full flex items-center justify-center border border-gray-300 py-2 rounded-full text-gray-700">
                    <img src="https://img.icons8.com/color/48/phone.png" class="w-6 h-6 mr-2"/> 
                    Continuar con teléfono
                </button>
                <button id="emailButton" class="w-full flex items-center justify-center border border-gray-300 py-2 rounded-full text-gray-700">
                    <img src="https://img.icons8.com/color/48/new-post.png" class="w-6 h-6 mr-2"/> 
                    Volver con email
                </button>
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
        
        document.getElementById('facebookButton').addEventListener('click', function() {
            window.location.href = 'https://www.facebook.com'; // URL para redirigir al iniciar sesión con Facebook
        });
        
        document.getElementById('googleButton').addEventListener('click', function() {
            window.location.href = 'https://www.google.com'; // URL para redirigir al iniciar sesión con Google
        });
        
        document.getElementById('appleButton').addEventListener('click', function() {
            window.location.href = 'https://www.apple.com'; // URL para redirigir al iniciar sesión con Apple
        });
        
        document.getElementById('twitterButton').addEventListener('click', function() {
            window.location.href = 'https://www.twitter.com'; // URL para redirigir al iniciar sesión con Twitter
        });
        
        document.getElementById('phoneButton').addEventListener('click', function() {
            window.location.href = 'https://www.ejemplo.com/telefono'; // URL para redirigir al iniciar sesión con teléfono
        });
        
        document.getElementById('emailButton').addEventListener('click', function() {
            window.location.href = 'https://www.ejemplo.com/email'; // URL para redirigir al iniciar sesión con email
        });
    </script>
    
</body>
</html>
