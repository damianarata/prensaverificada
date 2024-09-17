﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PrensaVerificada2.Assets.Login" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página de Inicio de Sesión</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex flex-col min-h-screen">

    <!-- Contenedor para el Header -->
    <div id="header"></div>

    <!-- Contenido principal -->
    <div class="flex-grow flex items-center justify-center">
        <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-sm">
            <h2 class="text-xl font-bold text-center mb-6">Bienvenido</h2>

            <!-- Formulario de Inicio de Sesión -->
            <form id="form1" runat="server">
                <!-- Correo -->
                <div class="mb-4">
                    <label for="email" class="block text-gray-700">Correo</label>
                    <asp:TextBox ID="TextBox1" runat="server" class="w-full p-2 border border-gray-300 rounded mt-1"></asp:TextBox>
&nbsp;</div>

                <!-- Contraseña -->
                <div class="mb-4">
                    <label for="password" class="block text-gray-700">Contraseña</label>&nbsp;
                    <asp:TextBox ID="TextBox2" runat="server" class="w-full p-2 border border-gray-300 rounded mt-1"></asp:TextBox>
                </div>

                <!-- reCAPTCHA -->
                <div class="mb-4">
                    <div class="flex items-center">
                        <asp:CheckBox ID="CheckBox1" runat="server" />
&nbsp;<label for="recaptcha" class="text-gray-700">I'm not a robot</label>
                    </div>
                    <!-- Simulación del reCAPTCHA -->
                    <div class="mt-2">
                        <img src="img/recaptcha-icon.png" alt="reCAPTCHA" class="w-24 h-auto">
                    </div>
                </div>

                <!-- Olvidaste la contraseña -->
                <div class="text-right mb-4">
                    <a href="./recover-pass.html" class="text-purple-600 hover:underline">¿Olvidaste la contraseña?</a>
                </div>

                <!-- Botón de Iniciar Sesión (deberia ser type=submit) -->
                <div class="mb-4">
                    <asp:Button ID="ButtonInicio" runat="server" OnClick="btnEnviar" class="w-full bg-black text-white py-2 rounded" Text="Iniciar Sesion" />
                </div>

                <!-- Redes Sociales -->
                <div class="text-center mb-4">
                    <asp:Button ID="ButtonRedes" runat="server" OnClick="btnRedes" class="w-full border border-gray-300 py-2 rounded text-gray-700" Text="Redes Sociales" />
                </div>
            </form>

            <!-- Crear Cuenta -->
            <div class="text-center">
                <p class="text-gray-600">¿Sos nuevo? <a href="./register.html" class="text-purple-600 hover:underline">Create una cuenta</a></p>
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
                    window.location.href = './login.html';
                });

                document.getElementById('login-redes-btn').addEventListener('click', function() {
                    window.location.href = './login-social.html';
                });
            });

        // Cargar el Footer
        fetch('footer.html')
            .then(response => response.text())
            .then(data => {
                document.getElementById('footer').innerHTML = data;
            });
        
        document.getElementById('local-login-btn').addEventListener('click', function() {
                    window.location.href = './index.html';
                });
    </script>

</body>
</html>

