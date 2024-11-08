<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecoverPass.aspx.cs" Inherits="PrensaVerificada2.Assets.RecoverPass" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recupero de Contraseña</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex flex-col min-h-screen">

    <!-- Contenedor para el Header -->
    <div id="header"></div>
    <form runat="server">

    <!-- Contenido principal -->
    <div class="flex-grow flex items-center justify-center mt-16">
        <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-sm">
            <!-- Título -->
            <h2 class="text-2xl font-semibold text-gray-800 mb-2">Recupero</h2>
            <p class="text-gray-600 mb-6">Recupera tu contraseña con el siguiente procedimiento</p>

            <!-- Formulario de Recupero -->
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
    
    <asp:RegularExpressionValidator ID="revEmailFormat" runat="server"
        ControlToValidate="EmailTextBox"
        ErrorMessage="Formato de email inválido"
        CssClass="text-red-500 text-sm"
        Display="Dynamic"
        ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,4}$">
    </asp:RegularExpressionValidator>
</div>

<!-- Campo para Confirmar Email -->
<div>
    <label for="ConfirmEmailTextBox" class="block text-gray-700">Confirmar Email</label>
    <asp:TextBox ID="ConfirmEmailTextBox" runat="server" CssClass="w-full mt-1 p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500" Placeholder="Confirmar correo electrónico" TextMode="Email"></asp:TextBox>
    
    <asp:RequiredFieldValidator ID="rfvConfirmEmail" runat="server" 
        ControlToValidate="ConfirmEmailTextBox" 
        ErrorMessage="Confirma el email" 
        CssClass="text-red-500 text-sm" 
        Display="Dynamic">
    </asp:RequiredFieldValidator>
    
    <asp:CompareValidator ID="cvEmails" runat="server"
        ControlToValidate="ConfirmEmailTextBox"
        ControlToCompare="EmailTextBox"
        ErrorMessage="Los emails no coinciden"
        CssClass="text-red-500 text-sm"
        Display="Dynamic">
    </asp:CompareValidator>
</div>

               <asp:Button ID="EnviarCorreobutton" runat="server" CssClass="w-full py-3 mt-4 bg-gray-300 text-gray-600 rounded-full text-lg font-semibold" Text="Enviar Correo" OnClick="SendButton_Click" />
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
        document.getElementById('recover-btn').addEventListener('click', function() {
            window.location.href = './NewPass.aspx';
        });
    </script>

</body>
</html>

