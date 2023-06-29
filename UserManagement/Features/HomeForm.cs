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
using System.Threading;
using UserManagement.Features;

namespace UserManagement
{
    public partial class HomeForm : Form
    {
        Thread t;
        public HomeForm()
        {
            InitializeComponent();
            HomeTabPanel_SelectedIndexChanged(null, null);
        }

        private void HomeTabPanel_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (HomeTabPanel.SelectedTab == InfoTab)
            {
                LoadInfo();
                UnlockRoleTools();
            }
            else
            {
                LoadAnnouncement();
            }
        }

        private void LoadInfo()
        {
            string cmd = "select * from nam.v_own_nhanvien";
            DataTable dt = new DataTable();
            try
            {
                OracleCommand oracmd = new OracleCommand(cmd, LoginForm.con);
                OracleDataReader reader = oracmd.ExecuteReader();
                // load data into textbox
                while (reader.Read())
                {
                    manv_tb.Text = reader.GetString(0);
                    tennv_tb.Text = reader.GetString(1);
                    if (reader.GetString(2) == "M")
                    {
                        gioitinh_tb.Text = "Nam";
                    }
                    else
                    {
                        gioitinh_tb.Text = "Nữ";
                    }
                    birthday_dpk.Value = reader.GetDateTime(3);
                    diachi_tb.Text = reader.GetString(4);
                    sdt_tb.Text = reader.GetString(5);
                    luong_tb.Text = reader.GetString(6) + " $";
                    phucap_tb.Text = reader.GetString(7) + " $";
                    vaitro_tb.Text = reader.GetString(8);
                    if(!reader.IsDBNull(9))
                    {
                        manql_tb.Text = reader.GetString(9);
                    }
                    if(!reader.IsDBNull(10))
                    {
                        phongban_tb.Text = reader.GetString(10);
                    }
                }
            }
            catch
            {
                MessageBox.Show("Load dữ liệu không thành công");
            }
            
        }

        private void LoadAnnouncement()
        {
            string cmd = "select * from admin.thongbao";
            OracleCommand oracmd = new OracleCommand(cmd, LoginForm.con);
            try
            {
                // load date into thongbaodg
                DataTable dt = new DataTable();
                dt.Load(oracmd.ExecuteReader());
                dgthongbao.DataSource = dt;
            }
            catch
            {
                MessageBox.Show("Load dữ liệu không thành công");
            }
            if(LoginForm.user_role == "ADMIN")
            {
                add_btn.Visible = true;
                noidung_tb.Visible = true;
            }
        }

        private void updateInfo_Click(object sender, EventArgs e)
        {
            string ngaysinh = birthday_dpk.Value.ToShortDateString();
            string sdt = sdt_tb.Text;
            string diachi = diachi_tb.Text;

            if (ngaysinh == "" || sdt == "" || diachi == "")
            {
                MessageBox.Show("Vui lòng nhập đầy đủ thông tin");
                return;
            }

            string cmd = "update nam.v_own_nhanvien set ngaysinh = to_date('" + ngaysinh + "', 'dd-mm-yyyy'), sodt = '"
                + sdt + "', diachi = '" + diachi + "' where manv = user";
            try
            {
                OracleCommand oracmd = new OracleCommand(cmd, LoginForm.con);
                oracmd.ExecuteNonQuery();
                MessageBox.Show("Cập nhật thông tin thành công");
                LoadInfo();
            }
            catch
            {
                MessageBox.Show("Cập nhật không thành công. Vui lòng kiểm tra thông tin nhập");
            }
        }

        private void UnlockRoleTools()
        {
            string usrrole = LoginForm.user_role;
            if (usrrole == "NHANSU" || usrrole == "BANGD" || usrrole == "TRUONGPHONG" || usrrole == "QLTRUCTIEP" || usrrole == "ADMIN")
            {
                nhansu_btn.Enabled = true;
            }
            if (usrrole == "TAICHINH" || usrrole == "BANGD" || usrrole == "ADMIN")
            {
                taichinh_btn.Enabled = true;
            }
        }

        private void logout_btn_Click(object sender, EventArgs e)
        {
            LoginForm.con.Close();
            this.Close();

            t = new Thread(() => Application.Run(new LoginForm()));
            t.SetApartmentState(ApartmentState.STA);
            t.Start();
        }

        private void phongban_btn_Click(object sender, EventArgs e)
        {
            DepartmentForm departmentForm = DepartmentForm.GetInstance();
            departmentForm.Show();
        }

        private void dean_btn_Click(object sender, EventArgs e)
        {
            ProjectForm projectForm = ProjectForm.GetInstance();
            projectForm.Show();
        }

        private void phancong_btn_Click(object sender, EventArgs e)
        {
            AssignmentForm assignmentForm = AssignmentForm.GetInstance();
            assignmentForm.Show();
        }

        private void nhansu_btn_Click(object sender, EventArgs e)
        {
            HRForm hRForm = HRForm.GetInstance();
            hRForm.Show();
        }

        private void taichinh_btn_Click(object sender, EventArgs e)
        {
            FinanceForm financeForm = FinanceForm.GetInstance();
            financeForm.Show();
        }

        private void add_btn_Click(object sender, EventArgs e)
        {
            string noidung = noidung_tb.Text;
            string cmd = "insert into admin.thongbao values ('" + noidung + "')";
            try
            {
                OracleCommand oracmd = new OracleCommand(cmd, LoginForm.con);
                oracmd.ExecuteNonQuery();
                MessageBox.Show("Thêm thông báo thành công");
                cmd = "update admin.thongbao set rowlabel = char_to_label('ESBD', 'NV') where noidung = '" + noidung +"'";
                oracmd = new OracleCommand(cmd, LoginForm.con);
                oracmd.ExecuteNonQuery();
                LoadAnnouncement();
            }
            catch
            {
                MessageBox.Show("Thêm thông báo không thành công");
            }
        }
    }
}
