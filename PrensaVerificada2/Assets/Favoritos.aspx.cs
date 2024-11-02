using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrensaVerificada2.Assets
{
    public partial class Favoritos : System.Web.UI.Page
    {
        private int fav_pages
        {
            get
            {
                return (int)(Session["fav_pages"] ?? 0);
            }
            set
            {
                Session["fav_pages"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (BLL.Usuario.GetInstancia().Restriction() == true)
            {
                if (Session["usuario"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
            Session["Index_Articles"] = null;
            Session["Autor_Articles"] = null;
            Session["autor_pages"] = null;
            Session["index_pages"] = null;
            LoadArticles();
        }

        private void LoadArticles(int skipCount = 0)
        {
            var publicaciones = BLL.Publicacion.GetInstancia().RetrieveFavs(new BE.Usuario { UsuarioID = Convert.ToInt32(Session["usuario"]) }, skipCount);
            var articles = new List<dynamic>();

            if (Session["Autor_Articles"] != null)
            {
                articles = (List<dynamic>)Session["Autor_Articles"];
            }

            foreach (var publi in publicaciones)
            {
                BE.Autor autor = BLL.Autor.GetInstancia().RetrieveAutor(publi.AutorID);
                string categoriaNombre = BLL.Categoria.GetInstancia().GetCategoriaNombre(publi.CategoriaID);

                articles.Add(new
                {
                    publiID = publi.PublicacionID,
                    ImageUrl = publi.Imagen,
                    Category = categoriaNombre,
                    Title = publi.Titulo,
                    Author = autor.Nombre,
                    AuthorImage = autor.Foto,
                    Date = publi.FechaPublicacion.ToString("dd 'de' MMMM 'de' yyyy")
                });
            }

            Session["Autor_Articles"] = articles;

            ArticlesRepeater.DataSource = articles;
            ArticlesRepeater.DataBind();
        }

        protected void CargarMasButton_Click(object sender, EventArgs e)
        {
            fav_pages += 6;
            LoadArticles(fav_pages);
        }
    }
}