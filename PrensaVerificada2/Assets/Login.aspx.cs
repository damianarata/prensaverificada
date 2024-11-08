using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace PrensaVerificada2.Assets
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Index_Articles"] = null;
            Session["Autor_Articles"] = null;
            Session["autor_pages"] = null;
            Session["index_pages"] = null;
        }

        protected void btnEnviar(object sender, EventArgs e)
        {
            BE.Usuario User = BLL.Usuario.Verificar_Usuario(TextBox1.Text.ToString().ToLower(), EncodeToBase64(TextBox2.Text.ToString()));

            if ( User.UsuarioID != 0)
            {
                Session["usuario"] = User.UsuarioID.ToString();
                var autor = BLL.Autor.GetInstancia().Retreivebyuser(User.UsuarioID);
                Session["autorId"] = autor.AutorID.ToString();
                Response.Redirect("Index.aspx");
            }
            else
            {
                if (User.Blocked == true)
                {
                    string script = "<script type='text/javascript'>alert('La cuenta quedo bloqueada, tenes que recuperar la contraseña');" +
                                    "window.location.href = 'RecoverPass.aspx';</script>";
                    SuccessMessageLiteral.Text = script;
                }
                else
                {
                    string script = "<script type='text/javascript'>alert('Contraseña incorrecta, volve a intentarlo');" +
                                    "window.location.href = 'Login.aspx';</script>";
                    SuccessMessageLiteral.Text = script;
                }
            }
        }

        protected void btnRedes(object sender, EventArgs e)
        {
            Response.Redirect("LoginRedes.aspx");
        }

        public static string EncodeToBase64(string plainText)
        {
            byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);
            return Convert.ToBase64String(plainTextBytes);
        }
    }
}