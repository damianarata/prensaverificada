<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Autores.aspx.cs" Inherits="PrensaVerificada2.Assets.Autores" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nuestros Autores</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Enlace a Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body class="bg-gray-100 text-gray-800">

    <!-- Contenedor para el Header -->
    <div id="header"></div>

    <!-- Sección de autores -->
    <section class="container mx-auto p-8 mt-8 bg-white shadow-lg rounded-lg">
        <h2 class="text-center text-3xl font-semibold mb-4">Nuestros autores</h2>
        <p class="text-center text-gray-600 mb-8">Estos son los periodistas que colaboran con nuestro portal y enriquecen nuestra comunidad</p>

        <!-- Tarjetas de autores -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
            <asp:Repeater ID="AuthorsRepeater" runat="server">
                <ItemTemplate>
                    <!-- Autor -->
                    <div class="bg-white p-4 rounded-lg shadow-md" onclick="window.location.href='Autor.aspx?autorID=<%# Eval("AutorID") %>'">
                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Nombre") %>' class="rounded-lg h-48 w-full">
                        <h3 class="text-lg font-bold mt-4"><%# Eval("Nombre") %></h3>
                        <p class="text-sm text-gray-500"><%# Eval("Medio") %></p>
                        <p class="text-sm text-gray-700 mt-2"><%# Eval("Descripcion") %></p>
                        <div class="flex space-x-4 mt-4">
                            <asp:PlaceHolder ID="SocialMediaPlaceholder" runat="server">
                                <%-- Facebook --%>
                                <a href='<%# Eval("FacebookUrl") %>' class="text-gray-500 hover:text-gray-700" target="_blank" 
                                   style="display: <%# string.IsNullOrEmpty(Eval("FacebookUrl").ToString()) ? "none" : "inline" %>;">
                                    <i class="fab fa-facebook-f"></i>
                                </a>
        
                                <%-- Twitter --%>
                                <a href='<%# Eval("TwitterUrl") %>' class="text-gray-500 hover:text-gray-700" target="_blank" 
                                   style="display: <%# string.IsNullOrEmpty(Eval("TwitterUrl").ToString()) ? "none" : "inline" %>;">
                                    <i class="fab fa-twitter"></i>
                                </a>
        
                                <%-- Instagram --%>
                                <a href='<%# Eval("InstagramUrl") %>' class="text-gray-500 hover:text-gray-700" target="_blank" 
                                   style="display: <%# string.IsNullOrEmpty(Eval("InstagramUrl").ToString()) ? "none" : "inline" %>;">
                                    <i class="fab fa-instagram"></i>
                                </a>
        
                                <%-- LinkedIn --%>
                                <a href='<%# Eval("LinkedInUrl") %>' class="text-gray-500 hover:text-gray-700" target="_blank" 
                                   style="display: <%# string.IsNullOrEmpty(Eval("LinkedInUrl").ToString()) ? "none" : "inline" %>;">
                                    <i class="fab fa-linkedin"></i>
                                </a>
        
                                <%-- YouTube --%>
                                <a href='<%# Eval("YouTubeUrl") %>' class="text-gray-500 hover:text-gray-700" target="_blank" 
                                   style="display: <%# string.IsNullOrEmpty(Eval("YouTubeUrl").ToString()) ? "none" : "inline" %>;">
                                    <i class="fab fa-youtube"></i>
                                </a>
                            </asp:PlaceHolder>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>

    <!-- Contenedor para el Footer -->
    <div id="footer" class="mt-8"></div>

    <!-- Iconos de redes sociales -->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
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
