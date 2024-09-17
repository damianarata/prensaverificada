using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BLL;

namespace PrensaVerificada2.Assets
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar(object sender, EventArgs e)
        {
            BE.Usuario User = BLL.Usuario.Verificar_Usuario(TextBox1.Text.ToString(), TextBox2.Text.ToString());

            if ( User.UsuarioID != 0)
            {
                // Si el UsuarioID es distinto de 0, guardamos el ID en la sesión y redirigimos a Home.aspx
                Session["usuario"] = User.UsuarioID.ToString();
                Response.Redirect("Home.aspx");
            }
            else
            {
                // Si el UsuarioID es 0 o el objeto User es null, redirigir al login
                Response.Redirect("Login.aspx");
                // O bien, puedes mostrar un mensaje de error
                // Label1.Visible = true;
            }
        }

        protected void btnRedes(object sender, EventArgs e)
        {
            Response.Redirect("LoginRedes.aspx");
        }
    }
}