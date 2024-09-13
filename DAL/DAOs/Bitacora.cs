using System;
using System.Collections.Generic;
using System.Data;
using BE;

namespace DAL.DAOs
{
    public class Bitacora
    {
        private Bitacora() { }

        public static Bitacora _instancia;

        public static Bitacora GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Bitacora();
            }
            return _instancia;
        }

        public bool Create(BE.Bitacora bitacora)
        {
            string query = string.Format("INSERT INTO bitacora (usuarioid, fecha, accion) VALUES ({0}, '{1}', '{2}');",
                bitacora.UsuarioID, bitacora.Fecha.ToString("yyyy-MM-dd"), bitacora.Accion);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public List<BE.Bitacora> RetreiveAll()
        {
            List<BE.Bitacora> bitacoras = new List<BE.Bitacora>();
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader("SELECT * FROM bitacora");
            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    bitacoras.Add(MAPPER.Bitacora.GetInstancia().Map(row));
                }
            }
            return bitacoras;
        }

        public bool Update(BE.Bitacora bitacora)
        {
            string query = string.Format("UPDATE bitacora SET usuarioid = {0}, fecha = '{1}', accion = '{2}' WHERE bitacoraid = {3}",
                bitacora.UsuarioID, bitacora.Fecha.ToString("yyyy-MM-dd"), bitacora.Accion, bitacora.BitacoraID);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public bool Delete(BE.Bitacora bitacora)
        {
            string query = string.Format("DELETE FROM bitacora WHERE bitacoraid = {0}", bitacora.BitacoraID);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }
    }
}
