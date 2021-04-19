using QuanLyBanHang.Libs;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyBanHang
{
    public partial class F_Login : Form
    {
        public F_Login()
        {
            InitializeComponent();
        }

        private void btn_Login_Click(object sender, EventArgs e)
        {
            if (txt_User.Text.Trim() !="" && txt_Pass.Text.Trim() != "")
            {
               Username user = new Username(txt_User.Text.Trim(), txt_Pass.Text.Trim());
               if(user.Checklogin() == true)
               {
                    F_Menu f = new F_Menu();
                    txt_User.Text = "";
                    txt_Pass.Text = "";
                    this.Hide();
                    f.ShowDialog();
                    this.Show();
               }
               else
               {
                    MessageBox.Show("Sai tài khoản hoặc mật khẩu vui lòng thử lại", "Đăng nhập thất bại", MessageBoxButtons.OK);
               }
            }
            else
            {
                MessageBox.Show("Chưa nhập thông tin","Thông báo");
            }
        }

        private void btn_Exit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void F_Login_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát không?", "Thông báo", MessageBoxButtons.OKCancel,MessageBoxIcon.Information) != System.Windows.Forms.DialogResult.OK)
            {
                e.Cancel = true;
            }
        }

    }
}
