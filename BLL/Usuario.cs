using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using DAL;

namespace BLL
{
    public class Usuario : ICrud<BE.Usuario>
    {
        #region Singleton
        public Usuario()
        {

        }

        public static Usuario _instancia;

        public static Usuario GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Usuario();
            }

            return _instancia;
        }
        #endregion
        
        #region Usuario Ops
        public BE.Usuario Agregar(BE.Usuario NewUser)
        {
            throw new NotImplementedException();
        }
        public bool CambiarContraseña(string NewPass)
        {
            throw new NotImplementedException();
        }
        public void CambiarIdioma(int id)
        {
            throw new NotImplementedException();
        }
        public bool Desbloquear(string User)
        {
            throw new NotImplementedException();
        }
        public bool Eliminar(string User)
        {
            throw new NotImplementedException();
        }
        
        public List<BE.Usuario> Listar()
        {
            throw new NotImplementedException();
        }
        public bool Login(BE.Usuario User, string EncryptedPass)
        {
            bool status = false;
            if (EncryptedPass == User.Contrasena)
            {
                status = true;
            }
            return status;
        }
        public BE.Usuario RetrieveUser(BE.Usuario User)
        {
            return DAL.DAOs.Usuario.GetInstancia().Retreive(User);
            
        }
        public void Logout()
        {
            //Dispose de los objetos, tanto BE, como BLL
            throw new NotImplementedException();
        }
        public void Modificar()
        {
            //Modificar la patente
            throw new NotImplementedException();
        }
        public bool RecuperarContraseña(string NewPass)
        {
            throw new NotImplementedException();
        }
        public bool ActualizarUsuario(BE.Usuario User)
        {
            return DAL.Usuario.GetInstancia().Update(User);
        }

        public bool EsEmailDisponible(string email)
        {
            return (!DAL.DAOs.Usuario.GetInstancia().ExisteEmail(email));
        }


        public static BE.Usuario Verificar_Usuario(string email, string contrasena)
        {
            BE.Usuario DBUser = DAL.Usuario.Login(new BE.Usuario { Email = email, Contrasena = contrasena });
            if (DBUser != null && DBUser.Contrasena == contrasena)
            {
                DBUser.Retry = 0;
                DBUser.Blocked = false;
                DAL.DAOs.Usuario.GetInstancia().Update(DBUser);
                BLL.Bitacora.GetInstancia().RegistroBitacora(DBUser.UsuarioID, 1);
                return DBUser;
            }
            else
            {
                if (DBUser.Blocked == true)
                {
                    BLL.Bitacora.GetInstancia().RegistroBitacora(DBUser.UsuarioID, 1);
                    return new BE.Usuario { UsuarioID = 0, Blocked = true };
                }
                DBUser.Retry += 1;
                BLL.Bitacora.GetInstancia().RegistroBitacora(DBUser.UsuarioID, 4);
                if (DBUser.Retry == 3)
                {
                    DBUser.Blocked = true;
                    BLL.Bitacora.GetInstancia().RegistroBitacora(DBUser.UsuarioID, 14);
                    DAL.DAOs.Usuario.GetInstancia().Update(DBUser);
                    return new BE.Usuario { UsuarioID = 0, Blocked = true };
                }
                DAL.DAOs.Usuario.GetInstancia().Update(DBUser);
            }
            return new BE.Usuario { UsuarioID = 0};
        }

        public static BE.Usuario Verificar_Codigo(string email, string codigo)
        {
            BE.Usuario DBUser = DAL.Usuario.Login(new BE.Usuario { Email = email, Codigo = codigo });
            if (DBUser != null && DBUser.Codigo == codigo)
            {
                return DBUser;
            }

            return new BE.Usuario { UsuarioID = 0 };
        }

        public string RecuperarPass(string email)
        {
            BE.Usuario DBUser = DAL.Usuario.Login(new BE.Usuario { Email = email });

            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var random = new Random();
            var codigo = new StringBuilder();

            for (int i = 0; i < 4; i++)
            {
                // Generar una sección de 4 caracteres
                for (int j = 0; j < 4; j++)
                {
                    codigo.Append(chars[random.Next(chars.Length)]);
                }

                // Agregar el guion entre cada grupo, excepto el último
                if (i < 3)
                {
                    codigo.Append("-");
                }
            }

            DBUser.Codigo = codigo.ToString();
            DAL.DAOs.Usuario.GetInstancia().Update(DBUser);
            return codigo.ToString();
        }

        // Usar esta funcion para saber si tiene que validarse la sesion o no.
        public bool Restriction () {
            return true;
        }

        #endregion
        #region Icrud
        public bool Create(BE.Usuario User)
        {
            return DAL.Usuario.GetInstancia().Create(User);
        }

        public bool Delete(BE.Usuario User)
        {
            throw new NotImplementedException();
        }

        public List<BE.Usuario> RetreiveAll()
        {
            return DAL.Usuario.GetInstancia().RetreiveAll();
        }

        public bool Update(BE.Usuario User)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
