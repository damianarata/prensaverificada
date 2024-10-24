<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Autor.aspx.cs" Inherits="PrensaVerificada2.Assets.Autor" %>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Perfil del Autor y Últimas Notas</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- Enlace a Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body class="bg-gray-100 flex flex-col min-h-screen">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

  <!-- Contenedor para el Header -->
  <div id="header"></div>

  <!-- Contenido principal -->
  <div class="flex-grow">
    <!-- Sección de perfil del autor -->
      <asp:UpdatePanel ID="UpdatePanelArticles" runat="server">
    <ContentTemplate>
        <asp:Repeater ID="AuthorDetailRepeater" runat="server">
            <ItemTemplate>
                <!-- Detalles del Autor -->
                <div class="w-full max-w-5xl mx-auto bg-white shadow-md rounded-lg overflow-hidden mt-8 p-8">
                    <div class="flex items-center">
                        <img src='<%# Eval("ImageUrl") %>' alt="Imagen del Autor" class="w-24 h-24 rounded-full object-cover">
                        <div class="ml-6">
                            <h1 class="text-3xl font-semibold text-gray-800"><%# Eval("Nombre") %></h1>
                            <p class="text-gray-600 italic"><%# Eval("Medio") %></p>
                        </div>
                    </div>
                    <div class="mt-4">
                        <p class="text-gray-700 leading-relaxed">
                            <%# Eval("Descripcion") %>
                        </p>
                        <div class="flex space-x-4 mt-4">
                            <asp:PlaceHolder ID="SocialMediaPlaceholder" runat="server">
                                <!-- Facebook -->
                                <a href='<%# Eval("FacebookUrl") %>' class="text-gray-500 hover:text-gray-700" target="_blank" 
                                   style="display: <%# string.IsNullOrEmpty(Eval("FacebookUrl").ToString()) ? "none" : "inline" %>;">
                                    <i class="fab fa-facebook-f"></i>
                                </a>

                                <!-- Twitter -->
                                <a href='<%# Eval("TwitterUrl") %>' class="text-gray-500 hover:text-gray-700" target="_blank" 
                                   style="display: <%# string.IsNullOrEmpty(Eval("TwitterUrl").ToString()) ? "none" : "inline" %>;">
                                    <i class="fab fa-twitter"></i>
                                </a>

                                <!-- Instagram -->
                                <a href='<%# Eval("InstagramUrl") %>' class="text-gray-500 hover:text-gray-700" target="_blank" 
                                   style="display: <%# string.IsNullOrEmpty(Eval("InstagramUrl").ToString()) ? "none" : "inline" %>;">
                                    <i class="fab fa-instagram"></i>
                                </a>

                                <!-- LinkedIn -->
                                <a href='<%# Eval("LinkedInUrl") %>' class="text-gray-500 hover:text-gray-700" target="_blank" 
                                   style="display: <%# string.IsNullOrEmpty(Eval("LinkedInUrl").ToString()) ? "none" : "inline" %>;">
                                    <i class="fab fa-linkedin"></i>
                                </a>

                                <!-- YouTube -->
                                <a href='<%# Eval("YouTubeUrl") %>' class="text-gray-500 hover:text-gray-700" target="_blank" 
                                   style="display: <%# string.IsNullOrEmpty(Eval("YouTubeUrl").ToString()) ? "none" : "inline" %>;">
                                    <i class="fab fa-youtube"></i>
                                </a>
                            </asp:PlaceHolder>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>


    <!-- Sección de últimas notas -->
    <div class="w-full max-w-5xl mx-auto mt-8">
      <h2 class="text-2xl font-semibold text-gray-800">Últimas notas</h2>
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
            <!-- Botón de cargar más -->
            <div class="flex justify-center mt-8">
                <asp:Button ID="ButtonNext" runat="server" Text="Cargas mas" CssClass="px-6 py-2 bg-gray-300 text-gray-600 rounded-full text-lg font-semibold" OnClick="CargarMasButton_Click" />
            </div>
        
        </ContentTemplate>
</asp:UpdatePanel>
    </div>
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
