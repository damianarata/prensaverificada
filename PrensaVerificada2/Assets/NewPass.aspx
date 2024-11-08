<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewPass.aspx.cs" Inherits="PrensaVerificada2.Assets.NewPass" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nueva Clave</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 flex flex-col min-h-screen">
    <form runat="server">
    <!-- Contenedor para el Header -->
    <div id="header"></div>

    <!-- Contenido principal -->
    <div class="flex-grow flex items-center justify-center mt-16">
        <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-sm">
            <!-- Título -->
            <h2 class="text-2xl font-semibold text-gray-800 mb-2">Nueva clave</h2>
            <p class="text-gray-600 mb-6">Validamos que el enlace sigue activo, ingresa la nueva clave.</p>

            <!-- Formulario de Nueva Clave -->
            <asp:Panel runat="server" CssClass="space-y-4" DefaultButton="ChangeButton">
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

                <!-- Botón de Actualizar Contraseña -->
                <asp:Button ID="ChangeButton" runat="server" CssClass="w-full py-3 mt-4 bg-gray-300 text-gray-600 rounded-full text-lg font-semibold" Text="Actualizar Contraseña" OnClick="ChangeButton_Click" UseSubmitBehavior="false" />
    <asp:Literal ID="SuccessMessageLiteral" runat="server"></asp:Literal>
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

