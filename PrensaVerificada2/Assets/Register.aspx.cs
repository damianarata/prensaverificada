using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace PrensaVerificada2.Assets
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Index_Articles"] = null;
            Session["Autor_Articles"] = null;
            Session["autor_pages"] = null;
            Session["index_pages"] = null;
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            BE.Usuario nuevoUsuario = new BE.Usuario();
            nuevoUsuario.Email = EmailTextBox.Text.Trim().ToLower();
            nuevoUsuario.Contrasena = EncodeToBase64(PasswordTextBox.Text.Trim());
            bool emailDisponible = BLL.Usuario.GetInstancia().EsEmailDisponible(nuevoUsuario.Email);

            if (emailDisponible)
            {
                nuevoUsuario.FechaRegistro = DateTime.Now;
                nuevoUsuario.Admin = false;
                nuevoUsuario.Codigo = "A";
                nuevoUsuario.Blocked = false;
                nuevoUsuario.Retry = 0;
                bool resultado = BLL.Usuario.GetInstancia().Create(nuevoUsuario);
                if (resultado)
                {
                    BE.Usuario User = BLL.Usuario.Verificar_Usuario(nuevoUsuario.Email, nuevoUsuario.Contrasena);
                    if (User.UsuarioID != 0)
                    {
                        Session["usuario"] = User.UsuarioID.ToString();
                        BLL.Bitacora.GetInstancia().RegistroBitacora(Convert.ToInt32(Session["usuario"]), 12, User.Email);
                    }
                    string script = "<script type='text/javascript'>alert('Usuario creado con éxito');" +
                                    "window.location.href = 'Index.aspx';</script>";
                    SuccessMessageLiteral.Text = script;
                }
                else
                {
                    string script = "<script type='text/javascript'>alert('Hubo un inconveniente. Por favor volve a probar mas tarde'); </script>";
                    SuccessMessageLiteral.Text = script;
                }
            }
            else
            {
                BLL.Bitacora.GetInstancia().RegistroBitacora(999999, 26);
                string script = "<script type='text/javascript'>alert('El email ya existe proba con otro o trata de recuperar tu contraseña'); </script>";
                SuccessMessageLiteral.Text = script;
            }
        }

        public static string EncodeToBase64(string plainText)
        {
            byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);
            return Convert.ToBase64String(plainTextBytes);
        }


    }
}