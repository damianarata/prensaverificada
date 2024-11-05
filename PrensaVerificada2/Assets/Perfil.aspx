<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="PrensaVerificada2.Assets.Perfil" %>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tu Perfil</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex flex-col min-h-screen">

  <!-- Contenedor para el Header -->
  <div id="header"></div>
    <form runat="server">
  <!-- Contenido principal -->
  <div class="flex-grow flex justify-center items-center">
    <div class="w-full max-w-4xl bg-white shadow-md rounded-lg p-8 mt-8">
      <h1 class="text-center text-2xl font-semibold text-gray-800 mb-4">Tu perfil</h1>
      <p class="text-lg text-gray-600 mb-8">Bienvenido</p>
      
      <!-- Formulario de perfil -->
      <div class="flex space-x-8">
        <!-- Imagen de perfil y nombre -->
        <div class="flex-shrink-0 flex flex-col items-center w-[100px]">
          <asp:Image ID="imgPerfil" runat="server" AlternateText="Imagen de perfil" CssClass="w-24 h-24 rounded-full object-cover mb-4" />
          <h2 class="text-lg font-semibold text-gray-800">Subir foto</h2>
            <label for="FileUpload1" class="cursor-pointer bg-gray-300 text-gray-700 px-2 py-1 rounded focus:outline-none focus:ring focus:ring-blue-500">
                ...
            </label>
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="hidden" OnChange="displayFileName(this)" />
                 <p id="fileNameDisplay" class="text-gray-600 mt-2 w-[50px] whitespace-nowrap overflow-hidden text-ellipsis text-center"></p>
        </div>

            <!-- Formulario para los campos de perfil -->
                <div class="flex-grow">
                    <div class="grid grid-cols-2 gap-4 mb-4">
                        <div>
                            <label for="NombreTextBox" class="text-gray-700">Nombre</label>
                            <asp:TextBox ID="NombreTextBox" runat="server" CssClass="w-full mt-2 p-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500" Placeholder="Escribí acá.."></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" 
                                ControlToValidate="NombreTextBox" 
                                ErrorMessage="El nombre es requerido" 
                                CssClass="text-red-500 text-sm"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revNombre" runat="server" 
                                ControlToValidate="NombreTextBox"
                                ValidationExpression="^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+$"
                                ErrorMessage="El nombre solo puede contener letras" 
                                CssClass="text-red-500 text-sm"
                                Display="Dynamic">
                            </asp:RegularExpressionValidator>
                        </div>

                        <div>
                            <label for="BiografiaTextBox" class="text-gray-700">Biografía</label>
                            <asp:TextBox ID="BiografiaTextBox" runat="server" TextMode="MultiLine" CssClass="w-full mt-2 p-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500" Placeholder="Escribí acá.."></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvBiografia" runat="server" 
                                ControlToValidate="BiografiaTextBox" 
                                ErrorMessage="La biografía es requerida" 
                                CssClass="text-red-500 text-sm"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div>
                            <label for="TwitterTextBox" class="text-gray-700">Twitter</label>
                            <asp:TextBox ID="TwitterTextBox" runat="server" CssClass="w-full mt-2 p-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500" Placeholder="https://twitter.com/usuario"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revTwitter" runat="server" 
                                ControlToValidate="TwitterTextBox"
                                ValidationExpression="^(https?:\/\/)?(www\.)?twitter\.com\/[a-zA-Z0-9_]{1,15}$"
                                ErrorMessage="Ingresa una URL válida de Twitter" 
                                CssClass="text-red-500 text-sm"
                                Display="Dynamic">
                            </asp:RegularExpressionValidator>
                        </div>

                        <div>
                            <label for="InstagramTextBox" class="text-gray-700">Instagram</label>
                            <asp:TextBox ID="InstagramTextBox" runat="server" CssClass="w-full mt-2 p-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500" Placeholder="https://instagram.com/usuario"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revInstagram" runat="server" 
                                ControlToValidate="InstagramTextBox"
                                ValidationExpression="^(https?:\/\/)?(www\.)?instagram\.com\/[a-zA-Z0-9_\.]{1,30}$"
                                ErrorMessage="Ingresa una URL válida de Instagram" 
                                CssClass="text-red-500 text-sm"
                                Display="Dynamic">
                            </asp:RegularExpressionValidator>
                        </div>

                        <div>
                            <label for="MedioTextBox" class="text-gray-700">Medio</label>
                            <asp:TextBox ID="MedioTextBox" runat="server" CssClass="w-full mt-2 p-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500" Placeholder="Escribí acá.."></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvMedio" runat="server" 
                                ControlToValidate="MedioTextBox" 
                                ErrorMessage="El medio es requerido" 
                                CssClass="text-red-500 text-sm"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div>
                            <label for="LinkedinTextBox" class="text-gray-700">LinkedIn</label>
                            <asp:TextBox ID="LinkedinTextBox" runat="server" CssClass="w-full mt-2 p-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500" Placeholder="https://linkedin.com/in/usuario"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revLinkedin" runat="server" 
                                ControlToValidate="LinkedinTextBox"
                                ValidationExpression="^(https?:\/\/)?(www\.)?linkedin\.com\/in\/[a-zA-Z0-9\-]{5,30}$"
                                ErrorMessage="Ingresa una URL válida de LinkedIn" 
                                CssClass="text-red-500 text-sm"
                                Display="Dynamic">
                            </asp:RegularExpressionValidator>
                        </div>

                        <div>
                            <label for="FacebookTextBox" class="text-gray-700">Facebook</label>
                            <asp:TextBox ID="FacebookTextBox" runat="server" CssClass="w-full mt-2 p-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500" Placeholder="https://facebook.com/usuario"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revFacebook" runat="server" 
                                ControlToValidate="FacebookTextBox"
                                ValidationExpression="^(https?:\/\/)?(www\.)?facebook\.com\/[a-zA-Z0-9\.]{5,50}$"
                                ErrorMessage="Ingresa una URL válida de Facebook" 
                                CssClass="text-red-500 text-sm"
                                Display="Dynamic">
                            </asp:RegularExpressionValidator>
                        </div>

                        <div>
                            <label for="YoutubeTextBox" class="text-gray-700">YouTube</label>
                            <asp:TextBox ID="YoutubeTextBox" runat="server" CssClass="w-full mt-2 p-2 border rounded-lg focus:ring-blue-500 focus:border-blue-500" Placeholder="https://youtube.com/@usuario"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revYoutube" runat="server" 
                                ControlToValidate="YoutubeTextBox"
                                ValidationExpression="^(https?:\/\/)?(www\.)?youtube\.com\/@[a-zA-Z0-9\-_]{3,30}$"
                                ErrorMessage="Ingresa una URL válida de YouTube" 
                                CssClass="text-red-500 text-sm"
                                Display="Dynamic">
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>
                        <div class="flex justify-end space-x-4">
                            <asp:Button ID="Button2" runat="server" OnClick="btnChange" CausesValidation="false" 
                            class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 focus:ring-4 focus:ring-blue-3000" 
                            Text="Cambiar contraseña" />
                            <asp:Button ID="Button1" runat="server" OnClick="btnCancel" CausesValidation="false" class="px-4 py-2 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300 focus:ring-4 focus:ring-gray-300" Text="Cancelar" />
                            <asp:Button ID="ButtonGuardar" runat="server" OnClick="btnGuardar" class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 focus:ring-4 focus:ring-blue-300" Text="Guardar" />
                      </div>

                    </div>
        </div>
      </div>
      </div>
        </form>

  <!-- Contenedor para el Footer -->
  <div id="footer" class="mt-8"></div>

  <script>
      function displayFileName(input) {
          var fileName = input.files[0] ? input.files[0].name : "Ningún archivo seleccionado";
          document.getElementById('fileNameDisplay').textContent = fileName;
      }
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
        document.getElementById('open-modal').addEventListener('click', function() {
            document.getElementById('delete-account-modal').classList.remove('hidden');
        });

        document.getElementById('close-modal').addEventListener('click', function() {
            document.getElementById('delete-account-modal').classList.add('hidden');
        });

        document.getElementById('cancel').addEventListener('click', function() {
            document.getElementById('delete-account-modal').classList.add('hidden');
        });

        document.addEventListener('click', function(event) {
            var modal = document.getElementById('delete-account-modal');
            if (event.target === modal) {
                modal.classList.add('hidden');
            }
        });
  </script>

</body>
</html>

