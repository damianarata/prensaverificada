<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Publicacion.aspx.cs" Inherits="PrensaVerificada2.Assets.Publicacion" %>

<!DOCTYPE html>
<html lang="es">
        
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal de noticias prensa verificada</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100">

     <form id="form1" runat="server">

     <!-- Header Container -->
     <div id="header"></div>

    <!-- Main Content -->
    <main class="container mx-auto mt-8">
        <article class="bg-white p-8 rounded-lg shadow-md">
            <div class="flex justify-end">
                <asp:Button ID="Button2" runat="server" Text="Favorito" CssClass="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 focus:ring-4 focus:ring-blue-500" OnClick="Favorito_Click" />
            </div>
            <h1 id="titulo" runat="server" class="text-3xl font-bold mb-4">No cargo el titulo</h1>
            <h2 id="subtitulo" runat="server" class="text-2xl font-semibold mb-4">No cargo el subtitulo</h2>
            <p id="autor" runat="server" class="text-gray-600 mb-4">No cargo el autor</p>
            <img id="img" runat="server" src="img2/imagen_1.jpg" alt="No cargo imagen" class="w-11/12 h-1/6 rounded-none mb-6">

            <asp:PlaceHolder ID="phTextBoxes" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="phPublicacionContent" runat="server"></asp:PlaceHolder>
        </article>
    </main>

    <div class="flex justify-center mt-8">
            <asp:Button ID="VolverBtn" class="bg-gray-200 text-gray-600 px-6 py-2 rounded" runat="server" OnClick="VolverBtn_Click" Text="Volver" />
    </div>

    <!-- Footer Container -->
    <div id="footer" class="mt-8"></div>

    <script>
        // Load header
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

        // Load footer
        fetch('footer.html')
            .then(response => response.text())
            .then(data => {
                document.getElementById('footer').innerHTML = data;
            });
            
        document.getElementById('appleButton').addEventListener('click', function() {
            window.location.href = 'https://www.apple.com'; // URL para redirigir al iniciar sesión con Apple
        });
    </script>


     </form>


</body>

</html>

