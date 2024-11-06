using System;

namespace BE
{
    public class Usuario
    {
        public int UsuarioID { get; set; }
        public string Nombre { get; set; }
        public string Email { get; set; }
        public string Contrasena { get; set; }
        public DateTime FechaRegistro { get; set; }
        public bool? Admin { get; set; }
        public bool? Blocked { get; set; }
        public string Codigo { get; set; }
        public int? Retry { get; set; }
    }

}
