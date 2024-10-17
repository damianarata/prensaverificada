﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Editor.aspx.cs" Inherits="PrensaVerificada2.Assets.Editor" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tu Publicación</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 text-gray-800">

    <!-- Contenedor para el Header -->
    <div id="header"></div>

    <!-- Área de edición de publicaciones -->
    <section class="container mx-auto p-8 bg-white shadow-lg rounded-lg mt-8">
        <h2 class="text-center text-3xl font-semibold mb-6">Tu publicación</h2>

    <form runat="server">
        <!-- Editor de texto -->
<div class="p-8">
    <div class="flex items-center space-x-4">
        <label for="ddlFontFamily" class="text-sm font-medium text-gray-700">Tipo de letra</label>
        <asp:DropDownList ID="ddlFontFamily" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFontFamily_SelectedIndexChanged">
            <asp:ListItem Text="Arial" Value="Arial"></asp:ListItem>
            <asp:ListItem Text="Times New Roman" Value="Times New Roman"></asp:ListItem>
            <asp:ListItem Text="Verdana" Value="Verdana"></asp:ListItem>
            <asp:ListItem Text="Courier New" Value="Courier New"></asp:ListItem>
            <asp:ListItem Text="Georgia" Value="Georgia"></asp:ListItem>
        </asp:DropDownList>

        <label for="ddlFontSize" class="text-sm font-medium text-gray-700">Tamaño de letra</label>
        <asp:DropDownList ID="ddlFontSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFontSize_SelectedIndexChanged">
            <asp:ListItem Text="8 pt" Value="8"></asp:ListItem>
            <asp:ListItem Text="10 pt" Value="10"></asp:ListItem>
            <asp:ListItem Text="12 pt" Value="12"></asp:ListItem>
            <asp:ListItem Text="14 pt" Value="14"></asp:ListItem>
            <asp:ListItem Text="16 pt" Value="16"></asp:ListItem>
            <asp:ListItem Text="18 pt" Value="18"></asp:ListItem>
            <asp:ListItem Text="20 pt" Value="20"></asp:ListItem>
        </asp:DropDownList>
    </div>
</div>

    <!-- Título editable con TextBox -->
    <div class="mb-4">
        <label for="txtTitulo" class="block text-sm font-medium text-gray-700">Título</label>
        <asp:TextBox ID="txtTitulo" runat="server" CssClass="mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500" Text="Titulo" />
    </div>

    <!-- Subtítulo editable con TextBox -->
    <div class="mb-4">
        <label for="txtSubtitulo" class="block text-sm font-medium text-gray-700">Subtítulo</label>
        <asp:TextBox ID="txtSubtitulo" runat="server" CssClass="mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500" Text="Subtitulo" />
    </div>

     <div class="mb-4">
        <label for="txtContenido" class="block text-sm font-medium text-gray-700">Contenido</label>
        <asp:TextBox 
            ID="TextContenido" 
            runat="server" 
            CssClass="mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 p-2" 
            TextMode="MultiLine" 
            Rows="5" 
            Text="Esta es la primera línea del contenido editable. 
    Este es el segundo párrafo de ejemplo para mostrar cómo se ve el contenido en varias líneas.
    Puedes editar este contenido para ajustarlo a tus necesidades.
    Este es un ejemplo de cómo se vería un párrafo largo en el TextBox.
    Agrega más líneas según sea necesario." />
    </div>
    
     <div class="mb-8">
    <label for="ddlCategoria" class="block text-sm font-medium text-gray-700">Seleccionar categoría</label>
    <asp:DropDownList ID="ddlCategoria" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged"
        CssClass="mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
        <asp:ListItem Text="Seleccione una categoría" Value="" />
        <asp:ListItem Text="Política" Value="1" />
        <asp:ListItem Text="Economía" Value="2" />
        <asp:ListItem Text="Deportes" Value="3" />
        <asp:ListItem Text="Tecnología" Value="4" />
        <asp:ListItem Text="Viajes" Value="5" />
    </asp:DropDownList>
    </div>
    <div class="mb-8">
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br /><br />
        <asp:Button ID="btnUpload" runat="server" Text="Cargar Imagen" Class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 focus:ring-4 focus:ring-blue-300" OnClick="btnUpload_Click" />
        <br /><br />
        <asp:Image ID="Image1" runat="server" Width="300px" />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </div>

<!-- Control Image para mostrar la imagen seleccionada -->
<div class="mb-8">
    <asp:Image ID="imgPreview" runat="server" CssClass="w-full h-auto rounded-lg shadow-md" ImageUrl="https://via.placeholder.com/800x400" />
</div>


    <!-- Botón de guardar cambios -->
    <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cambios" CssClass="inline-flex justify-center w-full rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-blue-600 text-white text-sm font-medium hover:bg-blue-700" OnClick="btnGuardar_Click" />
     <!-- Botón de publicar -->
    <asp:Button ID="btnPublicar" runat="server" Text="Publicar" CssClass="inline-flex justify-center w-full rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-green-600 text-white text-sm font-medium hover:bg-green-700" OnClick="btnPublicar_Click" />
</div>
        <div>
        <asp:Label ID="lblMensaje" runat="server" CssClass="text-red-500"></asp:Label>
    </div>
        </form>
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
    </script>

</body>

</html>
