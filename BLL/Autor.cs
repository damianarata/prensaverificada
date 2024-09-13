using System;
using System.Collections.Generic;
using BE;

namespace BLL
{
    public class Autor : ICrud<BE.Autor>
    {
        #region Singleton
        public Autor() { }

        public static Autor _instancia;

        public static Autor GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Autor();
            }
            return _instancia;
        }
        #endregion

        #region Autor Ops
        public bool Agregar(BE.Autor NewAutor)
        {
            throw new NotImplementedException();
        }

        public bool Eliminar(int AutorID)
        {
            throw new NotImplementedException();
        }

        public List<BE.Autor> Listar()
        {
            throw new NotImplementedException();
        }

        public BE.Autor RetrieveAutor(BE.Autor Autor)
        {
            throw new NotImplementedException();
        }

        public bool Modificar(BE.Autor Autor)
        {
            throw new NotImplementedException();
        }
        #endregion

        #region Icrud
        public bool Create(BE.Autor Autor)
        {
            return DAL.Autor.GetInstancia().Create(Autor);
        }

        public bool Delete(BE.Autor Autor)
        {
            throw new NotImplementedException();
        }

        public List<BE.Autor> RetreiveAll()
        {
            throw new NotImplementedException();
        }

        public bool Update(BE.Autor Autor)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
