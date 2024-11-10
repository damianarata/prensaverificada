using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.DataVisualization.Charting;


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
        private bool isAdmin
        {
            get
            {
                return Session["admin"] != null && Convert.ToBoolean(Session["admin"]);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (BLL.Usuario.GetInstancia().Restriction() == true)
            {
                if (Session["usuario"] == null)
                {
                    Response.Redirect("Login.aspx?redirect=true");
                }
            }
            if (isAdmin)
            {
                alertaDivAdmin.Visible = false;
                searchButton.Enabled = true;
                Button2.Enabled = true;
                ButtonPrevious.Enabled = true;
                ButtonNext.Enabled = true;
                if (!IsPostBack)
                {
                    Session.Remove("bitacora_pages");
                    Session.Remove("bitacora_filtro");

                    LoadAllLogEntries();
                    UpdatePageCounter();
                }
                CargarDatosGrafico();
            }
            UpdatePageCounter();
            Session["Index_Articles"] = null;
            Session["Autor_Articles"] = null;
            Session["autor_pages"] = null;
            Session["index_pages"] = null;
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
            ButtonNext.Visible = logEntries.Count >= 20;
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
            ButtonNext.Visible = logEntries.Count >= 20;

            LogRepeater.DataSource = logEntries;
            LogRepeater.DataBind();
        }

        protected void SiguienteButton_Click(object sender, EventArgs e)
        {
            bitacora_pages += 20;
            UpdatePageCounter();
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
            if (bitacora_pages>= 20)
            {
                bitacora_pages -= 20;
                UpdatePageCounter();
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

        private void CargarDatosGrafico()
        {
            // SEMANA
            Chart1.Series["Series1"].Points.Clear();
            Chart1.Series["Series1"].IsValueShownAsLabel = true;
            DataTable dt = BLL.Bitacora.GetInstancia().getReport("Últimos 7 días");

            foreach (DataRow row in dt.Rows)
            {
                string criticidad = row["criticidad"].ToString();
                int totalRegistros = Convert.ToInt32(row["TotalRegistros"]);

                // Agregar punto y obtener el índice
                int pointIndex = Chart1.Series["Series1"].Points.AddXY(criticidad, totalRegistros);

                // Asignar color según criticidad
                switch (criticidad)
                {
                    case "WARN":
                        Chart1.Series["Series1"].Points[pointIndex].Color = System.Drawing.Color.Orange;
                        break;
                    case "INFO":
                        Chart1.Series["Series1"].Points[pointIndex].Color = System.Drawing.Color.Blue;
                        break;
                    case "CRIT":
                        Chart1.Series["Series1"].Points[pointIndex].Color = System.Drawing.Color.Red;
                        break;
                    default:
                        Chart1.Series["Series1"].Points[pointIndex].Color = System.Drawing.Color.Gray; // Color para valores no especificados
                        break;
                }
            }

            Chart1.Legends.Add(new Legend("Últimos 7 días"));

            // MES
            Chart2.Series["Series2"].Points.Clear();
            Chart2.Series["Series2"].IsValueShownAsLabel = true;
            DataTable dtx = BLL.Bitacora.GetInstancia().getReport("Último mes");

            foreach (DataRow row in dtx.Rows)
            {
                string criticidad = row["criticidad"].ToString();
                int totalRegistros = Convert.ToInt32(row["TotalRegistros"]);

                // Agregar punto y obtener el índice
                int pointIndex = Chart2.Series["Series2"].Points.AddXY(criticidad, totalRegistros);

                // Asignar color según criticidad
                switch (criticidad)
                {
                    case "WARN":
                        Chart2.Series["Series2"].Points[pointIndex].Color = System.Drawing.Color.Orange;
                        break;
                    case "INFO":
                        Chart2.Series["Series2"].Points[pointIndex].Color = System.Drawing.Color.Blue;
                        break;
                    case "CRIT":
                        Chart2.Series["Series2"].Points[pointIndex].Color = System.Drawing.Color.Red;
                        break;
                    default:
                        Chart2.Series["Series2"].Points[pointIndex].Color = System.Drawing.Color.Gray; // Color para valores no especificados
                        break;
                }
            }

            Chart2.Legends.Add(new Legend("Último mes"));


        }

        private void UpdatePageCounter()
        {
            int pageNumber = (bitacora_pages / 20) + 1;
            PageCounterLabel.Text = "Página: " + pageNumber;
        }
    }
}
