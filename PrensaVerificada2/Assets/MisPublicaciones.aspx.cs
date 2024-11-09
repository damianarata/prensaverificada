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
        private int mispublis_page
        {
            get
            {
                if (Session["mispublis_pages"] is int page)
                {
                    return page;
                }
                else
                {
                    return 0; // Valor predeterminado si no es un int
                }
            }
            set
            {
                Session["mispublis_pages"] = value;
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
            if (Convert.ToInt32(Session["autorId"]) != 0)
            {
                alertaDiv.Visible = false;
            }
            if (!IsPostBack)
            {
                Session.Remove("mispublis_pages");
                LoadArticles();
            }
            Session["Index_Articles"] = null;
            Session["Autor_Articles"] = null;
            Session["autor_pages"] = null;
            Session["index_pages"] = null;
        }
        private void LoadArticles()
        {
            try
            {
                int autor1 = Convert.ToInt32(Session["autorId"]);
                List<BE.Publicacion> publicaciones = BLL.Publicacion.GetInstancia().RetrievePublicacionesPorAutor(autor1, mispublis_page);
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
            catch (Exception ex)
            {
                // Manejo de errores (opcional)
            }

        }



        protected void ArticlesRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int publicacionID = int.Parse(e.CommandArgument.ToString());

            switch (e.CommandName)
            {
                case "Continuar":
                    BLL.Bitacora.GetInstancia().RegistroBitacora(Convert.ToInt32(Session["usuario"]), 19, string.Format("{0} EN EDITOR", publicacionID.ToString()));
                    EditarPublicacion(publicacionID);
                    break;

                case "Pausar":
                    BLL.Bitacora.GetInstancia().RegistroBitacora(Convert.ToInt32(Session["usuario"]), 19, string.Format("{0} PAUSADA",publicacionID.ToString()));
                    SuspenderPublicacion(publicacionID);
                    break;

                case "Delete":
                    BLL.Bitacora.GetInstancia().RegistroBitacora(Convert.ToInt32(Session["usuario"]), 19, string.Format("{0} ELIMINADA", publicacionID.ToString()));
                    EliminarPublicacion(publicacionID);
                    break;
            }
        }

        private void EditarPublicacion(int publicacionID)
        {
            // Redirigir a la página de edición pasando el ID de la publicación en la QueryString
            Response.Redirect($"Editor.aspx?publiID={publicacionID}");
        }

        private void SuspenderPublicacion(int publicacionID)
        {
            BE.Publicacion Publi = BLL.Publicacion.GetInstancia().RetrievePublicacion(publicacionID.ToString());
            Publi.EstadoID = 2;
            BLL.Publicacion.GetInstancia().Update(Publi);
            Response.Redirect($"MisPublicaciones.aspx");
        }

        private void EliminarPublicacion(int publicacionID)
        {
            BE.Publicacion Publi = BLL.Publicacion.GetInstancia().RetrievePublicacion(publicacionID.ToString());
            BLL.Publicacion.GetInstancia().Delete(Publi);
            Response.Redirect($"MisPublicaciones.aspx");
        }

        protected void SiguienteButton_Click(object sender, EventArgs e)
        {
            mispublis_page += 20;
            Session["mispublis_pages"] = mispublis_page.ToString();
            LoadArticles();
        }

        protected void VolverButton_Click(object sender, EventArgs e)
        {
            if (mispublis_page >= 20)
            {
                mispublis_page -= 20;
                Session["mispublis_pages"] = mispublis_page.ToString();
                LoadArticles();
            }
        }
    }
}