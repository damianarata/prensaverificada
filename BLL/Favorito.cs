using System;
using System.Collections.Generic;
using BE;
using System.Data;

namespace BLL
{
    public class Favorito : ICrud<BE.Favorito>
    {
        #region Singleton
        public Favorito() { }

        public static Favorito _instancia;

        public static Favorito GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Favorito();
            }
            return _instancia;
        }
        #endregion

        #region Favorito Ops
        public bool Agregar(BE.Favorito NewFavorito)
        {
            throw new NotImplementedException();
        }

        public bool Eliminar(int FavoritoID)
        {
            throw new NotImplementedException();
        }

        public List<BE.Favorito> Listar()
        {
            throw new NotImplementedException();
        }

        public BE.Favorito RetrieveFavorito(BE.Favorito Favorito)
        {
            throw new NotImplementedException();
        }

        public bool Modificar(BE.Favorito Favorito)
        {
            throw new NotImplementedException();
        }

        public DataTable RetrieveTop()
        {
            return DAL.DAOs.Favorito.GetInstancia().RetrieveTop();
        }
        #endregion

        #region Icrud
        public bool Create(BE.Favorito Favorito)
        {
            return DAL.Favorito.GetInstancia().Create(Favorito);
        }

        public bool Delete(BE.Favorito Favorito)
        {
            throw new NotImplementedException();
        }

        public List<BE.Favorito> RetreiveAll()
        {
            throw new NotImplementedException();
        }

        public bool Update(BE.Favorito Favorito)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
