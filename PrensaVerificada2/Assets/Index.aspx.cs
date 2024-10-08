using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrensaVerificada2.Assets
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (BLL.Usuario.GetInstancia().Restriction() == true)
            {
                if (Session["usuario"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
            LoadFeaturedArticle();
            LoadArticles();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        private void LoadFeaturedArticle()
        {
            // Datos del artículo destacado (pueden venir de una base de datos)
            //featuredImage.Attributes["src"] = "./img/diputados.jpg";
            //featuredCategory.InnerText = "Política";
            //featuredTitle.InnerText = "Diputados se suben el sueldo y pasarán a cobrar más de $2,2 millones";
            //featuredAuthorImage.Attributes["src"] = "img/alconada.jpg";
            //featuredAuthorName.InnerText = "Hugo Alconada";
            //featuredDate.InnerText = "4 de junio 2024";
        }

        private void LoadArticles(int skipCount = 0)
        {
            // Obtiene las últimas 6 publicaciones con estadoid = 1, omitiendo 'skipCount' publicaciones si es necesario.
            var publicaciones = BLL.Publicacion.GetInstancia().RetrieveLatestPublicaciones(skipCount);

            // Crea una lista dinámica para almacenar los artículos que se mostrarán en el Repeater.
            var articles = new List<dynamic>();

            foreach (var publi in publicaciones)
            {
                // Obtiene el autor de la publicación.
                BE.Autor autor = BLL.Autor.GetInstancia().RetrieveAutor(publi.AutorID);
                string categoriaNombre = BLL.Categoria.GetInstancia().GetCategoriaNombre(publi.CategoriaID);

                // Crea un nuevo objeto dinámico para representar el artículo y agregarlo a la lista.
                articles.Add(new
                {
                    publiID = publi.PublicacionID,
                    ImageUrl = publi.Imagen,          // Ruta de la imagen
                    Category = categoriaNombre,  // Nombre de la categoría
                    Title = publi.Titulo,             // Título de la publicación
                    Author = autor.Nombre,            // Nombre del autor
                    AuthorImage = autor.Foto,       // Imagen del autor (si existe)
                    Date = publi.FechaPublicacion.ToString("dd 'de' MMMM 'de' yyyy")  // Fecha de publicación en formato personalizado
                });
            }

            // Asigna la lista de artículos al Repeater.
            ArticlesRepeater.DataSource = articles;
            ArticlesRepeater.DataBind();
        }

    }
}