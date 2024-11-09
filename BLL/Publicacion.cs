using System;
using System.Collections.Generic;
using BE;
using System.Linq;

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

        public List<BE.Publicacion> RetrieveLatestPublicaciones(int skipCount = 0)
        {
            return DAL.DAOs.Publicacion.GetInstancia().RetrieveLatestPublicaciones(skipCount);
        }

        public List<BE.Publicacion> RetrievePublicacionesPorAutor(int autorid, int skipCount = 0)
        {
            return DAL.DAOs.Publicacion.GetInstancia().RetrievePublicacionesPorAutor(autorid, skipCount);
        }

        public List<BE.Publicacion> RetrievePublicacionesPorAutorPublicadas(int autorid, int skipCount = 0)
        {
            return DAL.DAOs.Publicacion.GetInstancia().RetrievePublicacionesPorAutorPublicadas(autorid, skipCount);
        }

        public List<BE.Publicacion> RetrievePublicacionesPorCategoria(int autorid, int skipCount = 0)
        {
            return DAL.DAOs.Publicacion.GetInstancia().RetrievePublicacionesPorCategoria(autorid, skipCount);
        }

        public List<BE.Publicacion> RetrieveTop()
        {
            return DAL.DAOs.Publicacion.GetInstancia().RetreiveTop();
        }

        public List<BE.Publicacion> RetrievePublicacionesConFiltros(DateTime? startDate, DateTime? endDate, string author, string category, string title, string content, int skipCount)
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

            return DAL.DAOs.Publicacion.GetInstancia().RetrievePublicacionesConFiltros(startDate1, endDate1, author, category, title, content, skipCount);
        }

        public List<BE.Publicacion> RetrieveFavs(BE.Usuario usuario, int skip)
        {
            return DAL.DAOs.Publicacion.GetInstancia().RetrieveFavs(usuario, skip);
        }

        public bool CheckIfFavorite(BE.Publicacion Publi, int userid) {

            return DAL.DAOs.Publicacion.GetInstancia().CheckIfFavorite(Publi, userid);
        }


        public bool Modificar(BE.Publicacion Publicacion)
        {
            throw new NotImplementedException();
        }

        private static readonly Dictionary<int, string> EstadoMap = new Dictionary<int, string>
        {
            { 1, "activo" },
            { 2, "pausado" },
            { 3, "borrador" },
            { 4, "bloqueado" }
        };

        public string GetEstadoNombre(int estadoid)
        {
            return EstadoMap.TryGetValue(estadoid, out string nombre) ? nombre : "Desconocido";
        }

        private static readonly Dictionary<int, string> TipoLetraMap = new Dictionary<int, string>
        {
            { 1, "Arial" },
            { 2, "Times New Roman" },
            { 3, "Verdana" },
            { 4, "Courier New" },
            { 5, "Georgia" }
        };

        private static readonly Dictionary<string, int> TipoLetraIdMap = TipoLetraMap.ToDictionary(kvp => kvp.Value, kvp => kvp.Key);

        public string GetTipoLetraNombre(int tipoLetraId)
        {
            return TipoLetraMap.TryGetValue(tipoLetraId, out string nombre) ? nombre : "Arial";
        }

        public int GetTipoLetraId(string tipoLetraNombre)
        {
            return TipoLetraIdMap.TryGetValue(tipoLetraNombre, out int id) ? id : 1;
        }

        private static readonly Dictionary<int, string> TipoTamanoMap = new Dictionary<int, string>
        {
            { 1, "8" },
            { 2, "10" },
            { 3, "12" },
            { 4, "14" },
            { 5, "16" },
            { 6, "18" },
            { 7, "20" }
        };

        private static readonly Dictionary<string, int> TipoTamanoIdMap = TipoTamanoMap.ToDictionary(kvp => kvp.Value, kvp => kvp.Key);

        public string GetTipoTamanoNombre(int tipoTamanoId)
        {
            return TipoTamanoMap.TryGetValue(tipoTamanoId, out string nombre) ? nombre : "8";
        }

        public int GetTipoTamanoId(string tipoTamanoNombre)
        {
            return TipoTamanoIdMap.TryGetValue(tipoTamanoNombre, out int id) ? id : 1;
        }


        #endregion

        #region Icrud
        public bool Create(BE.Publicacion Publicacion)
        {
            return DAL.DAOs.Publicacion.GetInstancia().Create(Publicacion);
        }

        public bool Delete(BE.Publicacion Publicacion)
        {
            return DAL.DAOs.Publicacion.GetInstancia().Delete(Publicacion);
        }

        public List<BE.Publicacion> RetreiveAll()
        {
            throw new NotImplementedException();
        }

        public bool Update(BE.Publicacion Publicacion)
        {
            return DAL.DAOs.Publicacion.GetInstancia().Update(Publicacion);
        }
        #endregion
    }
}
