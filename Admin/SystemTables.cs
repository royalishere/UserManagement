using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Oracle.ManagedDataAccess.Client;
using UserManagement.Login;
using System.Threading;

namespace UserManagement
{
    public partial class SystemTables : Form
    {
        public SystemTables()
        {
            InitializeComponent();
            Fill_Combobox();
            
        }

        private void Fill_Combobox()
        {
            string cmd = "SELECT TABLE_NAME FROM USER_TABLES";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            OracleDataReader reader = command.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            comboBox1.DataSource = dt;
            comboBox1.DisplayMember = "TABLE_NAME";
        }

        private void comboBox1_SelectedValueChanged(object sender, EventArgs e)
        {
            // load tables to datagridview 
            string cmd = "SELECT * FROM " + comboBox1.Text;
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                OracleDataReader reader = command.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                dataGridView1.DataSource = dt;
            }
            catch 
            {
                //reset datagirdview
                dataGridView1.DataSource = null;
            }
        }

  
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //get header of first column 
            int ColIndex = dataGridView1.SelectedCells[0].ColumnIndex;
            string ColHeader = dataGridView1.Columns[ColIndex].HeaderText;
            if (ColHeader == "MANV")
            {
                string cellValue = dataGridView1.SelectedCells[0].Value.ToString();
                textBox1.Text = cellValue;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string username = textBox1.Text.Trim();
            string password = textBox2.Text.Trim();
            string acc_lock = "";
            if (checkBox1.Checked)
            {
                acc_lock = "ACCOUNT LOCK";
            }
            //call procedure create_user from database
            OracleCommand oracleCmd = new OracleCommand("create_user", LoginForm.con);
            oracleCmd.CommandType = CommandType.StoredProcedure;
            oracleCmd.Parameters.Add("username", OracleDbType.Varchar2).Value = username;
            oracleCmd.Parameters.Add("password", OracleDbType.Varchar2).Value = password;
            oracleCmd.Parameters.Add("islock", OracleDbType.Varchar2).Value = acc_lock;
            try
            {
                oracleCmd.ExecuteNonQuery();
                MessageBox.Show("Create user successfully");
            }
            catch
            {
                MessageBox.Show("User name conflits with another user or role name");
            }
        }
    }
}
