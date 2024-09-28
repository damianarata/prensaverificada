<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="PrensaVerificada2.Assets.Index" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Últimas Publicaciones</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 flex flex-col min-h-screen">

    <form id="form1" runat="server">

    <!-- Contenedor para el Header -->
    <div id="header"></div>

    <!-- Contenido principal -->
    <div class="flex-grow">
        <div class="container mx-auto p-8">
            <h1 class="text-3xl font-semibold text-center text-gray-800 mb-8">Últimas publicaciones</h1>

            <!-- Publicación destacada -->
            <div class="mb-8" onclick="window.location.href='./Publicacion.aspx?publiID=1'">
                <div class="relative">
                    <img src="./img/diputados.jpg" alt="Imagen Principal" class="w-full h-64 object-cover rounded-lg shadow-md">
                    <div class="absolute inset-0 bg-black bg-opacity-50 flex items-end rounded-lg">
                        <div class="p-6 text-white">
                            <span class="bg-blue-600 px-3 py-1 text-xs uppercase rounded-full">Política</span>
                            <h2 class="text-2xl font-semibold mt-2">Diputados se suben el sueldo y pasarán a cobrar más de $2,2 millones</h2>
                            <div class="flex items-center mt-4">
                                <img src="img/alconada.jpg" alt="Autor" class="w-10 h-10 rounded-full mr-4">
                                <div>
                                    <p class="font-semibold">Hugo Alconada</p>
                                    <p class="text-sm">4 de junio 2024</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Grid de publicaciones -->
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
                <!-- Repetir este bloque para cada artículo -->
                <div class="bg-white p-4 rounded-lg shadow-md" onclick="window.location.href='./Publicacion.aspx?publiID=1'">
                    <img src="img/cripto.jpg" alt="Criptomonedas" class="w-full h-32 object-cover rounded-lg mb-4">
                    <span class="block text-blue-600 text-sm font-semibold mb-2">Finanzas</span>
                    <h3 class="text-xl font-semibold mb-2">Criptomonedas: ya hay 35 billeteras inscriptas ante la CNV como proveedoras</h3>
                    <div class="flex items-center mt-4">
                        <img src="img/carlospagni.avif" alt="Autor" class="w-8 h-8 rounded-full mr-2">
                        <div>
                            <p class="text-sm font-semibold">Tracey Wilson</p>
                            <p class="text-sm text-gray-600">4 de junio de 2024</p>
                        </div>
                    </div>
                </div>
                <!-- Fin del bloque de artículo -->

                <!-- Repetir este bloque para cada artículo -->
                <div class="bg-white p-4 rounded-lg shadow-md" onclick="window.location.href='./Publicacion.aspx?publiID=1'">
                    <img src="img/javier-adorni.jpg" alt="Politica" class="w-full h-32 object-cover rounded-lg mb-4">
                    <span class="block text-blue-600 text-sm font-semibold mb-2">Politica</span>
                    <h3 class="text-xl font-semibold mb-2">La contundente frase de Javier Milei sobre Nicolás Posse: "Ya es historia"</h3>
                    <div class="flex items-center mt-4">
                        <img src="img/carlospagni.avif" alt="Autor" class="w-8 h-8 rounded-full mr-2">
                        <div>
                            <p class="text-sm font-semibold">Carlos Pagni</p>
                            <p class="text-sm text-gray-600">4 de junio de 2024</p>
                        </div>
                    </div>
                </div>
                <!-- Fin del bloque de artículo -->

                <!-- Repetir este bloque para cada artículo -->
                <div class="bg-white p-4 rounded-lg shadow-md" onclick="window.location.href='./Publicacion.aspx?publiID=1'">
                    <img src="img/inversiones.jpg" alt="Criptomonedas" class="w-full h-32 object-cover rounded-lg mb-4">
                    <span class="block text-blue-600 text-sm font-semibold mb-2">Finanzas</span>
                    <h3 class="text-xl font-semibold mb-2">Renta variable: qué empresas y sectores recomienda tener en cartera la city</h3>
                    <div class="flex items-center mt-4">
                        <img src="img/carlospagni.avif" alt="Autor" class="w-8 h-8 rounded-full mr-2">
                        <div>
                            <p class="text-sm font-semibold">Carlos Pagni</p>
                            <p class="text-sm text-gray-600">4 de junio de 2024</p>
                        </div>
                    </div>
                </div>
                <!-- Fin del bloque de artículo -->

                <!-- Repetir este bloque para cada artículo -->
                <div class="bg-white p-4 rounded-lg shadow-md" onclick="window.location.href='./Publicacion.aspx?publiID=1'">
                    <img src="img/mbappe.jpg" alt="Deportes" class="w-full h-32 object-cover rounded-lg mb-4">
                    <span class="block text-blue-600 text-sm font-semibold mb-2">Deportes</span>
                    <h3 class="text-xl font-semibold mb-2">El contrato de Mbappé en el Real Madrid es impresionante</h3>
                    <div class="flex items-center mt-4">
                        <img src="img/carlospagni.avif" alt="Autor" class="w-8 h-8 rounded-full mr-2">
                        <div>
                            <p class="text-sm font-semibold">Carlos Pagni</p>
                            <p class="text-sm text-gray-600">4 de junio de 2024</p>
                        </div>
                    </div>
                </div>
                <!-- Fin del bloque de artículo -->

                <!-- Repetir este bloque para cada artículo -->
                <div class="bg-white p-4 rounded-lg shadow-md" onclick="window.location.href='./Publicacion.aspx?publiID=1'">
                    <img src="img/netflix-peliculas-7jpg.jpg" alt="Streaming" class="w-full h-32 object-cover rounded-lg mb-4">
                    <span class="block text-blue-600 text-sm font-semibold mb-2">Streaming</span>
                    <h3 class="text-xl font-semibold mb-2">Está en Netflix, tiene a Brad Pitt y está basada en un best seller</h3>
                    <div class="flex items-center mt-4">
                        <img src="img/carlospagni.avif" alt="Autor" class="w-8 h-8 rounded-full mr-2">
                        <div>
                            <p class="text-sm font-semibold">Carlos Pagni</p>
                            <p class="text-sm text-gray-600">4 de junio de 2024</p>
                        </div>
                    </div>
                </div>
                <!-- Fin del bloque de artículo -->

                <!-- Repetir este bloque para cada artículo -->
                <div class="bg-white p-4 rounded-lg shadow-md" onclick="window.location.href='./Publicacion.aspx?publiID=1'">
                    <img src="img/dolar.jpg" alt="Economia" class="w-full h-32 object-cover rounded-lg mb-4">
                    <span class="block text-blue-600 text-sm font-semibold mb-2">Economia</span>
                    <h3 class="text-xl font-semibold mb-2">Fuerte suba del dólar blue de los financieros y se amplía la brecha con el oficial</h3>
                    <div class="flex items-center mt-4">
                        <img src="img/carlospagni.avif" alt="Autor" class="w-8 h-8 rounded-full mr-2">
                        <div>
                            <p class="text-sm font-semibold">Carlos Pagni</p>
                            <p class="text-sm text-gray-600">4 de junio de 2024</p>
                        </div>
                    </div>
                </div>
                <!-- Fin del bloque de artículo -->
                 
                <!-- Repetir este bloque para cada artículo -->
                <div class="bg-white p-4 rounded-lg shadow-md" onclick="window.location.href='./Publicacion.aspx?publiID=1'">
                    <img src="img/apple.jpg" alt="Tecnologia" class="w-full h-32 object-cover rounded-lg mb-4">
                    <span class="block text-blue-600 text-sm font-semibold mb-2">Tecnología</span>
                    <h3 class="text-xl font-semibold mb-2">Apple quiere aprovechar las bondades de ChatGPT y firma un acuerdo con OpenAI para potenciar el futuro iPhone 16</h3>
                    <div class="flex items-center mt-4">
                        <img src="img/carlospagni.avif" alt="Autor" class="w-8 h-8 rounded-full mr-2">
                        <div>
                            <p class="text-sm font-semibold">Tracey Wilson</p>
                            <p class="text-sm text-gray-600">4 de junio de 2024</p>
                        </div>
                    </div>
                </div>
                <!-- Fin del bloque de artículo -->

                <!-- Repetir este bloque para cada artículo -->
                <div class="bg-white p-4 rounded-lg shadow-md" onclick="window.location.href='./Publicacion.aspx?publiID=1'">
                    <img src="img/beach.jpg" alt="Viajes" class="w-full h-32 object-cover rounded-lg mb-4">
                    <span class="block text-blue-600 text-sm font-semibold mb-2">Viajes</span>
                    <h3 class="text-xl font-semibold mb-2">Estas son las playas paradisíacas y los destinos invernales que corren riesgo de desaparición por el cambio climático</h3>
                    <div class="flex items-center mt-4">
                        <img src="img/tenembaum.jpg" alt="Autor" class="w-8 h-8 rounded-full mr-2">
                        <div>
                            <p class="text-sm font-semibold">Tracey Wilson</p>
                            <p class="text-sm text-gray-600">4 de junio de 2024</p>
                        </div>
                    </div>
                </div>
                <!-- Fin del bloque de artículo -->

                <!-- Repetir este bloque para cada artículo -->
                <div class="bg-white p-4 rounded-lg shadow-md" onclick="window.location.href='./Publicacion.aspx?publiID=1'">
                    <img src="img/sele-arg.jpg" alt="Deportes" class="w-full h-32 object-cover rounded-lg mb-4">
                    <span class="block text-blue-600 text-sm font-semibold mb-2">Deportes</span>
                    <h3 class="text-xl font-semibold mb-2">Copa América 2024: La Selección argentina, con Lionel Messi, tuvo su primer entrenamiento en Estados Unidos</h3>
                    <div class="flex items-center mt-4">
                        <img src="img/carlospagni.avif" alt="Autor" class="w-8 h-8 rounded-full mr-2">
                        <div>
                            <p class="text-sm font-semibold">Tracey Wilson</p>
                            <p class="text-sm text-gray-600">4 de junio de 2024</p>
                        </div>
                    </div>
                </div>
                <!-- Fin del bloque de artículo -->
                <!-- Repite el bloque de publicación para cada artículo según sea necesario -->
                <asp:Repeater ID="ArticlesRepeater" runat="server" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>
                    <div class="bg-white p-4 rounded-lg shadow-md" onclick="window.location.href='Publicacion.aspx?publiID=<%# Eval("publiID") %>'">
                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' class="w-full h-32 object-cover rounded-lg mb-4">
                        <span class="block text-blue-600 text-sm font-semibold mb-2"><%# Eval("Category") %></span>
                        <h3 class="text-xl font-semibold mb-2"><%# Eval("Title") %></h3>
                        <div class="flex items-center mt-4">
                            <img src='<%# Eval("AuthorImage") %>' alt="Autor" class="w-8 h-8 rounded-full mr-2">
                            <div>
                                <p class="text-sm font-semibold"><%# Eval("Author") %></p>
                                <p class="text-sm text-gray-600"><%# Eval("Date") %></p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Botón de cargar más -->
            <div class="flex justify-center mt-8">
                <button class="px-6 py-2 bg-gray-300 text-gray-600 rounded-full text-lg font-semibold">Cargar más</button>
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

    </form>

</body>

</html>
