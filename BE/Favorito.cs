using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Favorito
    {
        public int FavoritoID { get; set; }  // ID único para el favorito
        public int UsuarioID { get; set; }   // ID del usuario que marcó la publicación como favorita
        public int PublicacionID { get; set; }  // ID de la publicación marcada como favorita
        public DateTime FechaAgregado { get; set; }  // Fecha en la que se agregó a favoritos
    }
}
