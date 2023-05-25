using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using UserManagement.DAO;
using UserManagement.DTO;

namespace UserManagement.Admin
{
    public partial class ManagementUser : Form
    {
        public ManagementUser()
        {
            InitializeComponent();
            Load();
        }

        private void Load()
        {
            LoadListRole();
            LoadListAllObjects();
            LoadListNhanVien();
            AddBinding();
        }

        private void AddBinding()
        {
            txbUserName.DataBindings.Add("TEXT", dtgvNhanVien.DataSource, "MANV");
            txbRoleName.DataBindings.Add("Text", dtgvRolePrivs.DataSource, "ROLE", true, DataSourceUpdateMode.Never);
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

            ComboBox cb = sender as ComboBox;

            if (cb.SelectedItem != null)
            {
                objectName = (cb.SelectedItem as ObjectDTO).NameObject;
                objectType = (cb.SelectedItem as ObjectDTO).TypeObject;

                txbObjectType.Text = objectType;
            }

            cbColumnObject.DataSource = RoleDAO.Instance.GetColumnsEachTable_Or_View(objectName, objectType);
            cbColumnObject.DisplayMember = "COLUMN_NAME";
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
            string columnName = cbColumnObject.Text;
           
            if (ckbSelect.Checked) {
                RoleDAO.Instance.Grant_ObjectPriv_Role(roleName, objectName, "SELECT", "");
            }
            if (ckbInsert.Checked) {
                RoleDAO.Instance.Grant_ObjectPriv_Role(roleName, objectName, "INSERT", "");
            }
            if (ckbDelete.Checked) {
                RoleDAO.Instance.Grant_ObjectPriv_Role(roleName, objectName, "DELETE", "");
            }
            if (ckbUpdate.Checked) {
                RoleDAO.Instance.Grant_ObjectPriv_Role(roleName, objectName, "UPDATE", columnName);
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
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void bntRevokeRole_Click(object sender, EventArgs e)
        {
            string roleName = txbRoleName.Text;
            string objectName = cbObjectName.Text;

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

            LoadListRole();
        }
    }
}
