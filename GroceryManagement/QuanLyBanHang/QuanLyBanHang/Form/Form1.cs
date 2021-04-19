using QuanLyBanHang.Libs.Class;
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
    public partial class F_Detail : Form
    {
        public F_Detail()
        {
            InitializeComponent();
        }
        private BillInfo bf = new BillInfo();

        public F_Detail(string a):this()
        {
            if (a == "0")
            {
                dgv_Detail.DataSource = bf.SLB();
            }
            else if (a == "1")
            {
                dgv_Detail.DataSource = bf.DEMHD();
            }
            else
            {
                dgv_Detail.DataSource = bf.DanhSach(a);
            }
        }

        private void F_Detail_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
    }
}
