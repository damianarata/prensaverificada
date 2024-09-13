using System;
using System.Collections.Generic;
using BE;

namespace BLL
{
    public class Categoria : ICrud<BE.Categoria>
    {
        #region Singleton
        public Categoria() { }

        public static Categoria _instancia;

        public static Categoria GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Categoria();
            }
            return _instancia;
        }
        #endregion

        #region Categoria Ops
        public bool Agregar(BE.Categoria NewCategoria)
        {
            throw new NotImplementedException();
        }

        public bool Eliminar(int CategoriaID)
        {
            throw new NotImplementedException();
        }

        public List<BE.Categoria> Listar()
        {
            throw new NotImplementedException();
        }

        public BE.Categoria RetrieveCategoria(BE.Categoria Categoria)
        {
            throw new NotImplementedException();
        }

        public bool Modificar(BE.Categoria Categoria)
        {
            throw new NotImplementedException();
        }
        #endregion

        #region Icrud
        public bool Create(BE.Categoria Categoria)
        {
            return DAL.Categoria.GetInstancia().Create(Categoria);
        }

        public bool Delete(BE.Categoria Categoria)
        {
            throw new NotImplementedException();
        }

        public List<BE.Categoria> RetreiveAll()
        {
            throw new NotImplementedException();
        }

        public bool Update(BE.Categoria Categoria)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
