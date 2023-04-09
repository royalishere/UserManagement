namespace UserManagement
{
    partial class AdminForm
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
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.panel5 = new System.Windows.Forms.Panel();
            this.label4 = new System.Windows.Forms.Label();
            this.txbRoleName = new System.Windows.Forms.TextBox();
            this.dtgvRole = new System.Windows.Forms.DataGridView();
            this.label2 = new System.Windows.Forms.Label();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.panel6 = new System.Windows.Forms.Panel();
            this.bntShowPrivsRole = new System.Windows.Forms.Button();
            this.bntCreateRole = new System.Windows.Forms.Button();
            this.bntDeleteRole = new System.Windows.Forms.Button();
            this.bntEditRole = new System.Windows.Forms.Button();
            this.dtgvRolePrivs = new System.Windows.Forms.DataGridView();
            this.tabPage3.SuspendLayout();
            this.panel5.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvRole)).BeginInit();
            this.tabControl1.SuspendLayout();
            this.panel6.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvRolePrivs)).BeginInit();
            this.SuspendLayout();
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.dtgvRolePrivs);
            this.tabPage3.Controls.Add(this.panel6);
            this.tabPage3.Controls.Add(this.panel5);
            this.tabPage3.Controls.Add(this.dtgvRole);
            this.tabPage3.Controls.Add(this.label2);
            this.tabPage3.Location = new System.Drawing.Point(4, 22);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage3.Size = new System.Drawing.Size(1342, 703);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "VAI TRÒ";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // panel5
            // 
            this.panel5.Controls.Add(this.label4);
            this.panel5.Controls.Add(this.txbRoleName);
            this.panel5.Location = new System.Drawing.Point(1079, 75);
            this.panel5.Margin = new System.Windows.Forms.Padding(2);
            this.panel5.Name = "panel5";
            this.panel5.Size = new System.Drawing.Size(256, 46);
            this.panel5.TabIndex = 15;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Calibri", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(10, 11);
            this.label4.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(67, 19);
            this.label4.TabIndex = 12;
            this.label4.Text = "Tên Role";
            // 
            // txbRoleName
            // 
            this.txbRoleName.Location = new System.Drawing.Point(88, 13);
            this.txbRoleName.Margin = new System.Windows.Forms.Padding(2);
            this.txbRoleName.Name = "txbRoleName";
            this.txbRoleName.Size = new System.Drawing.Size(155, 20);
            this.txbRoleName.TabIndex = 0;
            // 
            // dtgvRole
            // 
            this.dtgvRole.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dtgvRole.ClipboardCopyMode = System.Windows.Forms.DataGridViewClipboardCopyMode.EnableAlwaysIncludeHeaderText;
            this.dtgvRole.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgvRole.Location = new System.Drawing.Point(3, 75);
            this.dtgvRole.Margin = new System.Windows.Forms.Padding(2);
            this.dtgvRole.Name = "dtgvRole";
            this.dtgvRole.RowHeadersWidth = 51;
            this.dtgvRole.RowTemplate.Height = 24;
            this.dtgvRole.Size = new System.Drawing.Size(1038, 368);
            this.dtgvRole.TabIndex = 5;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 22.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.DarkBlue;
            this.label2.Location = new System.Drawing.Point(301, 24);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(415, 35);
            this.label2.TabIndex = 4;
            this.label2.Text = "BẢNG NHÓM NGƯỜI DÙNG";
            // 
            // tabPage2
            // 
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(1342, 703);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "NGƯỜI DÙNG";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // tabPage1
            // 
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(1342, 703);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "HỆ THỐNG";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Controls.Add(this.tabPage3);
            this.tabControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControl1.Location = new System.Drawing.Point(0, 0);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(1350, 729);
            this.tabControl1.TabIndex = 5;
            this.tabControl1.SelectedIndexChanged += new System.EventHandler(this.tabControl1_SelectedIndexChanged);
            // 
            // panel6
            // 
            this.panel6.Controls.Add(this.bntShowPrivsRole);
            this.panel6.Controls.Add(this.bntCreateRole);
            this.panel6.Controls.Add(this.bntDeleteRole);
            this.panel6.Controls.Add(this.bntEditRole);
            this.panel6.Location = new System.Drawing.Point(1151, 165);
            this.panel6.Margin = new System.Windows.Forms.Padding(2);
            this.panel6.Name = "panel6";
            this.panel6.Size = new System.Drawing.Size(122, 206);
            this.panel6.TabIndex = 16;
            // 
            // bntShowPrivsRole
            // 
            this.bntShowPrivsRole.AutoSize = true;
            this.bntShowPrivsRole.Location = new System.Drawing.Point(13, 17);
            this.bntShowPrivsRole.Margin = new System.Windows.Forms.Padding(2);
            this.bntShowPrivsRole.Name = "bntShowPrivsRole";
            this.bntShowPrivsRole.Size = new System.Drawing.Size(94, 32);
            this.bntShowPrivsRole.TabIndex = 7;
            this.bntShowPrivsRole.Text = "Xem quyền";
            this.bntShowPrivsRole.UseVisualStyleBackColor = true;
            this.bntShowPrivsRole.Click += new System.EventHandler(this.bntShowPrivsRole_Click);
            // 
            // bntCreateRole
            // 
            this.bntCreateRole.AutoSize = true;
            this.bntCreateRole.Location = new System.Drawing.Point(13, 63);
            this.bntCreateRole.Margin = new System.Windows.Forms.Padding(2);
            this.bntCreateRole.Name = "bntCreateRole";
            this.bntCreateRole.Size = new System.Drawing.Size(94, 32);
            this.bntCreateRole.TabIndex = 5;
            this.bntCreateRole.Text = "Tạo";
            this.bntCreateRole.UseVisualStyleBackColor = true;
            this.bntCreateRole.Click += new System.EventHandler(this.bntCreateRole_Click);
            // 
            // bntDeleteRole
            // 
            this.bntDeleteRole.AutoSize = true;
            this.bntDeleteRole.Location = new System.Drawing.Point(13, 155);
            this.bntDeleteRole.Margin = new System.Windows.Forms.Padding(2);
            this.bntDeleteRole.Name = "bntDeleteRole";
            this.bntDeleteRole.Size = new System.Drawing.Size(94, 32);
            this.bntDeleteRole.TabIndex = 8;
            this.bntDeleteRole.Text = "Xóa";
            this.bntDeleteRole.UseVisualStyleBackColor = true;
            this.bntDeleteRole.Click += new System.EventHandler(this.bntDeleteRole_Click);
            // 
            // bntEditRole
            // 
            this.bntEditRole.AutoSize = true;
            this.bntEditRole.Location = new System.Drawing.Point(13, 108);
            this.bntEditRole.Margin = new System.Windows.Forms.Padding(2);
            this.bntEditRole.Name = "bntEditRole";
            this.bntEditRole.Size = new System.Drawing.Size(94, 32);
            this.bntEditRole.TabIndex = 4;
            this.bntEditRole.Text = "Chỉnh sửa";
            this.bntEditRole.UseVisualStyleBackColor = true;
            this.bntEditRole.Click += new System.EventHandler(this.bntEditRole_Click);
            // 
            // dtgvRolePrivs
            // 
            this.dtgvRolePrivs.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dtgvRolePrivs.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgvRolePrivs.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.dtgvRolePrivs.Location = new System.Drawing.Point(3, 477);
            this.dtgvRolePrivs.Margin = new System.Windows.Forms.Padding(2);
            this.dtgvRolePrivs.Name = "dtgvRolePrivs";
            this.dtgvRolePrivs.RowHeadersWidth = 51;
            this.dtgvRolePrivs.RowTemplate.Height = 24;
            this.dtgvRolePrivs.Size = new System.Drawing.Size(1336, 223);
            this.dtgvRolePrivs.TabIndex = 17;
            // 
            // AdminForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1350, 729);
            this.Controls.Add(this.tabControl1);
            this.Name = "AdminForm";
            this.Text = "QUẢN TRỊ NGƯỜI DÙNG";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.AdminForm_Load);
            this.tabPage3.ResumeLayout(false);
            this.tabPage3.PerformLayout();
            this.panel5.ResumeLayout(false);
            this.panel5.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvRole)).EndInit();
            this.tabControl1.ResumeLayout(false);
            this.panel6.ResumeLayout(false);
            this.panel6.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvRolePrivs)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.Panel panel5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txbRoleName;
        private System.Windows.Forms.DataGridView dtgvRole;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DataGridView dtgvRolePrivs;
        private System.Windows.Forms.Panel panel6;
        private System.Windows.Forms.Button bntShowPrivsRole;
        private System.Windows.Forms.Button bntCreateRole;
        private System.Windows.Forms.Button bntDeleteRole;
        private System.Windows.Forms.Button bntEditRole;
    }
}