using QuanLyBanHang.Libs;
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
    public partial class F_Menu : Form
    {
        public F_Menu()
        {
            InitializeComponent();
            label5.Text = "Xin chào " + Username.username;
            LoadData();
        }

        //Tạo data clone
        #region
        private Customer cus = new Customer();
        private Good good = new Good();
        private Bill bill = new Bill();
        private BillInfo bf = new BillInfo();
        private void LoadData()
        {
            cmb_Customer.DataSource = cus.DanhSach();
            cmb_Customer.DisplayMember = "HoTen";
            cmb_Customer.ValueMember = "MaKH";
            cmb_Goods.DataSource = good.DanhSach();
            cmb_Goods.DisplayMember = "TenHH";
            cmb_Goods.ValueMember = "MaHH";
            txt_Id.Text = bill.Count();
            dgv_BillInfo.DataSource = bf.DanhSach(txt_Id.Text.Trim());
            txt_Tong.Text = bf.Sum(txt_Id.Text.Trim());
        }
        #endregion

        //Menu
        #region
        private void đăngXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void xemThôngTinToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Tài khoản hiện đang sử dụng là: "+ Username.username,"Thông tin");
        }

        private void đổiMậtKhẩuToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            F_Account f = new F_Account();
            f.ShowDialog();
            this.Show();
        }

        private void quảnLýToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            F_Sale f = new F_Sale();
            f.ShowDialog();
            LoadData();
            this.Show();
            
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            label6.Text = DateTime.Now.ToString();
        }
        #endregion

        //BillInfo
        #region
        private void btn_Check_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn đã chọn khách hàng đã thanh toán chưa?","Thông báo",MessageBoxButtons.YesNo)!= System.Windows.Forms.DialogResult.No)
            {
                Bill a = new Bill(txt_Id.Text.Trim(), cmb_Customer.SelectedValue.ToString().Trim(), DateTime.Now.ToString("mm/dd/yyyy").Trim(), int.Parse(txt_Tong.Text.Trim()));
                a.InsBill(a);
                MinusSL();
                txt_Tong.Text = "";
                txt_Num.Text = "";
                txt_Id.Text = bill.Count();
                dgv_BillInfo.DataSource = bf.DanhSach(txt_Id.Text.Trim());
            }
        }

        private void MinusSL()
        {
            int position = dgv_BillInfo.Rows.Count - 1;
            for (int i=0;i<position;i++)
            {
                int sl = int.Parse(dgv_BillInfo.Rows[i].Cells[2].Value.ToString());
                good.UpSL(cmb_Goods.SelectedValue.ToString().Trim(),good.SL(cmb_Goods.SelectedValue.ToString().Trim())-sl);
            }
        }

        private void btn_Insert_Click(object sender, EventArgs e)
        {
            if (int.Parse(txt_Num.Text.Trim()) <= good.SL(cmb_Goods.SelectedValue.ToString().Trim()))
            {
                BillInfo a = new BillInfo(txt_Id.Text.Trim(), cmb_Goods.SelectedValue.ToString().Trim(), int.Parse(txt_Num.Text.Trim()));
                a.InsBillInfo(a);
                dgv_BillInfo.DataSource = a.DanhSach(txt_Id.Text.Trim());
                txt_Tong.Text = a.Sum(txt_Id.Text.Trim());
                txt_Num.Text = "";
            }
            else
            {
                MessageBox.Show("Lượng sản phẩm trong kho không đủ, vui lòng kiểm tra lại");
            }
        }

        private void btn_Delete_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn muốn xóa dữ liệu về "+cmb_Goods.SelectedValue.ToString(),"Thông báo",MessageBoxButtons.YesNo) != System.Windows.Forms.DialogResult.No)
            {
                bf.DelBillInfo(txt_Id.Text.Trim(), cmb_Goods.SelectedValue.ToString().Trim());
                dgv_BillInfo.DataSource = bf.DanhSach(txt_Id.Text.Trim());
            }
        }

        private void dgv_BillInfo_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgv_BillInfo.Rows.Count>0)
            {
                int position = dgv_BillInfo.CurrentRow.Index;
                txt_Num.Text = dgv_BillInfo.Rows[position].Cells[2].Value.ToString();
                cmb_Goods.Text = dgv_BillInfo.Rows[position].Cells[1].Value.ToString();
            }
        }
        #endregion
    }
}
