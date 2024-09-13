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
