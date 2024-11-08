using System;
using System.Collections.Generic;
using BE;
using System.Globalization;
using System.Data;

namespace BLL
{
    public class Bitacora : ICrud<BE.Bitacora>
    {
        #region Singleton
        public Bitacora() { }

        public static Bitacora _instancia;

        public static Bitacora GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new Bitacora();
            }
            return _instancia;
        }
        #endregion

        #region Bitacora Ops
        public bool Agregar(BE.Bitacora NewBitacora)
        {
            throw new NotImplementedException();
        }

        public void RegistroBitacora(int uid, int id, string extra = "")
        {
            BE.Bitacora bitacora = new BE.Bitacora
            {
                UsuarioID = uid,
                Fecha = DateTime.Now
            };

            switch (id)
            {
                case 1:
                    bitacora. Accion = "Inicio de sesión";
                    bitacora.Criticidad = "INFO";
                    break;
                case 2:
                    bitacora.Accion = "Actualización de perfil";
                    bitacora.Criticidad = "INFO";
                    break;
                case 3:
                    bitacora.Accion = "Cargar top publicaciones";
                    bitacora.Criticidad = "INFO";
                    break;
                case 4:
                    bitacora.Accion = "Intento fallido de incio de sesión";
                    bitacora.Criticidad = "WARN";
                    break;
                case 5:
                    bitacora.Accion = "Cambio de contraseña";
                    bitacora.Criticidad = "WARN";
                    break;
                case 6:
                    bitacora.Accion = "Recuperación de clave";
                    bitacora.Criticidad = "CRIT";
                    break;
                case 7:
                    bitacora.Accion = "Actualizar perfil";
                    bitacora.Criticidad = "WARN";
                    break;
                case 8:
                    bitacora.Accion = "Leer publicación ";
                    bitacora.Criticidad = "INFO";
                    break;
                case 9:
                    bitacora.Accion = "Agregado a favoritos ";
                    bitacora.Criticidad = "INFO";
                    break;
                case 10:
                    bitacora.Accion = "Eliminado de favoritos ";
                    bitacora.Criticidad = "INFO";
                    break;
                case 11:
                    bitacora.Accion = "Búsqueda Avanzada";
                    bitacora.Criticidad = "INFO";
                    break;
                case 12:
                    bitacora.Accion = "Nuevo usuario ";
                    bitacora.Criticidad = "INFO";
                    break;
                case 13:
                    bitacora.Accion = "Crear reclamo";
                    bitacora.Criticidad = "CRIT";
                    break;
                case 14:
                    bitacora.Accion = "Usuario bloquado";
                    bitacora.Criticidad = "CRIT";
                    break;
                case 15:
                    bitacora.Accion = "Cargar autor ";
                    bitacora.Criticidad = "INFO";
                    break;
                case 16:
                    bitacora.Accion = "Cargar autores";
                    bitacora.Criticidad = "INFO";
                    break;
                case 17:
                    bitacora.Accion = "Realizar busqueda";
                    bitacora.Criticidad = "INFO";
                    break;
                case 18:
                    bitacora.Accion = "Cargar categorias";
                    bitacora.Criticidad = "INFO";
                    break;
                case 19:
                    bitacora.Accion = "Publicacion actualizada ";
                    bitacora.Criticidad = "INFO";
                    break;
                case 20:
                    bitacora.Accion = "Codigo de restauracion enviado a ";
                    bitacora.Criticidad = "WARN";
                    break;
                case 21:
                    bitacora.Accion = "Cargar favoritos";
                    bitacora.Criticidad = "INFO";
                    break;
                case 22:
                    bitacora.Accion = "Cargar publicaciones";
                    bitacora.Criticidad = "INFO";
                    break;
                case 23:
                    bitacora.Accion = "Cargar reclamos";
                    bitacora.Criticidad = "INFO";
                    break;
                case 24:
                    bitacora.Accion = "Email de recuperacion enviado a ";
                    bitacora.Criticidad = "WARN";
                    break;
                case 25:
                    bitacora.Accion = "Recuperacion de cuenta a ";
                    bitacora.Criticidad = "CRIT";
                    break;
                case 26:
                    bitacora.Accion = "Error de usuario o contraseña";
                    bitacora.Criticidad = "WARN";
                    break;
                default:
                    bitacora.Accion = "Accion desconocida";
                    bitacora.Criticidad = "INFO";
                    break;
            }

            if (!string.IsNullOrEmpty(extra))
            {
                bitacora.Accion += $" - {extra}";
            }

            BLL.Bitacora.GetInstancia().Create(bitacora);
        }


        public bool Eliminar(int BitacoraID)
        {
            throw new NotImplementedException();
        }

        public List<BE.Bitacora> Listar(int skipCount = 0)
        {
            return DAL.DAOs.Bitacora.GetInstancia().RetreiveAll(skipCount);
        }

        public List<BE.Bitacora> ListarConFiltros(DateTime? startDate, DateTime? endDate, string username, string operationType, int skipCount = 0)
        {
            string startDate1 = null;
            string endDate1 = null;

            if (startDate.HasValue)
            {
                startDate1 = startDate.Value.ToString("dd/MM/yyyy");
            }

            if (endDate.HasValue)
            {
                endDate1 = endDate.Value.ToString("dd/MM/yyyy");
            }

            // Llamada a ObtenerConFiltros con el parámetro actualizado
            return DAL.DAOs.Bitacora.GetInstancia().ObtenerConFiltros(startDate1, endDate1, username, operationType, skipCount);
        }

        public DataTable getReport(string filter)
        {
            return DAL.DAOs.Bitacora.GetInstancia().getReport(filter);
        }

        public BE.Bitacora RetrieveBitacora(BE.Bitacora Bitacora)
        {
            throw new NotImplementedException();
        }

        public bool Modificar(BE.Bitacora Bitacora)
        {
            throw new NotImplementedException();
        }
        #endregion

        #region Icrud
        public bool Create(BE.Bitacora Bitacora)
        {
            return DAL.Bitacora.GetInstancia().Create(Bitacora);
        }

        public bool Delete(BE.Bitacora Bitacora)
        {
            throw new NotImplementedException();
        }

        public List<BE.Bitacora> RetreiveAll()
        {
            throw new NotImplementedException();
        }

        public bool Update(BE.Bitacora Bitacora)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
