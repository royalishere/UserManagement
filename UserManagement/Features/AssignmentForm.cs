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
    public partial class AssignmentForm : Form
    {
        private static AssignmentForm instance;
        public AssignmentForm()
        {
            InitializeComponent();
        }

        public static AssignmentForm GetInstance()
        {
            
            if (instance == null || instance.IsDisposed)
            {
                instance = new AssignmentForm();
            }
            return instance;
        }

        private void AssignmentForm_Load(object sender, EventArgs e)
        {
            tgbatdau_dpk.Value = DateTime.Now;
            string cmd = "select * from admin.phancong";
            DataTable dt = new DataTable();
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                OracleDataReader reader = command.ExecuteReader();
                dt.Load(reader);
                dgphancong.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            if(LoginForm.user_role == "TRUONGPHONG" || LoginForm.user_role == "ADMIN")
            {
                fpn_button.Visible = true;
                manv_tb.Enabled = true;
                mada_tb.Enabled = true;
                tgbatdau_dpk.Enabled = true;
            }
        }

        private void dgphancong_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if(e.RowIndex >= 0)
            {
                manv_tb.Text = dgphancong.Rows[e.RowIndex].Cells[0].Value.ToString();
                mada_tb.Text = dgphancong.Rows[e.RowIndex].Cells[1].Value.ToString();
                tgbatdau_dpk.Value = DateTime.Parse(dgphancong.Rows[e.RowIndex].Cells[2].Value.ToString());
            }
        }

        private void createnew_btn_Click(object sender, EventArgs e)
        {
            string manv = manv_tb.Text;
            string mada = mada_tb.Text;
            string thoigian = tgbatdau_dpk.Value.ToShortDateString();
            string cmd = "insert into admin.phancong values('" + manv + "','" + mada + "',to_date('" + thoigian + "','dd/mm/yyyy'))";
            try
            {
                OracleCommand command = new OracleCommand(cmd, LoginForm.con);
                if(command.ExecuteNonQuery() == 0)
                {
                    MessageBox.Show("Thêm thất bại. Vui lòng kiểm tra lại thông tin");
                }
                else
                {
                    MessageBox.Show("Thêm phân công thành công");
                    AssignmentForm_Load(sender, e);
                }
            }
            catch
            {
                MessageBox.Show("Thông tin không hợp lệ hoặc đã tồn tại");
            }
        }

        private void update_btn_Click(object sender, EventArgs e)
        {
            string manv = manv_tb.Text;
            string mada = mada_tb.Text;
            string thoigian = tgbatdau_dpk.Value.ToShortDateString();
            string cmd = "update admin.phancong set thoigian = to_date('" + thoigian + "','dd/mm/yyyy') where manv = '" + manv + "' and mada = '" + mada + "'";
            try
            {
                OracleCommand command = new OracleCommand(cmd, LoginForm.con);
                if( command.ExecuteNonQuery() == 0)
                {
                    MessageBox.Show("Không tìm thấy phân công cần cập nhật");
                }
                else
                {
                    MessageBox.Show("Cập nhật thành công");
                    AssignmentForm_Load(sender, e);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }   
        }

        private void delete_btn_Click(object sender, EventArgs e)
        {
            string manv = manv_tb.Text;
            string mada = mada_tb.Text;
            string cmd = "delete from admin.phancong where manv = '" + manv + "' and mada = '" + mada + "'";
            try
            {
                OracleCommand command = new OracleCommand(cmd, LoginForm.con);
                command.ExecuteNonQuery();
                MessageBox.Show("Xóa thành công");
                AssignmentForm_Load(sender, e);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
