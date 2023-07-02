using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using UserManagement.Admin;

namespace UserManagement
{
    public partial class LoginForm : Form
    {
        Thread t;
        public static OracleConnection con;
        public static string user_role;
        public static string conString;

        public LoginForm()
        {
            // Create Oracle connection
            InitializeComponent();
        }


        private bool ConnectOracle(string ID, string pass)
        {
            conString = "Data Source= " + Orcl.hostname + ":" + Orcl.port + "/" + Orcl.servicename + ";User Id=" + ID + ";Password=" + pass + ";Pooling=False;"; // k dung connection pooling
            con = new OracleConnection(conString);
            try
            {
                con.Open();
                // check existing connection
                OracleCommand cmd = new OracleCommand("select sys_context(\'ctx_nhanvien\', \'con_count\') from dual", con);
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                if(count > 1)
                {
                    MessageBox.Show("Bạn đã đăng nhập trên một máy khác");
                    con.Close();
                    return false;
                }
                // check role
                cmd = new OracleCommand("select count(*) from session_roles where role = \'DBA\'", con);
                count = Convert.ToInt32(cmd.ExecuteScalar());
                if (count > 0)
                {
                    user_role = "ADMIN";
                }
                else
                {
                    cmd = new OracleCommand("select sys_context('ctx_nhanvien', 'role') from dual", con);
                    user_role = cmd.ExecuteScalar().ToString();
                }
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }

        private void bntLogin_Click(object sender, EventArgs e)
        {
            string ID = txbUserName.Text;
            string pass = txbPassword.Text;
            if (ConnectOracle(ID, pass))
            {
                //close login form
                this.Close();
                t = new Thread(() => Application.Run(new HomeForm()));
                t.SetApartmentState(ApartmentState.STA);
                t.Start();
            }
        }

        private void bntExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            txbPassword.UseSystemPasswordChar = !txbPassword.UseSystemPasswordChar;
        }

        private void btn_adminlog_Click(object sender, EventArgs e)
        {
            string ID = txbUserName.Text;
            string pass = txbPassword.Text;
            bool connected = ConnectOracle(ID, pass);
            OracleCommand cmd = new OracleCommand("select count(*) from session_roles where role = \'DBA\'", con);
            int count = connected ? Convert.ToInt32(cmd.ExecuteScalar()) : 0;
            if (connected && count > 0)
            {
                //close login form
                this.Close();
                t = new Thread(() => Application.Run(new ManagementUser()));
                t.SetApartmentState(ApartmentState.STA);
                t.Start();
            }
            else
            {
                MessageBox.Show("Bạn không có quyền truy cập vào chức năng này");
            }
        }
    }
}
