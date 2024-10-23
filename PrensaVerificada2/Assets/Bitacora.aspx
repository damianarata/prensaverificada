<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bitacora.aspx.cs" Inherits="PrensaVerificada2.Assets.Bitacora" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Consultar Bitácora</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex flex-col min-h-screen">

  <!-- Contenedor para el Header -->
  <div id="header"></div>

  <!-- Contenido principal -->
  <div class="flex-grow flex flex-col">
    <div class="w-full max-w-4xl mx-auto bg-white shadow-md rounded-lg overflow-hidden mt-8">
      <div class="px-4 pt-6 pb-8">
        <h1 class="text-2xl font-semibold text-gray-800">Consultar Bitácora</h1>

        <form runat="server">
            <div style="display: flex; justify-content: space-around;">

                <asp:Chart ID="Chart1" runat="server" Width="400px" Height="300px">
                    <Titles>
                        <asp:Title Name="Acciones en los Últimos 7 Días"  Text="Acciones en los Últimos 7 Días" Font="Arial, 12pt, style=Bold" ForeColor="#4B5563"/>
                    </Titles>
                    <Series>
                        <asp:Series Name="Series1" ChartType="Pie">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="Ultimos 7 dias">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>

                <asp:Chart ID="Chart2" runat="server" Width="400px" Height="300px">
                    <Titles>
                        <asp:Title Name="Acciones en el Último Mes" Text="Acciones en el Último Mes" Font="Arial, 12pt, style=Bold" ForeColor="#4B5563" />
                    </Titles>
                    <Series>
                        <asp:Series Name="Series2" ChartType="Pie">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="Ultimo mes">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>

            </div>



          <div class="mt-4">
            <p class="text-gray-700">Filtrar por Fecha</p>
            <div class="grid grid-cols-2 gap-4 mt-2">
              <div>
                <label for="startDate" class="block text-sm font-medium text-gray-700">Fecha de Inicio</label>
                <asp:TextBox ID="startDate" runat="server" CssClass="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm" TextMode="Date"></asp:TextBox>
              </div>
              <div>
                <label for="endDate" class="block text-sm font-medium text-gray-700">Fecha de Fin</label>
                <asp:TextBox ID="endDate" runat="server" CssClass="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm" TextMode="Date"></asp:TextBox>
              </div>
            </div>
          </div>

          <div class="mt-4">
            <p class="text-gray-700">Filtrar por Usuario</p>
            <asp:TextBox ID="usernameFilter" runat="server" CssClass="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm"></asp:TextBox>
          </div>

          <div class="mt-4">
            <p class="text-gray-700">Filtrar por Tipo de Operación</p>
            <asp:TextBox ID="operationFilter" runat="server" CssClass="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm"></asp:TextBox>
          </div>

          <div class="mt-4">
            <asp:Button ID="searchButton" runat="server" Text="Buscar" CssClass="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 focus:ring-4 focus:ring-blue-500" OnClick="SearchButton_Click" />
              <asp:Button ID="Button2" runat="server" Text="Restablecer" CssClass="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 focus:ring-4 focus:ring-blue-500" OnClick="RestablecerButton_Click" />
          </div>

          <div class="mt-6">
            <p class="text-gray-700">Resultados de la Bitácora</p>
            <div class="overflow-x-auto mt-4">
              <table class="min-w-full bg-white">
                <thead class="bg-gray-100">
                  <tr>
                    <th class="py-2 text-left text-sm font-semibold text-gray-600">Fecha</th>
                    <th class="py-2 text-left text-sm font-semibold text-gray-600">Usuario</th>
                    <th class="py-2 text-left text-sm font-semibold text-gray-600">Acción</th>
                  </tr>
                </thead>
                <tbody id="bitacoraResults" runat="server">
                  <asp:Repeater ID="LogRepeater" runat="server">
                    <ItemTemplate>
                      <tr>
                        <td class="py-2 border-b border-gray-200"><%# Eval("Fecha") %></td>
                        <td class="py-2 border-b border-gray-200"><%# Eval("UsuarioID") %></td>
                        <td class="py-2 border-b border-gray-200"><%# Eval("Accion") %></td>
                      </tr>
                    </ItemTemplate>
                  </asp:Repeater>
                </tbody>
              </table>
            </div>
          </div>
        <div class="mt-4">
            <asp:Button ID="ButtonPrevious" runat="server" Text="Volver" CssClass="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 focus:ring-4 focus:ring-blue-500" OnClick="VolverButton_Click" />
            <asp:Button ID="ButtonNext" runat="server" Text="Siguiente" CssClass="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 focus:ring-4 focus:ring-blue-500" OnClick="SiguienteButton_Click" />
          </div>
        </form>
      </div>
    </div>
  </div>

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

</script>
</body>
</html>
