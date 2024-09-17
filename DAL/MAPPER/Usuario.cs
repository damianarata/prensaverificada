using System;
using System.Data;

namespace DAL.MAPPER
{
    public class Usuario
    {
        private Usuario() { }

        static Usuario _instancia;

        public static Usuario GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Usuario();
            }

            return _instancia;
        }

        public BE.Usuario Map(DataRow row)
        {
            BE.Usuario usuario = new BE.Usuario();
            usuario.UsuarioID = Convert.ToInt32(row["usuarioid"]);
            usuario.Nombre = row["nombre"].ToString();
            usuario.Email = row["email"].ToString();
            usuario.Contrasena = row["contrasena"].ToString();
            usuario.FechaRegistro = Convert.ToDateTime(row["fecharegistro"]);
            return usuario;
        }
    }
}
