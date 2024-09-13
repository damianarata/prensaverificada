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

        public static Bitacora Getinstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Bitacora();
            }

            return _instancia;
        }

        public bool Create(BE.Bitacora Bitacora)
        {
            return DAOs.Bitacora.Getinstancia().Create(Bitacora);
        }

        public List<BE.Bitacora> RetreiveAll()
        {
            return DAOs.Bitacora.Getinstancia().RetreiveAll();
        }

        public bool Update(BE.Bitacora Bitacora)
        {

            return DAOs.Bitacora.Getinstancia().Update(Bitacora);
        }

        public bool Delete(BE.Bitacora Bitacora)
        {
            return DAOs.Bitacora.Getinstancia().Delete(Bitacora);
        }
    }
}
