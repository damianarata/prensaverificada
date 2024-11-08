using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrensaVerificada2.Assets
{
    public partial class Categorias : System.Web.UI.Page
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
            LoadCategorias();
            Session["Index_Articles"] = null;
            Session["Autor_Articles"] = null;
            Session["autor_pages"] = null;
            Session["index_pages"] = null;
        }

        private void LoadCategorias()
        {
            BLL.Bitacora.GetInstancia().RegistroBitacora(Convert.ToInt32(Session["usuario"]), 18);
            var categorias = BLL.Categoria.GetInstancia().Listar();
            var topArticles = new List<dynamic>();

            foreach (var cat in categorias)
            {
                topArticles.Add(new
                {
                    categoriaID = cat.CategoriaID,
                    ImageUrl = cat.Imagen,
                    Title = cat.Nombre
                });
            }

            CategoriaRepeater.DataSource = topArticles;
            CategoriaRepeater.DataBind();
        }

    }
}