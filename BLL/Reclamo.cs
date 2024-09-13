using System;
using System.Collections.Generic;
using BE;

namespace BLL
{
    public class Reclamo : ICrud<BE.Reclamo>
    {
        #region Singleton
        public Reclamo() { }

        public static Reclamo _instancia;

        public static Reclamo GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Reclamo();
            }
            return _instancia;
        }
        #endregion

        #region Reclamo Ops
        public bool Agregar(BE.Reclamo NewReclamo)
        {
            throw new NotImplementedException();
        }

        public bool Eliminar(int ReclamoID)
        {
            throw new NotImplementedException();
        }

        public List<BE.Reclamo> Listar()
        {
            throw new NotImplementedException();
        }

        public BE.Reclamo RetrieveReclamo(BE.Reclamo Reclamo)
        {
            throw new NotImplementedException();
        }

        public bool Modificar(BE.Reclamo Reclamo)
        {
            throw new NotImplementedException();
        }
        #endregion

        #region Icrud
        public bool Create(BE.Reclamo Reclamo)
        {
            return DAL.Reclamo.GetInstancia().Create(Reclamo);
        }

        public bool Delete(BE.Reclamo Reclamo)
        {
            throw new NotImplementedException();
        }

        public List<BE.Reclamo> RetreiveAll()
        {
            throw new NotImplementedException();
        }

        public bool Update(BE.Reclamo Reclamo)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
