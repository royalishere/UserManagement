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
            else
            {
                RolesForm rf = new RolesForm();
                rf.TopLevel = false;
                rf.AutoScroll = true;
                rf.Dock = DockStyle.Fill;
                tabPage3.Controls.Add(rf);
                rf.Show();
            }
        }
   
    }
}
