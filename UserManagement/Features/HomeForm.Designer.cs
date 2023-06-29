namespace UserManagement
{
    partial class HomeForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(HomeForm));
            this.HomeTabPanel = new System.Windows.Forms.TabControl();
            this.InfoTab = new System.Windows.Forms.TabPage();
            this.panel2 = new System.Windows.Forms.Panel();
            this.birthday_dpk = new System.Windows.Forms.DateTimePicker();
            this.updateInfo_btn = new System.Windows.Forms.Button();
            this.gioitinh_tb = new System.Windows.Forms.TextBox();
            this.diachi_tb = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.phongban_tb = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.manql_tb = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.vaitro_tb = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.phucap_tb = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.luong_tb = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.sdt_tb = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.tennv_tb = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.manv_tb = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.pictureBox5 = new System.Windows.Forms.PictureBox();
            this.pictureBox4 = new System.Windows.Forms.PictureBox();
            this.pictureBox3 = new System.Windows.Forms.PictureBox();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.taichinh_btn = new System.Windows.Forms.Button();
            this.nhansu_btn = new System.Windows.Forms.Button();
            this.logout_btn = new System.Windows.Forms.Button();
            this.dean_btn = new System.Windows.Forms.Button();
            this.phongban_btn = new System.Windows.Forms.Button();
            this.phancong_btn = new System.Windows.Forms.Button();
            this.label13 = new System.Windows.Forms.Label();
            this.AnnounmentTab = new System.Windows.Forms.TabPage();
            this.panel4 = new System.Windows.Forms.Panel();
            this.noidung_tb = new System.Windows.Forms.TextBox();
            this.add_btn = new System.Windows.Forms.Button();
            this.label14 = new System.Windows.Forms.Label();
            this.panel3 = new System.Windows.Forms.Panel();
            this.dgthongbao = new System.Windows.Forms.DataGridView();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.HomeTabPanel.SuspendLayout();
            this.InfoTab.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox5)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox4)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.AnnounmentTab.SuspendLayout();
            this.panel4.SuspendLayout();
            this.panel3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgthongbao)).BeginInit();
            this.SuspendLayout();
            // 
            // HomeTabPanel
            // 
            this.HomeTabPanel.Controls.Add(this.InfoTab);
            this.HomeTabPanel.Controls.Add(this.AnnounmentTab);
            this.HomeTabPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.HomeTabPanel.Font = new System.Drawing.Font("Times New Roman", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.HomeTabPanel.Location = new System.Drawing.Point(0, 0);
            this.HomeTabPanel.Name = "HomeTabPanel";
            this.HomeTabPanel.SelectedIndex = 0;
            this.HomeTabPanel.Size = new System.Drawing.Size(746, 471);
            this.HomeTabPanel.TabIndex = 0;
            this.HomeTabPanel.SelectedIndexChanged += new System.EventHandler(this.HomeTabPanel_SelectedIndexChanged);
            // 
            // InfoTab
            // 
            this.InfoTab.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.InfoTab.Controls.Add(this.panel2);
            this.InfoTab.Controls.Add(this.panel1);
            this.InfoTab.Location = new System.Drawing.Point(4, 24);
            this.InfoTab.Name = "InfoTab";
            this.InfoTab.Padding = new System.Windows.Forms.Padding(3);
            this.InfoTab.Size = new System.Drawing.Size(738, 443);
            this.InfoTab.TabIndex = 0;
            this.InfoTab.Text = "Dashboard";
            this.InfoTab.UseVisualStyleBackColor = true;
            // 
            // panel2
            // 
            this.panel2.BackgroundImage = global::UserManagement.Properties.Resources.background2;
            this.panel2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.panel2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel2.Controls.Add(this.birthday_dpk);
            this.panel2.Controls.Add(this.updateInfo_btn);
            this.panel2.Controls.Add(this.gioitinh_tb);
            this.panel2.Controls.Add(this.diachi_tb);
            this.panel2.Controls.Add(this.label12);
            this.panel2.Controls.Add(this.phongban_tb);
            this.panel2.Controls.Add(this.label10);
            this.panel2.Controls.Add(this.manql_tb);
            this.panel2.Controls.Add(this.label11);
            this.panel2.Controls.Add(this.vaitro_tb);
            this.panel2.Controls.Add(this.label8);
            this.panel2.Controls.Add(this.phucap_tb);
            this.panel2.Controls.Add(this.label9);
            this.panel2.Controls.Add(this.luong_tb);
            this.panel2.Controls.Add(this.label6);
            this.panel2.Controls.Add(this.sdt_tb);
            this.panel2.Controls.Add(this.label7);
            this.panel2.Controls.Add(this.label5);
            this.panel2.Controls.Add(this.label4);
            this.panel2.Controls.Add(this.tennv_tb);
            this.panel2.Controls.Add(this.label3);
            this.panel2.Controls.Add(this.manv_tb);
            this.panel2.Controls.Add(this.label2);
            this.panel2.Controls.Add(this.label1);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel2.Location = new System.Drawing.Point(3, 193);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(732, 247);
            this.panel2.TabIndex = 27;
            // 
            // birthday_dpk
            // 
            this.birthday_dpk.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.birthday_dpk.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.birthday_dpk.Location = new System.Drawing.Point(122, 160);
            this.birthday_dpk.Name = "birthday_dpk";
            this.birthday_dpk.Size = new System.Drawing.Size(125, 22);
            this.birthday_dpk.TabIndex = 50;
            // 
            // updateInfo_btn
            // 
            this.updateInfo_btn.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.updateInfo_btn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.updateInfo_btn.Font = new System.Drawing.Font("Times New Roman", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.updateInfo_btn.ForeColor = System.Drawing.Color.DarkBlue;
            this.updateInfo_btn.Location = new System.Drawing.Point(561, 198);
            this.updateInfo_btn.Name = "updateInfo_btn";
            this.updateInfo_btn.Size = new System.Drawing.Size(125, 26);
            this.updateInfo_btn.TabIndex = 49;
            this.updateInfo_btn.Text = "CẬP NHẬT";
            this.updateInfo_btn.UseVisualStyleBackColor = false;
            this.updateInfo_btn.Click += new System.EventHandler(this.updateInfo_Click);
            // 
            // gioitinh_tb
            // 
            this.gioitinh_tb.Enabled = false;
            this.gioitinh_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.gioitinh_tb.Location = new System.Drawing.Point(330, 114);
            this.gioitinh_tb.Name = "gioitinh_tb";
            this.gioitinh_tb.ReadOnly = true;
            this.gioitinh_tb.Size = new System.Drawing.Size(125, 22);
            this.gioitinh_tb.TabIndex = 48;
            // 
            // diachi_tb
            // 
            this.diachi_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.diachi_tb.Location = new System.Drawing.Point(330, 70);
            this.diachi_tb.Name = "diachi_tb";
            this.diachi_tb.Size = new System.Drawing.Size(125, 22);
            this.diachi_tb.TabIndex = 47;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label12.Location = new System.Drawing.Point(278, 73);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(46, 15);
            this.label12.TabIndex = 46;
            this.label12.Text = "Địa chỉ";
            // 
            // phongban_tb
            // 
            this.phongban_tb.Enabled = false;
            this.phongban_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.phongban_tb.Location = new System.Drawing.Point(561, 70);
            this.phongban_tb.Name = "phongban_tb";
            this.phongban_tb.ReadOnly = true;
            this.phongban_tb.Size = new System.Drawing.Size(125, 22);
            this.phongban_tb.TabIndex = 45;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label10.Location = new System.Drawing.Point(491, 73);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(64, 15);
            this.label10.TabIndex = 44;
            this.label10.Text = "Phòng ban";
            // 
            // manql_tb
            // 
            this.manql_tb.Enabled = false;
            this.manql_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.manql_tb.Location = new System.Drawing.Point(330, 200);
            this.manql_tb.Name = "manql_tb";
            this.manql_tb.ReadOnly = true;
            this.manql_tb.Size = new System.Drawing.Size(125, 22);
            this.manql_tb.TabIndex = 43;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label11.Location = new System.Drawing.Point(270, 203);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(54, 15);
            this.label11.TabIndex = 42;
            this.label11.Text = "Mã NQL";
            // 
            // vaitro_tb
            // 
            this.vaitro_tb.Enabled = false;
            this.vaitro_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.vaitro_tb.Location = new System.Drawing.Point(330, 157);
            this.vaitro_tb.Name = "vaitro_tb";
            this.vaitro_tb.ReadOnly = true;
            this.vaitro_tb.Size = new System.Drawing.Size(125, 22);
            this.vaitro_tb.TabIndex = 41;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label8.Location = new System.Drawing.Point(280, 160);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(44, 15);
            this.label8.TabIndex = 40;
            this.label8.Text = "Vai trò";
            // 
            // phucap_tb
            // 
            this.phucap_tb.Enabled = false;
            this.phucap_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.phucap_tb.Location = new System.Drawing.Point(561, 157);
            this.phucap_tb.Name = "phucap_tb";
            this.phucap_tb.ReadOnly = true;
            this.phucap_tb.Size = new System.Drawing.Size(125, 22);
            this.phucap_tb.TabIndex = 39;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label9.Location = new System.Drawing.Point(505, 160);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(50, 15);
            this.label9.TabIndex = 38;
            this.label9.Text = "Phụ cấp";
            // 
            // luong_tb
            // 
            this.luong_tb.Enabled = false;
            this.luong_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.luong_tb.Location = new System.Drawing.Point(561, 114);
            this.luong_tb.Name = "luong_tb";
            this.luong_tb.ReadOnly = true;
            this.luong_tb.Size = new System.Drawing.Size(125, 22);
            this.luong_tb.TabIndex = 37;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label6.Location = new System.Drawing.Point(511, 117);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(44, 15);
            this.label6.TabIndex = 36;
            this.label6.Text = "Lương";
            // 
            // sdt_tb
            // 
            this.sdt_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.sdt_tb.Location = new System.Drawing.Point(122, 200);
            this.sdt_tb.Name = "sdt_tb";
            this.sdt_tb.Size = new System.Drawing.Size(125, 22);
            this.sdt_tb.TabIndex = 35;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label7.Location = new System.Drawing.Point(39, 203);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(77, 15);
            this.label7.TabIndex = 34;
            this.label7.Text = "Số điện thoại";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label5.Location = new System.Drawing.Point(268, 117);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(56, 15);
            this.label5.TabIndex = 33;
            this.label5.Text = "Giới tính";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label4.Location = new System.Drawing.Point(54, 160);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(62, 15);
            this.label4.TabIndex = 31;
            this.label4.Text = "Ngày sinh";
            // 
            // tennv_tb
            // 
            this.tennv_tb.Enabled = false;
            this.tennv_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.tennv_tb.Location = new System.Drawing.Point(122, 114);
            this.tennv_tb.Name = "tennv_tb";
            this.tennv_tb.ReadOnly = true;
            this.tennv_tb.Size = new System.Drawing.Size(125, 22);
            this.tennv_tb.TabIndex = 30;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label3.Location = new System.Drawing.Point(33, 117);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(83, 15);
            this.label3.TabIndex = 29;
            this.label3.Text = "Tên nhân viên";
            // 
            // manv_tb
            // 
            this.manv_tb.Enabled = false;
            this.manv_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.manv_tb.Location = new System.Drawing.Point(122, 70);
            this.manv_tb.Name = "manv_tb";
            this.manv_tb.ReadOnly = true;
            this.manv_tb.Size = new System.Drawing.Size(125, 22);
            this.manv_tb.TabIndex = 28;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label2.Location = new System.Drawing.Point(37, 73);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(79, 15);
            this.label2.TabIndex = 27;
            this.label2.Text = "Mã nhân viên";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label1.Location = new System.Drawing.Point(255, 30);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(232, 22);
            this.label1.TabIndex = 26;
            this.label1.Text = "THÔNG TIN NHÂN VIÊN";
            // 
            // panel1
            // 
            this.panel1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.pictureBox5);
            this.panel1.Controls.Add(this.pictureBox4);
            this.panel1.Controls.Add(this.pictureBox3);
            this.panel1.Controls.Add(this.pictureBox2);
            this.panel1.Controls.Add(this.pictureBox1);
            this.panel1.Controls.Add(this.taichinh_btn);
            this.panel1.Controls.Add(this.nhansu_btn);
            this.panel1.Controls.Add(this.logout_btn);
            this.panel1.Controls.Add(this.dean_btn);
            this.panel1.Controls.Add(this.phongban_btn);
            this.panel1.Controls.Add(this.phancong_btn);
            this.panel1.Controls.Add(this.label13);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(3, 3);
            this.panel1.Name = "panel1";
            this.panel1.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.panel1.Size = new System.Drawing.Size(732, 190);
            this.panel1.TabIndex = 26;
            // 
            // pictureBox5
            // 
            this.pictureBox5.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.pictureBox5.Image = global::UserManagement.Properties.Resources.taichinh;
            this.pictureBox5.Location = new System.Drawing.Point(602, 54);
            this.pictureBox5.Name = "pictureBox5";
            this.pictureBox5.Size = new System.Drawing.Size(100, 86);
            this.pictureBox5.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox5.TabIndex = 60;
            this.pictureBox5.TabStop = false;
            // 
            // pictureBox4
            // 
            this.pictureBox4.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.pictureBox4.Image = global::UserManagement.Properties.Resources.nhansu;
            this.pictureBox4.Location = new System.Drawing.Point(458, 54);
            this.pictureBox4.Name = "pictureBox4";
            this.pictureBox4.Size = new System.Drawing.Size(100, 86);
            this.pictureBox4.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox4.TabIndex = 59;
            this.pictureBox4.TabStop = false;
            // 
            // pictureBox3
            // 
            this.pictureBox3.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.pictureBox3.Image = global::UserManagement.Properties.Resources.dean;
            this.pictureBox3.Location = new System.Drawing.Point(311, 56);
            this.pictureBox3.Name = "pictureBox3";
            this.pictureBox3.Size = new System.Drawing.Size(100, 86);
            this.pictureBox3.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox3.TabIndex = 58;
            this.pictureBox3.TabStop = false;
            // 
            // pictureBox2
            // 
            this.pictureBox2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.pictureBox2.Image = global::UserManagement.Properties.Resources.phongban;
            this.pictureBox2.Location = new System.Drawing.Point(164, 56);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(100, 86);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 57;
            this.pictureBox2.TabStop = false;
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.pictureBox1.Image = global::UserManagement.Properties.Resources.phancong;
            this.pictureBox1.Location = new System.Drawing.Point(20, 56);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(100, 86);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 56;
            this.pictureBox1.TabStop = false;
            // 
            // taichinh_btn
            // 
            this.taichinh_btn.Enabled = false;
            this.taichinh_btn.FlatAppearance.BorderColor = System.Drawing.Color.DarkCyan;
            this.taichinh_btn.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.taichinh_btn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.taichinh_btn.Font = new System.Drawing.Font("Times New Roman", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.taichinh_btn.ForeColor = System.Drawing.Color.DarkCyan;
            this.taichinh_btn.Location = new System.Drawing.Point(602, 146);
            this.taichinh_btn.Name = "taichinh_btn";
            this.taichinh_btn.Size = new System.Drawing.Size(100, 27);
            this.taichinh_btn.TabIndex = 55;
            this.taichinh_btn.Text = "QL Tài chính";
            this.taichinh_btn.UseVisualStyleBackColor = false;
            this.taichinh_btn.Click += new System.EventHandler(this.taichinh_btn_Click);
            // 
            // nhansu_btn
            // 
            this.nhansu_btn.Enabled = false;
            this.nhansu_btn.FlatAppearance.BorderColor = System.Drawing.Color.DarkCyan;
            this.nhansu_btn.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.nhansu_btn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.nhansu_btn.Font = new System.Drawing.Font("Times New Roman", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.nhansu_btn.ForeColor = System.Drawing.Color.DarkCyan;
            this.nhansu_btn.Location = new System.Drawing.Point(458, 146);
            this.nhansu_btn.Name = "nhansu_btn";
            this.nhansu_btn.Size = new System.Drawing.Size(100, 27);
            this.nhansu_btn.TabIndex = 54;
            this.nhansu_btn.Text = "QL Nhân sự";
            this.nhansu_btn.UseVisualStyleBackColor = false;
            this.nhansu_btn.Click += new System.EventHandler(this.nhansu_btn_Click);
            // 
            // logout_btn
            // 
            this.logout_btn.FlatAppearance.BorderSize = 0;
            this.logout_btn.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(224)))), ((int)(((byte)(192)))));
            this.logout_btn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.logout_btn.Font = new System.Drawing.Font("Times New Roman", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.logout_btn.ForeColor = System.Drawing.Color.Red;
            this.logout_btn.Location = new System.Drawing.Point(653, 6);
            this.logout_btn.Name = "logout_btn";
            this.logout_btn.Size = new System.Drawing.Size(74, 26);
            this.logout_btn.TabIndex = 53;
            this.logout_btn.Text = "Đăng xuất";
            this.logout_btn.UseVisualStyleBackColor = false;
            this.logout_btn.Click += new System.EventHandler(this.logout_btn_Click);
            // 
            // dean_btn
            // 
            this.dean_btn.FlatAppearance.BorderColor = System.Drawing.Color.DarkCyan;
            this.dean_btn.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.dean_btn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.dean_btn.Font = new System.Drawing.Font("Times New Roman", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.dean_btn.ForeColor = System.Drawing.Color.DarkCyan;
            this.dean_btn.Location = new System.Drawing.Point(311, 146);
            this.dean_btn.Name = "dean_btn";
            this.dean_btn.Size = new System.Drawing.Size(100, 27);
            this.dean_btn.TabIndex = 52;
            this.dean_btn.Text = "Các đề án";
            this.dean_btn.UseVisualStyleBackColor = false;
            this.dean_btn.Click += new System.EventHandler(this.dean_btn_Click);
            // 
            // phongban_btn
            // 
            this.phongban_btn.FlatAppearance.BorderColor = System.Drawing.Color.DarkCyan;
            this.phongban_btn.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.phongban_btn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.phongban_btn.Font = new System.Drawing.Font("Times New Roman", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.phongban_btn.ForeColor = System.Drawing.Color.DarkCyan;
            this.phongban_btn.Location = new System.Drawing.Point(164, 146);
            this.phongban_btn.Name = "phongban_btn";
            this.phongban_btn.Size = new System.Drawing.Size(100, 27);
            this.phongban_btn.TabIndex = 51;
            this.phongban_btn.Text = "Các phòng ban";
            this.phongban_btn.UseVisualStyleBackColor = false;
            this.phongban_btn.Click += new System.EventHandler(this.phongban_btn_Click);
            // 
            // phancong_btn
            // 
            this.phancong_btn.FlatAppearance.BorderColor = System.Drawing.Color.DarkCyan;
            this.phancong_btn.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.phancong_btn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.phancong_btn.Font = new System.Drawing.Font("Times New Roman", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.phancong_btn.ForeColor = System.Drawing.Color.DarkCyan;
            this.phancong_btn.Location = new System.Drawing.Point(20, 146);
            this.phancong_btn.Name = "phancong_btn";
            this.phancong_btn.Size = new System.Drawing.Size(100, 27);
            this.phancong_btn.TabIndex = 50;
            this.phancong_btn.Text = "Xem phân công";
            this.phancong_btn.UseVisualStyleBackColor = false;
            this.phancong_btn.Click += new System.EventHandler(this.phancong_btn_Click);
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label13.Location = new System.Drawing.Point(313, 10);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(100, 22);
            this.label13.TabIndex = 50;
            this.label13.Text = "CÔNG CỤ";
            // 
            // AnnounmentTab
            // 
            this.AnnounmentTab.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.AnnounmentTab.Controls.Add(this.panel4);
            this.AnnounmentTab.Controls.Add(this.panel3);
            this.AnnounmentTab.Location = new System.Drawing.Point(4, 24);
            this.AnnounmentTab.Name = "AnnounmentTab";
            this.AnnounmentTab.Padding = new System.Windows.Forms.Padding(3);
            this.AnnounmentTab.Size = new System.Drawing.Size(738, 443);
            this.AnnounmentTab.TabIndex = 3;
            this.AnnounmentTab.Text = "Thông báo";
            this.AnnounmentTab.UseVisualStyleBackColor = true;
            // 
            // panel4
            // 
            this.panel4.Controls.Add(this.noidung_tb);
            this.panel4.Controls.Add(this.add_btn);
            this.panel4.Controls.Add(this.label14);
            this.panel4.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel4.Location = new System.Drawing.Point(3, 3);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(730, 118);
            this.panel4.TabIndex = 1;
            // 
            // noidung_tb
            // 
            this.noidung_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.noidung_tb.Location = new System.Drawing.Point(168, 48);
            this.noidung_tb.Multiline = true;
            this.noidung_tb.Name = "noidung_tb";
            this.noidung_tb.Size = new System.Drawing.Size(401, 59);
            this.noidung_tb.TabIndex = 51;
            this.noidung_tb.Visible = false;
            // 
            // add_btn
            // 
            this.add_btn.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.add_btn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.add_btn.Font = new System.Drawing.Font("Times New Roman", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.add_btn.ForeColor = System.Drawing.Color.DarkBlue;
            this.add_btn.Location = new System.Drawing.Point(58, 63);
            this.add_btn.Name = "add_btn";
            this.add_btn.Size = new System.Drawing.Size(104, 26);
            this.add_btn.TabIndex = 50;
            this.add_btn.Text = "Thêm thông báo";
            this.add_btn.UseVisualStyleBackColor = false;
            this.add_btn.Visible = false;
            this.add_btn.Click += new System.EventHandler(this.add_btn_Click);
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label14.Location = new System.Drawing.Point(235, 13);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(278, 22);
            this.label14.TabIndex = 28;
            this.label14.Text = "BẢNG THÔNG BÁO CHI TIẾT";
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.dgthongbao);
            this.panel3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel3.Location = new System.Drawing.Point(3, 3);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(730, 435);
            this.panel3.TabIndex = 0;
            // 
            // dgthongbao
            // 
            this.dgthongbao.AllowUserToAddRows = false;
            this.dgthongbao.AllowUserToDeleteRows = false;
            this.dgthongbao.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgthongbao.BackgroundColor = System.Drawing.SystemColors.Control;
            this.dgthongbao.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgthongbao.ColumnHeadersVisible = false;
            this.dgthongbao.Location = new System.Drawing.Point(4, 124);
            this.dgthongbao.Name = "dgthongbao";
            this.dgthongbao.ReadOnly = true;
            this.dgthongbao.RowHeadersVisible = false;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgthongbao.RowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgthongbao.RowTemplate.Height = 25;
            this.dgthongbao.Size = new System.Drawing.Size(722, 307);
            this.dgthongbao.TabIndex = 0;
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
            // 
            // HomeForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(746, 471);
            this.Controls.Add(this.HomeTabPanel);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "HomeForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Hệ thống quản lý nhân viên & đề án";
            this.HomeTabPanel.ResumeLayout(false);
            this.InfoTab.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox5)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox4)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.AnnounmentTab.ResumeLayout(false);
            this.panel4.ResumeLayout(false);
            this.panel4.PerformLayout();
            this.panel3.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgthongbao)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl HomeTabPanel;
        private System.Windows.Forms.TabPage InfoTab;
        private System.Windows.Forms.TabPage AnnounmentTab;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Button updateInfo_btn;
        private System.Windows.Forms.TextBox gioitinh_tb;
        private System.Windows.Forms.TextBox diachi_tb;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox phongban_tb;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox manql_tb;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox vaitro_tb;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox phucap_tb;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox luong_tb;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox sdt_tb;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox tennv_tb;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox manv_tb;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Button logout_btn;
        private System.Windows.Forms.Button dean_btn;
        private System.Windows.Forms.Button phongban_btn;
        private System.Windows.Forms.Button phancong_btn;
        private System.Windows.Forms.Button taichinh_btn;
        private System.Windows.Forms.Button nhansu_btn;
        private System.Windows.Forms.PictureBox pictureBox5;
        private System.Windows.Forms.PictureBox pictureBox4;
        private System.Windows.Forms.PictureBox pictureBox3;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.DateTimePicker birthday_dpk;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.DataGridView dgthongbao;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.TextBox noidung_tb;
        private System.Windows.Forms.Button add_btn;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
    }
}