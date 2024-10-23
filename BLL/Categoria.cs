using System;
using System.Collections.Generic;
using BE;
using System.Data;

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
            return DAL.DAOs.Categoria.GetInstancia().RetreiveAll();
        }
        public DataTable RetrieveTop()
        {
            return DAL.DAOs.Categoria.GetInstancia().RetrieveTop();
        }

        public BE.Categoria RetrieveCategoria(BE.Categoria Categoria)
        {
            throw new NotImplementedException();
        }

        public bool Modificar(BE.Categoria Categoria)
        {
            throw new NotImplementedException();
        }

        private static readonly Dictionary<int, string> CategoriaMap = new Dictionary<int, string>
        {
            { 1, "Política" },
            { 2, "Economía" },
            { 3, "Deportes" },
            { 4, "Tecnología" },
            { 5, "Viajes" }
        };
        public string GetCategoriaNombre(int categoriaid)
        {
            return CategoriaMap.TryGetValue(categoriaid, out string nombre) ? nombre : "Desconocida";
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
            return DAL.Categoria.GetInstancia().RetreiveAll();
        }

        public bool Update(BE.Categoria Categoria)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
