<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Faq.aspx.cs" Inherits="PrensaVerificada2.Assets.Faq" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Preguntas Frecuentes</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">

    <!-- Header Container -->
    <div id="header"></div>

    <!-- Preguntas Frecuentes -->
    <section class="container mx-auto px-4 py-12">
        <h2 class="text-center text-3xl font-semibold mb-6">Preguntas frecuentes</h2>

        <div class="border-t border-b divide-y">
            <!-- Pregunta 1 -->
            <details class="py-4">
                <summary class="text-lg font-medium cursor-pointer">Necesito suscripción para leer el contenido o solo me registro?</summary>
                <p class="mt-2 text-gray-600">Sí, necesitas contratar una suscripción para poder visualizar el material exclusivo, solo con el registro vas a poder visualizar 5 publicaciones de manera mensual. Podés acceder a la sección de contacto o suscribirte.</p>
            </details>

            <!-- Pregunta 2 -->
            <details class="py-4">
                <summary class="text-lg font-medium cursor-pointer">¿Dónde publican los autores?</summary>
            </details>

            <!-- Pregunta 3 -->
            <details class="py-4">
                <summary class="text-lg font-medium cursor-pointer">¿Cómo puedo cancelar mi suscripción?</summary>
            </details>

            <!-- Pregunta 4 -->
            <details class="py-4">
                <summary class="text-lg font-medium cursor-pointer">¿Cómo funciona el algoritmo de IA para recomendaciones?</summary>
            </details>
        </div>
    </section>

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

