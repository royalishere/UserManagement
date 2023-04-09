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
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace UserManagement
{
    public partial class fCreateRole : Form
    {
        // Dùng để khi click tạo user sẽ load cái list này lên  để cấp quyền
        public static List<Tuple<string, string, string, string>> temp_tabPrivs =  new List<Tuple<string, string, string, string>>();
        public fCreateRole()
        {
            InitializeComponent();

            LoadListObjectPrivsRole();
            AddObjectBinding();
        }

        #region method

        void LoadListObjectPrivsRole()
        {
            dtgvRoleOjectPrivs.DataSource = RoleDAO.Instance.LoadListAllObjects();
        }

        void AddObjectBinding()
        {
            txbObjectName.DataBindings.Add("Text", dtgvRoleOjectPrivs.DataSource, "OBJECT_NAME", true, DataSourceUpdateMode.Never);
            txbObjectType.DataBindings.Add("Text", dtgvRoleOjectPrivs.DataSource, "OBJECT_TYPE", true, DataSourceUpdateMode.Never);
        }


        void LoadComboBox_Columns_Table_or_View()
        {
            string nameObjects = txbObjectName.Text;
            string typeObject = txbObjectType.Text;

            if(typeObject == "TABLE" || typeObject == "VIEW")
            {
                cbColumnsObject.DataSource = RoleDAO.Instance.GetColumnsEachTable_Or_View(nameObjects, typeObject);
                cbColumnsObject.DisplayMember = "COLUMN_NAME";
            }
        }

        #endregion


        #region
        private void bntCreateRole_Click(object sender, EventArgs e)
        {
            string roleName = txbCreateRoleName.Text;
            string rolePassword = txbCreateRolePass.Text;
            string roleReEnter = txbCreateRoleReEnterPass.Text;

            if(!roleReEnter.Equals(rolePassword))
            {
                MessageBox.Show("Vui lòng điền đúng mật khẩu xác nhận!");
            }
            else
            {
                try
                {
                    RoleDAO.Instance.CreateRole(roleName, rolePassword);
                    MessageBox.Show("Tạo role thành công");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void bntExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void txbObjectName_TextChanged(object sender, EventArgs e)
        {
            //LoadComboBox_Columns_Table_or_View();
            if (dtgvRoleOjectPrivs.SelectedCells.Count > 0)
            {
                LoadComboBox_Columns_Table_or_View();
            }
        }

        private void bntApplyObjectPrivs_Click(object sender, EventArgs e)
        {
            string roleName = txbCreateRoleName.Text;
            string objectName = txbObjectName.Text;
            string columnName = cbColumnsObject.Text;

            
            if (ckbSelect.Checked) {
                // Tại vì SELECT table, view không thể phân quyền trên cột
                temp_tabPrivs.Add(Tuple.Create(roleName, objectName, "", "SELECT"));
                MessageBox.Show("Đã ghi nhập quyền select trên " + objectName);
            }
            if (ckbInsert.Checked) {
                temp_tabPrivs.Add(Tuple.Create(roleName, objectName, "", "INSERT"));
                MessageBox.Show("Đã ghi nhập quyền insert " + objectName);
            }
            if (ckbDelete.Checked) {
                temp_tabPrivs.Add(Tuple.Create(roleName, objectName, "", "DELETE"));
                MessageBox.Show("Đã ghi nhập quyền delete "+ objectName);
            }
            if (ckbUpdate.Checked) {
                temp_tabPrivs.Add(Tuple.Create(roleName, objectName, columnName, "UPDATE"));
                MessageBox.Show("Đã ghi nhập quyền update " + columnName +" " + objectName);
            }
        }
        #endregion
    }
}
