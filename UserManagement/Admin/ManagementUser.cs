using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using UserManagement.DAO;
using UserManagement.DTO;
using Oracle.ManagedDataAccess.Client;

namespace UserManagement.Admin
{
    public partial class ManagementUser : Form
    {
        Thread t;
        public ManagementUser()
        {
            InitializeComponent();
            tabctrl_SelectedIndexChanged(null, null);
        }

        // load tabcontrol when switch tab
        private void tabctrl_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tabctrl.SelectedTab == tpTable)
            {
                FillCombobox();
            }
            else if (tabctrl.SelectedTab == tpUser)
            {
                FillCombobox();
                LoadUserPrivs();
                LoadUser();
            }
            else if(tabctrl.SelectedTab == tpRole)
            {
                LoadListRole();
                LoadListAllObjects();
                LoadListNhanVien();
            }
            else
            {
                loadAudit();
            }
        }   
        //----------------------- SYSTEM TABLE TAB--------------------------
        private void FillCombobox()
        {
            string cmd = "select table_name from user_tables union select view_name from user_views";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            OracleDataReader reader = command.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            cbTable.DataSource = dt;
            cb_tables.DataSource = dt;
            cbTable.DisplayMember = "TABLE_NAME";
            cb_tables.DisplayMember = "TABLE_NAME";
        }

        private void cbTable_SelectedIndexChanged(object sender, EventArgs e)
        {
            string table_name = cbTable.Text;
            string cmd = "select distinct(column_name) from all_tab_columns where table_name = '" + table_name + "'";
            OracleCommand command = new OracleCommand("select * from " + cbTable.Text, LoginForm.con);
            try
            {
                OracleDataAdapter adapter = new OracleDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                dg_system.DataSource = dt;
            }
            catch
            {
                //reset datagirdview
                dg_system.DataSource = null;
            }
            try
            {
                command = new OracleCommand(cmd, LoginForm.con);
                OracleDataReader reader = command.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                fpn_column.Controls.Clear();
                foreach (DataRow row in dt.Rows)
                {
                    CheckBox checkBox = new CheckBox();
                    checkBox.Text = row["COLUMN_NAME"].ToString();
                    fpn_column.Controls.Add(checkBox);
                }
            }
            catch
            {
                fpn_column.Controls.Clear();
            }
        }

        private void dg_system_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string columnHeader = dg_system.Columns[0].HeaderText;
            if (columnHeader == "MANV")
            {
                tbxusrname.Text = dg_system.CurrentRow.Cells[0].Value.ToString();
            }
        }

        private void createview_btn_Click(object sender, EventArgs e)
        {
            string cols = getSelectedCol(fpn_column);
            string viewname = txb_viewname.Text;
            string obj = cbTable.Text;
            OracleCommand cmd = new OracleCommand("create_view", LoginForm.con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("viewname", OracleDbType.Varchar2).Value = viewname;
            cmd.Parameters.Add("cols", OracleDbType.Varchar2).Value = cols;
            cmd.Parameters.Add("obj", OracleDbType.Varchar2).Value = obj;
            if(viewname == "" || cols == "")
            {
                MessageBox.Show("Tên view và cột không được để trống");
                return;
            }
            try
            {
                cmd.ExecuteNonQuery();
                MessageBox.Show("Tạo view thành công");

                FillCombobox();
            }
            catch
            {
                MessageBox.Show("View đã tồn tại hoặc không đủ quyền hạn");
            }
        }

        private void drop_btn_Click(object sender, EventArgs e)
        {
            string objects = cbTable.Text;
            string cmd = "select object_type from user_objects where object_name = '" + objects + "'";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            OracleDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                if (reader.GetString(0) == "VIEW")
                {
                    cmd = "DROP VIEW " + objects;
                }
                else
                {
                    cmd = "DROP TABLE " + objects;
                }
            }
            try
            {
                command = new OracleCommand(cmd, LoginForm.con);
                command.ExecuteNonQuery();
                MessageBox.Show("Drop " + objects + " thành công");
                FillCombobox();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void createuser_btn_Click(object sender, EventArgs e)
        {
            string username = tbxusrname.Text.Trim();
            string password = tbxpass.Text;
            string pass_confirm = tbxpass_confirm.Text;
            string is_lock = "";
            if(ckb_islock.Checked)
            {
                is_lock = "ACCOUNT LOCK";
            }
            if(password == "")
            {
                MessageBox.Show("Mật khẩu không được để trống!");
                return;
            }
            if(password != pass_confirm)
            {
                MessageBox.Show("Mật khẩu không khớp!");
                return;
            }
            else
            {
                OracleCommand command = new OracleCommand("create_user", LoginForm.con);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("username", OracleDbType.Varchar2).Value = username;
                command.Parameters.Add("password", OracleDbType.Varchar2).Value = password;
                command.Parameters.Add("is_lock", OracleDbType.Varchar2).Value = is_lock;
                try
                {
                    command.ExecuteNonQuery();
                    MessageBox.Show("Tạo user " + username + " thành công");
                }
                catch
                {
                    MessageBox.Show("Username/role đã tồn tại trong hệ thống");
                }
            }
        }

        //----------------------- USER TAB--------------------------
        private void LoadUser()
        {
            string cmd = "select username, account_status, lock_date, created, authentication_type from dba_users";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                OracleDataReader reader = command.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                dg_user.DataSource = dt;
            }
            catch
            {
                //reset datagirdview
                dg_user.DataSource = null;
            }
        }

        private void dg_user_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string columnHeader = dg_user.Columns[0].HeaderText;
            if (columnHeader == "USERNAME")
            {
                tbxusername.Text = dg_user.CurrentRow.Cells[0].Value.ToString();
            }
        }

        private void dropuser_btn_Click(object sender, EventArgs e)
        {
            string user = tbxusername.Text;
            string cmd = "drop user " + user + " cascade";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                command.ExecuteNonQuery();
                MessageBox.Show("Drop user successsfully");
                tbxusername.Text = "";
                LoadUser();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void upduser_btn_Click(object sender, EventArgs e)
        {
            OracleCommand command = new OracleCommand("usr_change_pass", LoginForm.con);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("username", OracleDbType.Varchar2).Value = tbxusername.Text;
            command.Parameters.Add("password", OracleDbType.Varchar2).Value = tbxpassword.Text;
            if (cbislock.Checked)
            {
                command.Parameters.Add("islock", OracleDbType.Varchar2).Value = "ACCOUNT LOCK";
            }
            else
            {
                command.Parameters.Add("islock", OracleDbType.Varchar2).Value = "ACCOUNT UNLOCK";
            }
            try
            {
                command.ExecuteNonQuery();
                MessageBox.Show("Cập nhật thông tin " + tbxusername.Text + " thành công");
                LoadUser();
            }
            catch
            {
                MessageBox.Show("User không tồn tại hoặc tình trạng user không khả dụng");
            }
        }

        private void LoadUserPrivs()
        {
            // load privileges into datagridview user_tab_privs
            string cmd = "select * from user_tab_privs";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            OracleDataReader reader = command.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            dg_usertabprivs.DataSource = dt;
            

            //load privileges into datagridview user_col_privs
            cmd = "select * from user_col_privs";
            command = new OracleCommand(cmd, LoginForm.con);
            reader = command.ExecuteReader();
            dt = new DataTable();
            dt.Load(reader);
            dg_usercolprivs.DataSource = dt;
            
        }

        private void cb_tables_SelectedIndexChanged(object sender, EventArgs e)
        {
            string table_name = cb_tables.Text;
            string cmd = "select distinct(column_name) from all_tab_columns where table_name = '" + table_name + "'";
            try
            {
                OracleCommand command = new OracleCommand(cmd, LoginForm.con);
                OracleDataReader reader = command.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                fpn_user.Controls.Clear();
                foreach (DataRow row in dt.Rows)
                {
                    CheckBox checkBox = new CheckBox();
                    checkBox.Text = row["COLUMN_NAME"].ToString();
                    fpn_user.Controls.Add(checkBox);
                }
            }
            catch
            {
                fpn_user.Controls.Clear();
            }
        }

        private void textBox3_KeyPress(object sender, KeyPressEventArgs e)
        {
            string cmd = "select username, account_status, lock_date, created, authentication_type from dba_users where username like \'%" + textBox3.Text.ToUpper() + "%\'";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                OracleDataReader reader = command.ExecuteReader();
                DataTable dataTable = new DataTable();
                dataTable.Load(reader);
                dg_user.DataSource = dataTable;
                
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private string getSelectedCol(FlowLayoutPanel f)
        {
            string cols = "";
            foreach (Control c in f.Controls)
            {
                CheckBox cb = c as CheckBox;
                if (cb.Checked)
                {
                    cols += cb.Text + ",";
                }
            }
            if (cols != "")
            {
                cols = cols.Substring(0, cols.Length - 1); ;
            }
            return cols;
        }

        private string getGrantPrivs()
        {
            string privs = "";
            string cols = getSelectedCol(fpn_user);
            if (cols != "")
            {
                if (insertcb.Checked)
                {
                    privs += "insert (" + cols + "),";
                }
                if (updatecb.Checked)
                {
                    privs += "update (" + cols + "),";
                }
            }
            else
            {
                if (insertcb.Checked)
                {
                    privs += "insert,";
                }
                if (updatecb.Checked)
                {
                    privs += "update,";
                }
            }
            if (selectcb.Checked)
            {
                privs += "select,";
            }
            if (delcb.Checked)
            {
                privs += "delete,";
            }
            if (privs != "")
            {
                privs = privs.Substring(0, privs.Length - 1);
            }
            return privs;
        }

        private string getRevokePrivs()
        {
            string privs = "";
            if (insertcb.Checked)
            {
                privs += "insert,";
            }
            if (updatecb.Checked)
            {
                privs += "update,";
            }
            if (selectcb.Checked)
            {
                privs += "select,";
            }
            if (delcb.Checked)
            {
                privs += "delete,";
            }
            if (privs != "")
            {
                privs = privs.Substring(0, privs.Length - 1);
            }
            return privs;
        }

        private void grantbtn_Click(object sender, EventArgs e)
        {
            string grantee = tbxusername.Text;
            string obj = cb_tables.Text;
            string grantable = "";
            if (grant_optcb.Checked)
            {
                grantable = " with grant option";
            }
            string privs = getGrantPrivs();

            if (privs != "" && grantee != "" && obj != "")
            {
                OracleCommand cmd = new OracleCommand("grant_user_privs", LoginForm.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("privs", OracleDbType.Varchar2).Value = privs;
                cmd.Parameters.Add("obj", OracleDbType.Varchar2).Value = obj;
                cmd.Parameters.Add("grantee", OracleDbType.Varchar2).Value = grantee;
                cmd.Parameters.Add("grantable", OracleDbType.Varchar2).Value = grantable;
                try
                {

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Cấp quyền cho " + grantee + " thành công");
                    LoadUserPrivs();
                }
                catch
                {
                    MessageBox.Show("Không thể thực hiện chức năng này. Thử lại sau");
                }
            }
        }

        private void revokebtn_Click(object sender, EventArgs e)
        {
            string grantee = tbxusername.Text;
            string obj = cb_tables.Text;
            string privs = getRevokePrivs();
            if (privs != "" && grantee != "" && obj != "")
            {
                OracleCommand cmd = new OracleCommand("revoke_user_privs", LoginForm.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("privs", OracleDbType.Varchar2).Value = privs;
                cmd.Parameters.Add("obj", OracleDbType.Varchar2).Value = obj;
                cmd.Parameters.Add("grantee", OracleDbType.Varchar2).Value = grantee;
                try
                {

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Lấy lại quyền từ " + grantee + " thành công");
                    LoadUserPrivs();
                }
                catch
                {
                    MessageBox.Show("Không thể thực hiện chức năng này. Thử lại sau");
                }
            }
        }

        //----------------------- ROLE TAB--------------------------
        private void dtgvNhanVien_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string columnHeader = dtgvNhanVien.Columns[0].HeaderText;
            if(columnHeader == "ROLE")
            {
                txbRoleName.Text = dtgvNhanVien.CurrentRow.Cells[0].Value.ToString();
            }

        }

        private void LoadListRole()
        {
            try
            {
                dtgvRolePrivs.DataSource = RoleDAO.Instance.GetListRole();
            }
            catch (Exception ex) 
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void LoadListNhanVien()
        {
            try
            {
                dtgvNhanVien.DataSource = RoleDAO.Instance.GetListNhanVien();
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void LoadListAllObjects()
        {
            List<ObjectDTO> objectList = RoleDAO.Instance.LoadListObject();
            
            cbObjectName.DataSource = objectList;
            cbObjectName.DisplayMember = "nameObject";
        }

        private void cbObjectName_SelectedIndexChanged(object sender, EventArgs e)
        {
            string objectName = "";
            string objectType = "";

            System.Windows.Forms.ComboBox cb = sender as System.Windows.Forms.ComboBox;

            if (cb.SelectedItem != null)
            {
                objectName = (cb.SelectedItem as ObjectDTO).NameObject;
                objectType = (cb.SelectedItem as ObjectDTO).TypeObject;

                txbObjectType.Text = objectType;
            }
            string cmd = "select distinct(column_name) from all_tab_columns where table_name = '" + objectName + "'";
            try
            {
                OracleCommand command = new OracleCommand(cmd, LoginForm.con);
                OracleDataReader reader = command.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                
                fpn_role.Controls.Clear();
                foreach (DataRow row in dt.Rows)
                {
                    CheckBox checkBox = new CheckBox();
                    checkBox.Text = row["COLUMN_NAME"].ToString();
                    fpn_role.Controls.Add(checkBox);
                }
            }
            catch
            {
                fpn_role.Controls.Clear();
            }
        }

        private void bntSearchRole_Click(object sender, EventArgs e)
        {
            string roleName = txbRoleName.Text;

            try
            {
                dtgvRolePrivs.DataSource = RoleDAO.Instance.PrivsObject_Role(roleName);
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void bntShowRole_Click(object sender, EventArgs e)
        {
            LoadListRole();
        }

        private void bntCreateRole_Click(object sender, EventArgs e)
        {
            string roleName = txbRoleName.Text;
            string rolePassword = txbRolePassword.Text;
            string reEnterPassword = txbRoleReEnterPassword.Text;

            if (!reEnterPassword.Equals(rolePassword))
            {
                MessageBox.Show("Tạo role không thành công. Vui lòng điền đúng mật khẩu xác nhận!");
            }
            else
            {
                try
                {
                    RoleDAO.Instance.CreateRole(roleName, rolePassword);
                    MessageBox.Show("Tạo role thành công");
                    LoadListNhanVien();
                }
                catch(Exception ex)
                {
                    MessageBox.Show(ex.Message);    
                }
            }
        }

        private void bntDeleleteRole_Click(object sender, EventArgs e)
        {
            string roleName = txbRoleName.Text;

            try
            {
                RoleDAO.Instance.DeleteRole(roleName);
                MessageBox.Show("Role " + roleName + " đã xóa thành công!");
                LoadListNhanVien();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            LoadListRole();
        }

        private void bntChangePasswordRole_Click(object sender, EventArgs e)
        {
            string roleName = txbRoleName.Text;
            string rolePassword = txbRolePassword.Text;
            string reEnterPassword = txbRoleReEnterPassword.Text;

            if (!reEnterPassword.Equals(rolePassword))
            {
                MessageBox.Show("Đổi mật khẩu không thành công. Vui lòng điền đúng mật khẩu xác nhận!");
            }
            else
            {
                try
                {
                    RoleDAO.Instance.ChangePassWord(roleName, rolePassword);
                    MessageBox.Show("Role " + roleName + " thay đổi mật khẩu thành công!");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void bntGrantRole_Click(object sender, EventArgs e)
        {
            string roleName = txbRoleName.Text;
            string objectName = cbObjectName.Text;
            string columnName = getSelectedCol(fpn_role);
           
            try
            {
                if (ckbSelect.Checked)
                {
                    RoleDAO.Instance.Grant_ObjectPriv_Role(roleName, objectName, "SELECT", "");
                }
                if (ckbInsert.Checked)
                {
                    RoleDAO.Instance.Grant_ObjectPriv_Role(roleName, objectName, "INSERT", columnName);
                }
                if (ckbDelete.Checked)
                {
                    RoleDAO.Instance.Grant_ObjectPriv_Role(roleName, objectName, "DELETE", "");
                }
                if (ckbUpdate.Checked)
                {
                    RoleDAO.Instance.Grant_ObjectPriv_Role(roleName, objectName, "UPDATE", columnName);
                }
            }
            catch 
            {
                MessageBox.Show("Role không tồn tại hoặc không đủ quyền hạn!");
            }
            LoadListRole();
        }

        private void bntAddUserToRole_Click(object sender, EventArgs e)
        {
            string roleName = txbRoleName.Text;
            string userName = txbUserName.Text;

            try
            {
                if (ckbGrantable.Checked)
                {
                    RoleDAO.Instance.AddUser_ToRole(roleName, userName, true);
                    MessageBox.Show("Cấp role cho User "+ userName +" thành công!");
                }
                else
                {
                    RoleDAO.Instance.AddUser_ToRole(roleName, userName, false);
                    MessageBox.Show("Cấp role cho User " + userName + " thành công!");
                }
            }
            catch
            {
                MessageBox.Show("Role không tồn tại hoặc không đủ quyền hạn!");
            }
        }

        private void bntRevokeRole_Click(object sender, EventArgs e)
        {
            string roleName = txbRoleName.Text;
            string objectName = cbObjectName.Text;

            try
            {
                if (ckbSelect.Checked)
                {
                    RoleDAO.Instance.Revoke_ObjectPriv_Role(roleName, objectName, "SELECT");
                }
                if (ckbInsert.Checked)
                {
                    RoleDAO.Instance.Revoke_ObjectPriv_Role(roleName, objectName, "INSERT");
                }
                if (ckbDelete.Checked)
                {
                    RoleDAO.Instance.Revoke_ObjectPriv_Role(roleName, objectName, "DELETE");
                }
                if (ckbUpdate.Checked)
                {
                    RoleDAO.Instance.Revoke_ObjectPriv_Role(roleName, objectName, "UPDATE");
                }
            }
            catch
            {
                MessageBox.Show("Role không tồn tại hoặc không đủ quyền hạn!");
            }
            LoadListRole();
        }
        //-------------------------AUDIT TAB------------------------------
        
        private void loadAudit()
        {
            string cmd = "select dbusername, event_timestamp, action_name, object_schema, object_name, sql_text, sql_binds, fga_policy_name" +
                         " from  unified_audit_trail where (object_schema = 'ADMIN' or object_schema = 'NAM')";
            if (checkBox1.Checked)
            {
                cmd += " and fga_policy_name is not null";
            }
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                OracleDataReader reader = command.ExecuteReader();
                DataTable dataTable = new DataTable();
                dataTable.Load(reader);
                dgaudit.DataSource = dataTable;
                
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            loadAudit();
        }

        private void logout_btn_Click(object sender, EventArgs e)
        {
            LoginForm.con.Close();
            this.Close();

            t = new Thread(() => Application.Run(new LoginForm()));
            t.SetApartmentState(ApartmentState.STA);
            t.Start();
        }
    }
}
