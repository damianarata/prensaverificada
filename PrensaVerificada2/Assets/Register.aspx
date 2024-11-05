<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PrensaVerificada2.Assets.Register" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrarse</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 flex flex-col min-h-screen">

    <!-- Contenedor para el Header -->
    <div id="header"></div>
    <form runat="server">

    <!-- Contenido principal -->
    <div class="flex-grow flex items-center justify-center">
        <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-sm">
            <!-- Título -->
            <h2 class="text-2xl font-semibold text-gray-800 mb-2">Registrarse</h2>
            <p class="text-gray-600 mb-6">Regístrate para tener acceso al portal de noticias</p>

            <!-- Formulario de Registro -->
<asp:Panel runat="server" CssClass="space-y-4">
    <div>
        <label for="EmailTextBox" class="block text-gray-700">Email</label>
        <asp:TextBox ID="EmailTextBox" runat="server" CssClass="w-full mt-1 p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500" Placeholder="Correo electrónico" TextMode="Email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
            ControlToValidate="EmailTextBox" 
            ErrorMessage="El email es requerido" 
            CssClass="text-red-500 text-sm" 
            Display="Dynamic">
        </asp:RequiredFieldValidator>
    </div>

    <div>
    <label for="PasswordTextBox" class="block text-gray-700">Contraseña</label>
    <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="w-full mt-1 p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500" Placeholder="Contraseña" TextMode="Password"></asp:TextBox>
    
    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
        ControlToValidate="PasswordTextBox" 
        ErrorMessage="La contraseña es requerida" 
        CssClass="text-red-500 text-sm" 
        Display="Dynamic">
    </asp:RequiredFieldValidator>
    
    <asp:RegularExpressionValidator ID="revPasswordComplexity" runat="server"
        ControlToValidate="PasswordTextBox"
        ErrorMessage="La contraseña debe tener más de 8 caracteres, incluir mayúsculas, números y símbolos."
        CssClass="text-red-500 text-sm"
        Display="Dynamic"
        ValidationExpression="^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\-]).{8,}$">
    </asp:RegularExpressionValidator>
    
    <p class="text-gray-600 text-sm mt-1">Usar más de 8 caracteres que tengan símbolos, mayúsculas y números</p>
</div>

<div>
    <label for="RepeatPasswordTextBox" class="block text-gray-700">Repetir Contraseña</label>
    <asp:TextBox ID="RepeatPasswordTextBox" runat="server" CssClass="w-full mt-1 p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500" Placeholder="Repetir contraseña" TextMode="Password"></asp:TextBox>
    
    <asp:RequiredFieldValidator ID="rfvRepeatPassword" runat="server" 
        ControlToValidate="RepeatPasswordTextBox" 
        ErrorMessage="Debes repetir la contraseña" 
        CssClass="text-red-500 text-sm" 
        Display="Dynamic">
    </asp:RequiredFieldValidator>
    
    <asp:CompareValidator ID="cvPasswords" runat="server"
        ControlToValidate="RepeatPasswordTextBox"
        ControlToCompare="PasswordTextBox"
        ErrorMessage="Las contraseñas no coinciden"
        CssClass="text-red-500 text-sm"
        Display="Dynamic">
    </asp:CompareValidator>
    
    <p class="text-gray-600 text-sm mt-1">Usar más de 8 caracteres que tengan símbolos, mayúsculas y números</p>
</div>

    <!-- Botón de Registrarse -->
    <asp:Button ID="RegisterButton" runat="server" CssClass="w-full py-3 mt-4 bg-gray-300 text-gray-600 rounded-full text-lg font-semibold" Text="Registrarse" OnClick="RegisterButton_Click" />
    <asp:Literal ID="SuccessMessageLiteral" runat="server"></asp:Literal>

    <!-- Enlace de Iniciar Sesión -->
    <p class="mt-4 text-center text-gray-600">¿Ya tienes cuenta? 
    <a href="login.aspx" class="text-indigo-600 hover:underline">Iniciar sesión</a>
</p>


</asp:Panel>
</div>
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

