<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Busqueda.aspx.cs" Inherits="PrensaVerificada2.Assets.Busqueda" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Búsqueda Avanzada</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 text-gray-800">

    <!-- Contenedor para el Header -->
    <div id="header"></div>
    <form runat="server">
    <!-- Búsqueda Avanzada -->
    <section class="container mx-auto p-8">
        <h2 class="text-center text-3xl font-semibold mb-6">Búsqueda Avanzada</h2>

        <!-- Filtros de búsqueda -->
        <div class="bg-white p-6 rounded-lg shadow-md mb-6">
            <div class="flex flex-wrap gap-4 items-center justify-center mt-4">
                <div class="flex items-center">
                    <label for="TextBox1" class="text-sm font-medium text-gray-700 mr-2">Fecha de Inicio</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="p-2 border border-gray-300 rounded-md shadow-sm" TextMode="Date"></asp:TextBox>
                </div>
                <div class="flex items-center">
                    <label for="TextBox2" class="text-sm font-medium text-gray-700 mr-2">Fecha de Fin</label>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="p-2 border border-gray-300 rounded-md shadow-sm" TextMode="Date"></asp:TextBox>
                </div>
                <asp:DropDownList ID="AuthorDropDown" runat="server" CssClass="p-2 border border-gray-300 rounded-md shadow-sm">
                    <asp:ListItem Text="Autores" Value="" />
                </asp:DropDownList>
                <asp:DropDownList ID="CategoriasDropDown" runat="server" CssClass="p-2 border border-gray-300 rounded-md shadow-sm">
                    <asp:ListItem Text="Categoria" Value="" />
                </asp:DropDownList>
                <asp:TextBox ID="TitFilterTextBox" runat="server" Placeholder="Filtrar Titulo" CssClass="p-2 border border-gray-300 rounded-md shadow-sm" />
                <asp:TextBox ID="CamFilterTextBox" runat="server" Placeholder="Filtrar Contenido" CssClass="p-2 border border-gray-300 rounded-md shadow-sm" />
            </div>
            <div class="flex justify-center mt-6">
                <asp:Button ID="BorrarButton" runat="server" Text="Borrar" CssClass="bg-gray-300 text-gray-700 px-4 py-2 rounded" OnClick="BorrarButton_Click" />
                <asp:Button ID="searchButton" runat="server" Text="Buscar" CssClass="bg-blue-500 text-white px-4 py-2 ml-4 rounded" OnClick="SearchButton_Click" />
            </div>
        </div>

        <!-- Resultados de búsqueda -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
                <!-- Repite el bloque de publicación para cada artículo según sea necesario -->
                <asp:Repeater ID="ArticlesRepeater" runat="server">
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

        <!-- Botón de retorno -->
        <div class="flex justify-center mt-8">
            <asp:Button ID="CargarButton" runat="server" Text="Cargar mas" CssClass="bg-gray-200 text-gray-600 px-6 py-2 rounded" OnClick="CargarMasButton_Click" />
        </div>
    </section>
        </form>
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
