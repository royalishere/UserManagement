namespace UserManagement.Features
{
    partial class ProjectForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ProjectForm));
            this.panel1 = new System.Windows.Forms.Panel();
            this.label5 = new System.Windows.Forms.Label();
            this.ngaybd_datepk = new System.Windows.Forms.DateTimePicker();
            this.fpn_button = new System.Windows.Forms.FlowLayoutPanel();
            this.createnew_btn = new System.Windows.Forms.Button();
            this.update_btn = new System.Windows.Forms.Button();
            this.delete_btn = new System.Windows.Forms.Button();
            this.maphg_tb = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.tenda_tb = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.mada_tb = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.dean_dg = new System.Windows.Forms.DataGridView();
            this.panel1.SuspendLayout();
            this.fpn_button.SuspendLayout();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dean_dg)).BeginInit();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.label5);
            this.panel1.Controls.Add(this.ngaybd_datepk);
            this.panel1.Controls.Add(this.fpn_button);
            this.panel1.Controls.Add(this.maphg_tb);
            this.panel1.Controls.Add(this.label4);
            this.panel1.Controls.Add(this.tenda_tb);
            this.panel1.Controls.Add(this.label3);
            this.panel1.Controls.Add(this.mada_tb);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(605, 189);
            this.panel1.TabIndex = 29;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label5.Location = new System.Drawing.Point(275, 104);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(76, 15);
            this.label5.TabIndex = 43;
            this.label5.Text = "Ngày bắt đầu";
            // 
            // ngaybd_datepk
            // 
            this.ngaybd_datepk.CalendarFont = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.ngaybd_datepk.CustomFormat = "dd MMM yyyy";
            this.ngaybd_datepk.Enabled = false;
            this.ngaybd_datepk.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.ngaybd_datepk.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.ngaybd_datepk.Location = new System.Drawing.Point(357, 101);
            this.ngaybd_datepk.Name = "ngaybd_datepk";
            this.ngaybd_datepk.Size = new System.Drawing.Size(124, 22);
            this.ngaybd_datepk.TabIndex = 42;
            this.ngaybd_datepk.Value = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            // 
            // fpn_button
            // 
            this.fpn_button.Controls.Add(this.createnew_btn);
            this.fpn_button.Controls.Add(this.update_btn);
            this.fpn_button.Controls.Add(this.delete_btn);
            this.fpn_button.Location = new System.Drawing.Point(154, 133);
            this.fpn_button.Margin = new System.Windows.Forms.Padding(0);
            this.fpn_button.Name = "fpn_button";
            this.fpn_button.Size = new System.Drawing.Size(300, 45);
            this.fpn_button.TabIndex = 41;
            this.fpn_button.Visible = false;
            // 
            // createnew_btn
            // 
            this.createnew_btn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.createnew_btn.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.createnew_btn.Location = new System.Drawing.Point(15, 10);
            this.createnew_btn.Margin = new System.Windows.Forms.Padding(15, 10, 15, 10);
            this.createnew_btn.Name = "createnew_btn";
            this.createnew_btn.Size = new System.Drawing.Size(70, 26);
            this.createnew_btn.TabIndex = 37;
            this.createnew_btn.Text = "Tạo mới";
            this.createnew_btn.UseVisualStyleBackColor = true;
            this.createnew_btn.Click += new System.EventHandler(this.createnew_btn_Click);
            // 
            // update_btn
            // 
            this.update_btn.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.update_btn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.update_btn.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.update_btn.ForeColor = System.Drawing.Color.DarkBlue;
            this.update_btn.Location = new System.Drawing.Point(115, 10);
            this.update_btn.Margin = new System.Windows.Forms.Padding(15, 10, 15, 10);
            this.update_btn.Name = "update_btn";
            this.update_btn.Size = new System.Drawing.Size(70, 26);
            this.update_btn.TabIndex = 38;
            this.update_btn.Text = "Cập nhật";
            this.update_btn.UseVisualStyleBackColor = true;
            this.update_btn.Click += new System.EventHandler(this.update_btn_Click);
            // 
            // delete_btn
            // 
            this.delete_btn.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(224)))), ((int)(((byte)(192)))));
            this.delete_btn.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.delete_btn.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.delete_btn.ForeColor = System.Drawing.Color.Red;
            this.delete_btn.Location = new System.Drawing.Point(215, 10);
            this.delete_btn.Margin = new System.Windows.Forms.Padding(15, 10, 15, 10);
            this.delete_btn.Name = "delete_btn";
            this.delete_btn.Size = new System.Drawing.Size(70, 26);
            this.delete_btn.TabIndex = 39;
            this.delete_btn.Text = "Xóa";
            this.delete_btn.UseVisualStyleBackColor = true;
            this.delete_btn.Click += new System.EventHandler(this.delete_btn_Click);
            // 
            // maphg_tb
            // 
            this.maphg_tb.Enabled = false;
            this.maphg_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.maphg_tb.Location = new System.Drawing.Point(138, 101);
            this.maphg_tb.Name = "maphg_tb";
            this.maphg_tb.Size = new System.Drawing.Size(103, 22);
            this.maphg_tb.TabIndex = 40;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label4.Location = new System.Drawing.Point(72, 104);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(60, 15);
            this.label4.TabIndex = 39;
            this.label4.Text = "Mã phòng";
            // 
            // tenda_tb
            // 
            this.tenda_tb.Enabled = false;
            this.tenda_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.tenda_tb.Location = new System.Drawing.Point(357, 57);
            this.tenda_tb.Multiline = true;
            this.tenda_tb.Name = "tenda_tb";
            this.tenda_tb.Size = new System.Drawing.Size(173, 38);
            this.tenda_tb.TabIndex = 38;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label3.Location = new System.Drawing.Point(291, 60);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(59, 15);
            this.label3.TabIndex = 37;
            this.label3.Text = "Tên đề án";
            // 
            // mada_tb
            // 
            this.mada_tb.Enabled = false;
            this.mada_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.mada_tb.Location = new System.Drawing.Point(138, 57);
            this.mada_tb.Name = "mada_tb";
            this.mada_tb.Size = new System.Drawing.Size(103, 22);
            this.mada_tb.TabIndex = 36;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label2.Location = new System.Drawing.Point(77, 60);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(55, 15);
            this.label2.TabIndex = 35;
            this.label2.Text = "Mã đề án";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label1.Location = new System.Drawing.Point(162, 19);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(280, 22);
            this.label1.TabIndex = 29;
            this.label1.Text = "DANH SÁCH ĐỀ ÁN CÔNG TY";
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.dean_dg);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel2.Location = new System.Drawing.Point(0, 189);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(605, 283);
            this.panel2.TabIndex = 30;
            // 
            // dean_dg
            // 
            this.dean_dg.AllowUserToAddRows = false;
            this.dean_dg.AllowUserToDeleteRows = false;
            this.dean_dg.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dean_dg.BackgroundColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dean_dg.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dean_dg.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dean_dg.Location = new System.Drawing.Point(13, 6);
            this.dean_dg.Name = "dean_dg";
            this.dean_dg.ReadOnly = true;
            this.dean_dg.RowHeadersVisible = false;
            this.dean_dg.Size = new System.Drawing.Size(580, 265);
            this.dean_dg.TabIndex = 0;
            this.dean_dg.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dean_dg_CellClick);
            // 
            // ProjectForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(605, 472);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "ProjectForm";
            this.Text = "Danh sách đề án";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.ProjectForm_FormClosed);
            this.Load += new System.EventHandler(this.ProjectForm_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.fpn_button.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dean_dg)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.DataGridView dean_dg;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.DateTimePicker ngaybd_datepk;
        private System.Windows.Forms.FlowLayoutPanel fpn_button;
        private System.Windows.Forms.Button createnew_btn;
        private System.Windows.Forms.Button update_btn;
        private System.Windows.Forms.Button delete_btn;
        private System.Windows.Forms.TextBox maphg_tb;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox tenda_tb;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox mada_tb;
        private System.Windows.Forms.Label label2;
    }
}