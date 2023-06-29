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
    public partial class HRForm : Form
    {
        private static HRForm instance;
        public static HRForm GetInstance()
        {
            if (instance == null || instance.IsDisposed)
            {
                instance = new HRForm();
            }
            return instance;
        }

        public HRForm()
        {
            InitializeComponent();
        }

        private void HRForm_Load(object sender, EventArgs e)
        {
            birthday_dpk.Value = DateTime.Now;
            string cmd = "select * from admin.v_nhanvien union select * from nam.v_own_nhanvien";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                OracleDataReader reader = command.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                dgnhansu.DataSource = dt;
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            if(LoginForm.user_role == "NHANSU" ||  LoginForm.user_role == "ADMIN")
            {
                fpn_button.Visible = true;
                manv_tb.Enabled = true;
                tennv_tb.Enabled = true;
                birthday_dpk.Enabled = true;
                gioitinh_cb.Enabled = true;
                diachi_tb.Enabled = true;
                sdt_tb.Enabled = true;
                manql_tb.Enabled = true;
                vaitro_tb.Enabled = true;
                phg_tb.Enabled = true;
            }
            if(LoginForm.user_role == "ADMIN")
            {
                delete_btn.Enabled = true;
            }
        }

        private void dgnhansu_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if(e.RowIndex >= 0)
            {
                manv_tb.Text = dgnhansu.Rows[e.RowIndex].Cells[0].Value.ToString();
                tennv_tb.Text = dgnhansu.Rows[e.RowIndex].Cells[1].Value.ToString();
                if (dgnhansu.Rows[e.RowIndex].Cells[2].Value.ToString() == "M")
                {
                    gioitinh_cb.SelectedIndex = 0;
                }
                else
                {
                    gioitinh_cb.SelectedIndex = 1;
                }
                birthday_dpk.Value = DateTime.Parse(dgnhansu.Rows[e.RowIndex].Cells[3].Value.ToString());
                diachi_tb.Text = dgnhansu.Rows[e.RowIndex].Cells[4].Value.ToString();
                sdt_tb.Text = dgnhansu.Rows[e.RowIndex].Cells[5].Value.ToString();
                luong_tb.Text = dgnhansu.Rows[e.RowIndex].Cells[6].Value.ToString();
                phucap_tb.Text = dgnhansu.Rows[e.RowIndex].Cells[7].Value.ToString();
                vaitro_tb.Text = dgnhansu.Rows[e.RowIndex].Cells[8].Value.ToString();
                manql_tb.Text = dgnhansu.Rows[e.RowIndex].Cells[9].Value.ToString();
                phg_tb.Text = dgnhansu.Rows[e.RowIndex].Cells[10].Value.ToString();
            }
        }

        private void createnew_btn_Click(object sender, EventArgs e)
        {
            string manv = manv_tb.Text;
            string tennv = tennv_tb.Text;
            string phai = "";
            if(gioitinh_cb.SelectedIndex == 0)
            {
                phai = "M";
            }
            else
            {
                phai = "F";
            }
            string ngaysinh = birthday_dpk.Value.ToShortDateString();
            string diachi = diachi_tb.Text;
            string sdt = sdt_tb.Text;
            string luong = luong_tb.Text;
            string phucap = phucap_tb.Text;
            string vaitro = vaitro_tb.Text;
            string manql = manql_tb.Text;
            string phg = phg_tb.Text;

            string cmd = "insert into admin.v_nhansu_nhanvien values('" + manv + "', '" + tennv + "', '" + phai + "', to_date('" + ngaysinh + "', 'dd/mm/yyyy'), '" + 
                diachi + "', '" + sdt + "', '" + luong + "', '" + phucap + "', '" + vaitro + "', '" + manql + "', '" + phg + "')";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                command.ExecuteNonQuery();
                MessageBox.Show("Thêm nhân viên thành công");
                HRForm_Load(sender, e);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void update_btn_Click(object sender, EventArgs e)
        {
            string manv = manv_tb.Text;
            string tennv = tennv_tb.Text;
            string phai = "";
            if (gioitinh_cb.SelectedIndex == 0)
            {
                phai = "M";
            }
            else
            {
                phai = "F";
            }
            string ngaysinh = birthday_dpk.Value.ToShortDateString();
            string diachi = diachi_tb.Text;
            string sdt = sdt_tb.Text;
            string luong = luong_tb.Text;
            string phucap = phucap_tb.Text;
            string vaitro = vaitro_tb.Text;
            string manql = manql_tb.Text;
            string phg = phg_tb.Text;

            string cmd = "update admin.v_nhansu_nhanvien set tennv = '" + tennv + "', phai = '" + phai + "', ngaysinh = to_date('" + ngaysinh + "', 'dd/mm/yyyy'), diachi = '" +
                diachi + "', sodt = '" + sdt + "', vaitro = '" + vaitro + "', manql = '" + manql + "', phg = '" + phg + "' where manv = '" + manv + "'";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                command.ExecuteNonQuery();
                MessageBox.Show("Cập nhật nhân viên thành công");
                HRForm_Load(sender, e);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void delete_btn_Click(object sender, EventArgs e)
        {
            string manv = manv_tb.Text;
            string cmd = "delete from admin.v_nhansu_nhanvien where manv = '" + manv + "'";
            OracleCommand command = new OracleCommand(cmd, LoginForm.con);
            try
            {
                command.ExecuteNonQuery();
                MessageBox.Show("Xóa nhân viên thành công");
                HRForm_Load(sender, e);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }

}
