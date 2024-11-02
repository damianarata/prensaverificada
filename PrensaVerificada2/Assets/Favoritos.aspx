<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="PrensaVerificada2.Assets.Favoritos" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Favoritos</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <form id="form1" runat="server">

    <!-- Header Container -->
    <div id="header"></div>

    <!-- Contenido Principal -->
    <main class="container mx-auto px-4 py-16">
        <!-- Título de la página -->
        <h1 class="text-3xl font-bold text-gray-800 mb-8">Mis Favoritos</h1>

        <div class="w-full max-w-5xl mx-auto mt-8">
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
        <asp:Repeater ID="ArticlesRepeater" runat="server" EnableViewState="true">
            <ItemTemplate>
                <div class="bg-white p-4 rounded-lg shadow-md" onclick="window.location.href='Publicacion.aspx?publiID=<%# Eval("publiID") %>'">
                    <!-- HiddenField to store publiID -->
                    <asp:HiddenField ID="HiddenPubliID" runat="server" Value='<%# Eval("publiID") %>' />
            
                    <!-- Article Image -->
                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' class="w-full h-32 object-cover rounded-lg mb-4">
            
                    <!-- Category -->
                    <span class="block text-blue-600 text-sm font-semibold mb-2">
                        <asp:Literal ID="CategoryControl" runat="server" Text='<%# Eval("Category") %>' />
                    </span>
            
                    <!-- Title -->
                    <h3 class="text-xl font-semibold mb-2">
                        <asp:Literal ID="TitleControl" runat="server" Text='<%# Eval("Title") %>' />
                    </h3>
            
                    <!-- Author and Date Section -->
                    <div class="flex items-center mt-4">
                        <img src='<%# Eval("AuthorImage") %>' alt="Autor" class="w-8 h-8 rounded-full mr-2">
                        <div>
                            <p class="text-sm font-semibold">
                                <asp:Literal ID="AuthorControl" runat="server" Text='<%# Eval("Author") %>' />
                            </p>
                            <p class="text-sm text-gray-600">
                                <asp:Literal ID="DateControl" runat="server" Text='<%# Eval("Date") %>' />
                            </p>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

            </div>
           </div> <!-- Botón de cargar más -->
            <div class="flex justify-center mt-8">
                <asp:Button ID="ButtonNext" runat="server" Text="Cargas mas" CssClass="px-6 py-2 bg-gray-300 text-gray-600 rounded-full text-lg font-semibold" OnClick="CargarMasButton_Click" />
            </div>
        
    </main>
        </form>

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
