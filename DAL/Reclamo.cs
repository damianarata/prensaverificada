using System;
using System.Collections.Generic;
using BE;

namespace DAL
{
    public class Reclamo
    {
        private Reclamo() { }

        public static Reclamo _instancia;

        public static Reclamo GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Reclamo();
            }

            return _instancia;
        }

        public bool Create(BE.Reclamo reclamo)
        {
            return DAOs.Reclamo.GetInstancia().Create(reclamo);
        }

        public List<BE.Reclamo> RetreiveAll()
        {
            throw new NotImplementedException();
        }

        public bool Update(BE.Reclamo reclamo)
        {
            return DAOs.Reclamo.GetInstancia().Update(reclamo);
        }

        public bool Delete(BE.Reclamo reclamo)
        {
            return DAOs.Reclamo.GetInstancia().Delete(reclamo);
        }
    }
}
