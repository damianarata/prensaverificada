using System;
using System.Data;
using BE;

namespace DAL.MAPPER
{
    public class Categoria
    {
        private Categoria() { }

        static Categoria _instancia;

        public static Categoria GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Categoria();
            }

            return _instancia;
        }

        public BE.Categoria Map(DataRow row)
        {
            BE.Categoria categoria = new BE.Categoria();
            categoria.CategoriaID = Convert.ToInt32(row["categoriaid"]);
            categoria.Nombre = row["nombre"].ToString();
            categoria.Imagen = row["imagen"].ToString();
            return categoria;
        }
    }
}
