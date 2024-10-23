using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrensaVerificada2.Assets
{
    public partial class Bitacora : System.Web.UI.Page
    {
        private int bitacora_pages
        {
            get
            {
                return (int)(Session["bitacora_pages"] ?? 0);
            }
            set
            {
                Session["bitacora_pages"] = value;
            }
        }

        private bool bitacora_filtro
        {
            get
            {
                return (bool)(Session["bitacora_filtro"] ?? false);
            }
            set
            {
                Session["bitacora_filtro"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (BLL.Usuario.GetInstancia().Restriction() == true)
            {
                if (Session["usuario"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }

            if (!IsPostBack)
            {
                Session.Remove("bitacora_pages");
                Session.Remove("bitacora_filtro");
                LoadAllLogEntries();
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            bitacora_filtro = true;
            ApplyFilters();
        }

        protected void RestablecerButton_Click(object sender, EventArgs e)
        {
            Session.Remove("bitacora_pages");
            Session.Remove("bitacora_filtro");
            startDate.Text = null;
            endDate.Text = null;
            usernameFilter.Text = null;
            operationFilter.Text = null;
            LoadAllLogEntries();
        }


        private void LoadAllLogEntries()
        {
            List<BE.Bitacora> logEntries = BLL.Bitacora.GetInstancia().Listar(bitacora_pages);
            LogRepeater.DataSource = logEntries;
            LogRepeater.DataBind();
        }

        private void ApplyFilters()
        {
            DateTime? startDateValue = string.IsNullOrEmpty(startDate.Text) ? (DateTime?)null : DateTime.Parse(startDate.Text);
            DateTime? endDateValue = string.IsNullOrEmpty(endDate.Text) ? (DateTime?)null : DateTime.Parse(endDate.Text);
            string username = usernameFilter.Text;
            string operationType = operationFilter.Text;

            List<BE.Bitacora> logEntries;

            if (startDateValue.HasValue || endDateValue.HasValue || !string.IsNullOrEmpty(username) || !string.IsNullOrEmpty(operationType))
            {
                logEntries = BLL.Bitacora.GetInstancia().ListarConFiltros(startDateValue, endDateValue, username, operationType, bitacora_pages);
            }
            else
            {
                logEntries = BLL.Bitacora.GetInstancia().Listar();
            }

            LogRepeater.DataSource = logEntries;
            LogRepeater.DataBind();
        }

        protected void SiguienteButton_Click(object sender, EventArgs e)
        {
            bitacora_pages += 20;
            if (bitacora_filtro == true)
            {
                ApplyFilters();
            }
            else
            {
                LoadAllLogEntries();
            }
        }

        protected void VolverButton_Click(object sender, EventArgs e)
        {
            bitacora_pages -= 20;
            if (bitacora_filtro == true)
            {
                ApplyFilters();
            }
            else
            {
                LoadAllLogEntries();
            }
        }

    }
}
