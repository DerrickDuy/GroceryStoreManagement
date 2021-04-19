using QuanLyBanHang.Libs;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyBanHang
{
    public partial class F_Account : Form
    {
        public F_Account()
        {
            InitializeComponent();
        }

        private void btn_Cancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btn_Update_Click(object sender, EventArgs e)
        {
            if(txt_New.Text.Trim() != "" && txt_Old.Text.Trim() !="" && txt_Repeat.Text.Trim() !="")
            {
                if (Username.password==txt_Old.Text.Trim())
                {
                    if (txt_New.Text.Trim() == txt_Repeat.Text.Trim())
                    {
                        Username user = new Username();
                        user.Updatepass(txt_New.Text.Trim());
                        MessageBox.Show("Đổi mật khẩu thành công", "Thông báo");
                        this.Close();
                    }
                    else
                    {
                        MessageBox.Show("Mật khẩu mới không trùng khớp vui lòng kiểm tra lại", "Thông báo");
                    }
                }
                else
                {
                    MessageBox.Show("Mật khẩu cũ không đúng vui lòng nhập lại","Thông báo");
                }
            }
            else
            {
                MessageBox.Show("Thiếu thông tin, vui lòng nhập lại","Thông báo");
            }
        }
    }
}
