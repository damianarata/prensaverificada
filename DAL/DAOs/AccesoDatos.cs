using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace DAL.DAOs
{
    public class AccesoDatos
    {
        #region Singleton

        private AccesoDatos()
        {

        }

        public static AccesoDatos _instancia;

        public static AccesoDatos GetInstancia()
        {
            if (_instancia == null)
            {
                _instancia = new AccesoDatos();
            }

            return _instancia;
        }

        #endregion

        SqlConnection SQLconn = new SqlConnection(@"Data Source=.;Initial Catalog=PrensaVerificada;Integrated Security=True");


        #region ExecuteQuery
        public bool TestCon()
        {
            bool result = false;
            this.SQLconn = new SqlConnection(@"Data Source=.;Initial Catalog=PrensaVerificada;Integrated Security=True");
            try
            {
                SqlCommand comm = new SqlCommand();
                comm.Connection = SQLconn;
                SQLconn.Open();
                result = true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                result = false;
            }
            finally
            {
                SQLconn.Close();
            }
            return result;
        }
        public bool ExecuteQuery(string Query)
        {
            bool result = false;

            try
            {
                SqlCommand comm = new SqlCommand();
                comm.Connection = SQLconn;
                comm.CommandType = CommandType.Text;
                comm.CommandText = string.Format(Query);
                SQLconn.Open();
                int i;
                i = comm.ExecuteNonQuery();

                if (i > 0)
                {
                    result = true;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                result = false;
                Console.WriteLine(Query);
            }
            finally
            {
                SQLconn.Close();
            }
            return result;
        }

        public bool ExecuteQuery(string StoreProcedure, List<SqlParameter> Parametros)
        {
            bool result = false;

            try
            {
                SqlCommand comm = new SqlCommand();
                comm.Connection = SQLconn;
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = StoreProcedure;
                if (Parametros != null)
                {
                    foreach (SqlParameter item in Parametros)
                    {
                        comm.Parameters.Add(item);
                    }
                }
                SQLconn.Open();
                int i;
                i = comm.ExecuteNonQuery();

                if (i > 0)
                {
                    result = true;
                }

                SQLconn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                result = false;
            }
            return result;
        }

        public bool ExecuteQuery(string StoreProcedure, List<SqlParameter> Parametros, params SqlParameter[] _Parametros)

        {
            bool result = false;

            try
            {
                SqlCommand comm = new SqlCommand();
                comm.Connection = SQLconn;
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = StoreProcedure;

                if ((Parametros.Count > 0) && (_Parametros.Length == 0))
                {
                    foreach (SqlParameter item in Parametros)
                    {
                        comm.Parameters.Add(item);
                    }
                }

                if ((Parametros.Count == 0) && (_Parametros.Length > 0))
                {
                    comm.Parameters.AddRange(_Parametros);
                }
                else
                {
                    comm.Parameters.AddRange(_Parametros);

                }


                SQLconn.Open();
                int i;
                i = comm.ExecuteNonQuery();

                if (i > 0)
                {
                    result = true;
                }

                SQLconn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                result = false;
            }
            return result;
        }

        #endregion


        #region ExecuteReader
        public DataTable ExecuteReader(string Query)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = SQLconn;
                    comm.CommandType = CommandType.Text;
                    comm.CommandText = string.Format(Query);
                    SQLconn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(comm);
                    da.Fill(dt);
                    SQLconn.Close();
                    da.Dispose();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                Console.WriteLine(Query);
            }

            return dt;
        }

        public DataTable ExecuteReader(string StoreProcedure, List<SqlParameter> Parametros)
        {
            DataTable dt = new DataTable();

            try
            {
                SqlCommand comm = new SqlCommand();
                comm.Connection = SQLconn;
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = StoreProcedure;
                if (Parametros != null)
                {
                    foreach (SqlParameter item in Parametros)
                    {
                        comm.Parameters.Add(item);
                    }
                }

                SQLconn.Open();
                SqlDataAdapter da = new SqlDataAdapter(comm);
                da.Fill(dt);
                SQLconn.Close();
                da.Dispose();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

            return dt;
        }

        public DataTable ExecuteReader(string StoreProcedure, List<SqlParameter> Parametros, params SqlParameter[] _Parametros)
        {
            DataTable dt = new DataTable();

            try
            {
                SqlCommand comm = new SqlCommand();
                comm.Connection = SQLconn;
                comm.CommandType = CommandType.StoredProcedure;
                comm.CommandText = StoreProcedure;

                if ((Parametros.Count > 0) && (_Parametros.Length == 0))
                {
                    foreach (SqlParameter item in Parametros)
                    {
                        comm.Parameters.Add(item);
                    }
                }

                if ((Parametros.Count == 0) && (_Parametros.Length > 0))
                {
                    comm.Parameters.AddRange(_Parametros);
                }
                else
                {
                    comm.Parameters.AddRange(_Parametros);

                }

                SQLconn.Open();
                SqlDataAdapter da = new SqlDataAdapter(comm);
                da.Fill(dt);
                SQLconn.Close();
                da.Dispose();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

            return dt;
        }

        #endregion
    }
}
