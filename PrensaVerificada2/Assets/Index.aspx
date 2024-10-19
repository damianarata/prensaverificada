<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="PrensaVerificada2.Assets.Index" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Últimas Publicaciones</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 flex flex-col min-h-screen">

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <!-- Contenedor para el Header -->
    <div id="header"></div>

    <!-- Contenido principal -->
    <div class="flex-grow">
        <div class="container mx-auto p-8">
            <h1 class="text-3xl font-semibold text-center text-gray-800 mb-8">Últimas publicaciones</h1>

            <!-- Publicación destacada -->
            <div class="mb-8" onclick="window.location.href='./Publicacion.aspx?publiID=1'">
                <div class="relative">
                    <img src="./img/diputados.jpg" alt="Imagen Principal" class="w-full h-64 object-cover rounded-lg shadow-md">
                    <div class="absolute inset-0 bg-black bg-opacity-50 flex items-end rounded-lg">
                        <div class="p-6 text-white">
                            <span class="bg-blue-600 px-3 py-1 text-xs uppercase rounded-full">Política</span>
                            <h2 class="text-2xl font-semibold mt-2">Diputados se suben el sueldo y pasarán a cobrar más de $2,2 millones</h2>
                            <div class="flex items-center mt-4">
                                <img src="img/alconada.jpg" alt="Autor" class="w-10 h-10 rounded-full mr-4">
                                <div>
                                    <p class="font-semibold">Hugo Alconada</p>
                                    <p class="text-sm">4 de junio 2024</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Grid de publicaciones -->
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
                <!-- Repite el bloque de publicación para cada artículo según sea necesario -->
                <asp:Repeater ID="ArticlesRepeater" runat="server" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>
                    <div class="bg-white p-4 rounded-lg shadow-md" onclick="window.location.href='Publicacion.aspx?publiID=<%# Eval("publiID") %>'">
                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' class="w-full h-32 object-cover rounded-lg mb-4">
                        <span class="block text-blue-600 text-sm font-semibold mb-2"><%# Eval("Category") %></span>
                        <h3 class="text-xl font-semibold mb-2"><%# Eval("Title") %></h3>
                        <div class="flex items-center mt-4">
                            <img src='<%# Eval("AuthorImage") %>' alt="Autor" class="w-8 h-8 rounded-full mr-2">
                            <div>
                                <p class="text-sm font-semibold"><%# Eval("Author") %></p>
                                <p class="text-sm text-gray-600"><%# Eval("Date") %></p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Botón de cargar más -->
            <div class="flex justify-center mt-8">
                <button class="px-6 py-2 bg-gray-300 text-gray-600 rounded-full text-lg font-semibold">Cargar más</button>
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

    </form>

</body>

</html>
