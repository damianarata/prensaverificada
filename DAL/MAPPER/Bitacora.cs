using System;
using System.Data;

namespace DAL.MAPPER
{
    public class Bitacora
    {
        private Bitacora() { }

        static Bitacora _instancia;

        public static Bitacora GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Bitacora();
            }

            return _instancia;
        }

        public BE.Bitacora Map(DataRow row)
        {
            BE.Bitacora bitacora = new BE.Bitacora();
            bitacora.BitacoraID = Convert.ToInt32(row["bitacoraid"]);
            bitacora.UsuarioID = Convert.ToInt32(row["usuarioid"]);
            bitacora.Fecha = Convert.ToDateTime(row["fecha"]);
            bitacora.Accion = row["accion"].ToString();
            return bitacora;
        }
    }
}
