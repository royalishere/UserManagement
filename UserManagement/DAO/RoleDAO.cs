using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using UserManagement.DTO;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

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
            private set => instance = value;
        }

        private RoleDAO() { }


        public DataTable GetListRole()
        {
            string query = "SELECT * FROM ROLE_TAB_PRIVS WHERE OWNER = 'ADMIN' ORDER BY ROLE";

            OracleCommand command = new OracleCommand(query, LoginForm.con);
            OracleDataReader reader = command.ExecuteReader();
            DataTable data = new DataTable();
            data.Load(reader);
            return data;
        }

        public DataTable PrivsObject_Role(string roleName)
        {
            string query = "SELECT * FROM ROLE_TAB_PRIVS WHERE OWNER = 'ADMIN' AND ROLE = '" + roleName + "' ORDER BY ROLE";

            OracleCommand command = new OracleCommand(query, LoginForm.con);
            OracleDataReader reader = command.ExecuteReader();
            DataTable data = new DataTable();
            data.Load(reader);
            return data;
        }

        public DataTable GetListNhanVien()
        {
            string query = "select role, role_id, password_required, authentication_type from dba_roles"; // XUất ra user mới đúng
            //string query = "SELECT * FROM NHANVIEN WHERE MANV IN (SELECT USERNAME FROM ALL_USERS)";

            OracleCommand command = new OracleCommand(query, LoginForm.con);
            OracleDataReader reader = command.ExecuteReader();
            DataTable data = new DataTable();
            data.Load(reader);
            return data;
        }

        public List<ObjectDTO> LoadListObject()
        {
            List<ObjectDTO> obList = new List<ObjectDTO>();

            string query = "SELECT OBJECT_NAME, OBJECT_TYPE FROM ALL_OBJECTS WHERE OWNER = 'ADMIN' AND OBJECT_TYPE IN ('TABLE', 'VIEW')";

            OracleCommand command = new OracleCommand(query, LoginForm.con);
            OracleDataReader reader = command.ExecuteReader();
            DataTable data = new DataTable();
            data.Load(reader);

            foreach (DataRow item in data.Rows)
            {
                ObjectDTO ob = new ObjectDTO(item);
                obList.Add(ob);
            }

            return obList;
        }

        public DataTable GetColumnsEachTable_Or_View(string objectName, string objectType)
        {
            string query = "";

            if (objectType == "TABLE")
            {
                query = "SELECT COLUMN_NAME FROM sys.dba_tab_columns where OWNER = 'ADMIN' AND TABLE_NAME = '" + objectName + "'";
            }
            else if (objectType == "VIEW")
            {
                query = "SELECT column_name FROM sys.all_tab_columns col, sys.all_views v WHERE col.owner = 'ADMIN' AND col.owner = v.owner AND col.table_name = '" + objectName + "'";
            }
            OracleCommand command = new OracleCommand(query, LoginForm.con);
            OracleDataReader reader = command.ExecuteReader();
            DataTable data = new DataTable();
            data.Load(reader);
            return data;
        }

        public bool CreateRole(string roleName, string rolePassword)
        {
            int result = -1;
            string query = "SP_CREATE_ROLE";

            OracleCommand command = new OracleCommand(query, LoginForm.con);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("roleName", roleName);
            command.Parameters.Add("rolePassword", rolePassword);
            result = command.ExecuteNonQuery();
            return result > 0;
        }

        public void DeleteRole(string roleName)
        {
            string query = "SP_DELETE_ROLE";

            OracleCommand command = new OracleCommand(query, LoginForm.con);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("roleName", roleName);
            command.ExecuteNonQuery();
        }

        public void ChangePassWord(string roleName, string rolePassword)
        {
            string query = "SP_CHANGE_PASSWORD_ROLE";

            OracleCommand command = new OracleCommand(query, LoginForm.con);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("roleName", roleName);
            command.Parameters.Add("rolePassword", rolePassword);
            command.ExecuteNonQuery();
        }

        public void Grant_ObjectPriv_Role(string roleName, string objectName, string objectPrivs, string columnName)
        {
            string query = "ADMIN.SP_GRANT_TAB_PRIVS_ROLE";

            OracleCommand command = new OracleCommand(query, LoginForm.con);
            
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("roleName", roleName);
            command.Parameters.Add("objectName", objectName);
            command.Parameters.Add("columnName", columnName);
            command.Parameters.Add("tabPrivs", objectPrivs);

            command.ExecuteNonQuery();
        }

        public void Revoke_ObjectPriv_Role(string roleName, string objectName, string objectPrivs)
        {
            string query = "SP_REVOKE_ROLE";

            OracleCommand command = new OracleCommand(query, LoginForm.con);

            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("roleName", roleName);
            command.Parameters.Add("objectName", objectName);
            command.Parameters.Add("tabPrivs", objectPrivs);

            command.ExecuteNonQuery();
        }

        public void AddUser_ToRole(string roleName, string userName, bool grantable)
        {
            string query = "ADMIN.SP_GRANTROLE_TO_USER";

            OracleCommand command = new OracleCommand(query, LoginForm.con);
            
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("roleName", roleName);
            command.Parameters.Add("userName", userName);
            command.Parameters.Add("grantable", grantable);

            command.ExecuteNonQuery();
        }

    }
}
