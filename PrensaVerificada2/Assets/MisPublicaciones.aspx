<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MisPublicaciones.aspx.cs" Inherits="PrensaVerificada2.Assets.MisPublicaciones" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tus Publicaciones</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 text-gray-800">

    <!-- Contenedor para el Header -->
    <div id="header"></div>

    <section class="container mx-auto p-8">
    <h2 class="text-center text-3xl font-semibold mb-6">Tus publicaciones</h2>

    <!-- Tabla -->
    <form id="form1" runat="server">
    <div class="bg-white shadow overflow-hidden sm:rounded-lg">
        <table class="min-w-full divide-y divide-gray-200">
            <thead class="bg-gray-50">
                <tr>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Autor
                    </th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Título
                    </th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Fecha
                    </th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Categoría
                    </th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Estado
                    </th>
                    <th scope="col" class="relative px-6 py-3">
                        <span class="sr-only">Acciones</span>
                    </th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
                <asp:Repeater ID="ArticlesRepeater" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap flex items-center">
                                <img src='<%# Eval("AutorImagen") %>' alt="Avatar" class="w-10 h-10 rounded-full mr-4">
                                <div class="text-sm font-medium text-gray-900"><%# Eval("AutorNombre") %></div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%# Eval("Titulo") %></td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%# Eval("FechaPublicacion", "{0:dd/MM/yyyy}") %></td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%# Eval("CategoriaNombre") %></td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm">
                                <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full <%# Eval("EstadoColor") %>"><%# Eval("EstadoNombre") %></span>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                <div class="relative inline-block text-left">
                                    <!-- Botón de acciones -->
                                    <asp:LinkButton ID="ActionsButton" runat="server" Text="Acciones" OnClientClick="toggleMenu(this); return false;" CssClass="inline-flex justify-center w-full rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50" />

                                    <!-- Menú desplegable de acciones -->
                                    <div class="origin-top-right absolute right-0 mt-2 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none hidden"
                                    id='<%# "menuContainer_" + Eval("PublicacionID") %>'
                                    style="z-index: 1000; position: absolute;">
                                        <asp:LinkButton ID="ContinueButton" runat="server" CommandName="Continuar" CommandArgument='<%# Eval("PublicacionID") %>' Text="Continuar editando" CssClass="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100" />
                                        <asp:LinkButton ID="PauseButton" runat="server" CommandName="Pausar" CommandArgument='<%# Eval("PublicacionID") %>' Text="Pausar" CssClass="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100" />
                                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CommandArgument='<%# Eval("PublicacionID") %>' Text="Borrar" CssClass="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100" />
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
        </form>
</section>


    <!-- Contenedor para el Footer -->
    <div id="footer" class="mt-8"></div>

    <!-- Iconos de redes sociales -->
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

        function toggleMenu(button) {
            // Encuentra el contenedor del menú, que es el siguiente elemento del botón
            var menuContainer = button.nextElementSibling;

            // Si el contenedor existe, alterna la clase 'hidden'
            if (menuContainer) {
                menuContainer.classList.toggle('hidden');
            }
        }
    </script>

</body>

</html>

