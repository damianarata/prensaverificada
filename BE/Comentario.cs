using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Comentario
    {
        public int ComentarioID { get; set; }
        public int ReclamoID { get; set; }
        public DateTime Fecha { get; set; }
        public string Descripcion { get; set; }
    }
}
