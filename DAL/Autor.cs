using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;

namespace DAL
{
    public class Autor
    {
        private Autor()
        {

        }

        public static Autor _instancia;

        public static Autor GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Autor();
            }

            return _instancia;
        }

        public bool Create(BE.Autor Autor)
        {
            return DAOs.Autor.GetInstancia().Create(Autor);
        }

        public List<BE.Autor> RetreiveAll()
        {
            return DAOs.Autor.GetInstancia().RetreiveAll();
        }

        public bool Update(BE.Autor Autor)
        {

            return DAOs.Autor.GetInstancia().Update(Autor);
        }

        public bool Delete(BE.Autor Autor)
        {
            return DAOs.Autor.GetInstancia().Delete(Autor);
        }
    }
}
