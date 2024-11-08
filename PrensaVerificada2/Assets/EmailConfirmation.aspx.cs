using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrensaVerificada2.Assets
{
    public partial class EmailConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ConfirmButton_Click(object sender, EventArgs e)
        {
            string email = Session["Email"] as string;
            string code = Session["Code"] as string;
            BLL.Bitacora.GetInstancia().RegistroBitacora(Convert.ToInt32(Session["usuario"]), 20, email);
            Response.Write($"<script>alert('Email confirmado exitosamente.'); window.location.href = 'NewPass.aspx?Code={code}&Email={email}';</script>");
        }
    }
}