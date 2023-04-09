using PhanHe01.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PhanHe01.DAO
{
    public class RoleDAO
    {
        private static RoleDAO instance;

        public static RoleDAO Instance
        { 
            get
            {
                if(instance == null)
                    instance= new RoleDAO();
                return instance;
            }
            set => instance = value;
        }

        private RoleDAO() { }


        public DataTable getListRole()
        {
            string query = "SELECT * FROM DBA_ROLES";
            //string query = "SELECT * FROM DBA_ROLES WHERE ROLE IN (SELECT DISTINCT VAITRO  FROM NHANVIEN)";

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            return data;
        }

        public DataTable GetPrivs_ByNameRole(string roleName)
        {
            string query = "SELECT * FROM ROLE_TAB_PRIVS WHERE ROLE = '" + roleName + "'";

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            return data;
        }

        public void DeleteRole_ByRoleName(string roleName)
        {
            string query = "SP_DELETE_ROLE";

            DataProvider.Instance.ExecuteProcedure(query, new string[] { "roleName" }, new object[] { roleName });
        }

        public bool CreateRole(string roleName, string rolePassword)
        {
            string query = "SP_CREATE_ROLE";

            int result = DataProvider.Instance.ExecuteProcedure(query, new string[] {"roleName", "rolePassword"}, new object[] {roleName, rolePassword});

            if (fCreateRole.temp_tabPrivs.Count > 0)
            {
                // roleName, objectName, columnName, privs
                foreach (var item in fCreateRole.temp_tabPrivs)
                {
                    query = "SP_GRANT_TAB_PRIVS_ROLE";
                    try
                    {
                        DataProvider.Instance.ExecuteProcedure(query, new string[] { "roleName", "objectName", "columnName", "tabPrivs" }, new object[] { roleName, item.Item2, item.Item3, item.Item4});
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

            int result = DataProvider.Instance.ExecuteProcedure(query, new string[] { "roleName", "rolePassword" }, new object[] { roleName, rolePassword });

            return result > 0;
        }

        public DataTable LoadListAllObjects()
        {
            string query = "SELECT OBJECT_NAME, OBJECT_TYPE FROM ALL_OBJECTS WHERE OWNER = 'QLNHANVIEN' AND OBJECT_TYPE IN ('TABLE', 'VIEW', 'PROCEDURE','FUNCTION')";

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            return data;
        }

        public List<Role> GetListRoleSys()
        {
            List<Role> roleList = new List<Role>();
            string query = "SELECT ROLE FROM DBA_ROLES WHERE ROLE NOT IN (SELECT DISTINCT VAITRO  FROM NHANVIEN)";

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach(DataRow item in data.Rows)
            {
                Role role = new Role(item);
                roleList.Add(role);
            }

            return roleList;
        }

        public DataTable GetColumnsEachTable_Or_View(string objectName, string typeObject)
        {
            string query = "";

            if(typeObject == "TABLE")
            {
                query = "SELECT COLUMN_NAME  FROM sys.dba_tab_columns  where TABLE_NAME = '" + objectName + "'";
            }
            else if(typeObject == "VIEW")
            {
                query = "SELECT col.column_name FROM sys.all_tab_columns col INNER JOIN sys.all_views v ON col.owner = v.owner AND col.table_name = '" + objectName + "'";
            }

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            return data;
        }
    }
}
