using System;
using System.Collections.Generic;
using BE;
using System.Globalization;
using System.Data;

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

        public List<BE.Bitacora> Listar(int skipCount = 0)
        {
            return DAL.DAOs.Bitacora.GetInstancia().RetreiveAll(skipCount);
        }

        public List<BE.Bitacora> ListarConFiltros(DateTime? startDate, DateTime? endDate, string username, string operationType, int skipCount = 0)
        {
            string startDate1 = null;
            string endDate1 = null;

            if (startDate.HasValue)
            {
                startDate1 = startDate.Value.ToString("dd/MM/yyyy");
            }

            if (endDate.HasValue)
            {
                endDate1 = endDate.Value.ToString("dd/MM/yyyy");
            }

            // Llamada a ObtenerConFiltros con el parámetro actualizado
            return DAL.DAOs.Bitacora.GetInstancia().ObtenerConFiltros(startDate1, endDate1, username, operationType, skipCount);
        }

        public DataTable getReport(string filter)
        {
            return DAL.DAOs.Bitacora.GetInstancia().getReport(filter);
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
