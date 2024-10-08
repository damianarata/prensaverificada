using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            try
            {
                // Verificar si el parámetro publiID está presente en la Query String
                string publiID = Request.QueryString["publiID"];

                if (string.IsNullOrEmpty(publiID))
                {
                    //
                }
                else
                {
                    // Cargar publicación existente
                    BE.Publicacion Publi = BLL.Publicacion.GetInstancia().RetrievePublicacion(publiID);
                    BE.Autor Autor = BLL.Autor.GetInstancia().RetrieveAutor(Publi.AutorID);

                    // Rellenar los campos con los valores de la publicación
                    txtTitulo.Text = Publi.Titulo;
                    txtSubtitulo.Text = Publi.Subtitulo; // Asumiendo que Subtitulo es un campo de Publicacion
                    TextContenido.Text = Publi.Contenido;
                    // Establecer la imagen seleccionada (puedes agregar lógica para seleccionar la correcta)
                    ddlImagen.SelectedValue = Publi.Imagen;
                    ddlCategoria.SelectedValue = Publi.CategoriaID.ToString(); // Convertir a string para el DropDownList
                    imgPreview.ImageUrl = ddlImagen.SelectedValue;
                }
            }
            catch (Exception ex)
            {
                // Manejo de errores: mostrar un mensaje o redirigir a otra página
                Response.Write($"Error: {ex.Message}");
                // Redirigir a una página de error o a la página principal
                // Response.Redirect("ErrorPage.aspx");
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

        protected void cargar(int status)
        {
            try
            {
                // Obtener los valores de los controles en la página
                string titulo = txtTitulo.Text;
                string subtitulo = txtSubtitulo.Text;
                string contenido = TextContenido.Text;
                string imagenSeleccionada = ddlImagen.SelectedValue;
                int categoriaID = Convert.ToInt32(ddlCategoria.SelectedValue);

                // Crear una nueva instancia de Publicacion
                BE.Publicacion nuevaPublicacion = new BE.Publicacion
                {
                    Titulo = titulo,
                    Subtitulo = subtitulo,
                    Contenido = contenido,
                    Imagen = imagenSeleccionada,
                    FechaPublicacion = DateTime.Now, // Asignar la fecha actual
                    AutorID = 1,  // Definir el AutorID correspondiente (ajustar según sea necesario)
                    CategoriaID = categoriaID,
                    EstadoID = status
                };

                // Llamar al método de lógica de negocios para guardar la nueva publicación
                //
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

                // Mensaje de éxito o redireccionamiento (opcional)
                lblMensaje.Text = "Publicación creada con éxito.";
                ClientScript.RegisterStartupScript(this.GetType(), "redirect", "setTimeout(function() { window.location.href = 'MisPublicaciones.aspx'; }, 3000);", true);
            }
            catch (Exception ex)
            {
                // Manejo de errores (opcional)
                lblMensaje.Text = "Error al crear la publicación: " + ex.Message;

            }
        }

        protected void ddlImagen_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Establecer la URL de la imagen seleccionada en el control Image
            imgPreview.ImageUrl = ddlImagen.SelectedValue;
        }

        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Establecer la URL de la imagen seleccionada en el control Image
        }


    }
}