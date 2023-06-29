namespace UserManagement.Features
{
    partial class FinanceForm
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FinanceForm));
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.manv_tb = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.tennv_tb = new System.Windows.Forms.TextBox();
            this.update_btn = new System.Windows.Forms.Button();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.luong_tb = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.phucap_tb = new System.Windows.Forms.TextBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.phg_tb = new System.Windows.Forms.TextBox();
            this.vaitro_tb = new System.Windows.Forms.TextBox();
            this.panel2 = new System.Windows.Forms.Panel();
            this.dgtaichinh = new System.Windows.Forms.DataGridView();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgtaichinh)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label1.Location = new System.Drawing.Point(274, 19);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(296, 22);
            this.label1.TabIndex = 27;
            this.label1.Text = "TÀI CHÍNH NHÂN SỰ CÔNG TY";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label2.Location = new System.Drawing.Point(94, 76);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(79, 15);
            this.label2.TabIndex = 28;
            this.label2.Text = "Mã nhân viên";
            // 
            // manv_tb
            // 
            this.manv_tb.Enabled = false;
            this.manv_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.manv_tb.Location = new System.Drawing.Point(183, 73);
            this.manv_tb.Name = "manv_tb";
            this.manv_tb.Size = new System.Drawing.Size(114, 22);
            this.manv_tb.TabIndex = 29;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label3.Location = new System.Drawing.Point(91, 111);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(83, 15);
            this.label3.TabIndex = 30;
            this.label3.Text = "Tên nhân viên";
            // 
            // tennv_tb
            // 
            this.tennv_tb.Enabled = false;
            this.tennv_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.tennv_tb.Location = new System.Drawing.Point(183, 108);
            this.tennv_tb.Name = "tennv_tb";
            this.tennv_tb.Size = new System.Drawing.Size(114, 22);
            this.tennv_tb.TabIndex = 31;
            // 
            // update_btn
            // 
            this.update_btn.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.update_btn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.update_btn.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.update_btn.ForeColor = System.Drawing.Color.DarkBlue;
            this.update_btn.Location = new System.Drawing.Point(393, 153);
            this.update_btn.Margin = new System.Windows.Forms.Padding(15, 10, 15, 10);
            this.update_btn.Name = "update_btn";
            this.update_btn.Size = new System.Drawing.Size(114, 30);
            this.update_btn.TabIndex = 38;
            this.update_btn.Text = "Cập nhật";
            this.update_btn.UseVisualStyleBackColor = true;
            this.update_btn.Visible = false;
            this.update_btn.Click += new System.EventHandler(this.update_btn_Click);
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label9.Location = new System.Drawing.Point(341, 76);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(44, 15);
            this.label9.TabIndex = 43;
            this.label9.Text = "Vai trò";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label10.Location = new System.Drawing.Point(321, 111);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(64, 15);
            this.label10.TabIndex = 47;
            this.label10.Text = "Phòng ban";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label11.Location = new System.Drawing.Point(565, 76);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(44, 15);
            this.label11.TabIndex = 49;
            this.label11.Text = "Lương";
            // 
            // luong_tb
            // 
            this.luong_tb.Enabled = false;
            this.luong_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.luong_tb.Location = new System.Drawing.Point(617, 73);
            this.luong_tb.Name = "luong_tb";
            this.luong_tb.Size = new System.Drawing.Size(114, 22);
            this.luong_tb.TabIndex = 50;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label12.Location = new System.Drawing.Point(559, 111);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(50, 15);
            this.label12.TabIndex = 51;
            this.label12.Text = "Phụ cấp";
            // 
            // phucap_tb
            // 
            this.phucap_tb.Enabled = false;
            this.phucap_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.phucap_tb.Location = new System.Drawing.Point(617, 108);
            this.phucap_tb.Name = "phucap_tb";
            this.phucap_tb.Size = new System.Drawing.Size(114, 22);
            this.phucap_tb.TabIndex = 52;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.update_btn);
            this.panel1.Controls.Add(this.phucap_tb);
            this.panel1.Controls.Add(this.label12);
            this.panel1.Controls.Add(this.luong_tb);
            this.panel1.Controls.Add(this.label11);
            this.panel1.Controls.Add(this.phg_tb);
            this.panel1.Controls.Add(this.label10);
            this.panel1.Controls.Add(this.vaitro_tb);
            this.panel1.Controls.Add(this.label9);
            this.panel1.Controls.Add(this.tennv_tb);
            this.panel1.Controls.Add(this.label3);
            this.panel1.Controls.Add(this.manv_tb);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(825, 211);
            this.panel1.TabIndex = 30;
            // 
            // phg_tb
            // 
            this.phg_tb.Enabled = false;
            this.phg_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.phg_tb.Location = new System.Drawing.Point(393, 108);
            this.phg_tb.Name = "phg_tb";
            this.phg_tb.Size = new System.Drawing.Size(114, 22);
            this.phg_tb.TabIndex = 48;
            // 
            // vaitro_tb
            // 
            this.vaitro_tb.Enabled = false;
            this.vaitro_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.vaitro_tb.Location = new System.Drawing.Point(393, 73);
            this.vaitro_tb.Name = "vaitro_tb";
            this.vaitro_tb.Size = new System.Drawing.Size(114, 22);
            this.vaitro_tb.TabIndex = 44;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.dgtaichinh);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel2.Location = new System.Drawing.Point(0, 211);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(825, 331);
            this.panel2.TabIndex = 31;
            // 
            // dgtaichinh
            // 
            this.dgtaichinh.AllowUserToAddRows = false;
            this.dgtaichinh.AllowUserToDeleteRows = false;
            this.dgtaichinh.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgtaichinh.BackgroundColor = System.Drawing.SystemColors.Control;
            this.dgtaichinh.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.Raised;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgtaichinh.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dgtaichinh.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgtaichinh.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.dgtaichinh.Location = new System.Drawing.Point(12, 10);
            this.dgtaichinh.Name = "dgtaichinh";
            this.dgtaichinh.ReadOnly = true;
            this.dgtaichinh.RowHeadersVisible = false;
            this.dgtaichinh.Size = new System.Drawing.Size(801, 309);
            this.dgtaichinh.TabIndex = 0;
            this.dgtaichinh.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgtaichinh_CellClick);
            // 
            // FinanceForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(825, 542);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FinanceForm";
            this.Text = "Quản Lí Tài chính";
            this.Load += new System.EventHandler(this.FinanceForm_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgtaichinh)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox manv_tb;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox tennv_tb;
        private System.Windows.Forms.Button update_btn;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox luong_tb;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox phucap_tb;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.TextBox phg_tb;
        private System.Windows.Forms.TextBox vaitro_tb;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.DataGridView dgtaichinh;
    }
}