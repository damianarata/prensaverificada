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


    <!-- Imagen seleccionable con DropDownList -->
    <div class="mb-8">
    <label for="ddlImagen" class="block text-sm font-medium text-gray-700">Seleccionar imagen</label>
    <asp:DropDownList ID="ddlImagen" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlImagen_SelectedIndexChanged"
        CssClass="mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
        <asp:ListItem Text="Imagen 1" Value="img2/imagen_1.jpg" />
        <asp:ListItem Text="Imagen 2" Value="img2/imagen_2.jpg" />
        <asp:ListItem Text="Imagen 3" Value="img2/imagen_3.jpg" />
        <asp:ListItem Text="Imagen 4" Value="img2/imagen_4.jpg" />
        <asp:ListItem Text="Imagen 5" Value="img2/imagen_5.jpg" />
        <asp:ListItem Text="Imagen 6" Value="img2/imagen_6.jpg" />
        <asp:ListItem Text="Imagen 7" Value="img2/imagen_7.jpg" />
        <asp:ListItem Text="Imagen 8" Value="img2/imagen_8.jpg" />
        <asp:ListItem Text="Imagen 9" Value="img2/imagen_9.jpg" />
        <asp:ListItem Text="Imagen 10" Value="img2/imagen_10.jpg" />
        <asp:ListItem Text="Imagen 11" Value="img2/imagen_11.jpg" />
        <asp:ListItem Text="Imagen 12" Value="img2/imagen_12.jpg" />
        <asp:ListItem Text="Imagen 13" Value="img2/imagen_13.jpg" />
        <asp:ListItem Text="Imagen 14" Value="img2/imagen_14.jpg" />
        <asp:ListItem Text="Imagen 15" Value="img2/imagen_15.jpg" />
        <asp:ListItem Text="Imagen 16" Value="img2/imagen_16.jpg" />
        <asp:ListItem Text="Imagen 17" Value="img2/imagen_17.jpg" />
        <asp:ListItem Text="Imagen 18" Value="img2/imagen_18.jpg" />
        <asp:ListItem Text="Imagen 19" Value="img2/imagen_19.jpg" />
        <asp:ListItem Text="Imagen 20" Value="img2/imagen_20.jpg" />
    </asp:DropDownList>
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
