using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                    Response.Redirect("Login.aspx");
                }
            }
        }
    }
}