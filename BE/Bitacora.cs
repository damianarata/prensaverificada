using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Bitacora
    {
        public int BitacoraID { get; set; }  // ID principal, puede estar en la tabla dependiendo de su estructura
        public int UsuarioID { get; set; }
        public DateTime Fecha { get; set; }
        public string Accion { get; set; }
        public string Criticidad { get; set; }
    }
}
