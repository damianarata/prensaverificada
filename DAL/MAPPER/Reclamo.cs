using System;
using System.Data;

namespace DAL.MAPPER
{
    public class Reclamo
    {
        private Reclamo() { }

        static Reclamo _instancia;

        public static Reclamo GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Reclamo();
            }

            return _instancia;
        }

        public BE.Reclamo Map(DataRow row)
        {
            BE.Reclamo reclamo = new BE.Reclamo();
            reclamo.ReclamoID = Convert.ToInt32(row["reclamoid"]);
            reclamo.UsuarioID = row.IsNull("usuarioid") ? (int?)null : Convert.ToInt32(row["usuarioid"]);
            reclamo.Fecha = Convert.ToDateTime(row["fecha"]);
            reclamo.EstadoID = Convert.ToInt32(row["estadoid"]);
            reclamo.Descripcion = row["descripcion"].ToString();
            reclamo.Nombre = row["nombre"].ToString();
            reclamo.Mail = row["mail"].ToString();

            return reclamo;
        }

    }
}
