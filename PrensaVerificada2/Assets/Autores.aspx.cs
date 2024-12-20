﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrensaVerificada2.Assets
{
    public partial class Autores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (BLL.Usuario.GetInstancia().Restriction() == true)
            {
                if (Session["usuario"] == null)
                {
                    Response.Redirect("Login.aspx?redirect=true");
                }
            }
            LoadAutores();
            Session["Index_Articles"] = null;
            Session["Autor_Articles"] = null;
            Session["autor_pages"] = null;
            Session["index_pages"] = null;
        }

        private void LoadAutores()
        {
            var topArticles = new List<dynamic>();
            var autores = BLL.Autor.GetInstancia().RetreiveAll();
            BLL.Bitacora.GetInstancia().RegistroBitacora(Convert.ToInt32(Session["usuario"]), 16);
            foreach (var autor in autores)
            {
                topArticles.Add(new
                {
                    autorID = autor.AutorID,
                    ImageUrl = autor.Foto,
                    Nombre = autor.Nombre,
                    Medio = autor.Medio,
                    Descripcion = autor.Biografia,
                    TwitterUrl = autor.Twitter,
                    InstagramUrl = autor.Instagram,
                    FacebookUrl = autor.Facebook,
                    LinkedInUrl = autor.Linkedin,
                    YouTubeUrl = autor.Youtube,
                });
            }

            AuthorsRepeater.DataSource = topArticles;
            AuthorsRepeater.DataBind();
        }
    }
}