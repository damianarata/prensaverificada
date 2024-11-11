using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrensaVerificada2.Assets
{
    public partial class Autor : System.Web.UI.Page
    {
        int autorid;
        private int autor_pages
        {
            get
            {
                return (int)(Session["autor_pages"] ?? 0);
            }
            set
            {
                Session["autor_pages"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (BLL.Usuario.GetInstancia().Restriction() == true)
            {
                if (Session["usuario"] == null)
                {
                    Response.Redirect("Login.aspx?redirect=true");
                }
            }

            try
            {
                if (string.IsNullOrEmpty(Request.QueryString["autorID"]))
                {
                    throw new ArgumentException("El parámetro 'autorID' no está presente en la Query String.");
                }
                else
                {
                    autorid = Convert.ToInt32(Request.QueryString["autorID"]);

                    if (!IsPostBack)
                    {
                        LoadAutor();
                        LoadArticles();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"Error: {ex.Message}");
            }
            Session["Index_Articles"] = null;
            Session["index_pages"] = null;
        }


        private void LoadAutor()
        {
            var topArticles = new List<dynamic>();
            var autor = BLL.Autor.GetInstancia().RetrieveAutor(autorid);
            BLL.Bitacora.GetInstancia().RegistroBitacora(Convert.ToInt32(Session["usuario"]), 15, autor.AutorID.ToString());
            topArticles.Add(new
            {
                autorID = autor.AutorID,
                ImageUrl = autor.Foto,
                Nombre = autor.Nombre,
                Medio = autor.Medio,
                Descripcion = autor.Biografia,
                TwitterUrl = autor.Twitter,
                InstagramUrl = autor.Instagram,
                FacebookUrl = autor.Facebook,
                LinkedInUrl = autor.Linkedin,
                YouTubeUrl = autor.Youtube,
            });
            AuthorDetailRepeater.DataSource = topArticles;
            AuthorDetailRepeater.DataBind();
        }

        private void LoadArticles(int skipCount = 0)
        {
            var publicaciones = BLL.Publicacion.GetInstancia().RetrievePublicacionesPorAutorPublicadas(autorid, skipCount);
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
            ButtonNext.Visible = publicaciones.Count >= 6;

            Session["Autor_Articles"] = articles;

            ArticlesRepeater.DataSource = articles;
            ArticlesRepeater.DataBind();
        }

        protected void CargarMasButton_Click(object sender, EventArgs e)
        {
            autor_pages += 6;
            LoadArticles(autor_pages);
        }
    }
}