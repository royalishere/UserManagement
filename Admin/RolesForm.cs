using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UserManagement.Admin
{
    public partial class RolesForm : Form
    {
        public RolesForm()
        {
            InitializeComponent();
        }

        private void RolesForm_Load(object sender, EventArgs e)
        {
            string cmd = "select role, authentication_type auth, common, inherited from dba_roles";
            OracleCommand command = new OracleCommand(cmd, Login.LoginForm.con);
            DataTable dt = new DataTable();
            OracleDataReader reader = command.ExecuteReader();
            dt.Load(reader);
            dataGridView1.DataSource = dt;
        }
    }
}
