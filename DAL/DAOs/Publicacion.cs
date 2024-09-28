using System;
using System.Collections.Generic;
using System.Data;
using BE;

namespace DAL.DAOs
{
    public class Publicacion
    {
        private Publicacion() { }

        public static Publicacion _instancia;

        public static Publicacion GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Publicacion();
            }
            return _instancia;
        }

        public bool Create(BE.Publicacion publicacion)
        {
            string query = string.Format("INSERT INTO publicaciones (titulo, subtitulo, contenido, imagen, fechapublicacion, autorid, categoriaid) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', {5}, {6});",
                publicacion.Titulo, publicacion.Subtitulo, publicacion.Contenido, publicacion.Imagen, publicacion.FechaPublicacion.ToString("yyyy-MM-dd"), publicacion.AutorID, publicacion.CategoriaID);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public List<BE.Publicacion> RetreiveAll()
        {
            List<BE.Publicacion> publicaciones = new List<BE.Publicacion>();
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader("SELECT * FROM publicaciones");
            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    publicaciones.Add(MAPPER.Publicacion.GetInstancia().Map(row));
                }
            }
            return publicaciones;
        }

        public BE.Publicacion Retreive(BE.Publicacion publicacion)
        {
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader(string.Format("SELECT * FROM PrensaVerificada.dbo.publicaciones WHERE publicacionid = '{0}'", publicacion.PublicacionID.ToString()));

            if (dt.Rows.Count != 0)
            {
                // Recupera la primera fila y la mapea a un objeto BE.Publicacion
                DataRow row = dt.Rows[0];
                publicacion = MAPPER.Publicacion.GetInstancia().Map(row);
            }

            return publicacion; // Devuelve el objeto o null si no hay filas
        }

        public List<BE.Publicacion> RetrieveLatestPublicaciones(int skipCount = 0)
        {
            // Ejecuta la consulta para obtener las últimas 6 publicaciones con estadoid = 1,
            // omitiendo las primeras 'skipCount' filas (si skipCount > 0).
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader(
                string.Format(
                    @"SELECT * 
              FROM PrensaVerificada.dbo.publicaciones 
              WHERE estadoid = 1 
              ORDER BY fechapublicacion DESC 
              OFFSET {0} ROWS FETCH NEXT 6 ROWS ONLY",
                    skipCount
                )
            );

            // Crear una lista para almacenar las publicaciones.
            List<BE.Publicacion> publicaciones = new List<BE.Publicacion>();

            if (dt.Rows.Count != 0)
            {
                // Itera sobre cada fila de resultados y mapea a objetos BE.Publicacion.
                foreach (DataRow row in dt.Rows)
                {
                    BE.Publicacion publicacion = MAPPER.Publicacion.GetInstancia().Map(row);
                    publicaciones.Add(publicacion);
                }
            }

            return publicaciones; // Devuelve la lista de publicaciones (puede estar vacía si no hay resultados).
        }

        public List<BE.Publicacion> RetrievePublicacionesPorAutor(int autorid, int skipCount = 0)
        {
            // Ejecuta la consulta para obtener todas las publicaciones de un autor específico,
            // ordenando por fecha de publicación y omitiendo 'skipCount' filas si es necesario.
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader(
                string.Format(
                    @"SELECT * 
              FROM PrensaVerificada.dbo.publicaciones 
              WHERE autorid = {0} 
              ORDER BY fechapublicacion DESC 
              OFFSET {1} ROWS",
                    autorid, skipCount
                )
            );

            // Crea una lista para almacenar las publicaciones.
            List<BE.Publicacion> publicaciones = new List<BE.Publicacion>();

            if (dt.Rows.Count != 0)
            {
                // Itera sobre cada fila de resultados y mapea a objetos BE.Publicacion.
                foreach (DataRow row in dt.Rows)
                {
                    BE.Publicacion publicacion = MAPPER.Publicacion.GetInstancia().Map(row);
                    publicaciones.Add(publicacion);
                }
            }

            return publicaciones; // Devuelve la lista de publicaciones (puede estar vacía si no hay resultados).
        }





        public bool Update(BE.Publicacion publicacion)
        {
            string query = string.Format("UPDATE publicaciones SET titulo = '{0}', subtitulo = '{1}', contenido = '{2}', imagen = '{3}', fechapublicacion = '{4}', autorid = {5}, categoriaid = {6} WHERE publicacionid = {7}",
                publicacion.Titulo, publicacion.Subtitulo, publicacion.Contenido, publicacion.Imagen, publicacion.FechaPublicacion.ToString("yyyy-MM-dd"), publicacion.AutorID, publicacion.CategoriaID, publicacion.PublicacionID);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public bool Delete(BE.Publicacion publicacion)
        {
            string query = string.Format("DELETE FROM publicaciones WHERE publicacionid = {0}", publicacion.PublicacionID);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }
    }
}
