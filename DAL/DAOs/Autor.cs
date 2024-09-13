using System;
using System.Collections.Generic;
using System.Data;
using BE;

namespace DAL.DAOs
{
    public class Autor
    {
        private Autor() { }

        public static Autor _instancia;

        public static Autor GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Autor();
            }
            return _instancia;
        }

        public bool Create(BE.Autor autor)
        {
            string query = string.Format("INSERT INTO autores (nombre, biografia, twitter, instagram, foto) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}');",
                autor.Nombre, autor.Biografia, autor.Twitter, autor.Instagram, autor.Foto);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public List<BE.Autor> RetreiveAll()
        {
            List<BE.Autor> autores = new List<BE.Autor>();
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader("SELECT * FROM autores");
            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    autores.Add(MAPPER.Autor.GetInstancia().Map(row));
                }
            }
            return autores;
        }

        public bool Update(BE.Autor autor)
        {
            string query = string.Format("UPDATE autores SET nombre = '{0}', biografia = '{1}', twitter = '{2}', instagram = '{3}', foto = '{4}' WHERE autorid = {5}",
                autor.Nombre, autor.Biografia, autor.Twitter, autor.Instagram, autor.Foto, autor.AutorID);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public bool Delete(BE.Autor autor)
        {
            string query = string.Format("DELETE FROM autores WHERE autorid = {0}", autor.AutorID);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }
    }
}