using System;

namespace BE
{
    public class Reclamo
    {
        public int ReclamoID { get; set; }
        public int? UsuarioID { get; set; }
        public DateTime Fecha { get; set; }
        public int EstadoID { get; set; }
        public string Descripcion { get; set; }
        public string Nombre { get; set; }
        public string Mail { get; set; }
    }
}
