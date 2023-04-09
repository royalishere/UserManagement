namespace UserManagement
{
    partial class fCreateRole
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
            this.bntExit = new System.Windows.Forms.Button();
            this.bntCreateRole = new System.Windows.Forms.Button();
            this.tcCreateRole = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.panel2 = new System.Windows.Forms.Panel();
            this.txbCreateRoleReEnterPass = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.panel3 = new System.Windows.Forms.Panel();
            this.txbCreateRolePass = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.panel4 = new System.Windows.Forms.Panel();
            this.txbCreateRoleName = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.lsvRoleGrantRole = new System.Windows.Forms.ListView();
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader2 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader3 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.panel7 = new System.Windows.Forms.Panel();
            this.txbObjectType = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.panel6 = new System.Windows.Forms.Panel();
            this.txbObjectName = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.panel5 = new System.Windows.Forms.Panel();
            this.bntApplyObjectPrivs = new System.Windows.Forms.Button();
            this.ckbSelect = new System.Windows.Forms.CheckBox();
            this.ckbInsert = new System.Windows.Forms.CheckBox();
            this.ckbDelete = new System.Windows.Forms.CheckBox();
            this.ckbUpdate = new System.Windows.Forms.CheckBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label5 = new System.Windows.Forms.Label();
            this.cbColumnsObject = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.dtgvRoleOjectPrivs = new System.Windows.Forms.DataGridView();
            this.tcCreateRole.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            this.panel4.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.tabPage3.SuspendLayout();
            this.panel7.SuspendLayout();
            this.panel6.SuspendLayout();
            this.panel5.SuspendLayout();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvRoleOjectPrivs)).BeginInit();
            this.SuspendLayout();
            // 
            // bntExit
            // 
            this.bntExit.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bntExit.Location = new System.Drawing.Point(595, 521);
            this.bntExit.Name = "bntExit";
            this.bntExit.Size = new System.Drawing.Size(95, 34);
            this.bntExit.TabIndex = 8;
            this.bntExit.Text = "Thoát";
            this.bntExit.UseVisualStyleBackColor = true;
            this.bntExit.Click += new System.EventHandler(this.bntExit_Click);
            // 
            // bntCreateRole
            // 
            this.bntCreateRole.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bntCreateRole.Location = new System.Drawing.Point(470, 521);
            this.bntCreateRole.Name = "bntCreateRole";
            this.bntCreateRole.Size = new System.Drawing.Size(95, 34);
            this.bntCreateRole.TabIndex = 7;
            this.bntCreateRole.Text = "Tạo";
            this.bntCreateRole.UseVisualStyleBackColor = true;
            this.bntCreateRole.Click += new System.EventHandler(this.bntCreateRole_Click);
            // 
            // tcCreateRole
            // 
            this.tcCreateRole.Controls.Add(this.tabPage1);
            this.tcCreateRole.Controls.Add(this.tabPage2);
            this.tcCreateRole.Controls.Add(this.tabPage3);
            this.tcCreateRole.Location = new System.Drawing.Point(2, 7);
            this.tcCreateRole.Name = "tcCreateRole";
            this.tcCreateRole.SelectedIndex = 0;
            this.tcCreateRole.Size = new System.Drawing.Size(704, 499);
            this.tcCreateRole.TabIndex = 10;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.panel2);
            this.tabPage1.Controls.Add(this.panel3);
            this.tabPage1.Controls.Add(this.panel4);
            this.tabPage1.Location = new System.Drawing.Point(4, 25);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(696, 470);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Role";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.txbCreateRoleReEnterPass);
            this.panel2.Controls.Add(this.label1);
            this.panel2.Location = new System.Drawing.Point(7, 144);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(683, 63);
            this.panel2.TabIndex = 3;
            // 
            // txbCreateRoleReEnterPass
            // 
            this.txbCreateRoleReEnterPass.Location = new System.Drawing.Point(242, 21);
            this.txbCreateRoleReEnterPass.Name = "txbCreateRoleReEnterPass";
            this.txbCreateRoleReEnterPass.Size = new System.Drawing.Size(428, 22);
            this.txbCreateRoleReEnterPass.TabIndex = 1;
            this.txbCreateRoleReEnterPass.UseSystemPasswordChar = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(13, 21);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(157, 22);
            this.label1.TabIndex = 1;
            this.label1.Text = "Xác nhận mật khẩu";
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.txbCreateRolePass);
            this.panel3.Controls.Add(this.label2);
            this.panel3.Location = new System.Drawing.Point(7, 75);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(683, 63);
            this.panel3.TabIndex = 2;
            // 
            // txbCreateRolePass
            // 
            this.txbCreateRolePass.Location = new System.Drawing.Point(242, 21);
            this.txbCreateRolePass.Name = "txbCreateRolePass";
            this.txbCreateRolePass.Size = new System.Drawing.Size(428, 22);
            this.txbCreateRolePass.TabIndex = 1;
            this.txbCreateRolePass.UseSystemPasswordChar = true;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(13, 21);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(118, 22);
            this.label2.TabIndex = 1;
            this.label2.Text = "Mật khẩu mới";
            // 
            // panel4
            // 
            this.panel4.Controls.Add(this.txbCreateRoleName);
            this.panel4.Controls.Add(this.label3);
            this.panel4.Location = new System.Drawing.Point(6, 6);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(683, 63);
            this.panel4.TabIndex = 0;
            // 
            // txbCreateRoleName
            // 
            this.txbCreateRoleName.Location = new System.Drawing.Point(242, 21);
            this.txbCreateRoleName.Name = "txbCreateRoleName";
            this.txbCreateRoleName.Size = new System.Drawing.Size(428, 22);
            this.txbCreateRoleName.TabIndex = 1;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(13, 21);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(77, 22);
            this.label3.TabIndex = 1;
            this.label3.Text = "Tên role";
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.lsvRoleGrantRole);
            this.tabPage2.Location = new System.Drawing.Point(4, 25);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(696, 470);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Grant Roles";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // lsvRoleGrantRole
            // 
            this.lsvRoleGrantRole.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader1,
            this.columnHeader2,
            this.columnHeader3});
            this.lsvRoleGrantRole.GridLines = true;
            this.lsvRoleGrantRole.HideSelection = false;
            this.lsvRoleGrantRole.Location = new System.Drawing.Point(6, 40);
            this.lsvRoleGrantRole.Name = "lsvRoleGrantRole";
            this.lsvRoleGrantRole.Size = new System.Drawing.Size(684, 424);
            this.lsvRoleGrantRole.TabIndex = 0;
            this.lsvRoleGrantRole.UseCompatibleStateImageBehavior = false;
            this.lsvRoleGrantRole.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader1
            // 
            this.columnHeader1.Text = "Role Name";
            this.columnHeader1.Width = 334;
            // 
            // columnHeader2
            // 
            this.columnHeader2.Text = "Granted";
            this.columnHeader2.Width = 164;
            // 
            // columnHeader3
            // 
            this.columnHeader3.Text = "Admin";
            this.columnHeader3.Width = 181;
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.panel7);
            this.tabPage3.Controls.Add(this.panel6);
            this.tabPage3.Controls.Add(this.panel5);
            this.tabPage3.Controls.Add(this.panel1);
            this.tabPage3.Controls.Add(this.label4);
            this.tabPage3.Controls.Add(this.dtgvRoleOjectPrivs);
            this.tabPage3.Location = new System.Drawing.Point(4, 25);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage3.Size = new System.Drawing.Size(696, 470);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "Object Privileges";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // panel7
            // 
            this.panel7.Controls.Add(this.txbObjectType);
            this.panel7.Controls.Add(this.label8);
            this.panel7.Location = new System.Drawing.Point(455, 145);
            this.panel7.Name = "panel7";
            this.panel7.Size = new System.Drawing.Size(236, 78);
            this.panel7.TabIndex = 11;
            // 
            // txbObjectType
            // 
            this.txbObjectType.Location = new System.Drawing.Point(9, 42);
            this.txbObjectType.Name = "txbObjectType";
            this.txbObjectType.Size = new System.Drawing.Size(211, 22);
            this.txbObjectType.TabIndex = 9;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Calibri", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(5, 15);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(134, 24);
            this.label8.TabIndex = 8;
            this.label8.Text = "Loại đối tượng";
            // 
            // panel6
            // 
            this.panel6.Controls.Add(this.txbObjectName);
            this.panel6.Controls.Add(this.label6);
            this.panel6.Location = new System.Drawing.Point(455, 53);
            this.panel6.Name = "panel6";
            this.panel6.Size = new System.Drawing.Size(236, 78);
            this.panel6.TabIndex = 10;
            // 
            // txbObjectName
            // 
            this.txbObjectName.Location = new System.Drawing.Point(9, 42);
            this.txbObjectName.Name = "txbObjectName";
            this.txbObjectName.Size = new System.Drawing.Size(211, 22);
            this.txbObjectName.TabIndex = 9;
            this.txbObjectName.TextChanged += new System.EventHandler(this.txbObjectName_TextChanged);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Calibri", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(5, 15);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(129, 24);
            this.label6.TabIndex = 8;
            this.label6.Text = "Tên đối tượng";
            // 
            // panel5
            // 
            this.panel5.Controls.Add(this.bntApplyObjectPrivs);
            this.panel5.Controls.Add(this.ckbSelect);
            this.panel5.Controls.Add(this.ckbInsert);
            this.panel5.Controls.Add(this.ckbDelete);
            this.panel5.Controls.Add(this.ckbUpdate);
            this.panel5.Location = new System.Drawing.Point(455, 313);
            this.panel5.Name = "panel5";
            this.panel5.Size = new System.Drawing.Size(233, 151);
            this.panel5.TabIndex = 10;
            // 
            // bntApplyObjectPrivs
            // 
            this.bntApplyObjectPrivs.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bntApplyObjectPrivs.Location = new System.Drawing.Point(68, 106);
            this.bntApplyObjectPrivs.Name = "bntApplyObjectPrivs";
            this.bntApplyObjectPrivs.Size = new System.Drawing.Size(95, 34);
            this.bntApplyObjectPrivs.TabIndex = 11;
            this.bntApplyObjectPrivs.Text = "Áp dụng";
            this.bntApplyObjectPrivs.UseVisualStyleBackColor = true;
            this.bntApplyObjectPrivs.Click += new System.EventHandler(this.bntApplyObjectPrivs_Click);
            // 
            // ckbSelect
            // 
            this.ckbSelect.AutoSize = true;
            this.ckbSelect.Location = new System.Drawing.Point(14, 18);
            this.ckbSelect.Name = "ckbSelect";
            this.ckbSelect.Size = new System.Drawing.Size(67, 20);
            this.ckbSelect.TabIndex = 2;
            this.ckbSelect.Text = "Select";
            this.ckbSelect.UseVisualStyleBackColor = true;
            // 
            // ckbInsert
            // 
            this.ckbInsert.AutoSize = true;
            this.ckbInsert.Location = new System.Drawing.Point(146, 18);
            this.ckbInsert.Name = "ckbInsert";
            this.ckbInsert.Size = new System.Drawing.Size(61, 20);
            this.ckbInsert.TabIndex = 3;
            this.ckbInsert.Text = "Insert";
            this.ckbInsert.UseVisualStyleBackColor = true;
            // 
            // ckbDelete
            // 
            this.ckbDelete.AutoSize = true;
            this.ckbDelete.Location = new System.Drawing.Point(14, 63);
            this.ckbDelete.Name = "ckbDelete";
            this.ckbDelete.Size = new System.Drawing.Size(69, 20);
            this.ckbDelete.TabIndex = 6;
            this.ckbDelete.Text = "Delete";
            this.ckbDelete.UseVisualStyleBackColor = true;
            // 
            // ckbUpdate
            // 
            this.ckbUpdate.AutoSize = true;
            this.ckbUpdate.Location = new System.Drawing.Point(146, 63);
            this.ckbUpdate.Name = "ckbUpdate";
            this.ckbUpdate.Size = new System.Drawing.Size(74, 20);
            this.ckbUpdate.TabIndex = 5;
            this.ckbUpdate.Text = "Update";
            this.ckbUpdate.UseVisualStyleBackColor = true;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.label5);
            this.panel1.Controls.Add(this.cbColumnsObject);
            this.panel1.Location = new System.Drawing.Point(455, 229);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(234, 78);
            this.panel1.TabIndex = 9;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Calibri", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(5, 12);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(70, 24);
            this.label5.TabIndex = 8;
            this.label5.Text = "Tên cột";
            // 
            // cbColumnsObject
            // 
            this.cbColumnsObject.FormattingEnabled = true;
            this.cbColumnsObject.Location = new System.Drawing.Point(9, 39);
            this.cbColumnsObject.Name = "cbColumnsObject";
            this.cbColumnsObject.Size = new System.Drawing.Size(211, 24);
            this.cbColumnsObject.TabIndex = 7;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Calibri", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.Blue;
            this.label4.Location = new System.Drawing.Point(121, 17);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(166, 24);
            this.label4.TabIndex = 1;
            this.label4.Text = "BẢNG ĐỐI TƯỢNG";
            // 
            // dtgvRoleOjectPrivs
            // 
            this.dtgvRoleOjectPrivs.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dtgvRoleOjectPrivs.BackgroundColor = System.Drawing.SystemColors.Info;
            this.dtgvRoleOjectPrivs.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgvRoleOjectPrivs.Location = new System.Drawing.Point(11, 59);
            this.dtgvRoleOjectPrivs.Name = "dtgvRoleOjectPrivs";
            this.dtgvRoleOjectPrivs.RowHeadersWidth = 51;
            this.dtgvRoleOjectPrivs.RowTemplate.Height = 24;
            this.dtgvRoleOjectPrivs.Size = new System.Drawing.Size(443, 411);
            this.dtgvRoleOjectPrivs.TabIndex = 0;
            // 
            // fCreateRole
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(709, 567);
            this.Controls.Add(this.tcCreateRole);
            this.Controls.Add(this.bntExit);
            this.Controls.Add(this.bntCreateRole);
            this.Name = "fCreateRole";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Tạo role";
            this.tcCreateRole.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel4.ResumeLayout(false);
            this.panel4.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.tabPage3.ResumeLayout(false);
            this.tabPage3.PerformLayout();
            this.panel7.ResumeLayout(false);
            this.panel7.PerformLayout();
            this.panel6.ResumeLayout(false);
            this.panel6.PerformLayout();
            this.panel5.ResumeLayout(false);
            this.panel5.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvRoleOjectPrivs)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Button bntExit;
        private System.Windows.Forms.Button bntCreateRole;
        private System.Windows.Forms.TabControl tcCreateRole;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.TextBox txbCreateRoleReEnterPass;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.TextBox txbCreateRolePass;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.TextBox txbCreateRoleName;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.ListView lsvRoleGrantRole;
        private System.Windows.Forms.ColumnHeader columnHeader1;
        private System.Windows.Forms.ColumnHeader columnHeader2;
        private System.Windows.Forms.ColumnHeader columnHeader3;
        private System.Windows.Forms.DataGridView dtgvRoleOjectPrivs;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.CheckBox ckbInsert;
        private System.Windows.Forms.CheckBox ckbSelect;
        private System.Windows.Forms.Panel panel5;
        private System.Windows.Forms.CheckBox ckbDelete;
        private System.Windows.Forms.CheckBox ckbUpdate;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ComboBox cbColumnsObject;
        private System.Windows.Forms.Panel panel6;
        private System.Windows.Forms.TextBox txbObjectName;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Panel panel7;
        private System.Windows.Forms.TextBox txbObjectType;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Button bntApplyObjectPrivs;
    }
}