using System;
using System.Collections.Generic;
using System.Data;
using BE;

namespace DAL.DAOs
{
    public class Favorito
    {
        private Favorito() { }

        public static Favorito _instancia;

        public static Favorito GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Favorito();
            }
            return _instancia;
        }

        public bool Create(BE.Favorito favorito)
        {
            string query = string.Format("INSERT INTO favoritos (usuarioid, publicacionid, fechaagregado) VALUES ({0}, {1}, '{2}');",
                favorito.UsuarioID, favorito.PublicacionID, favorito.FechaAgregado.ToString("yyyy-MM-dd"));
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public List<BE.Favorito> RetreiveAll()
        {
            List<BE.Favorito> favoritos = new List<BE.Favorito>();
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader("SELECT * FROM favoritos");
            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    favoritos.Add(MAPPER.Favorito.GetInstancia().Map(row));
                }
            }
            return favoritos;
        }

        public bool Update(BE.Favorito favorito)
        {
            string query = string.Format("UPDATE favoritos SET usuarioid = {0}, publicacionid = {1}, fechaagregado = '{2}' WHERE favoritoid = {3}",
                favorito.UsuarioID, favorito.PublicacionID, favorito.FechaAgregado.ToString("yyyy-MM-dd"), favorito.FavoritoID);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public bool Delete(BE.Favorito favorito)
        {
            string query = string.Format("DELETE FROM favoritos WHERE favoritoid = {0}", favorito.FavoritoID);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }
    }
}
