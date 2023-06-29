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

namespace UserManagement.Features
{
    public partial class FinanceForm : Form
    {
        private static FinanceForm instance;

        public static FinanceForm GetInstance()
        {
            if (instance == null || instance.IsDisposed)
            {
                instance = new FinanceForm();
            }
            return instance;
        }

        public FinanceForm()
        {
            InitializeComponent();
        }

        private void FinanceForm_Load(object sender, EventArgs e)
        {
            string cmd = "select * from nam.v_nhanvien";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                OracleDataReader reader = command.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                dgtaichinh.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            if(LoginForm.user_role == "TAICHINH" || LoginForm.user_role == "ADMIN")
            {
                update_btn.Visible = true;
                luong_tb.Enabled = true;
                phucap_tb.Enabled = true;
            }
        }

        private void dgtaichinh_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if(e.RowIndex >= 0)
            {
                manv_tb.Text = dgtaichinh.Rows[e.RowIndex].Cells[0].Value.ToString();
                tennv_tb.Text = dgtaichinh.Rows[e.RowIndex].Cells[1].Value.ToString();
                luong_tb.Text = dgtaichinh.Rows[e.RowIndex].Cells[6].Value.ToString();
                phucap_tb.Text = dgtaichinh.Rows[e.RowIndex].Cells[7].Value.ToString();
                vaitro_tb.Text = dgtaichinh.Rows[e.RowIndex].Cells[8].Value.ToString();
                phg_tb.Text = dgtaichinh.Rows[e.RowIndex].Cells[10].Value.ToString();
            }
        }

        private void update_btn_Click(object sender, EventArgs e)
        {
            string manv = manv_tb.Text;
            string luong = luong_tb.Text;
            string phucap = phucap_tb.Text;
            string cmd = "update nam.v_nhanvien set luong = " + luong + ", phucap = " + phucap + " where manv = '" + manv + "'";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                command.ExecuteNonQuery();
                MessageBox.Show("Cập nhật thành công");
                FinanceForm_Load(sender, e);
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
