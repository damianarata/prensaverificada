using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;

namespace DAL
{
    public class Categoria
    {
        private Categoria()
        {

        }

        public static Categoria _instancia;

        public static Categoria GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Categoria();
            }

            return _instancia;
        }

        public bool Create(BE.Categoria Categoria)
        {
            return DAOs.Categoria.GetInstancia().Create(Categoria);
        }

        public List<BE.Categoria> RetreiveAll()
        {
            return DAOs.Categoria.GetInstancia().RetreiveAll();
        }

        public bool Update(BE.Categoria Categoria)
        {

            return DAOs.Categoria.GetInstancia().Update(Categoria);
        }

        public bool Delete(BE.Categoria Categoria)
        {
            return DAOs.Categoria.GetInstancia().Delete(Categoria);
        }
    }
}
