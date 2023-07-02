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
    public partial class DepartmentForm : Form
    {
        private static DepartmentForm instance;
        public DepartmentForm()
        {
            InitializeComponent();
        }
        public static DepartmentForm GetInstance()
        {
            if (instance == null || instance.IsDisposed)
            {
                instance = new DepartmentForm();
            }
            return instance;
        }

        private void DepartmentForm_Load(object sender, EventArgs e)
        {
            string cmd = "select * from admin.phongban";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                OracleDataReader reader = command.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                dgphongban.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            if(LoginForm.user_role == "ADMIN" || LoginForm.user_role == "NHANSU")
            {
                fpn_button.Visible = true;
                maphg_tb.Enabled = true;
                tenphg_tb.Enabled = true;
                matrphg_tb.Enabled = true;
            }
            if(LoginForm.user_role == "ADMIN")
            {
                delete_btn.Enabled = true;
            }
        }

        private void dgphongban_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //biding data with textbox
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dgphongban.Rows[e.RowIndex];
                maphg_tb.Text = row.Cells[0].Value.ToString();
                tenphg_tb.Text = row.Cells[1].Value.ToString();
                matrphg_tb.Text = row.Cells[2].Value.ToString();
            }
        }

        private void createnew_btn_Click(object sender, EventArgs e)
        {
            string maphg = maphg_tb.Text;
            string tenphg = tenphg_tb.Text;
            string matrphg = matrphg_tb.Text;
            string cmd = "insert into admin.phongban values('" + maphg + "','" + tenphg + "','" + matrphg + "')";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                command.ExecuteNonQuery();
                MessageBox.Show("Thêm phòng ban thành công");
                DepartmentForm_Load(null, null);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void update_btn_Click(object sender, EventArgs e)
        {
            string maphg = maphg_tb.Text;
            string tenphg = tenphg_tb.Text;
            string matrphg = matrphg_tb.Text;
            string cmd = "update admin.phongban set tenpb = '" + tenphg + "', trphg = '" + matrphg + "' where mapb = '" + maphg + "'";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                if(command.ExecuteNonQuery() == 0)
                {
                    MessageBox.Show("Không tìm thấy phòng ban");
                }
                else
                {
                MessageBox.Show("Cập nhật phòng ban thành công");
                DepartmentForm_Load(null, null);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void delete_btn_Click(object sender, EventArgs e)
        {
            string maphg = maphg_tb.Text;
            string cmd = "delete from admin.phongban where mapb = '" + maphg + "'";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                command.ExecuteNonQuery();
                MessageBox.Show("Xóa phòng ban thành công");
                DepartmentForm_Load(null, null);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
