using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace PrensaVerificada2.Assets
{
    public partial class Publicacion : System.Web.UI.Page
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
            try
            {
                //// Verificar si el parámetro publiID está presente en la Query String
                string publiID = Request.QueryString["publiID"];
                if (string.IsNullOrEmpty(publiID))
                {
                    throw new ArgumentException("El parámetro 'publiID' no está presente en la Query String.");
                }

                // Configurar los controles con los valores obtenidos
                //string publiID = "1";
                BE.Publicacion Publi = BLL.Publicacion.GetInstancia().RetrievePublicacion(publiID);
                BE.Autor Autor = BLL.Autor.GetInstancia().RetrieveAutor(Publi.AutorID);
                titulo.InnerText = Publi.Titulo;
                autor.InnerText = Autor.Nombre;
                img.Src = Publi.Imagen;
                img.Alt = Publi.Titulo;
                texto.InnerText = Publi.Contenido;
                updateFront(Publi.IdTipoLetra,Publi.IdTipoTamano);
            }
            catch (Exception ex)
            {
                // Manejo de errores: mostrar un mensaje o redirigir a otra página
                // Puedes también registrar el error si es necesario
                Response.Write($"Error: {ex.Message}");
                // Redirigir a una página de error o a la página principal
                // Response.Redirect("ErrorPage.aspx");
            }
        }


        protected void VolverBtn_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "GoBack", "window.history.back();", true);
        }

        protected void updateFront(int letra, int tam)
        {
            int selectedFontSize = Convert.ToInt32(BLL.Publicacion.GetInstancia().GetTipoTamanoNombre(tam));
            string selectedFont = BLL.Publicacion.GetInstancia().GetTipoLetraNombre(letra);

            // Aplicar estilos usando CSS
            titulo.Style["font-size"] = $"{selectedFontSize}pt";
            titulo.Style["font-family"] = selectedFont;

            texto.Style["font-size"] = $"{selectedFontSize}pt";
            texto.Style["font-family"] = selectedFont;
        }

    }
}