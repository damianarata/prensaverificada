﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace PrensaVerificada2.Assets
{
    public partial class NewPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Index_Articles"] = null;
            Session["Autor_Articles"] = null;
            Session["autor_pages"] = null;
            Session["index_pages"] = null;
        }

        protected void ChangeButton_Click(object sender, EventArgs e)
        {
            BE.Usuario user = BLL.Usuario.GetInstancia().RetrieveUser(new BE.Usuario { UsuarioID = Convert.ToInt32(Session["usuario"]) });
            user.Contrasena = EncodeToBase64(PasswordTextBox.Text.Trim());
            if (user.UsuarioID != 0)
            {
                bool resultado = BLL.Usuario.GetInstancia().ActualizarUsuario(user);
                if (resultado)
                {
                    string script = "<script type='text/javascript'>alert('Contraseña cambiada con exito');" +
                                    "window.location.href = 'Perfil.aspx';</script>";
                    SuccessMessageLiteral.Text = script;
                }
                else
                {
                    string script = "<script type='text/javascript'>alert('Hubo un inconveniente. Por favor comunicate con soporte.');" +
                                    "window.location.href = 'Contacto.aspx';</script>";
                    SuccessMessageLiteral.Text = script;
                }
            }
        }

        public static string EncodeToBase64(string plainText)
        {
            byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);
            return Convert.ToBase64String(plainTextBytes);
        }

    }
}