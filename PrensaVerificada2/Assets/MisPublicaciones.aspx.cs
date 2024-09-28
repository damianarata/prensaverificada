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

            var articles = publicaciones.Select(publi => new
            {
                AutorNombre = Autor.Nombre, 
                AutorImagen = Autor.Foto, 
                Titulo = publi.Titulo,
                FechaPublicacion = publi.FechaPublicacion,
                CategoriaNombre = BLL.Categoria.GetInstancia().GetCategoriaNombre(publi.CategoriaID),
                EstadoNombre = BLL.Publicacion.GetInstancia().GetEstadoNombre(publi.EstadoID),
                EstadoColor = publi.EstadoID == 1 ? "bg-red-100 text-red-800" : "bg-green-100 text-green-800" // Ajustar según tu lógica
            }).ToList();

            ArticlesRepeater.DataSource = articles;
            ArticlesRepeater.DataBind();
        }
    }
}