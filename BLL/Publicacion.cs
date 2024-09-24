using System;
using System.Collections.Generic;
using BE;

namespace BLL
{
    public class Publicacion : ICrud<BE.Publicacion>
    {
        #region Singleton
        public Publicacion() { }

        public static Publicacion _instancia;

        public static Publicacion GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Publicacion();
            }
            return _instancia;
        }
        #endregion

        #region Publicacion Ops
        public bool Agregar(BE.Publicacion NewPublicacion)
        {
            throw new NotImplementedException();
        }

        public bool Eliminar(int PublicacionID)
        {
            throw new NotImplementedException();
        }

        public List<BE.Publicacion> Listar()
        {
            throw new NotImplementedException();
        }

        public BE.Publicacion RetrievePublicacion(string id)
        {
            BE.Publicacion Publi = DAL.Publicacion.GetInstancia().Retreive(new BE.Publicacion { PublicacionID = Convert.ToInt32(id) });
            return Publi;
        }

        public bool Modificar(BE.Publicacion Publicacion)
        {
            throw new NotImplementedException();
        }
        #endregion

        #region Icrud
        public bool Create(BE.Publicacion Publicacion)
        {
            return DAL.Publicacion.GetInstancia().Create(Publicacion);
        }

        public bool Delete(BE.Publicacion Publicacion)
        {
            throw new NotImplementedException();
        }

        public List<BE.Publicacion> RetreiveAll()
        {
            throw new NotImplementedException();
        }

        public bool Update(BE.Publicacion Publicacion)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
