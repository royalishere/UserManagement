using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using UserManagement.Admin;

namespace UserManagement
{
    public partial class LoginForm : Form
    {
        Thread t;
        public static OracleConnection con;

        public LoginForm()
        {
            // Create Oracle connection
            InitializeComponent();
        }

        private bool ConnectOracle(string ID, string pass)
        {
            string conString = "Data Source= " + Orcl.hostname + ":" + Orcl.port + "/" + Orcl.servicename + ";User Id=" + ID + ";Password=" + pass + ";";
            con = new OracleConnection(conString);
            try
            {
                con.Open();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }

        private void open_empform(object obj)
        {
            Application.Run(new ManagementUser());
        }

        private void bntLogin_Click(object sender, EventArgs e)
        {
            string ID = txbUserName.Text;
            string pass = txbPassword.Text;
            if (ConnectOracle(ID, pass))
            {
                //close login form
                t = new Thread(open_empform);
                t.SetApartmentState(ApartmentState.STA);
                t.Start();
            }
        }

        private void bntExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
