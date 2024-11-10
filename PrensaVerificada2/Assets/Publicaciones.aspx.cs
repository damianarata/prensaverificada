using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace PrensaVerificada2.Assets
{
    public partial class Publicaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (BLL.Usuario.GetInstancia().Restriction() == true)
            {
                if (Session["usuario"] == null)
                {
                    Response.Redirect("Login.aspx?redirect=true");
                }
            }
            LoadTopReadArticles();
            LoadLastArticles();
            LoadTopAutores();
            LoadCategorias();
            LoadFavoritos();
            Session["Index_Articles"] = null;
            Session["Autor_Articles"] = null;
            Session["autor_pages"] = null;
            Session["index_pages"] = null;
            BLL.Bitacora.GetInstancia().RegistroBitacora(Convert.ToInt32(Session["usuario"]), 3);
        }

        private void LoadTopReadArticles()
        {
            var publicaciones = BLL.Publicacion.GetInstancia().RetrieveTop();
            var topArticles = new List<dynamic>();

            foreach (var publi in publicaciones)
            {
                string titulo = publi.Titulo;
                string imageUrl = publi.Imagen;
                int publiID = publi.PublicacionID;
                int contador = publi.ContadorTotal;

                topArticles.Add(new
                {
                    publiID = publiID,
                    ImageUrl = imageUrl,
                    Title = titulo,
                    Visitas = contador
                });
            }

            TopArticlesRepeater.DataSource = topArticles;
            TopArticlesRepeater.DataBind();
        }

        private void LoadTopAutores()
        {
            var topArticles = new List<dynamic>();
            DataTable dt = BLL.Autor.GetInstancia().RetrieveTop();
            foreach (DataRow row in dt.Rows)
            {
                string titulo = row["nombre"].ToString();
                string imageUrl = row["foto"].ToString();
                int autorID = Convert.ToInt32(row["autorid"]);
                int contador = Convert.ToInt32(row["total_lecturas"]);

                topArticles.Add(new
                {
                    autorID = autorID,
                    ImageUrl = imageUrl,
                    Title = titulo,
                    Visitas = contador
                });
            }

            RepeaterAutores.DataSource = topArticles;
            RepeaterAutores.DataBind();
        }

        private void LoadLastArticles()
        {
            var publicaciones = BLL.Publicacion.GetInstancia().RetrieveLatestPublicaciones();
            var topArticles = new List<dynamic>();
            int count = 0;

            foreach (var publi in publicaciones)
            {
                if (count < 5)
                {
                    string titulo = publi.Titulo;
                    string imageUrl = publi.Imagen;
                    int publiID = publi.PublicacionID;
                    int contador = publi.ContadorTotal;

                    topArticles.Add(new
                    {
                        publiID = publiID,
                        ImageUrl = imageUrl,
                        Title = titulo,
                        Visitas = contador
                    });
                    count++;
                }
                else
                {
                    break;
                }
            }

            RepeaterUltimas.DataSource = topArticles;
            RepeaterUltimas.DataBind();
        }

        private void LoadCategorias()
        {
            var topArticles = new List<dynamic>();
            DataTable dt = BLL.Categoria.GetInstancia().RetrieveTop();
            foreach (DataRow row in dt.Rows)
            {
                string titulo = row["nombre"].ToString();
                string imageUrl = row["imagen"].ToString();
                int categoriaID = Convert.ToInt32(row["categoriaid"]);
                int contador = Convert.ToInt32(row["total_lecturas"]);

                topArticles.Add(new
                {
                    categoriaID = categoriaID,
                    ImageUrl = imageUrl,
                    Title = titulo,
                    Visitas = contador
                });
            }

            RepeaterCategoria.DataSource = topArticles;
            RepeaterCategoria.DataBind();
        }

        private void LoadFavoritos()
        {
            var topArticles = new List<dynamic>();
            DataTable dt = BLL.Favorito.GetInstancia().RetrieveTop();
            foreach (DataRow row in dt.Rows)
            {
                string titulo = row["titulo"].ToString();
                string imageUrl = row["imagen"].ToString();
                int publiID = Convert.ToInt32(row["publicacionid"]);
                int contador = Convert.ToInt32(row["total_favoritos"]);

                topArticles.Add(new
                {
                    publiID = publiID,
                    ImageUrl = imageUrl,
                    Title = titulo,
                    Visitas = contador
                });
            }

            RepeaterFavoritos.DataSource = topArticles;
            RepeaterFavoritos.DataBind();
        }

    }
}