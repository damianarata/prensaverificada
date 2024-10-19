using System;
using System.Data;

namespace DAL.MAPPER
{
    public class Publicacion
    {
        private Publicacion() { }

        static Publicacion _instancia;

        public static Publicacion GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Publicacion();
            }

            return _instancia;
        }

        public BE.Publicacion Map(DataRow row)
        {
            BE.Publicacion publicacion = new BE.Publicacion();
            publicacion.PublicacionID = Convert.ToInt32(row["publicacionid"]);
            publicacion.Titulo = row["titulo"].ToString();
            publicacion.Subtitulo = row["subtitulo"].ToString();
            publicacion.Contenido = row["contenido"].ToString();
            publicacion.Imagen = row["imagen"].ToString();
            publicacion.FechaPublicacion = Convert.ToDateTime(row["fechapublicacion"]);
            publicacion.AutorID = Convert.ToInt32(row["autorid"]);
            publicacion.CategoriaID = Convert.ToInt32(row["categoriaid"]);
            publicacion.EstadoID = Convert.ToInt32(row["estadoid"]);
            publicacion.IdTipoLetra = Convert.ToInt32(row["id_tipo_letra"]);
            publicacion.IdTipoTamano = Convert.ToInt32(row["id_tipo_tamano"]);
            publicacion.Parrafos = Convert.ToInt32(row["parrafos"]);
            return publicacion;
        }


    }
}
