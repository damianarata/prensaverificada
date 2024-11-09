using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrensaVerificada2.Assets
{
    public partial class Busqueda : System.Web.UI.Page
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
                CargarAutores();
                CargarCategoria();
            }
            Session["Index_Articles"] = null;
            Session["Autor_Articles"] = null;
            Session["autor_pages"] = null;
            Session["index_pages"] = null;
        }

        private void CargarAutores()
        {
            var autores = BLL.Autor.GetInstancia().RetreiveAll();
            foreach (var autor in autores)
            {
                AuthorDropDown.Items.Add(new ListItem(autor.Nombre, autor.AutorID.ToString()));
            }
        }

        private void CargarCategoria()
        {
            var categorias = BLL.Categoria.GetInstancia().RetreiveAll();
            foreach (var cat in categorias)
            {
                CategoriasDropDown.Items.Add(new ListItem(cat.Nombre, cat.CategoriaID.ToString()));
            }
        }

        private void LoadArticles(int skipCount = 0)
        {
            BLL.Bitacora.GetInstancia().RegistroBitacora(Convert.ToInt32(Session["usuario"]), 17);
            DateTime? startDateValue = string.IsNullOrEmpty(TextBox1.Text) ? (DateTime?)null : DateTime.Parse(TextBox1.Text);
            DateTime? endDateValue = string.IsNullOrEmpty(TextBox2.Text) ? (DateTime?)null : DateTime.Parse(TextBox2.Text);
            string selectedAuthor = AuthorDropDown.SelectedValue;
            string selectedCategory = CategoriasDropDown.SelectedValue;
            string titleFilter = TitFilterTextBox.Text;
            string contentFilter = CamFilterTextBox.Text;

            var articles = Session["Busqueda_Articles"] as List<dynamic> ?? new List<dynamic>();

            var publicaciones = BLL.Publicacion.GetInstancia().RetrievePublicacionesConFiltros(
                startDateValue, endDateValue, selectedAuthor, selectedCategory, titleFilter, contentFilter, skipCount);
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
            CargarButton.Visible = publicaciones.Count >= 6;

            // Guardar en sesión y actualizar el Repeater
            Session["Busqueda_Articles"] = articles;
            ArticlesRepeater.DataSource = articles;
            ArticlesRepeater.DataBind();
        }


        protected void CargarMasButton_Click(object sender, EventArgs e)
        {
            index_pages += 6;
            LoadArticles(index_pages);
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            Session.Remove("Busqueda_Articles");
            LoadArticles(index_pages);
        }

        protected void BorrarButton_Click(object sender, EventArgs e)
        {
            Session.Remove("Busqueda_Articles");
            Session.Remove("index_pages");
            index_pages = 0;
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            AuthorDropDown.SelectedIndex = 0;
            CategoriasDropDown.SelectedIndex = 0;
            TitFilterTextBox.Text = string.Empty;
            CamFilterTextBox.Text = string.Empty;
            ArticlesRepeater.DataSource = null;
            ArticlesRepeater.DataBind();
        }
    }

}