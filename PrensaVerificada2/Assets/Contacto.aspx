<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="PrensaVerificada2.Assets.Contacto" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contactanos</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 text-gray-800">

    <!-- Header Container -->
    <div id="header"></div>
    <form runat="server">

    <!-- Formulario de contacto -->
    <section class="container mx-auto p-8">
        <h2 class="text-center text-3xl font-semibold mb-6">Contactanos</h2>
          <asp:Panel CssClass="bg-white p-8 rounded-lg shadow-md max-w-3xl mx-auto" runat="server">
    <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 mb-6">
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-2" for="NombreTextBox">Nombre*</label>
            <asp:TextBox ID="NombreTextBox" runat="server" CssClass="w-full border border-gray-300 p-2 rounded" Placeholder="Escribí acá.." ValidationGroup="SubmitGroup"></asp:TextBox>
            <asp:RequiredFieldValidator ID="NombreValidator" runat="server" ControlToValidate="NombreTextBox" ErrorMessage="El nombre es obligatorio" CssClass="text-red-500" Display="Dynamic" ValidationGroup="SubmitGroup" />
            <asp:RegularExpressionValidator ID="NombreRegexValidator" runat="server" ControlToValidate="NombreTextBox" ErrorMessage="Solo se permiten letras" CssClass="text-red-500" Display="Dynamic" ValidationGroup="SubmitGroup" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" />
        </div>
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-2" for="EmailTextBox">E-mail*</label>
            <asp:TextBox ID="EmailTextBox" runat="server" CssClass="w-full border border-gray-300 p-2 rounded" TextMode="Email" Placeholder="Escribí acá.." ValidationGroup="SubmitGroup"></asp:TextBox>
            <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ControlToValidate="EmailTextBox" ErrorMessage="El correo electrónico es obligatorio" CssClass="text-red-500" Display="Dynamic" ValidationGroup="SubmitGroup" />
            <asp:RegularExpressionValidator ID="EmailRegexValidator" runat="server" ControlToValidate="EmailTextBox" ErrorMessage="Formato de correo electrónico inválido" CssClass="text-red-500" Display="Dynamic" ValidationGroup="SubmitGroup" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" />
        </div>
    </div>
    <div class="mb-6">
        <label class="block text-sm font-medium text-gray-700 mb-2" for="DescripcionTextBox">Descripcion</label>
        <asp:TextBox ID="DescripcionTextBox" runat="server" CssClass="w-full border border-gray-300 p-2 rounded" TextMode="MultiLine" Rows="4" Placeholder="Escribí acá.." ValidationGroup="SubmitGroup"></asp:TextBox>
    </div>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-red-500 mb-4" ValidationGroup="SubmitGroup" />

    <div class="flex items-center justify-between">
        <asp:Button ID="FaqButton" runat="server" Text="Preguntas frecuentes" 
                    CssClass="bg-blue-500 text-white px-4 py-2 rounded" 
                    OnClick="FaqButton_Click" CausesValidation="false" />

        <asp:Button ID="SubmitButton" runat="server" Text="Enviar" 
                    CssClass="bg-gray-300 text-gray-700 px-4 py-2 rounded" 
                    OnClick="SubmitButton_Click" CausesValidation="true" ValidationGroup="SubmitGroup" />
        <asp:Literal ID="SuccessMessageLiteral" runat="server"></asp:Literal>
    </div>
</asp:Panel>




    </section>
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
