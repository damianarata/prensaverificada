using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrensaVerificada2.Assets
{
    public partial class MisPublicaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["usuario"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}
            LoadArticles();
        }
        private void LoadArticles()
        {
            int autor1 = 1;
            List<BE.Publicacion> publicaciones = BLL.Publicacion.GetInstancia().RetrievePublicacionesPorAutor(autor1);
            BE.Autor Autor = BLL.Autor.GetInstancia().RetrieveAutor(autor1);

            var articles = publicaciones.Select(publi => {
                string estadoColor;

                switch (publi.EstadoID)
                {
                    case 1:
                        estadoColor = "bg-green-100 text-green-800";  // Verde
                        break;
                    case 2:
                        estadoColor = "bg-yellow-100 text-yellow-800";  // Amarillo
                        break;
                    case 3:
                        estadoColor = "bg-gray-100 text-gray-800";    // Gris
                        break;
                    case 4:
                        estadoColor = "bg-red-100 text-red-800";      // Rojo
                        break;
                    default:
                        estadoColor = "bg-gray-100 text-gray-800";    // Predeterminado: Gris
                        break;
                }

                return new
                {
                    AutorNombre = Autor.Nombre,
                    AutorImagen = Autor.Foto,
                    Titulo = publi.Titulo,
                    FechaPublicacion = publi.FechaPublicacion,
                    CategoriaNombre = BLL.Categoria.GetInstancia().GetCategoriaNombre(publi.CategoriaID),
                    EstadoNombre = BLL.Publicacion.GetInstancia().GetEstadoNombre(publi.EstadoID),
                    EstadoColor = estadoColor,
                    PublicacionID = publi.PublicacionID
                };
            }).ToList();

            ArticlesRepeater.DataSource = articles;
            ArticlesRepeater.DataBind();
        }



        protected void ArticlesRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            // Obtener el ID de la publicación desde el CommandArgument
            int publicacionID = int.Parse(e.CommandArgument.ToString());

            switch (e.CommandName)
            {
                case "Edit":
                    // Lógica para continuar editando la publicación
                    EditarPublicacion(publicacionID);
                    break;

                case "Suspend":
                    // Lógica para suspender la publicación
                    SuspenderPublicacion(publicacionID);
                    break;

                case "Delete":
                    // Lógica para eliminar la publicación
                    EliminarPublicacion(publicacionID);
                    break;

                case "ShowMenu":
                    // Aquí podrías manejar el despliegue del menú con JavaScript o CSS
                    MostrarMenu(e.Item);
                    break;
            }
        }

        private void EditarPublicacion(int publicacionID)
        {
            // Lógica para editar la publicación
        }

        private void SuspenderPublicacion(int publicacionID)
        {
            // Lógica para suspender la publicación
        }

        private void EliminarPublicacion(int publicacionID)
        {
            // Lógica para eliminar la publicación
        }

        private void MostrarMenu(RepeaterItem item)
        {
            // Aquí puedes manipular el HTML para mostrar/ocultar el menú. Alternativamente,
            // puedes hacer que el botón "ShowMenu" dispare un evento JavaScript que muestre el menú.
        }
    }
}