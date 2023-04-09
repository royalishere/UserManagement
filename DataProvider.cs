using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

using Oracle.ManagedDataAccess.Client;
namespace PhanHe01.DAO
{
    public class DataProvider
    {
        private static DataProvider instance;

        public static DataProvider Instance
        {
            get
            {
                if (instance == null)
                    instance = new DataProvider();
                return instance;
            }
            set => instance = value;
        }

        private DataProvider() { }

        public DataTable ExecuteQuery(string query, object[] paramenter = null)
        {
            DataTable data = new DataTable();

            using (OracleConnection connection = new OracleConnection(fLogin.connectionStr))
            {
                connection.Open();

                OracleCommand command = new OracleCommand(query, connection);

                if (paramenter != null)
                {
                    String[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.Add(item, paramenter[i]);
                            i++;
                        }
                    }
                }

                OracleDataAdapter adapter = new OracleDataAdapter(command);

                adapter.Fill(data);

                connection.Close();
            }

            return data;
        }

        public int ExecuteNonQuery(string query, object[] paramenter = null)
        {
            int data = 0;

            using (OracleConnection connection = new OracleConnection(fLogin.connectionStr))
            {
                connection.Open();

                OracleCommand command = new OracleCommand(query, connection);

                if (paramenter != null)
                {
                    String[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.Add(item, paramenter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteNonQuery();

                connection.Close();
            }

            return data;
        }

        public object ExecuteScalar(string query, object[] paramenter = null)
        {
            object data = 0;

            using (OracleConnection connection = new OracleConnection(fLogin.connectionStr))
            {
                connection.Open();

                OracleCommand command = new OracleCommand(query, connection);

                if (paramenter != null)
                {
                    String[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.Add(item, paramenter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteScalar();

                connection.Close();
            }

            return data;
        }

        public int ExecuteProcedure(string procedureName, string[] name_parameters = null, object[] parameter = null)
        {
            int data = 0;

            using (OracleConnection connection = new OracleConnection(fLogin.connectionStr))
            {
                connection.Open();

                OracleCommand command = new OracleCommand(procedureName, connection);

                command.CommandType = CommandType.StoredProcedure;

                if (parameter != null)
                {
                    int i = 0;
                    foreach (string item in name_parameters)
                    {
                        OracleDbType dbType = GetOracleDbType(parameter[i]);
                        command.Parameters.Add(new OracleParameter(item, dbType)).Value = parameter[i];
                        i++;
                    }
                }

                data = command.ExecuteNonQuery();

                connection.Close();
            }

            return data;
        }

        private OracleDbType GetOracleDbType(object value)
        {
            Type type = value.GetType();
            if (type == typeof(string)) return OracleDbType.Varchar2;
            else if (type == typeof(int)) return OracleDbType.Int32;
            else if (type == typeof(DateTime)) return OracleDbType.Date;
            // Add more types as needed
            else throw new ArgumentException($"Unknown parameter type: {type}");
        }

        public object ExecuteFunction(string functionName, string[] name_parameter = null, object[] parameters = null)
        {
            object result = null;

            using (OracleConnection connection = new OracleConnection(fLogin.connectionStr))
            {
                connection.Open();

                OracleCommand command = new OracleCommand(functionName, connection);

                command.CommandType = CommandType.StoredProcedure;

                if (parameters != null)
                {
                    int i = 0;
                    foreach (string item in name_parameter)
                    {
                        OracleParameter parameter = new OracleParameter(name_parameter[i], parameters[i].GetType());
                        parameter.Direction = ParameterDirection.Input;
                        parameter.Value = parameters[i];
                        command.Parameters.Add(parameter);
                        i++;
                    }
                }

                OracleParameter returnParameter = new OracleParameter("result", OracleDbType.Varchar2, 4000);
                returnParameter.Direction = ParameterDirection.ReturnValue;
                command.Parameters.Add(returnParameter);

                command.ExecuteNonQuery();

                result = returnParameter.Value;

                connection.Close();
            }

            return result;
        }
    }
}
