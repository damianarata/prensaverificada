using System;
using System.Data;

namespace DAL.MAPPER
{
    public class Autor
    {
        private Autor() { }

        static Autor _instancia;

        public static Autor GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Autor();
            }

            return _instancia;
        }

        public BE.Autor Map(DataRow row)
        {
            BE.Autor autor = new BE.Autor();
            autor.AutorID = Convert.ToInt32(row["autorid"]);
            autor.Nombre = row["nombre"].ToString();
            autor.Biografia = row["biografia"].ToString();
            autor.Twitter = row["twitter"].ToString();
            autor.Instagram = row["instagram"].ToString();
            autor.Foto = row["foto"].ToString();
            return autor;
        }
    }
}
