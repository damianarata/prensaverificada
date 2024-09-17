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
        public bool Agregar(BE.Usuario NewUser)
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
            //return DAL.Usuario.GetInstancia().Login(User);
            throw new NotImplementedException();
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

        public static BE.Usuario Verificar_Usuario(string email, string contrasena)
        {
            // Crear un objeto Usuario con los datos ingresados
            BE.Usuario DBUser = DAL.Usuario.Login(new BE.Usuario { Email = email, Contrasena = contrasena });

            // Validar si la contraseña ingresada coincide con la contraseña en la base de datos
            if (DBUser != null && DBUser.Contrasena == contrasena)
            {
                return DBUser; // Si las contraseñas coinciden, devolver el usuario encontrado
            }

            // Si no coincide la contraseña, devolver un usuario con UsuarioID = 0
            return new BE.Usuario { UsuarioID = 0 };
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
