namespace UserManagement.Features
{
    partial class DepartmentForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(DepartmentForm));
            this.label1 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.fpn_button = new System.Windows.Forms.FlowLayoutPanel();
            this.createnew_btn = new System.Windows.Forms.Button();
            this.update_btn = new System.Windows.Forms.Button();
            this.delete_btn = new System.Windows.Forms.Button();
            this.matrphg_tb = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.tenphg_tb = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.maphg_tb = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.dgphongban = new System.Windows.Forms.DataGridView();
            this.panel1.SuspendLayout();
            this.fpn_button.SuspendLayout();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgphongban)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label1.Location = new System.Drawing.Point(131, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(336, 22);
            this.label1.TabIndex = 27;
            this.label1.Text = "DANH SÁCH PHÒNG BAN CÔNG TY";
            // 
            // panel1
            // 
            this.panel1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.panel1.Controls.Add(this.fpn_button);
            this.panel1.Controls.Add(this.matrphg_tb);
            this.panel1.Controls.Add(this.label4);
            this.panel1.Controls.Add(this.tenphg_tb);
            this.panel1.Controls.Add(this.label3);
            this.panel1.Controls.Add(this.maphg_tb);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(605, 172);
            this.panel1.TabIndex = 28;
            // 
            // fpn_button
            // 
            this.fpn_button.Controls.Add(this.createnew_btn);
            this.fpn_button.Controls.Add(this.update_btn);
            this.fpn_button.Controls.Add(this.delete_btn);
            this.fpn_button.Location = new System.Drawing.Point(155, 114);
            this.fpn_button.Margin = new System.Windows.Forms.Padding(0);
            this.fpn_button.Name = "fpn_button";
            this.fpn_button.Size = new System.Drawing.Size(300, 48);
            this.fpn_button.TabIndex = 34;
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
            this.delete_btn.Enabled = false;
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
            // matrphg_tb
            // 
            this.matrphg_tb.Enabled = false;
            this.matrphg_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.matrphg_tb.Location = new System.Drawing.Point(490, 71);
            this.matrphg_tb.Name = "matrphg_tb";
            this.matrphg_tb.Size = new System.Drawing.Size(103, 22);
            this.matrphg_tb.TabIndex = 33;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label4.Location = new System.Drawing.Point(384, 74);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(102, 15);
            this.label4.TabIndex = 32;
            this.label4.Text = "Mã trưởng phòng";
            // 
            // tenphg_tb
            // 
            this.tenphg_tb.Enabled = false;
            this.tenphg_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.tenphg_tb.Location = new System.Drawing.Point(252, 71);
            this.tenphg_tb.Name = "tenphg_tb";
            this.tenphg_tb.Size = new System.Drawing.Size(114, 22);
            this.tenphg_tb.TabIndex = 31;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label3.Location = new System.Drawing.Point(186, 74);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(64, 15);
            this.label3.TabIndex = 30;
            this.label3.Text = "Tên phòng";
            // 
            // maphg_tb
            // 
            this.maphg_tb.Enabled = false;
            this.maphg_tb.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.maphg_tb.Location = new System.Drawing.Point(75, 71);
            this.maphg_tb.Name = "maphg_tb";
            this.maphg_tb.Size = new System.Drawing.Size(90, 22);
            this.maphg_tb.TabIndex = 29;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label2.Location = new System.Drawing.Point(9, 74);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(60, 15);
            this.label2.TabIndex = 28;
            this.label2.Text = "Mã phòng";
            // 
            // panel2
            // 
            this.panel2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.panel2.Controls.Add(this.dgphongban);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel2.Location = new System.Drawing.Point(0, 172);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(605, 254);
            this.panel2.TabIndex = 29;
            // 
            // dgphongban
            // 
            this.dgphongban.AllowUserToAddRows = false;
            this.dgphongban.AllowUserToDeleteRows = false;
            this.dgphongban.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgphongban.BackgroundColor = System.Drawing.SystemColors.Control;
            this.dgphongban.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.Raised;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgphongban.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dgphongban.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgphongban.Location = new System.Drawing.Point(12, 10);
            this.dgphongban.Name = "dgphongban";
            this.dgphongban.ReadOnly = true;
            this.dgphongban.RowHeadersVisible = false;
            this.dgphongban.Size = new System.Drawing.Size(581, 232);
            this.dgphongban.TabIndex = 0;
            this.dgphongban.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgphongban_CellClick);
            // 
            // DepartmentForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(605, 426);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "DepartmentForm";
            this.Text = "Danh sách phòng ban";
            this.Load += new System.EventHandler(this.DepartmentForm_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.fpn_button.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgphongban)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.DataGridView dgphongban;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox matrphg_tb;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox tenphg_tb;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox maphg_tb;
        private System.Windows.Forms.FlowLayoutPanel fpn_button;
        private System.Windows.Forms.Button delete_btn;
        private System.Windows.Forms.Button update_btn;
        private System.Windows.Forms.Button createnew_btn;
    }
}