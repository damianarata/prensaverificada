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
            Session["Index_Articles"] = null;
            Session["Autor_Articles"] = null;
            Session["autor_pages"] = null;
            Session["index_pages"] = null;
        }

        protected void btnEnviar(object sender, EventArgs e)
        {
            BE.Usuario User = BLL.Usuario.Verificar_Usuario(TextBox1.Text.ToString(), TextBox2.Text.ToString());

            if ( User.UsuarioID != 0)
            {
                Session["usuario"] = User.UsuarioID.ToString();
                var autor = BLL.Autor.GetInstancia().Retreivebyuser(User.UsuarioID);
                Session["autorId"] = autor.AutorID.ToString();
                Response.Redirect("Index.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnRedes(object sender, EventArgs e)
        {
            Response.Redirect("LoginRedes.aspx");
        }
    }
}