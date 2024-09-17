using System;
using System.Collections.Generic;
using BE;

namespace BLL
{
    public class Bitacora : ICrud<BE.Bitacora>
    {
        #region Singleton
        public Bitacora() { }

        public static Bitacora _instancia;

        public static Bitacora GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Bitacora();
            }
            return _instancia;
        }
        #endregion

        #region Bitacora Ops
        public bool Agregar(BE.Bitacora NewBitacora)
        {
            throw new NotImplementedException();
        }

        public bool Eliminar(int BitacoraID)
        {
            throw new NotImplementedException();
        }

        public List<BE.Bitacora> Listar()
        {
            throw new NotImplementedException();
        }

        public BE.Bitacora RetrieveBitacora(BE.Bitacora Bitacora)
        {
            throw new NotImplementedException();
        }

        public bool Modificar(BE.Bitacora Bitacora)
        {
            throw new NotImplementedException();
        }
        #endregion

        #region Icrud
        public bool Create(BE.Bitacora Bitacora)
        {
            return DAL.Bitacora.GetInstancia().Create(Bitacora);
        }

        public bool Delete(BE.Bitacora Bitacora)
        {
            throw new NotImplementedException();
        }

        public List<BE.Bitacora> RetreiveAll()
        {
            throw new NotImplementedException();
        }

        public bool Update(BE.Bitacora Bitacora)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
