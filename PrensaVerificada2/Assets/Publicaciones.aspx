
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Publicaciones.aspx.cs" Inherits="PrensaVerificada2.Assets.Publicaciones" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Publicaciones</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">

    <!-- Contenedor para el Header -->
    <div id="header"></div>

    <!-- Contenido Principal -->
    <main class="container mx-auto px-4 py-16">
        <!-- Título de la página -->
        <h1 class="text-3xl font-bold text-gray-800 mb-8">Publicaciones</h1>

        <!-- Sección de Rankings -->
        <div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-2 xl:grid-cols-3 gap-8">

            <!-- Publicaciones más leídas -->
            <div class="bg-white p-6 rounded-lg shadow-md">
                <h2 class="text-xl font-bold text-gray-700 mb-4">Publicaciones más leídas</h2>
                <ul class="space-y-4">
                    <asp:Repeater ID="TopArticlesRepeater" runat="server">
                        <ItemTemplate>
                            <li class="flex items-center space-x-4" onclick="window.location.href='Publicacion.aspx?publiID=<%# Eval("publiID") %>'">
                                <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' class="w-16 h-16 rounded-md object-cover">
                                <!-- Mostrar contador de visitas -->
                                <a href='Publicacion.aspx?publiID=<%# Eval("publiID") %>' class="text-blue-500 hover:underline"><%# Eval("Title") %></a>
                                <span class="text-gray-500 text-sm font-semibold mr-2"><%# Eval("Visitas") %> visitas</span>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>

            <!-- Últimas publicaciones -->
            <div class="bg-white p-6 rounded-lg shadow-md">
                <h2 class="text-xl font-bold text-gray-700 mb-4">Últimas publicaciones</h2>
                <ul class="space-y-4">
                    <asp:Repeater ID="RepeaterUltimas" runat="server">
                        <ItemTemplate>
                            <li class="flex items-center space-x-4" onclick="window.location.href='Publicacion.aspx?publiID=<%# Eval("publiID") %>'">
                                <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' class="w-16 h-16 rounded-md object-cover">
                                <!-- Mostrar contador de visitas -->
                                <a href='Publicacion.aspx?publiID=<%# Eval("publiID") %>' class="text-blue-500 hover:underline"><%# Eval("Title") %></a>
                                <span class="text-gray-500 text-sm font-semibold mr-2"><%# Eval("Visitas") %> visitas</span>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>

            <!-- Autores más leídos -->
            <div class="bg-white p-6 rounded-lg shadow-md">
                <h2 class="text-xl font-bold text-gray-700 mb-4">Autores más leídos</h2>
                <ul class="space-y-4">
                    <asp:Repeater ID="RepeaterAutores" runat="server">
                        <ItemTemplate>
                            <li class="flex items-center space-x-4" onclick="window.location.href='./Autor.aspx?autorID=<%# Eval("autorID") %>'">
                                <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' class="w-16 h-16 rounded-md object-cover">
                                <a href='Autor.aspx?autorID=<%# Eval("autorID") %>' class="text-blue-500 hover:underline"><%# Eval("Title") %></a>
                                <span class="text-gray-500 text-sm font-semibold mr-2"><%# Eval("Visitas") %> visitas</span>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>

            <!-- Tendencias -->
            <div class="bg-white p-6 rounded-lg shadow-md">
                <h2 class="text-xl font-bold text-gray-700 mb-4">Categorias Tendencia</h2>
                <ul class="space-y-4">
                    <asp:Repeater ID="RepeaterCategoria" runat="server">
                        <ItemTemplate>
                            <li class="flex items-center space-x-4" onclick="window.location.href='./index.aspx?categoriaID=<%# Eval("categoriaID") %>'">
                                <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' class="w-16 h-16 rounded-md object-cover">
                                <a href='index.aspx?categoriaID=<%# Eval("categoriaID") %>' class="text-blue-500 hover:underline"><%# Eval("Title") %></a>
                                <span class="text-gray-500 text-sm font-semibold mr-2"><%# Eval("Visitas") %> visitas</span>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>

            <!-- Más Favoritos -->
            <div class="bg-white p-6 rounded-lg shadow-md">
                <h2 class="text-xl font-bold text-gray-700 mb-4">Más Favoritos</h2>
                <ul class="space-y-4">
                    <asp:Repeater ID="RepeaterFavoritos" runat="server">
                        <ItemTemplate>
                            <li class="flex items-center space-x-4" onclick="window.location.href='Publicacion.aspx?publiID=<%# Eval("publiID") %>'">
                                <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' class="w-16 h-16 rounded-md object-cover">
                                <!-- Mostrar contador de visitas -->
                                <a href='Publicacion.aspx?publiID=<%# Eval("publiID") %>' class="text-blue-500 hover:underline"><%# Eval("Title") %></a>
                                <span class="text-gray-500 text-sm font-semibold mr-2"><%# Eval("Visitas") %> fav</span>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>

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
