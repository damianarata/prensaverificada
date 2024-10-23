using System;
using System.Collections.Generic;
using System.Data;
using BE;
using System.Data.SqlClient;
using System.Linq;

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
            string query = string.Format("INSERT INTO PrensaVerificada.dbo.bitacora (usuarioid, fecha, accion) VALUES ({0}, '{1}', '{2}');",
                bitacora.UsuarioID, bitacora.Fecha.ToString("yyyy-MM-dd"), bitacora.Accion);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public List<BE.Bitacora> RetreiveAll(int skipCount = 0)
        {
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader(
               string.Format(
                   @"SELECT * 
              FROM PrensaVerificada.dbo.bitacora 
              ORDER BY fecha DESC, bitacoraid DESC 
              OFFSET {0} ROWS FETCH NEXT 20 ROWS ONLY",
                   skipCount.ToString()
               )
           );

            // Crear una lista para almacenar las publicaciones.
            List<BE.Bitacora> bitacoras = new List<BE.Bitacora>();

            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    bitacoras.Add(MAPPER.Bitacora.GetInstancia().Map(row));
                }
            }
            return bitacoras;
        }

        public List<BE.Bitacora> ObtenerConFiltros(string startDate, string endDate, string username, string operationType, int skipCount = 0)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();

            string query = "SELECT * FROM PrensaVerificada.dbo.bitacora WHERE 1=1";

            if (!string.IsNullOrEmpty(startDate))
            {
                query += " AND [fecha] BETWEEN '" + startDate + "' AND '" + endDate + "'";
            }

            if (!string.IsNullOrEmpty(username))
            {
                query += " AND usuarioid = " + username;
            }

            if (!string.IsNullOrEmpty(operationType))
            {
                query += " AND accion like '%" + operationType + "%'";
            }

            query += string.Format("ORDER BY fecha DESC, bitacoraid DESC OFFSET {0} ROWS FETCH NEXT 20 ROWS ONLY", skipCount.ToString());

            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader(query);

            List<BE.Bitacora> bitacoras = new List<BE.Bitacora>();

            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    bitacoras.Add(MAPPER.Bitacora.GetInstancia().Map(row));
                }
            }

            return bitacoras;
        }

        public DataTable getReport(string filter)
        {
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader(string.Format("SELECT * FROM vw_BitacoraCriticidad WHERE Periodo = '{0}'", filter));
            return dt;
        }
        public bool Update(BE.Bitacora bitacora)
        {
            string query = string.Format("UPDATE PrensaVerificada.dbo.bitacora SET usuarioid = {0}, fecha = '{1}', accion = '{2}' WHERE bitacoraid = {3}",
                bitacora.UsuarioID, bitacora.Fecha.ToString("yyyy-MM-dd"), bitacora.Accion, bitacora.BitacoraID);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public bool Delete(BE.Bitacora bitacora)
        {
            string query = string.Format("DELETE FROM PrensaVerificada.dbo.bitacora WHERE bitacoraid = {0}", bitacora.BitacoraID);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }
    }
}
