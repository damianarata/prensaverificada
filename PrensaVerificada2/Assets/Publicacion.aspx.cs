using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
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
                string publiID = Request.QueryString["publiID"];
                if (string.IsNullOrEmpty(publiID))
                {
                    throw new ArgumentException("El parámetro 'publiID' no está presente en la Query String.");
                }

                BE.Publicacion Publi = BLL.Publicacion.GetInstancia().RetrievePublicacion(publiID);
                BE.Autor Autor = BLL.Autor.GetInstancia().RetrieveAutor(Publi.AutorID);

                titulo.InnerText = Publi.Titulo;
                autor.InnerText = Autor.Nombre;
                subtitulo.InnerText = Publi.Subtitulo;
                img.Src = Publi.Imagen;
                img.Alt = Publi.Titulo;

                int selectedFontSize = Convert.ToInt32(BLL.Publicacion.GetInstancia().GetTipoTamanoNombre(Publi.IdTipoTamano));
                string selectedFont = BLL.Publicacion.GetInstancia().GetTipoLetraNombre(Publi.IdTipoLetra);

                updateFront(Publi.IdTipoLetra, Publi.IdTipoTamano);
                DisplayParagraphs(Publi, selectedFontSize, selectedFont);
            }
            catch (Exception ex)
            {
                Response.Write($"Error: {ex.Message}");
            }
            Session["Index_Articles"] = null;
            Session["Autor_Articles"] = null;
            Session["autor_pages"] = null;
            Session["index_pages"] = null;
        }



        protected void VolverBtn_Click(object sender, EventArgs e)
        {
            if (Request.UrlReferrer != null)
            {
                Response.Redirect(Request.UrlReferrer.ToString());
            }
            else
            {
                Response.Redirect("Index.aspx");
            }
        }

        protected void updateFront(int letra, int tam)
        {
            int selectedFontSize = Convert.ToInt32(BLL.Publicacion.GetInstancia().GetTipoTamanoNombre(tam));
            string selectedFont = BLL.Publicacion.GetInstancia().GetTipoLetraNombre(letra);

            titulo.Style["font-size"] = $"{selectedFontSize}pt";
            titulo.Style["font-family"] = selectedFont;
            autor.Style["font-size"] = $"{selectedFontSize}pt";
            autor.Style["font-family"] = selectedFont;
            subtitulo.Style["font-size"] = $"{selectedFontSize}pt";
            subtitulo.Style["font-family"] = selectedFont;

            foreach (Control control in phTextBoxes.Controls)
            {
                if (control is Label label)
                {
                    label.Style["font-size"] = $"{selectedFontSize}pt";
                    label.Style["font-family"] = selectedFont;
                }
            }
        }


        private void DisplayParagraphs(BE.Publicacion publi, int selectedFontSize, string selectedFont)
        {
            phTextBoxes.Controls.Clear(); 
            HtmlGenericControl paragraphContainer = new HtmlGenericControl("div");
            paragraphContainer.Attributes.Add("class", "flex space-x-4");
            string[] paragraphs = publi.Contenido.Split(new[] { "\n\n" }, StringSplitOptions.None);

            for (int i = 0; i < paragraphs.Length && i < 3; i++)
            {
                HtmlGenericControl paragraphDiv = new HtmlGenericControl("div")
                {
                    ID = $"divParagraph{i + 1}",
                    InnerText = paragraphs[i],
                };

                paragraphDiv.Attributes.Add("class", "flex-1 p-2");
                paragraphDiv.Style["font-size"] = $"{selectedFontSize}pt";
                paragraphDiv.Style["font-family"] = selectedFont; 
                paragraphContainer.Controls.Add(paragraphDiv);
            }
            phTextBoxes.Controls.Add(paragraphContainer);
        }
    }
}
