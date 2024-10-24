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
        private int index_pages
        {
            get
            {
                return (int)(Session["index_pages"] ?? 0);
            }
            set
            {
                Session["index_pages"] = value;
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
            if (!IsPostBack)
            {
                LoadArticles();
            }
            Session["Autor_Articles"] = null;
            Session["autor_pages"] = null;
        }

        private void LoadArticles(int skipCount = 0)
        {
            var articles = Session["Index_Articles"] as List<dynamic> ?? new List<dynamic>();
            var publicaciones = BLL.Publicacion.GetInstancia().RetrieveLatestPublicaciones(skipCount);

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

            Session["Index_Articles"] = articles;
            ArticlesRepeater.DataSource = articles;
            ArticlesRepeater.DataBind();
        }

        protected void CargarMasButton_Click(object sender, EventArgs e)
        {
            index_pages += 6;
            LoadArticles(index_pages);
        }
    }
}