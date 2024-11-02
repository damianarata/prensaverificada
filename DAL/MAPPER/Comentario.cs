using System;
using System.Data;

namespace DAL.MAPPER
{
    public class Comentario
    {
        private Comentario() { }

        static Comentario _instancia;

        public static Comentario GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Comentario();
            }

            return _instancia;
        }

        public BE.Comentario Map(DataRow row)
        {
            BE.Comentario comentario = new BE.Comentario();
            comentario.ComentarioID = Convert.ToInt32(row["ComentarioID"]);
            comentario.ReclamoID = Convert.ToInt32(row["ReclamoID"]);
            comentario.Fecha = Convert.ToDateTime(row["Fecha"]);
            comentario.Descripcion = row["Descripcion"].ToString();

            return comentario;
        }


    }
}
