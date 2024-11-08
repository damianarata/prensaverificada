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
            BE.Usuario usuario = new BE.Usuario
            {
                UsuarioID = Convert.ToInt32(row["usuarioid"]),
                Nombre = row["nombre"].ToString(),
                Email = row["email"].ToString(),
                Contrasena = row["contrasena"].ToString(),
                FechaRegistro = Convert.ToDateTime(row["fecharegistro"]),
                Admin = row["admin"] != DBNull.Value ? (bool?)Convert.ToBoolean(row["admin"]) : null,
                Blocked = row["blocked"] != DBNull.Value ? (bool?)Convert.ToBoolean(row["blocked"]) : null,
                Codigo = row["codigo"].ToString(),
                Retry = row["retry"] != DBNull.Value ? (int?)Convert.ToInt32(row["retry"]) : null
            };

            return usuario;
        }
    }
}
