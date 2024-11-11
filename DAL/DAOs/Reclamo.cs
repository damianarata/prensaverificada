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
            string query = string.Format(
                "INSERT INTO reclamos (usuarioid, fecha, estadoid, descripcion, nombre, mail) VALUES ({0}, '{1}', {2}, '{3}', '{4}', '{5}');",
                reclamo.UsuarioID.HasValue ? reclamo.UsuarioID.ToString() : "NULL",
                reclamo.Fecha.ToString(),
                reclamo.EstadoID,
                reclamo.Descripcion.Replace("'", "''"),
                reclamo.Nombre.Replace("'", "''"),
                reclamo.Mail.Replace("'", "''")
            );

            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public BE.Reclamo Retreive(BE.Reclamo reclamo)
        {
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader(string.Format("SELECT * FROM PrensaVerificada.dbo.reclamos WHERE reclamoid = '{0}'", reclamo.ReclamoID.ToString()));

            if (dt.Rows.Count != 0)
            {
                DataRow row = dt.Rows[0];
                reclamo = MAPPER.Reclamo.GetInstancia().Map(row);
            }

            return reclamo;
        }
        public List<BE.Reclamo> RetrieveAll(int skipCount = 0)
        {
            List<BE.Reclamo> reclamos = new List<BE.Reclamo>();

            string query = $@"
                SELECT * 
                FROM reclamos 
                ORDER BY Fecha DESC 
                OFFSET {skipCount} ROWS 
                FETCH NEXT 20 ROWS ONLY";

            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader(query);

            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    reclamos.Add(MAPPER.Reclamo.GetInstancia().Map(row));
                }
            }

            return reclamos;
        }

        public List<BE.Comentario> RetrieveComentario(BE.Reclamo reclamo)
        {
            List<BE.Comentario> comentarios = new List<BE.Comentario>();
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader(string.Format("SELECT * FROM PrensaVerificada.dbo.comentarios WHERE comentarioid = '{0}'", reclamo.ReclamoID.ToString()));

            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    comentarios.Add(MAPPER.Comentario.GetInstancia().Map(row));
                }
            }

            return comentarios;
        }

        public bool SaveComentario(BE.Comentario comentario)
        {
            string query = string.Format(
                "INSERT INTO comentarios (reclamoid, fecha, descripcion) VALUES ({0}, '{1}', '{2}');",
                comentario.ReclamoID,
                comentario.Fecha.ToString(),
                comentario.Descripcion.Replace("'", "''")
            );

            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }
        public bool Update(BE.Reclamo reclamo)
        {
            string query = string.Format(
                "UPDATE reclamos SET usuarioid = {0}, fecha = '{1}', estadoid = {2}, descripcion = '{3}', nombre = '{4}', mail = '{5}' WHERE reclamoid = {6}",
                reclamo.UsuarioID.HasValue ? reclamo.UsuarioID.ToString() : "NULL",
                reclamo.Fecha.ToString(),
                reclamo.EstadoID,
                reclamo.Descripcion.Replace("'", "''"),
                reclamo.Nombre.Replace("'", "''"),
                reclamo.Mail.Replace("'", "''"),
                reclamo.ReclamoID
            );

            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }


        public bool Delete(BE.Reclamo reclamo)
        {
            string query = string.Format("DELETE FROM reclamos WHERE reclamoid = {0}", reclamo.ReclamoID);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }
    }
}
