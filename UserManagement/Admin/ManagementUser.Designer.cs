namespace UserManagement.Admin
{
    partial class ManagementUser
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
            this.TabCobtrol = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.tpRole = new System.Windows.Forms.TabPage();
            this.panel4 = new System.Windows.Forms.Panel();
            this.dtgvRolePrivs = new System.Windows.Forms.DataGridView();
            this.panel1 = new System.Windows.Forms.Panel();
            this.dtgvNhanVien = new System.Windows.Forms.DataGridView();
            this.panel3 = new System.Windows.Forms.Panel();
            this.ckbGrantable = new System.Windows.Forms.CheckBox();
            this.bntShowRole = new System.Windows.Forms.Button();
            this.label10 = new System.Windows.Forms.Label();
            this.txbUserName = new System.Windows.Forms.TextBox();
            this.txbObjectType = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.bntSearchRole = new System.Windows.Forms.Button();
            this.bntRevokeRole = new System.Windows.Forms.Button();
            this.bntGrantRole = new System.Windows.Forms.Button();
            this.ckbDelete = new System.Windows.Forms.CheckBox();
            this.ckbUpdate = new System.Windows.Forms.CheckBox();
            this.ckbInsert = new System.Windows.Forms.CheckBox();
            this.ckbSelect = new System.Windows.Forms.CheckBox();
            this.cbColumnObject = new System.Windows.Forms.ComboBox();
            this.label6 = new System.Windows.Forms.Label();
            this.cbObjectName = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.bntCreateRole = new System.Windows.Forms.Button();
            this.bntChangePasswordRole = new System.Windows.Forms.Button();
            this.bntDeleleteRole = new System.Windows.Forms.Button();
            this.txbRoleReEnterPassword = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txbRolePassword = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.txbRoleName = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.bntAddUserToRole = new System.Windows.Forms.Button();
            this.TabCobtrol.SuspendLayout();
            this.tpRole.SuspendLayout();
            this.panel4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvRolePrivs)).BeginInit();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvNhanVien)).BeginInit();
            this.panel3.SuspendLayout();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // TabCobtrol
            // 
            this.TabCobtrol.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.TabCobtrol.Controls.Add(this.tabPage1);
            this.TabCobtrol.Controls.Add(this.tabPage2);
            this.TabCobtrol.Controls.Add(this.tpRole);
            this.TabCobtrol.Location = new System.Drawing.Point(1, 1);
            this.TabCobtrol.Name = "TabCobtrol";
            this.TabCobtrol.SelectedIndex = 0;
            this.TabCobtrol.Size = new System.Drawing.Size(1797, 669);
            this.TabCobtrol.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.Location = new System.Drawing.Point(4, 25);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(1789, 640);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "HỆ THỐNG";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // tabPage2
            // 
            this.tabPage2.Location = new System.Drawing.Point(4, 25);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(1789, 640);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "NGƯỜI DÙNG";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // tpRole
            // 
            this.tpRole.Controls.Add(this.panel4);
            this.tpRole.Controls.Add(this.panel1);
            this.tpRole.Controls.Add(this.panel3);
            this.tpRole.Controls.Add(this.panel2);
            this.tpRole.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tpRole.Location = new System.Drawing.Point(4, 25);
            this.tpRole.Name = "tpRole";
            this.tpRole.Padding = new System.Windows.Forms.Padding(3);
            this.tpRole.Size = new System.Drawing.Size(1789, 640);
            this.tpRole.TabIndex = 2;
            this.tpRole.Text = "VAI TRÒ";
            this.tpRole.UseVisualStyleBackColor = true;
            // 
            // panel4
            // 
            this.panel4.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panel4.Controls.Add(this.dtgvRolePrivs);
            this.panel4.Location = new System.Drawing.Point(711, 258);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(1070, 376);
            this.panel4.TabIndex = 18;
            // 
            // dtgvRolePrivs
            // 
            this.dtgvRolePrivs.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dtgvRolePrivs.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dtgvRolePrivs.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgvRolePrivs.Location = new System.Drawing.Point(5, 3);
            this.dtgvRolePrivs.Name = "dtgvRolePrivs";
            this.dtgvRolePrivs.RowHeadersWidth = 51;
            this.dtgvRolePrivs.RowTemplate.Height = 24;
            this.dtgvRolePrivs.Size = new System.Drawing.Size(1062, 370);
            this.dtgvRolePrivs.TabIndex = 0;
            // 
            // panel1
            // 
            this.panel1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.panel1.Controls.Add(this.dtgvNhanVien);
            this.panel1.Location = new System.Drawing.Point(45, 258);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(637, 386);
            this.panel1.TabIndex = 17;
            // 
            // dtgvNhanVien
            // 
            this.dtgvNhanVien.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dtgvNhanVien.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dtgvNhanVien.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgvNhanVien.Location = new System.Drawing.Point(3, 4);
            this.dtgvNhanVien.Name = "dtgvNhanVien";
            this.dtgvNhanVien.RowHeadersWidth = 51;
            this.dtgvNhanVien.RowTemplate.Height = 24;
            this.dtgvNhanVien.Size = new System.Drawing.Size(631, 372);
            this.dtgvNhanVien.TabIndex = 0;
            // 
            // panel3
            // 
            this.panel3.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panel3.Controls.Add(this.bntAddUserToRole);
            this.panel3.Controls.Add(this.ckbGrantable);
            this.panel3.Controls.Add(this.bntShowRole);
            this.panel3.Controls.Add(this.label10);
            this.panel3.Controls.Add(this.txbUserName);
            this.panel3.Controls.Add(this.txbObjectType);
            this.panel3.Controls.Add(this.label9);
            this.panel3.Controls.Add(this.bntSearchRole);
            this.panel3.Controls.Add(this.bntRevokeRole);
            this.panel3.Controls.Add(this.bntGrantRole);
            this.panel3.Controls.Add(this.ckbDelete);
            this.panel3.Controls.Add(this.ckbUpdate);
            this.panel3.Controls.Add(this.ckbInsert);
            this.panel3.Controls.Add(this.ckbSelect);
            this.panel3.Controls.Add(this.cbColumnObject);
            this.panel3.Controls.Add(this.label6);
            this.panel3.Controls.Add(this.cbObjectName);
            this.panel3.Controls.Add(this.label5);
            this.panel3.Controls.Add(this.label8);
            this.panel3.Location = new System.Drawing.Point(711, 6);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(1070, 249);
            this.panel3.TabIndex = 16;
            // 
            // ckbGrantable
            // 
            this.ckbGrantable.AutoSize = true;
            this.ckbGrantable.Location = new System.Drawing.Point(220, 173);
            this.ckbGrantable.Name = "ckbGrantable";
            this.ckbGrantable.Size = new System.Drawing.Size(97, 23);
            this.ckbGrantable.TabIndex = 25;
            this.ckbGrantable.Text = "Grantable";
            this.ckbGrantable.UseVisualStyleBackColor = true;
            // 
            // bntShowRole
            // 
            this.bntShowRole.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bntShowRole.Location = new System.Drawing.Point(949, 206);
            this.bntShowRole.Name = "bntShowRole";
            this.bntShowRole.Size = new System.Drawing.Size(118, 40);
            this.bntShowRole.TabIndex = 24;
            this.bntShowRole.Text = "Xem tất cả";
            this.bntShowRole.UseVisualStyleBackColor = true;
            this.bntShowRole.Click += new System.EventHandler(this.bntShowRole_Click);
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(14, 92);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(42, 19);
            this.label10.TabIndex = 22;
            this.label10.Text = "User";
            // 
            // txbUserName
            // 
            this.txbUserName.Location = new System.Drawing.Point(62, 86);
            this.txbUserName.Name = "txbUserName";
            this.txbUserName.Size = new System.Drawing.Size(122, 27);
            this.txbUserName.TabIndex = 23;
            // 
            // txbObjectType
            // 
            this.txbObjectType.Location = new System.Drawing.Point(548, 136);
            this.txbObjectType.Name = "txbObjectType";
            this.txbObjectType.Size = new System.Drawing.Size(145, 27);
            this.txbObjectType.TabIndex = 21;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(424, 139);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(110, 19);
            this.label9.TabIndex = 20;
            this.label9.Text = "Loại đối tượng";
            // 
            // bntSearchRole
            // 
            this.bntSearchRole.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bntSearchRole.Location = new System.Drawing.Point(748, 206);
            this.bntSearchRole.Name = "bntSearchRole";
            this.bntSearchRole.Size = new System.Drawing.Size(110, 40);
            this.bntSearchRole.TabIndex = 19;
            this.bntSearchRole.Text = "Tìm kiếm";
            this.bntSearchRole.UseVisualStyleBackColor = true;
            this.bntSearchRole.Click += new System.EventHandler(this.bntSearchRole_Click);
            // 
            // bntRevokeRole
            // 
            this.bntRevokeRole.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bntRevokeRole.Location = new System.Drawing.Point(548, 206);
            this.bntRevokeRole.Name = "bntRevokeRole";
            this.bntRevokeRole.Size = new System.Drawing.Size(95, 40);
            this.bntRevokeRole.TabIndex = 18;
            this.bntRevokeRole.Text = "REVOKE";
            this.bntRevokeRole.UseVisualStyleBackColor = true;
            this.bntRevokeRole.Click += new System.EventHandler(this.bntRevokeRole_Click);
            // 
            // bntGrantRole
            // 
            this.bntGrantRole.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bntGrantRole.Location = new System.Drawing.Point(326, 206);
            this.bntGrantRole.Name = "bntGrantRole";
            this.bntGrantRole.Size = new System.Drawing.Size(90, 40);
            this.bntGrantRole.TabIndex = 17;
            this.bntGrantRole.Text = "GRANT";
            this.bntGrantRole.UseVisualStyleBackColor = true;
            this.bntGrantRole.Click += new System.EventHandler(this.bntGrantRole_Click);
            // 
            // ckbDelete
            // 
            this.ckbDelete.AutoSize = true;
            this.ckbDelete.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ckbDelete.Location = new System.Drawing.Point(326, 132);
            this.ckbDelete.Name = "ckbDelete";
            this.ckbDelete.Size = new System.Drawing.Size(77, 23);
            this.ckbDelete.TabIndex = 16;
            this.ckbDelete.Text = "Delete";
            this.ckbDelete.UseVisualStyleBackColor = true;
            // 
            // ckbUpdate
            // 
            this.ckbUpdate.AutoSize = true;
            this.ckbUpdate.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ckbUpdate.Location = new System.Drawing.Point(220, 132);
            this.ckbUpdate.Name = "ckbUpdate";
            this.ckbUpdate.Size = new System.Drawing.Size(79, 23);
            this.ckbUpdate.TabIndex = 15;
            this.ckbUpdate.Text = "Update";
            this.ckbUpdate.UseVisualStyleBackColor = true;
            // 
            // ckbInsert
            // 
            this.ckbInsert.AutoSize = true;
            this.ckbInsert.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ckbInsert.Location = new System.Drawing.Point(326, 86);
            this.ckbInsert.Name = "ckbInsert";
            this.ckbInsert.Size = new System.Drawing.Size(70, 23);
            this.ckbInsert.TabIndex = 14;
            this.ckbInsert.Text = "Insert";
            this.ckbInsert.UseVisualStyleBackColor = true;
            // 
            // ckbSelect
            // 
            this.ckbSelect.AutoSize = true;
            this.ckbSelect.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ckbSelect.Location = new System.Drawing.Point(220, 86);
            this.ckbSelect.Name = "ckbSelect";
            this.ckbSelect.Size = new System.Drawing.Size(74, 23);
            this.ckbSelect.TabIndex = 13;
            this.ckbSelect.Text = "Select";
            this.ckbSelect.UseVisualStyleBackColor = true;
            // 
            // cbColumnObject
            // 
            this.cbColumnObject.FormattingEnabled = true;
            this.cbColumnObject.Location = new System.Drawing.Point(922, 89);
            this.cbColumnObject.Name = "cbColumnObject";
            this.cbColumnObject.Size = new System.Drawing.Size(145, 27);
            this.cbColumnObject.TabIndex = 12;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(768, 93);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(124, 19);
            this.label6.TabIndex = 11;
            this.label6.Text = "Tên cột (Update)";
            // 
            // cbObjectName
            // 
            this.cbObjectName.FormattingEnabled = true;
            this.cbObjectName.Location = new System.Drawing.Point(548, 89);
            this.cbObjectName.Name = "cbObjectName";
            this.cbObjectName.Size = new System.Drawing.Size(145, 27);
            this.cbObjectName.TabIndex = 10;
            this.cbObjectName.SelectedIndexChanged += new System.EventHandler(this.cbObjectName_SelectedIndexChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(424, 94);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(104, 19);
            this.label5.TabIndex = 9;
            this.label5.Text = "Tên đối tượng";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Times New Roman", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(317, 27);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(368, 35);
            this.label8.TabIndex = 6;
            this.label8.Text = "Danh Sách Quyền Của Role";
            // 
            // panel2
            // 
            this.panel2.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panel2.Controls.Add(this.bntCreateRole);
            this.panel2.Controls.Add(this.bntChangePasswordRole);
            this.panel2.Controls.Add(this.bntDeleleteRole);
            this.panel2.Controls.Add(this.txbRoleReEnterPassword);
            this.panel2.Controls.Add(this.label3);
            this.panel2.Controls.Add(this.txbRolePassword);
            this.panel2.Controls.Add(this.label2);
            this.panel2.Controls.Add(this.label1);
            this.panel2.Controls.Add(this.txbRoleName);
            this.panel2.Controls.Add(this.label4);
            this.panel2.Location = new System.Drawing.Point(45, 6);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(630, 250);
            this.panel2.TabIndex = 11;
            // 
            // bntCreateRole
            // 
            this.bntCreateRole.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bntCreateRole.Location = new System.Drawing.Point(108, 206);
            this.bntCreateRole.Name = "bntCreateRole";
            this.bntCreateRole.Size = new System.Drawing.Size(80, 40);
            this.bntCreateRole.TabIndex = 13;
            this.bntCreateRole.Text = "Tạo";
            this.bntCreateRole.UseVisualStyleBackColor = true;
            this.bntCreateRole.Click += new System.EventHandler(this.bntCreateRole_Click);
            // 
            // bntChangePasswordRole
            // 
            this.bntChangePasswordRole.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bntChangePasswordRole.Location = new System.Drawing.Point(293, 206);
            this.bntChangePasswordRole.Name = "bntChangePasswordRole";
            this.bntChangePasswordRole.Size = new System.Drawing.Size(136, 40);
            this.bntChangePasswordRole.TabIndex = 15;
            this.bntChangePasswordRole.Text = "Đổi mật khẩu";
            this.bntChangePasswordRole.UseVisualStyleBackColor = true;
            this.bntChangePasswordRole.Click += new System.EventHandler(this.bntChangePasswordRole_Click);
            // 
            // bntDeleleteRole
            // 
            this.bntDeleleteRole.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bntDeleleteRole.Location = new System.Drawing.Point(535, 206);
            this.bntDeleleteRole.Name = "bntDeleleteRole";
            this.bntDeleleteRole.Size = new System.Drawing.Size(80, 40);
            this.bntDeleleteRole.TabIndex = 14;
            this.bntDeleleteRole.Text = "Xóa";
            this.bntDeleleteRole.UseVisualStyleBackColor = true;
            this.bntDeleleteRole.Click += new System.EventHandler(this.bntDeleleteRole_Click);
            // 
            // txbRoleReEnterPassword
            // 
            this.txbRoleReEnterPassword.Location = new System.Drawing.Point(450, 136);
            this.txbRoleReEnterPassword.Name = "txbRoleReEnterPassword";
            this.txbRoleReEnterPassword.Size = new System.Drawing.Size(165, 27);
            this.txbRoleReEnterPassword.TabIndex = 12;
            this.txbRoleReEnterPassword.Text = "123456";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(287, 140);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(140, 19);
            this.label3.TabIndex = 11;
            this.label3.Text = "Xác nhận mật khẩu:";
            // 
            // txbRolePassword
            // 
            this.txbRolePassword.Location = new System.Drawing.Point(450, 89);
            this.txbRolePassword.Name = "txbRolePassword";
            this.txbRolePassword.Size = new System.Drawing.Size(165, 27);
            this.txbRolePassword.TabIndex = 10;
            this.txbRolePassword.Text = "123456";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(287, 94);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(76, 19);
            this.label2.TabIndex = 9;
            this.label2.Text = "Mật khẩu:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(5, 92);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(86, 19);
            this.label1.TabIndex = 7;
            this.label1.Text = "Tên vai trò:";
            // 
            // txbRoleName
            // 
            this.txbRoleName.Location = new System.Drawing.Point(106, 91);
            this.txbRoleName.Name = "txbRoleName";
            this.txbRoleName.Size = new System.Drawing.Size(165, 27);
            this.txbRoleName.TabIndex = 8;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(197, 27);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(218, 35);
            this.label4.TabIndex = 6;
            this.label4.Text = "Danh Sách Role";
            // 
            // bntAddUserToRole
            // 
            this.bntAddUserToRole.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bntAddUserToRole.Location = new System.Drawing.Point(62, 206);
            this.bntAddUserToRole.Name = "bntAddUserToRole";
            this.bntAddUserToRole.Size = new System.Drawing.Size(104, 40);
            this.bntAddUserToRole.TabIndex = 16;
            this.bntAddUserToRole.Text = "Cấp role";
            this.bntAddUserToRole.UseVisualStyleBackColor = true;
            this.bntAddUserToRole.Click += new System.EventHandler(this.bntAddUserToRole_Click);
            // 
            // ManagementUser
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1798, 671);
            this.Controls.Add(this.TabCobtrol);
            this.Name = "ManagementUser";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Quản lý người dùng";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.TabCobtrol.ResumeLayout(false);
            this.tpRole.ResumeLayout(false);
            this.panel4.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dtgvRolePrivs)).EndInit();
            this.panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dtgvNhanVien)).EndInit();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl TabCobtrol;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.TabPage tpRole;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Button bntCreateRole;
        private System.Windows.Forms.Button bntChangePasswordRole;
        private System.Windows.Forms.Button bntDeleleteRole;
        private System.Windows.Forms.TextBox txbRoleReEnterPassword;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txbRolePassword;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txbRoleName;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.ComboBox cbColumnObject;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.ComboBox cbObjectName;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.CheckBox ckbInsert;
        private System.Windows.Forms.CheckBox ckbSelect;
        private System.Windows.Forms.Button bntSearchRole;
        private System.Windows.Forms.Button bntRevokeRole;
        private System.Windows.Forms.Button bntGrantRole;
        private System.Windows.Forms.CheckBox ckbDelete;
        private System.Windows.Forms.CheckBox ckbUpdate;
        private System.Windows.Forms.DataGridView dtgvRolePrivs;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox txbObjectType;
        private System.Windows.Forms.DataGridView dtgvNhanVien;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox txbUserName;
        private System.Windows.Forms.Button bntShowRole;
        private System.Windows.Forms.CheckBox ckbGrantable;
        private System.Windows.Forms.Button bntAddUserToRole;
    }
}