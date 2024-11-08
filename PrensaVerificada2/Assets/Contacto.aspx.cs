using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrensaVerificada2.Assets
{
    public partial class Contacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Index_Articles"] = null;
            Session["Autor_Articles"] = null;
            Session["autor_pages"] = null;
            Session["index_pages"] = null;
        }

        protected void FaqButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Faq.aspx");
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            int usuarioId = Convert.ToInt32(Session["usuario"]);
            if (usuarioId == 0)
            {
                usuarioId = 999999;
            }

            BE.Reclamo reclamo = new BE.Reclamo
            {
                Descripcion = DescripcionTextBox.Text,
                Nombre = NombreTextBox.Text,
                Mail = EmailTextBox.Text,
                EstadoID = 1,
                Fecha = DateTime.Now,
                UsuarioID = usuarioId
            };

            BLL.Bitacora.GetInstancia().RegistroBitacora(usuarioId, 13);

            bool resultado = BLL.Reclamo.GetInstancia().Create(reclamo);
            if (resultado)
            {
                string script = "<script type='text/javascript'>alert('Reclamo enviado exitosamente');" +
                        "window.location.href = 'Contacto.aspx';</script>";
                SuccessMessageLiteral.Text = script;
            }
        }
    }
}