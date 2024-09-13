using System;

namespace BE
{
    public class Reclamo
    {
        public int ReclamoID { get; set; }
        public int UsuarioID { get; set; }
        public DateTime Fecha { get; set; }
        public string Estado { get; set; }
        public string Descripcion { get; set; }
    }
}
