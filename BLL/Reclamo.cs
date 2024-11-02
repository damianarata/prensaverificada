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
        private static readonly Dictionary<int, string> EstadoMap = new Dictionary<int, string>
        {
            { 1, "Pendiente" },
            { 2, "En Proceso" },
            { 3, "Resuelto" }
        };

        public string GetEstadoNombre(int estadoid)
        {
            return EstadoMap.TryGetValue(estadoid, out string nombre) ? nombre : "Desconocido";
        }

        public bool Agregar(BE.Reclamo NewReclamo)
        {
            throw new NotImplementedException();
        }

        public bool Eliminar(int ReclamoID)
        {
            throw new NotImplementedException();
        }

        public List<BE.Reclamo> Listar(int skipCount = 0)
        {
            return DAL.DAOs.Reclamo.GetInstancia().RetrieveAll(skipCount);
        }

        public BE.Reclamo RetrieveReclamo(int reclamoid)
        {
            return DAL.DAOs.Reclamo.GetInstancia().Retreive(new BE.Reclamo { ReclamoID = reclamoid });
        }

        public List<BE.Comentario> RetrieveComentario(int reclamoid)
        {
            return DAL.DAOs.Reclamo.GetInstancia().RetrieveComentario(new BE.Reclamo { ReclamoID = reclamoid });
        }

        public bool SaveComentario(BE.Comentario comentario)
        {
            return DAL.DAOs.Reclamo.GetInstancia().SaveComentario(comentario);
        }


        public bool Modificar(BE.Reclamo Reclamo)
        {
            throw new NotImplementedException();
        }
        #endregion

        #region Icrud
        public bool Create(BE.Reclamo Reclamo)
        {
            return DAL.DAOs.Reclamo.GetInstancia().Create(Reclamo);
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
            return DAL.DAOs.Reclamo.GetInstancia().Update(Reclamo);
        }
        #endregion
    }
}
