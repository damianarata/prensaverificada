using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Favorito
    {
        public int FavoritoID { get; set; }  // ID �nico para el favorito
        public int UsuarioID { get; set; }   // ID del usuario que marc� la publicaci�n como favorita
        public int PublicacionID { get; set; }  // ID de la publicaci�n marcada como favorita
        public DateTime FechaAgregado { get; set; }  // Fecha en la que se agreg� a favoritos
    }
}
