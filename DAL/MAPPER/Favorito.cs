using System;
using System.Data;

namespace DAL.MAPPER
{
    public class Favorito
    {
        private Favorito() { }

        static Favorito _instancia;

        public static Favorito GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Favorito();
            }

            return _instancia;
        }

        public BE.Favorito Map(DataRow row)
        {
            BE.Favorito Favorito = new BE.Favorito();
            Favorito.FavoritoID = Convert.ToInt32(row["Favoritoid"]);
            Favorito.UsuarioID = 2314; //row["nombre"].ToString();
            return Favorito;
        }
    }
}
