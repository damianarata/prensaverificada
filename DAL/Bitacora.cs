using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;

namespace DAL
{
    public class Bitacora
    {
        private Bitacora()
        {

        }

        public static Bitacora _instancia;

        public static Bitacora GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Bitacora();
            }

            return _instancia;
        }

        public bool Create(BE.Bitacora Bitacora)
        {
            return DAOs.Bitacora.GetInstancia().Create(Bitacora);
        }

        public List<BE.Bitacora> RetreiveAll()
        {
            return DAOs.Bitacora.GetInstancia().RetreiveAll();
        }

        public bool Update(BE.Bitacora Bitacora)
        {

            return DAOs.Bitacora.GetInstancia().Update(Bitacora);
        }

        public bool Delete(BE.Bitacora Bitacora)
        {
            return DAOs.Bitacora.GetInstancia().Delete(Bitacora);
        }
    }
}
