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
using System.Data.Entity.Core.Common;

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
            string cmd = "select username, account_status status, lock_date, created, authentication_type auth from dba_users";
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
                MessageBox.Show("Alter user successsfully");
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
            string cmd = "select * from user_tab_privs";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            OracleDataReader reader = command.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            dataGridView2.DataSource = dt;

            //load privileges into datagridview3
            cmd = "select * from user_col_privs";
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
                textBox1.Text = username;
            }
        }

        private void FillCombobox()
        {
            string cmd = "select * from user_objects where object_type = 'TABLE' or object_type = 'VIEW'";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            OracleDataReader reader = command.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            comboBox1.DataSource = dt;
            comboBox1.DisplayMember = "OBJECT_NAME";
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string table_name = comboBox1.Text;
            string cmd = "select distinct(column_name) from all_tab_columns where table_name = '" + table_name + "'";
            try
            {
                OracleCommand command = new OracleCommand(cmd, LoginForm.con);
                OracleDataReader reader = command.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                flowLayoutPanel1.Controls.Clear();
                foreach (DataRow row in dt.Rows)
                {
                    CheckBox checkBox = new CheckBox();
                    checkBox.Text = row["COLUMN_NAME"].ToString();
                    flowLayoutPanel1.Controls.Add(checkBox);
                }
            }
            catch
            {
                flowLayoutPanel1.Controls.Clear();
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            string user = textBox1.Text;
            string cmd = "drop user " + user + " cascade";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                command.ExecuteNonQuery();
                MessageBox.Show("Drop user successsfully");
                textBox1.Clear();
                UsersForm_Load(sender, e);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }   
        }

        private void button6_Click(object sender, EventArgs e)
        {
            textBox2.UseSystemPasswordChar = !textBox2.UseSystemPasswordChar;
        }

        private string getSelectedColPanel()
        {
            string col = "";
            foreach (Control c in flowLayoutPanel1.Controls)
            {
                if (c is CheckBox)
                {
                    CheckBox cb = (CheckBox)c;
                    if (cb.Checked)
                    {
                        col += cb.Text + ",";
                    }
                }
            }
            if (col != "")
            {
                col = col.Substring(0, col.Length - 1);
            }
            return col; 
        }

        private void create_view(string col)
        {
            col = getSelectedColPanel();
            string table_name = comboBox1.Text;
            string view_name = textBox1.Text +"_" + table_name + "_view";
            string cmd = "create or replace view " + view_name + " as select " + col + " from " + table_name;
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                command.ExecuteNonQuery();
                MessageBox.Show("Create view " + view_name + " successsfully");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            string privs = "";
            string col = getSelectedColPanel();
            string table_name = comboBox1.Text;
            string grantee = textBox1.Text;
            string granable = "";
            if(col != "")
            {
                if (selectcb.Checked)
                {
                    create_view(col);
                    string view_name = grantee + "_" + table_name + "_view";
                    string cmd = "grant select on " + view_name + " to " + grantee;
                    OracleCommand command = new OracleCommand(cmd, LoginForm.con);
                    try
                    {
                        command.ExecuteNonQuery();
                        MessageBox.Show("Grant select on view " + view_name + " successsfully");
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }
                if (updatecb.Checked)
                {
                    privs += "update(" + col + "),";
                }
            }
            else
            {
                if(selectcb.Checked) { privs += "select,"; };
                if(updatecb.Checked) { privs += "update,"; };   
            }
            if (insertcb.Checked) { privs += "insert,"; };
            if (deletecb.Checked) { privs += "delete,"; };
            if (privs != "")
            {
                if(grantablecb.Checked)
                {
                    granable = " with grant option";
                }
                privs = privs.Substring(0, privs.Length - 1);
                string cmd2 = "grant " + privs + " on " + table_name + " to " + grantee + granable;
                OracleCommand command2 = new OracleCommand(cmd2, LoginForm.con);
                try
                {
                    command2.ExecuteNonQuery();
                    MessageBox.Show("Grant privileges on " + table_name + " successsfully");
                    selectcb.Checked = false;
                    updatecb.Checked = false;
                    insertcb.Checked = false;
                    deletecb.Checked = false;
                    grantablecb.Checked = false;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            string privs = "";
            string col = getSelectedColPanel();
            string object_name = comboBox1.Text;
            string grantee = textBox1.Text;
            if(updatecb.Checked) { privs += "update,"; } ;
            if(selectcb.Checked) { privs += "select,"; };
            if(insertcb.Checked) { privs += "insert,"; };
            if(deletecb.Checked) { privs += "delete,"; };

            if(privs != "")
            {
                privs = privs.Substring(0, privs.Length - 1);
                string cmd = "revoke " + privs + " on " + object_name + " from " + grantee;
                OracleCommand command = new OracleCommand(cmd, LoginForm.con);
                try
                {
                    command.ExecuteNonQuery();
                    MessageBox.Show("Revoke privileges on " + object_name + " successsfully");
                    selectcb.Checked = false;
                    updatecb.Checked = false;
                    insertcb.Checked = false;
                    deletecb.Checked = false;
                    grantablecb.Checked = false;

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }   
            }
        }
    }


}
