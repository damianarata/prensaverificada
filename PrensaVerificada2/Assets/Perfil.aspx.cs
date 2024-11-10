using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

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
                    Response.Redirect("Login.aspx?redirect=true");
                }
            }
            Session["Index_Articles"] = null;
            Session["Autor_Articles"] = null;
            Session["autor_pages"] = null;
            Session["index_pages"] = null;
            if (!IsPostBack)
            {
                LoadPerfilAutor();
            }
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
            autor.Foto = imgPerfil.ImageUrl;

            if (FileUpload1.HasFile)
            {
                try
                {
                    // Verificar el tipo de archivo
                    string extension = Path.GetExtension(FileUpload1.FileName).ToLower();
                    string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };

                    if (Array.Exists(allowedExtensions, ext => ext == extension))
                    {
                        // Guardar la imagen en una carpeta
                        string filePath = "~/Assets/Uploads/" + Path.GetFileName(FileUpload1.FileName);
                        string serverPath = Server.MapPath(filePath);

                        // Guardar el archivo en la ubicación del servidor
                        FileUpload1.SaveAs(serverPath);

                        // Asignar la URL de la imagen al objeto autor
                        autor.Foto = "Uploads/" + Path.GetFileName(FileUpload1.FileName);

                        // Mostrar la imagen cargada en imgPreview
                        imgPerfil.ImageUrl = filePath;
                        lblMensaje.Text = "Imagen cargada con éxito.";
                        lblMensaje.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblMensaje.Text = "Solo se permiten archivos JPG, JPEG, PNG o GIF.";
                        lblMensaje.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    lblMensaje.Text = "Error: " + ex.Message;
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                }
            }

            int autorId = Convert.ToInt32(Session["autorId"]);
            int usuario = Convert.ToInt32(Session["usuario"]);
            BLL.Bitacora.GetInstancia().RegistroBitacora(usuario, 2);

            if (autorId != 0)
            {
                autor.AutorID = autorId;
                autor.UsuarioID = usuario;
                BLL.Autor.GetInstancia().Update(autor);
                string script = "<script type='text/javascript'>alert('Perfil actualizado');</script>";
                SuccessMessageLiteral.Text = script;
            }
           else
            {
                autor.UsuarioID = usuario;
                BLL.Autor.GetInstancia().Create(autor);
                string script = "<script type='text/javascript'>alert('Nuevo perfil creado');" +
                                    "window.location.href = 'Autores.aspx';</script>";
                SuccessMessageLiteral.Text = script;
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