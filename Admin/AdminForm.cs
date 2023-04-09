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
using Oracle.ManagedDataAccess.Client;
using UserManagement.Admin;
using UserManagement.Login;

namespace UserManagement
{
    public partial class AdminForm : Form
    {
        public AdminForm()
        {
            InitializeComponent();
            LoadListRole();
            AddRoleBinding();
        }


        private void AdminForm_Load(object sender, EventArgs e)
        {
            //load QueryTables into tabpage1
            SystemTables st = new SystemTables();
            st.TopLevel = false;
            st.AutoScroll = true;
            st.Dock = DockStyle.Fill;
            tabPage1.Controls.Add(st);
            st.Show();
        }
        private void tabControl1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(tabControl1.SelectedIndex == 0)
            {
                AdminForm_Load(sender, e);
            }
            else if(tabControl1.SelectedIndex == 1)
            {
                //load UsersForm into tabpage2
                UsersForm uf = new UsersForm();
                uf.TopLevel = false;
                uf.AutoScroll = true;
                uf.Dock = DockStyle.Fill;
                tabPage2.Controls.Add(uf);
                uf.Show();
            }
        }
        void LoadListRole()
        {
            dtgvRole.DataSource = RoleDAO.Instance.getListRole();
        }


        void AddRoleBinding()
        {
            txbRoleName.DataBindings.Add("Text", dtgvRole.DataSource, "ROLE", true, DataSourceUpdateMode.Never);
        }

        private void bntCreateRole_Click(object sender, EventArgs e)
        {
            fCreateRole f = new fCreateRole();
            f.ShowDialog();
            this.Show();

            LoadListRole();
        }

        private void bntShowPrivsRole_Click(object sender, EventArgs e)
        {
            string roleName = txbRoleName.Text;

            dtgvRolePrivs.DataSource = RoleDAO.Instance.GetPrivs_ByNameRole(roleName);
        }

        private void bntDeleteRole_Click(object sender, EventArgs e)
        {
            string roleName = txbRoleName.Text;

            try
            {
                RoleDAO.Instance.DeleteRole_ByRoleName(roleName);
                LoadListRole();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void bntEditRole_Click(object sender, EventArgs e)
        {
            string roleName = txbRoleName.Text;
            fEditRole f = new fEditRole(roleName);
            f.ShowDialog();
            this.Show();
        }
    }
}
