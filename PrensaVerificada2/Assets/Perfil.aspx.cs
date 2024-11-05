using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrensaVerificada2.Assets
{
    public partial class Perfil : System.Web.UI.Page
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
            Session["Index_Articles"] = null;
            Session["Autor_Articles"] = null;
            Session["autor_pages"] = null;
            Session["index_pages"] = null;
            LoadPerfilAutor();
        }

        protected void LoadPerfilAutor()
        {
            try
            {
                int autorId = Convert.ToInt32(Session["autorId"]);

                var autor = BLL.Autor.GetInstancia().RetrieveAutor(autorId);

                if (autorId != 0)
                {
                    if (!string.IsNullOrEmpty(autor.Foto))
                    {
                        imgPerfil.ImageUrl = autor.Foto;
                    }

                    NombreTextBox.Text = autor.Nombre;
                    BiografiaTextBox.Text = autor.Biografia;
                    TwitterTextBox.Text = autor.Twitter ?? string.Empty;
                    InstagramTextBox.Text = autor.Instagram ?? string.Empty;
                    MedioTextBox.Text = autor.Medio ?? string.Empty;
                    LinkedinTextBox.Text = autor.Linkedin ?? string.Empty;
                    FacebookTextBox.Text = autor.Facebook ?? string.Empty;
                    YoutubeTextBox.Text = autor.Youtube ?? string.Empty;
                }
                else
                {
                    int usuario = Convert.ToInt32(Session["usuario"]);
                    var user = BLL.Usuario.GetInstancia().RetrieveUser(new BE.Usuario { UsuarioID = usuario }) ;
                    NombreTextBox.Text = user.Nombre;
                }
            }
            catch (Exception ex)
            {
                Response.Write($"Error: {ex.Message}");
            }
        }

        protected void btnGuardar(object sender, EventArgs e)
        {
            BE.Autor autor = new BE.Autor();

            autor.Nombre = NombreTextBox.Text.Trim();
            autor.Biografia = BiografiaTextBox.Text.Trim();
            autor.Twitter = string.IsNullOrEmpty(TwitterTextBox.Text.Trim()) ? null : TwitterTextBox.Text.Trim();
            autor.Instagram = string.IsNullOrEmpty(InstagramTextBox.Text.Trim()) ? null : InstagramTextBox.Text.Trim();
            autor.Medio = string.IsNullOrEmpty(MedioTextBox.Text.Trim()) ? null : MedioTextBox.Text.Trim();
            autor.Linkedin = string.IsNullOrEmpty(LinkedinTextBox.Text.Trim()) ? null : LinkedinTextBox.Text.Trim();
            autor.Facebook = string.IsNullOrEmpty(FacebookTextBox.Text.Trim()) ? null : FacebookTextBox.Text.Trim();
            autor.Youtube = string.IsNullOrEmpty(YoutubeTextBox.Text.Trim()) ? null : YoutubeTextBox.Text.Trim();

            if (FileUpload1.HasFile)
            {
                autor.Foto = imgPerfil.ImageUrl;
            }
            int autorId = Convert.ToInt32(Session["autorId"]);
            int usuario = Convert.ToInt32(Session["usuario"]);

            if (autorId != 0)
            {
                BLL.Autor.GetInstancia().Update(autor);
            }
           else
            {
                autor.UsuarioID = usuario;
                BLL.Autor.GetInstancia().Create(autor);
            }
        }

        protected void btnCancel(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void btnChange(object sender, EventArgs e)
        {
            Response.Redirect("NewPass.aspx");
        }
    }
}