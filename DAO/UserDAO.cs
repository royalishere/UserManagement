using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UserManagement.DAO
{
    public class UserDAO
    {
        private static UserDAO instance;

        public static UserDAO Instance 
        {
            get 
            {
                if (instance == null)   
                    instance = new UserDAO();
                return instance;
            } 
            set => instance = value; 
        }

        private UserDAO() { }

        public DataTable GetListUser()
        {
            string query = "SELECT USERNAME, CREATED FROM DBA_USERS WHERE USERNAME IN ( SELECT MANV FROM NHANVIEN ) ORDER BY CREATED DESC";

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            return data;
        }


        public bool CreateUser(string userName, string passWord)
        {
            //string query = "EXECUTE SP_CREATE_EACH_NHANVIEN";
            //string query = "CREATE USER " + userName + " IDENTIFIED BY " + passWord;
            string query = "SP_CREATE_EACH_NHANVIEN";

            int result = DataProvider.Instance.ExecuteProcedure(query, new string[] {"userName", "passWord"}, new object[] {userName, passWord});

            return result > 0;
        }

        public DataTable GetListPrivilegeUser(string userName)
        {
            string query = "SELECT grantee,owner,table_name,grantor,privilege,grantable,type FROM DBA_TAB_PRIVS WHERE GRANTEE = '" + userName + "'";

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            return data;
        }
    }
}
