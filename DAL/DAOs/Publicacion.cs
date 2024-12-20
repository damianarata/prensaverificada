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
            string query = string.Format("INSERT INTO publicaciones (titulo, subtitulo, contenido, imagen, fechapublicacion, autorid, categoriaid, estadoid, id_tipo_letra, id_tipo_tamano, parrafos, contador_total, contador_semanal) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', {5}, {6}, {7}, {8}, {9}, {10}, {11}, {12});",
                publicacion.Titulo,
                publicacion.Subtitulo,
                publicacion.Contenido,
                publicacion.Imagen,
                publicacion.FechaPublicacion.ToString(),
                publicacion.AutorID,
                publicacion.CategoriaID,
                publicacion.EstadoID,
                publicacion.IdTipoLetra,
                publicacion.IdTipoTamano,
                publicacion.Parrafos,
                publicacion.ContadorTotal,
                publicacion.ContadorSemanal);

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
                DataRow row = dt.Rows[0];
                publicacion = MAPPER.Publicacion.GetInstancia().Map(row);
            }

            return publicacion;
        }

        public List<BE.Publicacion> RetreiveTop()
        {
            List<BE.Publicacion> publicaciones = new List<BE.Publicacion>();
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader("SELECT TOP 5 * FROM PrensaVerificada.dbo.publicaciones ORDER BY contador_total DESC");
            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    publicaciones.Add(MAPPER.Publicacion.GetInstancia().Map(row));
                }
            }
            return publicaciones;
        }

        public List<BE.Publicacion> RetrieveLatestPublicaciones(int skipCount = 0)
        {
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

            List<BE.Publicacion> publicaciones = new List<BE.Publicacion>();

            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    BE.Publicacion publicacion = MAPPER.Publicacion.GetInstancia().Map(row);
                    publicaciones.Add(publicacion);
                }
            }

            return publicaciones;
        }

        public List<BE.Publicacion> RetrievePublicacionesPorAutor(int autorid, int skipCount = 0)
        {
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader(
                string.Format(
                    @"SELECT * 
              FROM PrensaVerificada.dbo.publicaciones 
              WHERE autorid = {0}
              ORDER BY fechapublicacion DESC
              OFFSET {1} ROWS FETCH NEXT 20 ROWS ONLY",
                    autorid, skipCount
                )
            );

            List<BE.Publicacion> publicaciones = new List<BE.Publicacion>();

            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    BE.Publicacion publicacion = MAPPER.Publicacion.GetInstancia().Map(row);
                    publicaciones.Add(publicacion);
                }
            }

            return publicaciones;
        }

        public List<BE.Publicacion> RetrievePublicacionesPorAdmin(int skipCount = 0)
        {
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader(
                string.Format(
                    @"SELECT * 
              FROM PrensaVerificada.dbo.publicaciones 
              ORDER BY fechapublicacion DESC
              OFFSET {0} ROWS FETCH NEXT 20 ROWS ONLY",
                    skipCount
                )
            );

            List<BE.Publicacion> publicaciones = new List<BE.Publicacion>();

            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    BE.Publicacion publicacion = MAPPER.Publicacion.GetInstancia().Map(row);
                    publicaciones.Add(publicacion);
                }
            }

            return publicaciones;
        }

        public List<BE.Publicacion> RetrievePublicacionesPorAutorPublicadas(int autorid, int skipCount = 0)
        {
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader(
                string.Format(
                    @"SELECT * 
              FROM PrensaVerificada.dbo.publicaciones 
              WHERE autorid = {0} AND estadoid = 1
              ORDER BY fechapublicacion DESC 
              OFFSET {1} ROWS FETCH NEXT 6 ROWS ONLY",
                    autorid, skipCount
                )
            );

            List<BE.Publicacion> publicaciones = new List<BE.Publicacion>();

            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    BE.Publicacion publicacion = MAPPER.Publicacion.GetInstancia().Map(row);
                    publicaciones.Add(publicacion);
                }
            }

            return publicaciones;
        }

        public List<BE.Publicacion> RetrievePublicacionesPorCategoria(int catid, int skipCount = 0)
        {
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader(
                string.Format(
                    @"SELECT * 
              FROM PrensaVerificada.dbo.publicaciones 
              WHERE categoriaid = {0} AND estadoid = 1
              ORDER BY fechapublicacion DESC 
              OFFSET {1} ROWS FETCH NEXT 6 ROWS ONLY",
                    catid, skipCount
                )
            );

            List<BE.Publicacion> publicaciones = new List<BE.Publicacion>();

            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    BE.Publicacion publicacion = MAPPER.Publicacion.GetInstancia().Map(row);
                    publicaciones.Add(publicacion);
                }
            }

            return publicaciones;
        }

        public List<BE.Publicacion> RetrieveFavs(BE.Usuario usuario, int skipCount = 0)
        {
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader(
                string.Format(
                    @"SELECT * 
                FROM dbo.vw_PublicacionesFavoritasPorUsuario
                WHERE usuarioid = {0}
                ORDER BY fecha_favorito DESC 
                OFFSET {1} ROWS FETCH NEXT 6 ROWS ONLY",
                    usuario.UsuarioID, skipCount
                )
            );

            List<BE.Publicacion> publicaciones = new List<BE.Publicacion>();

            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    BE.Publicacion publicacion = MAPPER.Publicacion.GetInstancia().Map(row);
                    publicaciones.Add(publicacion);
                }
            }

            return publicaciones;
        }

        public List<BE.Publicacion> RetrievePublicacionesConFiltros(string startDate, string endDate, string author, string category, string title, string content, int skipCount)
        {
            string query = "SELECT * FROM PrensaVerificada.dbo.publicaciones WHERE estadoid = 1 ";

            if (!string.IsNullOrEmpty(startDate))
            {
                query += " AND [fechapublicacion] BETWEEN '" + startDate + "' AND '" + endDate + "'";
            }

            if (!string.IsNullOrEmpty(author))
            {
                query += " AND autorid = " + author;
            }

            if (!string.IsNullOrEmpty(category))
            {
                query += " AND categoriaid = " + category;
            }

            if (!string.IsNullOrEmpty(title))
            {
                query += " AND titulo like '%" + title + "%'";
            }

            if (!string.IsNullOrEmpty(content))
            {
                query += " AND contenido like '%" + content + "%'";
            }

            query += string.Format(" ORDER BY fechapublicacion DESC OFFSET {0} ROWS FETCH NEXT 6 ROWS ONLY", skipCount.ToString());

            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader(query);

            List<BE.Publicacion> publicaciones = new List<BE.Publicacion>();

            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    BE.Publicacion publicacion = MAPPER.Publicacion.GetInstancia().Map(row);
                    publicaciones.Add(publicacion);
                }
            }

            return publicaciones;
        }

        public bool CheckIfFavorite(BE.Publicacion Publi, int userId)
        {
            string query = string.Format(
                @"SELECT 1
            FROM dbo.vw_PublicacionesFavoritasPorUsuario
            WHERE usuarioid = {0}
            AND publicacionid = {1}",
                    userId, Publi.PublicacionID);

            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader(query);
            return dt.Rows.Count > 0;
        }
        public bool Update(BE.Publicacion publicacion)
        {
            string query = string.Format("UPDATE publicaciones SET titulo = '{0}', subtitulo = '{1}', contenido = '{2}', imagen = '{3}', fechapublicacion = '{4}', autorid = {5}, categoriaid = {6}, estadoid = {7}, id_tipo_letra = {8}, id_tipo_tamano = {9}, parrafos = {10}, contador_total = {11}, contador_semanal = {12} WHERE publicacionid = {13}",
                publicacion.Titulo,
                publicacion.Subtitulo,
                publicacion.Contenido,
                publicacion.Imagen,
                publicacion.FechaPublicacion.ToString(),
                publicacion.AutorID,
                publicacion.CategoriaID,
                publicacion.EstadoID,
                publicacion.IdTipoLetra,
                publicacion.IdTipoTamano,
                publicacion.Parrafos,
                publicacion.ContadorTotal,
                publicacion.ContadorSemanal,
                publicacion.PublicacionID);

            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public bool DeleteFavs(BE.Publicacion publicacion)
        {
            string query = string.Format("DELETE FROM favoritos WHERE publicacionid = {0}", publicacion.PublicacionID);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public bool Delete(BE.Publicacion publicacion)
        {
            DeleteFavs(publicacion);
            string query = string.Format("DELETE FROM publicaciones WHERE publicacionid = {0}", publicacion.PublicacionID);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }
    }
}
