using System;
using System.Collections.Generic;
using System.Data;
using BE;

namespace DAL.DAOs
{
    public class Categoria
    {
        private Categoria() { }

        public static Categoria _instancia;

        public static Categoria GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Categoria();
            }
            return _instancia;
        }

        public bool Create(BE.Categoria categoria)
        {
            string query = string.Format("INSERT INTO categorias (nombre) VALUES ('{0}');", categoria.Nombre);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public List<BE.Categoria> RetreiveAll()
        {
            List<BE.Categoria> categorias = new List<BE.Categoria>();
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader("SELECT * FROM categorias");
            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    categorias.Add(MAPPER.Categoria.GetInstancia().Map(row));
                }
            }
            return categorias;
        }

        public bool Update(BE.Categoria categoria)
        {
            string query = string.Format("UPDATE categorias SET nombre = '{0}' WHERE categoriaid = {1}",
                categoria.Nombre, categoria.CategoriaID);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public bool Delete(BE.Categoria categoria)
        {
            string query = string.Format("DELETE FROM categorias WHERE categoriaid = {0}", categoria.CategoriaID);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public DataTable RetrieveTop()
        {
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader("SELECT * FROM vw_categorias_mas_leidas ORDER BY total_lecturas DESC");
            return dt;
        }
    }
}
