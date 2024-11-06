using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrensaVerificada2.Assets
{
    public partial class RecoverPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Index_Articles"] = null;
            Session["Autor_Articles"] = null;
            Session["autor_pages"] = null;
            Session["index_pages"] = null;
        }

        protected void SendButton_Click(object sender, EventArgs e)
        {
            var email = EmailTextBox.Text.ToLower();
            var code = BLL.Usuario.GetInstancia().RecuperarPass(email);
            Session["Code"] = code;
            Session["Email"] = email;
            string url = $"EmailConfirmation.aspx"; //?code={code}&email={email}";
            string script = $"window.open('{url}', '_blank');";
            ClientScript.RegisterStartupScript(this.GetType(), "AbrirNuevaPestaña", script, true);
        }

    }
}