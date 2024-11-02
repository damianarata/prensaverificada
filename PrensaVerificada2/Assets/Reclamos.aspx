<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reclamos.aspx.cs" Inherits="PrensaVerificada2.Assets.Reclamos" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Reclamos</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex flex-col min-h-screen">

    <!-- Contenedor para el Header -->
    <div id="header"></div>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <!-- Contenido Principal -->
    <main class="container mx-auto px-4 py-16">
        <!-- Título de la página -->
        <h1 class="text-3xl font-bold text-gray-800 mb-8">Gestión de Reclamos</h1>

       <table class="min-w-full divide-y divide-gray-200">
    <thead class="bg-gray-50">
        <tr>
            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Fecha
            </th>
            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Correo
            </th>
            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Nombre
            </th>
            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Descripción
            </th>
            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Estado
            </th>
            <th scope="col" class="relative px-6 py-3">
                <span class="sr-only">Acciones</span>
            </th>
        </tr>
    </thead>
    <tbody class="bg-white divide-y divide-gray-200">
        <asp:Repeater ID="ReclamosRepeater" runat="server" OnItemCommand="ReclamosRepeater_ItemCommand">
            <ItemTemplate>
                <tr>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%# Eval("Fecha", "{0:dd/MM/yyyy}") %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%# Eval("Mail") %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%# Eval("Nombre") %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%# Eval("Descripcion") %></td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm">
                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full <%# Eval("EstadoColor") %>">
                            <%# Eval("EstadoNombre") %>
                        </span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                        <div class="relative inline-block text-left">
                            <asp:LinkButton ID="ActionsButton" runat="server" Text="Acciones" 
                                OnClientClick='<%# "toggleMenu(\"" + "menuContainer_" + Eval("ReclamoID") + "\"); return false;" %>' 
                                CssClass="inline-flex justify-center w-full rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50" />

                            <!-- Menú desplegable de acciones -->
                            <div class="origin-top-right absolute right-0 mt-2 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none hidden"
                                 id='<%# "menuContainer_" + Eval("ReclamoID") %>'
                                 style="z-index: 1000; position: absolute;">
                                <asp:LinkButton ID="VerButton" runat="server" CommandName="Ver" CommandArgument='<%# Eval("ReclamoID") %>' Text="Ver" CssClass="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100" />
                                <asp:LinkButton ID="ResolveButton" runat="server" CommandName="Resolver" CommandArgument='<%# Eval("ReclamoID") %>' Text="Resolver" CssClass="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100" />
                            </div>
                        </div>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </tbody>
</table>
        <div id="reclamoModal" class="fixed inset-0 hidden bg-gray-800 bg-opacity-75 flex items-center justify-center z-50">
    <div class="bg-white p-6 rounded shadow-lg w-96">
        <h2 class="text-lg font-semibold mb-4">Detalles del Reclamo</h2>
        <input type="hidden" id="hiddenReclamoId" value="" />
        <p><strong>Nombre:</strong> <span id="modalNombre"></span></p>
        <p><strong>Descripción:</strong> <span id="modalDescripcion"></span></p>
        <p><strong>Email:</strong> <span id="modalMail"></span></p>
        <p><strong>Fecha:</strong> <span id="modalFecha"></span></p>
        <p><strong>Estado:</strong> <span id="modalEstadoNombre" class="px-2 rounded-full text-white"></span></p>
        <div class="mt-4 mb-4">
            <h3 class="text-md font-semibold mb-2">Historial de Comentarios</h3>
            <div id="comentariosHistorial" class="max-h-40 overflow-y-auto">
                <!-- Los comentarios se cargarán aquí dinámicamente -->
            </div>
        </div>

        <!-- Cuadro de texto para comentarios -->
        <div class="mt-4">
            <label for="modalComentario" class="block text-sm font-medium text-gray-700">Comentario</label>
            <textarea id="modalComentario" rows="3" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm"></textarea>
        </div>

        <!-- Botones para guardar y cerrar -->
        <div class="mt-4 flex justify-end space-x-4">
            <button onclick="saveComment()" class="px-4 py-2 bg-blue-600 text-white rounded">Guardar</button>
            <button onclick="closeModal()" class="px-4 py-2 bg-gray-600 text-white rounded">Cerrar</button>
        </div>
    </div>
</div>

    </main>
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

        function toggleMenu(menuId) {
            // Buscar el contenedor del menú usando su ID
            var menuContainer = document.getElementById(menuId);

            // Si se encuentra el contenedor del menú, alternar la clase 'hidden'
            if (menuContainer) {
                menuContainer.classList.toggle('hidden');
            }
        }

        function showReclamoModal(nombre, descripcion, mail, fecha, estadoNombre, estadoColor) {
            document.getElementById('modalNombre').textContent = nombre;
            document.getElementById('modalDescripcion').textContent = descripcion;
            document.getElementById('modalMail').textContent = mail;
            document.getElementById('modalFecha').textContent = fecha;
            var estadoElem = document.getElementById('modalEstadoNombre');
            estadoElem.textContent = estadoNombre;
            estadoElem.className = `px-2 rounded-full ${estadoColor}`;
            document.getElementById('reclamoModal').classList.remove('hidden');
        }

        function closeModal() {
            document.getElementById('reclamoModal').classList.add('hidden');
        }

        function saveComment() {
            var comentario = document.getElementById('modalComentario').value;
            alert("Comentario guardado: " + comentario);
            closeModal();
        }
    </script>
</body>
</html>

