using UserManagement.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UserManagement
{
    public partial class fEditRole : Form
    {
        private string role;
        public fEditRole(string roleName)
        {
            InitializeComponent();


            Role = roleName;
            txbEditRoleName.Text = Role;

            LoadListObjectPrivsRole();
            AddObjectBinding();
        }

        public string Role { get => role; set => role = value; }

        #region method

        void LoadListObjectPrivsRole()
        {
            dtgvEditRoleOjectPrivs.DataSource = RoleDAO.Instance.LoadListAllObjects();
        }

        void AddObjectBinding()
        {
            txbObjectName.DataBindings.Add("Text", dtgvEditRoleOjectPrivs.DataSource, "OBJECT_NAME", true, DataSourceUpdateMode.Never);
            txbObjectType.DataBindings.Add("Text", dtgvEditRoleOjectPrivs.DataSource, "OBJECT_TYPE", true, DataSourceUpdateMode.Never);
        }

        void LoadComboBox_Columns_Table_or_View()
        {
            string nameObjects = txbObjectName.Text;
            string typeObject = txbObjectType.Text;

            if (typeObject == "TABLE" || typeObject == "VIEW")
            {
                cbColumnsObject.DataSource = RoleDAO.Instance.GetColumnsEachTable_Or_View(nameObjects, typeObject);
                cbColumnsObject.DisplayMember = "COLUMN_NAME";
            }
        }

        #endregion

        #region events
        private void bntApplyRole_Click(object sender, EventArgs e)
        {
            txbEditRoleName.Text = this.Role;
            string roleName = txbEditRoleName.Text;
            string rolePassword = txbEditRolePass.Text;
            string roleReEnter = txbEditRoleReEnterPass.Text;

            if (rolePassword == "" || roleReEnter == "")
            {
                MessageBox.Show("Không được để trống thông tin password! Vui lòng điền theo yêu cầu");
            }
            else
            {
                if (!roleReEnter.Equals(rolePassword))
                {
                    MessageBox.Show("Vui lòng điền mật khẩu xác nhận đúng với mật khẩu mới!");
                }
                else
                {
                    try
                    {
                        RoleDAO.Instance.UpdateRole(roleName, rolePassword);
                        MessageBox.Show("Cập nhật role thành công");
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }
            }
        }
        private void bntExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }


        #endregion

        private void txbObjectName_TextChanged(object sender, EventArgs e)
        {
            if (dtgvEditRoleOjectPrivs.SelectedCells.Count > 0)
            {
                LoadComboBox_Columns_Table_or_View();
            }
        }
    }
}
