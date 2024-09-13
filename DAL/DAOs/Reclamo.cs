using System;
using System.Collections.Generic;
using System.Data;
using BE;

namespace DAL.DAOs
{
    public class Reclamo
    {
        private Reclamo() { }

        public static Reclamo _instancia;

        public static Reclamo GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Reclamo();
            }
            return _instancia;
        }

        public bool Create(BE.Reclamo reclamo)
        {
            string query = string.Format("INSERT INTO reclamos (usuarioid, fecha, estado, descripcion) VALUES ({0}, '{1}', '{2}', '{3}');",
                reclamo.UsuarioID, reclamo.Fecha.ToString("yyyy-MM-dd"), reclamo.Estado, reclamo.Descripcion);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public List<BE.Reclamo> RetreiveAll()
        {
            List<BE.Reclamo> reclamos = new List<BE.Reclamo>();
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader("SELECT * FROM reclamos");
            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    reclamos.Add(MAPPER.Reclamo.GetInstancia().Map(row));
                }
            }
            return reclamos;
        }

        public bool Update(BE.Reclamo reclamo)
        {
            string query = string.Format("UPDATE reclamos SET usuarioid = {0}, fecha = '{1}', estado = '{2}', descripcion = '{3}' WHERE reclamoid = {4}",
                reclamo.UsuarioID, reclamo.Fecha.ToString("yyyy-MM-dd"), reclamo.Estado, reclamo.Descripcion, reclamo.ReclamoID);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public bool Delete(BE.Reclamo reclamo)
        {
            string query = string.Format("DELETE FROM reclamos WHERE reclamoid = {0}", reclamo.ReclamoID);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }
    }
}
