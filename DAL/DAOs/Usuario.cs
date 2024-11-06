using System;
using System.Collections.Generic;
using System.Data;
using BE;

namespace DAL.DAOs
{
    public class Usuario
    {
        private Usuario() { }

        public static Usuario _instancia;

        public static Usuario GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Usuario();
            }
            return _instancia;
        }

        public bool Create(BE.Usuario usuario)
        {
            string adminValue = usuario.Admin.HasValue ? (usuario.Admin.Value ? "1" : "0") : "NULL";
            string blockedValue = usuario.Blocked.HasValue ? (usuario.Blocked.Value ? "1" : "0") : "NULL";
            string retryValue = usuario.Retry.HasValue ? usuario.Retry.Value.ToString() : "NULL";

            string query = string.Format(
                "INSERT INTO usuarios (nombre, email, contrasena, fecharegistro, admin, blocked, codigo, retry) " +
                "VALUES ('{0}', '{1}', '{2}', '{3}', {4}, {5}, '{6}', {7});",
                usuario.Nombre,
                usuario.Email,
                usuario.Contrasena,
                usuario.FechaRegistro.ToString("yyyy-MM-dd"),
                adminValue,
                blockedValue,
                usuario.Codigo,
                retryValue
            );

            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public bool Update(BE.Usuario usuario)
        {
            string adminValue = usuario.Admin.HasValue ? (usuario.Admin.Value ? "1" : "0") : "NULL";
            string blockedValue = usuario.Blocked.HasValue ? (usuario.Blocked.Value ? "1" : "0") : "NULL";
            string retryValue = usuario.Retry.HasValue ? usuario.Retry.Value.ToString() : "NULL";

            string query = string.Format(
                "UPDATE usuarios SET nombre = '{0}', email = '{1}', contrasena = '{2}', fecharegistro = '{3}', " +
                "admin = {4}, blocked = {5}, codigo = '{6}', retry = {7} WHERE usuarioid = {8};",
                usuario.Nombre,
                usuario.Email,
                usuario.Contrasena,
                usuario.FechaRegistro.ToString("yyyy-MM-dd"),
                adminValue,
                blockedValue,
                usuario.Codigo,
                retryValue,
                usuario.UsuarioID
            );

            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }


        public List<BE.Usuario> RetreiveAll()
        {
            List<BE.Usuario> usuarios = new List<BE.Usuario>();
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader("SELECT * FROM usuarios");
            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    usuarios.Add(MAPPER.Usuario.GetInstancia().Map(row));
                }
            }
            return usuarios;
        }

        public BE.Usuario Retreive(BE.Usuario user)
        {
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader(string.Format("SELECT * FROM PrensaVerificada.dbo.usuarios WHERE usuarioid = '{0}'", user.UsuarioID.ToString()));

            if (dt.Rows.Count != 0)
            {
                DataRow row = dt.Rows[0];
                user = MAPPER.Usuario.GetInstancia().Map(row);
            }

            return user;
        }

        public bool Delete(BE.Usuario usuario)
        {
            string query = string.Format("DELETE FROM usuarios WHERE usuarioid = {0}", usuario.UsuarioID);
            return AccesoDatos.GetInstancia().ExecuteQuery(query);
        }

        public BE.Usuario Login(BE.Usuario Usuario)
        {
            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader(string.Format("SELECT * FROM PrensaVerificada.dbo.usuarios WHERE email = '{0}'", Usuario.Email));
            if (dt.Rows.Count != 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    Usuario = MAPPER.Usuario.GetInstancia().Map(row);
                }
            }
            return Usuario;
        }

        public bool ExisteEmail(string email)
        {
            string query = string.Format(
                @"SELECT 1
          FROM dbo.usuarios
          WHERE email = '{0}'", email);

            DataTable dt = AccesoDatos.GetInstancia().ExecuteReader(query);
            return dt.Rows.Count > 0;
        }


    }
}
