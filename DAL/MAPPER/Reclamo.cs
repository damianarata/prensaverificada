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
            reclamo.UsuarioID = Convert.ToInt32(row["usuarioid"]);
            reclamo.Fecha = Convert.ToDateTime(row["fecha"]);
            reclamo.Estado = row["estado"].ToString();
            reclamo.Descripcion = row["descripcion"].ToString();
            return reclamo;
        }
    }
}
