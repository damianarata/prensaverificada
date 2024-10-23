using System;

namespace BE
{
    public class Publicacion
    {
        public int PublicacionID { get; set; }
        public string Titulo { get; set; }
        public string Subtitulo { get; set; }
        public string Contenido { get; set; }
        public string Imagen { get; set; }
        public DateTime FechaPublicacion { get; set; }
        public int AutorID { get; set; }
        public int CategoriaID { get; set; }
        public int EstadoID { get; set; }
        public int IdTipoLetra { get; set; }
        public int IdTipoTamano { get; set; }
        public int Parrafos { get; set; }
        public int ContadorTotal { get; set; }
        public int ContadorSemanal { get; set; }
    }
}
