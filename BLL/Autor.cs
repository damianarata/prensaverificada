using System;
using System.Collections.Generic;
using BE;
using DAL;
using System.Data;

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

        public BE.Autor RetrieveAutor(int id)
        {
            return DAL.DAOs.Autor.GetInstancia().Retreive(new BE.Autor { AutorID = id });
        }

        public BE.Autor Retreivebyuser(int id)
        {
            BE.Autor Autor = DAL.DAOs.Autor.GetInstancia().Retreivebyuser(new BE.Autor { UsuarioID = id });
            return Autor;
        }

        public DataTable RetrieveTop()
        {
            return DAL.DAOs.Autor.GetInstancia().RetrieveTop();
        }
        public bool Modificar(BE.Autor Autor)
        {
            throw new NotImplementedException();
        }
        #endregion

        #region Icrud
        public bool Create(BE.Autor Autor)
        {
            return DAL.DAOs.Autor.GetInstancia().Create(Autor);
        }

        public bool Delete(BE.Autor Autor)
        {
            throw new NotImplementedException();
        }

        public List<BE.Autor> RetreiveAll()
        {
            return DAL.DAOs.Autor.GetInstancia().RetreiveAll();
        }

        public bool Update(BE.Autor Autor)
        {
            return DAL.DAOs.Autor.GetInstancia().Update(Autor);
        }
        #endregion
    }
}
