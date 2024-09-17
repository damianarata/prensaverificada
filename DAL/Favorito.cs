using System;
using System.Collections.Generic;
using BE;

namespace DAL
{
    public class Favorito
    {
        private Favorito() { }

        public static Favorito _instancia;

        public static Favorito GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Favorito();
            }

            return _instancia;
        }

        public bool Create(BE.Favorito favorito)
        {
            return DAOs.Favorito.GetInstancia().Create(favorito);
        }

        public List<BE.Favorito> RetreiveAll()
        {
            return DAOs.Favorito.GetInstancia().RetreiveAll();
        }

        public bool Update(BE.Favorito favorito)
        {
            return DAOs.Favorito.GetInstancia().Update(favorito);
        }

        public bool Delete(BE.Favorito favorito)
        {
            return DAOs.Favorito.GetInstancia().Delete(favorito);
        }
    }
}
