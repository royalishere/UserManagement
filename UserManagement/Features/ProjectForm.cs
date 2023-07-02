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
    public partial class ProjectForm : Form
    {
        private static ProjectForm instance;
        public ProjectForm()
        {
            InitializeComponent();
        }

        public static ProjectForm GetInstance()
        {
            if (instance == null || instance.IsDisposed)
            {
                instance = new ProjectForm();
            }
            return instance;
        }

        private void ProjectForm_Load(object sender, EventArgs e)
        {
            ngaybd_datepk.Value = DateTime.Now;
            string cmd = "select * from admin.dean";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                OracleDataReader reader = command.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                dean_dg.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            if(LoginForm.user_role == "ADMIN" || LoginForm.user_role == "TRUONGDEAN")
            {
                fpn_button.Visible = true;
                mada_tb.Enabled = true;
                tenda_tb.Enabled = true;
                maphg_tb.Enabled = true;
                ngaybd_datepk.Enabled = true;
            }
        }

        private void dean_dg_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if(e.RowIndex >=0)
            {
                DataGridViewRow row = this.dean_dg.Rows[e.RowIndex];
                mada_tb.Text = row.Cells[0].Value.ToString();
                tenda_tb.Text = row.Cells[1].Value.ToString();
                ngaybd_datepk.Value = DateTime.Parse(row.Cells[2].Value.ToString());
                maphg_tb.Text = row.Cells[3].Value.ToString();
            }
        }

        private void createnew_btn_Click(object sender, EventArgs e)
        {
            string mada = mada_tb.Text;
            string tenda = tenda_tb.Text;
            string maphg = maphg_tb.Text;
            string ngaybd = ngaybd_datepk.Value.ToShortDateString();
            string cmd = "insert into admin.dean values('" + mada + "','" + tenda + "'," + "to_date('" + ngaybd + "','dd/mm/yyyy'), '" + maphg + "')";
            try
            {
                OracleCommand command = new OracleCommand(cmd, LoginForm.con);
                command.ExecuteNonQuery();
                MessageBox.Show("Thêm đề án thành công");
                ProjectForm_Load(sender, e);
            }
            catch
            {
                MessageBox.Show("Đã xảy ra lỗi. Vui lòng kiểm tra lại thông tin");
            }
        }

        private void update_btn_Click(object sender, EventArgs e)
        {
            string mada = mada_tb.Text;
            string tenda = tenda_tb.Text;
            string maphg = maphg_tb.Text;
            string ngaybd = ngaybd_datepk.Value.ToShortDateString();
            string cmd = "update admin.dean set tenda = '" + tenda + "', phong = '" + maphg + "', ngaybd = to_date('" + ngaybd + "','dd/mm/yyyy') where mada = '" + mada + "'";
            try
            {
                OracleCommand command = new OracleCommand(cmd, LoginForm.con);
                if (command.ExecuteNonQuery() == 0)
                {
                    MessageBox.Show("Không tìm thấy đề án cần cập nhật");
                    return;
                }
                else
                {
                    MessageBox.Show("Cập nhật đề án thành công");
                    ProjectForm_Load(sender, e);
                }
            }
            catch
            {
                MessageBox.Show("Đã xảy ra lỗi. Kiểm tra lại mã đề án và phòng ban");
            }
        }

        private void delete_btn_Click(object sender, EventArgs e)
        {
            string mada = mada_tb.Text;
            string cmd = "delete from admin.dean where mada = '" + mada + "'";
            try
            {
                OracleCommand command = new OracleCommand(cmd, LoginForm.con);
                command.ExecuteNonQuery();
                MessageBox.Show("Xóa đề án thành công");
                ProjectForm_Load(sender, e);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void ProjectForm_FormClosed(object sender, FormClosedEventArgs e)
        {
            instance = null;
        }
    }
}
