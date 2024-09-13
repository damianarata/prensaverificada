using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;

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
            if (EncryptedPass == User.contrasena)
            {
                status = true;
            }
            return status;
        }
        public BE.Usuario RetrieveUser(BE.Usuario User)
        {
            return DAL.Usuario.Getinstancia().Login(User);
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
        public bool UsuariosExistentes(string User)
        {
            return DAL.Usuario.Getinstancia().UsuariosExistentes(User);
        }
        public bool EmailExistentes(string Email)
        {
            return DAL.Usuario.Getinstancia().EmailExistentes(Email);
        }
        public bool ActualizarUsuario(BE.Usuario User)
        {
            return DAL.Usuario.Getinstancia().Update(User);
        }
        #endregion
        #region Icrud
        public bool Create(BE.Usuario User)
        {
            return DAL.Usuario.Getinstancia().Create(User);
        }

        public bool Delete(BE.Usuario User)
        {
            throw new NotImplementedException();
        }

        public List<BE.Usuario> RetreiveAll()
        {
            return DAL.Usuario.Getinstancia().RetreiveAll();
        }

        public bool Update(BE.Usuario User)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
