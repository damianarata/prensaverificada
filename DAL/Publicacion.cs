using System;
using System.Collections.Generic;
using BE;

namespace DAL
{
    public class Publicacion
    {
        private Publicacion() { }

        public static Publicacion _instancia;

        public static Publicacion GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Publicacion();
            }

            return _instancia;
        }

        public bool Create(BE.Publicacion publicacion)
        {
            return DAOs.Publicacion.GetInstancia().Create(publicacion);
        }

        public List<BE.Publicacion> RetreiveAll()
        {
            return DAOs.Publicacion.GetInstancia().RetreiveAll();
        }

        public bool Update(BE.Publicacion publicacion)
        {
            return DAOs.Publicacion.GetInstancia().Update(publicacion);
        }

        public bool Delete(BE.Publicacion publicacion)
        {
            return DAOs.Publicacion.GetInstancia().Delete(publicacion);
        }
    }
}
