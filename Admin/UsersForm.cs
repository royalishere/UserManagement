using UserManagement;
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
using UserManagement.Login;

namespace UserManagement.Admin
{
    public partial class UsersForm : Form
    {
        public UsersForm()
        {
            InitializeComponent();
        }

        private void UsersForm_Load(object sender, EventArgs e)
        {
            // load username from database
            string cmd = "SELECT username, account_status status,created, authentication_type auth_type FROM dba_users WHERE username IN (SELECT manv FROM nhanvien)";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            OracleDataReader reader = command.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            dataGridView1.DataSource = dt;
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            // pass username into textbox
            int index = dataGridView1.SelectedCells[0].ColumnIndex;
            string colName = dataGridView1.Columns[index].Name;
            if(colName == "USERNAME")
            {
                string username = dataGridView1.SelectedCells[0].Value.ToString();
                textBox1.Text = username;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string username = textBox1.Text;
            string pass = textBox2.Text;
            string acc_lock = "ACCOUNT ";
            string cmd = "ALTER USER " + username;
            if (radioButton1.Checked)
            {
                acc_lock += "LOCK";
            }
            else
            {
                acc_lock += "UNLOCK";
            }
            
            if (pass == "")
            {
                cmd = "ALTER USER " + username + " " + acc_lock;
            }
            else
            {
                cmd = "ALTER USER " + username + " IDENTIFIED BY " + pass + " " + acc_lock;
            }
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                command.ExecuteNonQuery();
                MessageBox.Show("Alter user successfully");
                UsersForm_Load(sender, e);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }   
        }

        private void button2_Click(object sender, EventArgs e)
        {
            FillCombobox();
            // load privileges into datagridview2
            string cmd = "select * from dba_tab_privs where grantee in (select * from v_users)";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            OracleDataReader reader = command.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            dataGridView2.DataSource = dt;

            //load privileges into datagridview3
            cmd = "select * from dba_col_privs where grantee in (select * from v_users)";
            command = new OracleCommand(cmd, LoginForm.con);
            reader = command.ExecuteReader();
            dt = new DataTable();
            dt.Load(reader);
            dataGridView3.DataSource = dt;
        }

        private void dataGridView2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int index = dataGridView2.SelectedCells[0].ColumnIndex;
            string colName = dataGridView2.Columns[index].Name;
            if (colName == "GRANTEE")
            {
                string username = dataGridView2.SelectedCells[0].Value.ToString();
                textBox3.Text = username;
            }
        }

        private void FillCombobox()
        {
            string cmd = "SELECT TABLE_NAME FROM USER_TABLES";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            OracleDataReader reader = command.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            comboBox1.DataSource = dt;
            comboBox1.DisplayMember = "TABLE_NAME";
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // load column of table into combobox 2
            string table_name = comboBox1.Text;
            string cmd = "select column_name from all_tab_columns where table_name = '" + table_name + "'";
            try
            {
                OracleCommand command = new OracleCommand(cmd, LoginForm.con);
                OracleDataReader reader = command.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                comboBox2.DataSource = dt;
                comboBox2.DisplayMember = "COLUMN_NAME";
            }
            catch
            {
                // clear combobox2
                comboBox2.DataSource = null;
            }
        }
    }


}
