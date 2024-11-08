using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace PrensaVerificada2.Assets
{
    public partial class Reclamos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (BLL.Usuario.GetInstancia().Restriction() == true)
            {
                if (Session["usuario"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                Session["Index_Articles"] = null;
                Session["Autor_Articles"] = null;
                Session["autor_pages"] = null;
                Session["index_pages"] = null;
            }
            LoadReclamos();
        }

        private void LoadReclamos()
        {
            try
            {
                BLL.Bitacora.GetInstancia().RegistroBitacora(Convert.ToInt32(Session["usuario"]), 23);
                List<BE.Reclamo> reclamos = BLL.Reclamo.GetInstancia().Listar();

                var reclamosData = reclamos.Select(reclamo => {
                    string estadoColor;

                    // Determina el color de fondo basado en EstadoID
                    switch (reclamo.EstadoID)
                    {
                        case 1:
                            estadoColor = "bg-red-100 text-red-800";  // Verde
                            break;
                        case 2:
                            estadoColor = "bg-yellow-100 text-yellow-800";  // Amarillo
                            break;
                        case 3:
                            estadoColor = "bg-green-100 text-green-800";     // Gris
                            break;
                        default:
                            estadoColor = "bg-gray-100 text-gray-800";    // Predeterminado: Gris
                            break;
                    }

                    return new
                    {
                        Nombre = reclamo.Nombre,
                        Descripcion = reclamo.Descripcion,
                        Mail = reclamo.Mail,
                        Fecha = reclamo.Fecha,
                        EstadoNombre = BLL.Reclamo.GetInstancia().GetEstadoNombre(reclamo.EstadoID),
                        EstadoColor = estadoColor,
                        ReclamoID = reclamo.ReclamoID
                    };
                }).ToList();

                ReclamosRepeater.DataSource = reclamosData;
                ReclamosRepeater.DataBind();
            }
            catch (Exception ex)
            {
                // Manejo de errores (opcional)
            }
        }
        protected void ReclamosRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Ver")
            {
                int reclamoId = Convert.ToInt32(e.CommandArgument);
                var reclamo = BLL.Reclamo.GetInstancia().RetrieveReclamo(reclamoId);
                if (reclamo != null)
                {
                    string estadoColor = GetEstadoColor(reclamo.EstadoID);

                    // Primero registra la función si no existe
                    string functionScript = @"
                function showReclamoModal(nombre, descripcion, mail, fecha, estadoNombre, estadoColor) {
                    document.getElementById('modalNombre').textContent = nombre;
                    document.getElementById('modalDescripcion').textContent = descripcion;
                    document.getElementById('modalMail').textContent = mail;
                    document.getElementById('modalFecha').textContent = fecha;
                    var estadoElem = document.getElementById('modalEstadoNombre');
                    estadoElem.textContent = estadoNombre;
                    estadoElem.className = `px-2 rounded-full ${estadoColor}`;
                    document.getElementById('reclamoModal').classList.remove('hidden');
                }";

                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "ShowModalFunction", functionScript, true);

                    // Luego llama a la función
                    string callScript = $"showReclamoModal('{HttpUtility.JavaScriptStringEncode(reclamo.Nombre)}', " +
                                      $"'{HttpUtility.JavaScriptStringEncode(reclamo.Descripcion)}', " +
                                      $"'{HttpUtility.JavaScriptStringEncode(reclamo.Mail)}', " +
                                      $"'{reclamo.Fecha:dd/MM/yyyy}', " +
                                      $"'{HttpUtility.JavaScriptStringEncode(BLL.Reclamo.GetInstancia().GetEstadoNombre(reclamo.EstadoID))}', " +
                                      $"'{estadoColor}');";

                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowModalScript", callScript, true);
                }
            }
            if (e.CommandName == "Resolver")
            {
                int reclamoId = Convert.ToInt32(e.CommandArgument);
                BE.Reclamo reclamo = BLL.Reclamo.GetInstancia().RetrieveReclamo(reclamoId);
                reclamo.EstadoID = 3;
                BLL.Reclamo.GetInstancia().Update(reclamo);
            }
        }


        public string GetEstadoColor(int estadoID)
        {
            string estadoColor;

            switch (estadoID)
            {
                case 1:
                    estadoColor = "bg-yellow-100 text-yellow-800"; // Pendiente
                    break;
                case 2:
                    estadoColor = "bg-blue-100 text-blue-800";     // En Proceso
                    break;
                case 3:
                    estadoColor = "bg-green-100 text-green-800";   // Resuelto
                    break;
                default:
                    estadoColor = "bg-gray-100 text-gray-800";     // Desconocido
                    break;
            }

            return estadoColor;
        }
        public static object SaveComentario(int reclamoId, string comentario)
        {
            try
            {
                BLL.Reclamo.GetInstancia().SaveComentario( new BE.Comentario { ReclamoID = reclamoId, Descripcion = comentario, Fecha = DateTime.Now });
                return new { success = true };
            }
            catch (Exception ex)
            {
                return new { success = false, message = ex.Message };
            }
        }
        public static List<object> GetComentarios(int reclamoId)
        {
            var comentarios = BLL.Reclamo.GetInstancia().RetrieveComentario(reclamoId);
            return comentarios.Select(c => new {
                texto = c.Descripcion,
                fecha = c.Fecha.ToString("dd/MM/yyyy HH:mm"),
                usuario = c.ComentarioID
            }).ToList<object>();
        }

    }
}