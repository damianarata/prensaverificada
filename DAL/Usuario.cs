using System;
using System.Collections.Generic;
using BE;

namespace DAL
{
    public class Usuario
    {
        private Usuario() { }

        public static Usuario _instancia;

        public static Usuario GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Usuario();
            }

            return _instancia;
        }

        public bool Create(BE.Usuario usuario)
        {
            return DAOs.Usuario.GetInstancia().Create(usuario);
        }

        public List<BE.Usuario> RetreiveAll()
        {
            return DAOs.Usuario.GetInstancia().RetreiveAll();
        }

        public bool Update(BE.Usuario usuario)
        {
            return DAOs.Usuario.GetInstancia().Update(usuario);
        }

        public bool Delete(BE.Usuario usuario)
        {
            return DAOs.Usuario.GetInstancia().Delete(usuario);
        }
        public static BE.Usuario Login(BE.Usuario usuario)
        {
            return DAOs.Usuario.GetInstancia().Login(usuario);
        }
    }
}
