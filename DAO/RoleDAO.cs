using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using UserManagement.Admin;
using UserManagement.Login;

namespace UserManagement.DAO
{
    public class RoleDAO
    {
        private static RoleDAO instance;

        public static RoleDAO Instance
        {
            get
            {
                if (instance == null)
                    instance = new RoleDAO();
                return instance;
            }
            set => instance = value;
        }

        private RoleDAO() { }


        public DataTable getListRole()
        {
            string query = "SELECT * FROM DBA_ROLES";
            //string query = "SELECT * FROM DBA_ROLES WHERE ROLE IN (SELECT DISTINCT VAITRO  FROM NHANVIEN)";
            OracleCommand command = new OracleCommand(query, LoginForm.con);
            OracleDataReader reader = command.ExecuteReader();
            DataTable data = new DataTable();
            data.Load(reader);

            return data;
        }

        public DataTable GetPrivs_ByNameRole(string roleName)
        {
            string query = "SELECT * FROM ROLE_TAB_PRIVS WHERE ROLE = '" + roleName + "'";
            OracleCommand command = new OracleCommand(query, LoginForm.con);
            OracleDataReader reader = command.ExecuteReader();
            DataTable data = new DataTable();
            data.Load(reader);
            return data;
        }

        public void DeleteRole_ByRoleName(string roleName)
        {
            string query = "SP_DELETE_ROLE";
            OracleCommand command = new OracleCommand(query, LoginForm.con);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("roleName", roleName);
            command.ExecuteNonQuery();
        }

        public bool CreateRole(string roleName, string rolePassword)
        {
            string query = "SP_CREATE_ROLE";
            OracleCommand command = new OracleCommand(query, LoginForm.con);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("roleName", roleName);
            command.Parameters.Add("rolePassword", rolePassword);
            command.ExecuteNonQuery();
            int result = 1;

            if (fCreateRole.temp_tabPrivs.Count > 0)
            {
                // roleName, objectName, columnName, privs
                foreach (var item in fCreateRole.temp_tabPrivs)
                {
                    query = "SP_GRANT_TAB_PRIVS_ROLE";
                    try
                    {
                        command = new OracleCommand(query, LoginForm.con);
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("roleName", roleName);
                        command.Parameters.Add("objectName", item.Item2);
                        command.Parameters.Add("columnName", item.Item3);
                        command.Parameters.Add("tabPrivs", item.Item4);
                        command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }

                }
            }

            return result > 0;
        }

        public bool UpdateRole(string roleName, string rolePassword)
        {
            string query = "SP_EDIT_ROLE";
            OracleCommand command = new OracleCommand(query, LoginForm.con);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("roleName", roleName);
            command.Parameters.Add("rolePassword", rolePassword);
            command.ExecuteNonQuery();
            int result = 1;

            return result > 0;
        }

        public DataTable LoadListAllObjects()
        {
            string query = "SELECT OBJECT_NAME, OBJECT_TYPE FROM ALL_OBJECTS WHERE OWNER = 'ADMIN' AND OBJECT_TYPE IN ('TABLE', 'VIEW', 'PROCEDURE','FUNCTION')";

            OracleCommand command = new OracleCommand(query, LoginForm.con);
            OracleDataReader reader = command.ExecuteReader();
            DataTable data = new DataTable();
            data.Load(reader);
            return data;
        }

        public DataTable GetColumnsEachTable_Or_View(string objectName, string typeObject)
        {
            string query = "";

            if (typeObject == "TABLE")
            {
                query = "SELECT COLUMN_NAME  FROM sys.dba_tab_columns  where TABLE_NAME = '" + objectName + "'";
            }
            else if (typeObject == "VIEW")
            {
                query = "SELECT col.column_name FROM sys.all_tab_columns col INNER JOIN sys.all_views v ON col.owner = v.owner AND col.table_name = '" + objectName + "'";
            }
            OracleCommand command = new OracleCommand(query, LoginForm.con);
            OracleDataReader reader = command.ExecuteReader();
            DataTable data = new DataTable();
            data.Load(reader);
            return data;
        }
    }
}
