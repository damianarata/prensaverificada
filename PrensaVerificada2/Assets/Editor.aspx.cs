using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace PrensaVerificada2.Assets
{
    public partial class Editor : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                try
                {
                    cargarpubli();
                    int selectedParagraphs = ddlNumParrafos.SelectedValue != null ? int.Parse(ddlNumParrafos.SelectedValue) : 1;
                    UpdateParagraphTextBoxes(selectedParagraphs);
                }
                catch (Exception ex)
                {
                    Response.Write($"Error: {ex.Message}");
                }
            }
            if (Convert.ToInt32(Session["autorId"]) != 0)
            {
                alertaDiv.Visible = false;
            }
            Session["Index_Articles"] = null;
            Session["Autor_Articles"] = null;
            Session["autor_pages"] = null;
            Session["index_pages"] = null;
        }

        private void UpdateParagraphTextBoxes(int numParagraphs)
        {
            // Limpiar cualquier TextBox previamente generado
            phTextBoxes.Controls.Clear();

            for (int i = 1; i <= numParagraphs; i++)
            {
                TextBox txtParagraph = new TextBox
                {
                    ID = $"txtParagraph{i}",
                    TextMode = TextBoxMode.MultiLine,
                    CssClass = "mt-1 block w-full border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 p-2",
                    Rows = 5,
                    Text = $"Este es el párrafo {i}. Puedes editar este contenido."
                };

                // Agregar el TextBox al PlaceHolder
                phTextBoxes.Controls.Add(txtParagraph);
            }
        }




        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            cargar(3);
        }

        protected void btnPublicar_Click(object sender, EventArgs e)
        {
            cargar(1);
        }

        protected void cargarpubli()
        {
            string publiID = Request.QueryString["publiID"];

            if (string.IsNullOrEmpty(publiID))
            {
                // Manejar el caso en que no hay publiID
            }
            else
            {
                BE.Publicacion Publi = BLL.Publicacion.GetInstancia().RetrievePublicacion(publiID);
                BE.Autor Autor = BLL.Autor.GetInstancia().RetrieveAutor(Publi.AutorID);

                txtTitulo.Text = Publi.Titulo;
                txtSubtitulo.Text = Publi.Subtitulo; 

                string[] parrafos = Publi.Contenido.Split(new[] { Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries);
                int parrafosCount = Publi.Parrafos;

                for (int i = 0; i < parrafosCount; i++)
                {
                    if (i < parrafos.Length)
                    {
                        switch (i)
                        {
                            case 0:
                                txtParagraph1.Text = parrafos[i];
                                break;
                            case 1:
                                txtParagraph2.Text = parrafos[i];
                                break;
                            case 2:
                                txtParagraph3.Text = parrafos[i];
                                break;
                        }
                    }
                }

                ddlCategoria.SelectedValue = Publi.CategoriaID.ToString();
                imgPreview.ImageUrl = Publi.Imagen;
                ddlFontFamily.SelectedValue = Publi.IdTipoLetra.ToString();
                ddlFontSize.SelectedValue = Publi.IdTipoTamano.ToString();
            }
        }


        protected void cargar(int status)
        {
            try
            {
                string titulo = txtTitulo.Text;
                string subtitulo = txtSubtitulo.Text;
                string contenido = string.Empty;

                if (!string.IsNullOrEmpty(txtParagraph1.Text))
                {
                    contenido += txtParagraph1.Text.Trim();
                }

                if (!string.IsNullOrEmpty(txtParagraph2.Text))
                {
                    contenido += (contenido.Length > 0 ? "\n\n" : "") + txtParagraph2.Text.Trim();
                }

                if (!string.IsNullOrEmpty(txtParagraph3.Text))
                {
                    contenido += (contenido.Length > 0 ? "\n\n" : "") + txtParagraph3.Text.Trim();
                }

                string imagenSeleccionada = imgPreview.ImageUrl ?? string.Empty;
                int categoriaID = Convert.ToInt32(ddlCategoria.SelectedValue);

                BE.Publicacion nuevaPublicacion = new BE.Publicacion
                {
                    Titulo = titulo,
                    Subtitulo = subtitulo,
                    Contenido = contenido,
                    Imagen = imagenSeleccionada,
                    FechaPublicacion = DateTime.Now,
                    AutorID = 1,
                    CategoriaID = categoriaID,
                    EstadoID = status,
                    IdTipoLetra = Convert.ToInt32(ddlFontFamily.SelectedValue),
                    IdTipoTamano = Convert.ToInt32(ddlFontSize.SelectedValue),
                    Parrafos = Convert.ToInt32(ddlNumParrafos.SelectedValue)
                };

                string publiID = Request.QueryString["publiID"];

                if (string.IsNullOrEmpty(publiID))
                {
                    BLL.Publicacion.GetInstancia().Create(nuevaPublicacion);
                }
                else
                {
                    nuevaPublicacion.PublicacionID = Convert.ToInt32(publiID);
                    BLL.Publicacion.GetInstancia().Update(nuevaPublicacion);
                }
                lblMensaje.Text = "Publicación creada con éxito.";
                ClientScript.RegisterStartupScript(this.GetType(), "redirect", "setTimeout(function() { window.location.href = 'MisPublicaciones.aspx'; }, 3000);", true);
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al crear la publicación: " + ex.Message;
            }
        }


        protected void ddlImagen_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Establecer la URL de la imagen seleccionada en el control Image
            //imgPreview.ImageUrl = ddlImagen.SelectedValue;
        }

        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Establecer la URL de la imagen seleccionada en el control Image
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
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
                        Response.Write("Guardando archivo en: " + serverPath);
                        FileUpload1.SaveAs(serverPath);


                        // Mostrar la imagen cargada
                        imgPreview.ImageUrl = "Uploads/" + Path.GetFileName(FileUpload1.FileName);
                        lblMessage.Text = "Imagen cargada con éxito.";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblMessage.Text = "Solo se permiten archivos JPG, JPEG, PNG o GIF.";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
            else
            {
                lblMessage.Text = "Por favor, selecciona una imagen para cargar.";
            }
        }


        protected void ddlFontFamily_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedFont = BLL.Publicacion.GetInstancia().GetTipoLetraNombre(int.Parse(ddlFontFamily.SelectedValue));

            // Aplicar la fuente a los TextBoxes de párrafos
            txtTitulo.Font.Name = selectedFont;
            txtSubtitulo.Font.Name = selectedFont;

            // Suponiendo que tienes tres TextBoxes para los párrafos
            txtParagraph1.Font.Name = selectedFont;
            txtParagraph2.Font.Name = selectedFont;
            txtParagraph3.Font.Name = selectedFont;
        }

        protected void ddlFontSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedFontSize = Convert.ToInt32(BLL.Publicacion.GetInstancia().GetTipoTamanoNombre(int.Parse(ddlFontSize.SelectedValue)));

            // Aplicar el tamaño de fuente a los TextBoxes de párrafos
            txtTitulo.Font.Size = FontUnit.Point(selectedFontSize);
            txtSubtitulo.Font.Size = FontUnit.Point(selectedFontSize);

            // Suponiendo que tienes tres TextBoxes para los párrafos
            txtParagraph1.Font.Size = FontUnit.Point(selectedFontSize);
            txtParagraph2.Font.Size = FontUnit.Point(selectedFontSize);
            txtParagraph3.Font.Size = FontUnit.Point(selectedFontSize);
        }

        protected void updateFront()
        {
            int selectedFontSize = Convert.ToInt32(BLL.Publicacion.GetInstancia().GetTipoTamanoNombre(int.Parse(ddlFontSize.SelectedValue)));
            txtTitulo.Font.Size = FontUnit.Point(selectedFontSize);
            txtSubtitulo.Font.Size = FontUnit.Point(selectedFontSize);

            // Aplicar el tamaño de fuente a los TextBoxes de párrafos
            txtParagraph1.Font.Size = FontUnit.Point(selectedFontSize);
            txtParagraph2.Font.Size = FontUnit.Point(selectedFontSize);
            txtParagraph3.Font.Size = FontUnit.Point(selectedFontSize);

            string selectedFont = BLL.Publicacion.GetInstancia().GetTipoLetraNombre(int.Parse(ddlFontFamily.SelectedValue));
            txtTitulo.Font.Name = selectedFont;
            txtSubtitulo.Font.Name = selectedFont;

            // Aplicar la fuente a los TextBoxes de párrafos
            txtParagraph1.Font.Name = selectedFont;
            txtParagraph2.Font.Name = selectedFont;
            txtParagraph3.Font.Name = selectedFont;
        }

        protected void ddlNumParrafos_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedParagraphs = Convert.ToInt32(ddlNumParrafos.SelectedValue);

            // Muestra los TextBox según la selección
            txtParagraph1.Visible = selectedParagraphs >= 1;
            txtParagraph2.Visible = selectedParagraphs >= 2;
            txtParagraph3.Visible = selectedParagraphs >= 3;
        }

    }
}