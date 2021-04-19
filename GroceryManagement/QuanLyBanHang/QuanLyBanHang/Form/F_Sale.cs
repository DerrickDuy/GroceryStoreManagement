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
    public partial class F_Sale : Form
    {
        public F_Sale()
        {
            InitializeComponent();
            LoadDataTable();
        }

        private void btn_Back_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        //Tạo dataclone
        #region
        private Vendor ven = new Vendor();
        private Category cat = new Category();
        private Customer cus = new Customer();
        private Good good = new Good();
        private Bill bill = new Bill();

        private void LoadDataTable()
        {
            dgv_Vendor.DataSource = ven.Danhsach();
            label14.Text = "Số dòng hiện tại " + (dgv_Vendor.Rows.Count - 1);
            dgv_Cat.DataSource = cat.DanhSach();
            label19.Text = "Số dòng hiện tại " + (dgv_Cat.Rows.Count - 1);
            dgv_Customers.DataSource = cus.DanhSach();
            label20.Text = "Số dòng hiện tại " + (dgv_Customers.Rows.Count - 1);
            dgv_Good.DataSource = good.DanhSach();
            label21.Text = "Số dòng hiện tại " + (dgv_Good.Rows.Count - 1);
            cmb_CatGood.DataSource = cat.DanhSach();
            cmb_CatGood.DisplayMember = "TenLoai";
            cmb_CatGood.ValueMember = "MaLoaiHH";
            cmb_VenGood.DataSource = ven.Danhsach();
            cmb_VenGood.DisplayMember = "TenCungCap";
            cmb_VenGood.ValueMember = "MaCC";
            dgv_Bill.DataSource = bill.DanhSach();
            label22.Text = "Số dòng hiện tại " + (dgv_Bill.Rows.Count - 1);
            SumUp();
        }

        private void SumUp()
        {
            int Tong = 0;
            int position = dgv_Bill.Rows.Count - 1;
            for (int i = 0; i < position; i++)
            {
                int sl = int.Parse(dgv_Bill.Rows[i].Cells[3].Value.ToString());
                Tong = Tong + sl;
            }
            label23.Text = "Tổng: " + Tong +"đ";
        }
        #endregion

        //Vendor
        #region 
        private void btn_InsVen_Click(object sender, EventArgs e)
        {
            if (txt_IdVen.Text.Trim()!="")
            {
                Vendor a = new Vendor(txt_IdVen.Text.Trim(), txt_NameVen.Text.Trim(), txt_AddVen.Text.Trim(), txt_PhoVen.Text.Trim());
                a.InsertVen(a);
                dgv_Vendor.DataSource = a.Danhsach();
                label14.Text = "Số dòng hiện tại " + (dgv_Vendor.Rows.Count - 1);
            }
            else
            {
                MessageBox.Show("Thiếu mã nhà cung cấp nên không thể thêm!", "Thông báo");
            }
        }

        private void dgv_Vendor_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if(dgv_Vendor.Rows.Count >0)
            {
                int position = dgv_Vendor.CurrentRow.Index;
                txt_IdVen.Text = dgv_Vendor.Rows[position].Cells[0].Value.ToString();
                txt_NameVen.Text = dgv_Vendor.Rows[position].Cells[1].Value.ToString();
                txt_AddVen.Text = dgv_Vendor.Rows[position].Cells[2].Value.ToString();
                txt_PhoVen.Text = dgv_Vendor.Rows[position].Cells[3].Value.ToString();
            }
        }

        private void btn_DelVen_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa dữ liệu về " + txt_NameVen.Text, "Thông báo", MessageBoxButtons.YesNo) != System.Windows.Forms.DialogResult.No)
            {
                ven.DelVen(txt_IdVen.Text.Trim());
                txt_IdVen.Text = "";
                txt_NameVen.Text = "";
                txt_AddVen.Text = "";
                txt_PhoVen.Text = "";
                dgv_Vendor.DataSource = ven.Danhsach();
                label14.Text = "Số dòng hiện tại " + dgv_Vendor.Rows.Count;
            }
        }

        private void btn_UpVen_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn sửa dữ liệu về " + txt_NameVen.Text, "Thông báo", MessageBoxButtons.YesNo) != System.Windows.Forms.DialogResult.No)
            {
                ven.UpVen(txt_IdVen.Text.Trim(), txt_NameVen.Text.Trim(), txt_AddVen.Text.Trim(), txt_PhoVen.Text.Trim());
                dgv_Vendor.DataSource = ven.Danhsach();
            }
        }

        private void btn_FindVen_Click(object sender, EventArgs e)
        {
            if (txt_FindVen.Text.Trim() != "")
            {
                if (cb_Find.Text == "Tên")
                {
                    dgv_Vendor.DataSource = ven.FindVen(txt_FindVen.Text.Trim(),1);
                    label14.Text = "Số dòng hiện tại " + (dgv_Vendor.Rows.Count - 1);
                }
                else if (cb_Find.Text == "Địa chỉ")
                {
                    dgv_Vendor.DataSource = ven.FindVen(txt_FindVen.Text.Trim(), 2);
                    label14.Text = "Số dòng hiện tại " + (dgv_Vendor.Rows.Count - 1);
                }
                else if (cb_Find.Text == "Mã") 
                {
                    dgv_Vendor.DataSource = ven.FindVen(txt_FindVen.Text.Trim(), 0);
                    label14.Text = "Số dòng hiện tại " + (dgv_Vendor.Rows.Count - 1);
                }
                else
                {
                    dgv_Vendor.DataSource = ven.FindVen(txt_FindVen.Text.Trim(), 3);
                    label14.Text = "Số dòng hiện tại " + (dgv_Vendor.Rows.Count - 1);
                }
            }
            else
            {
                dgv_Vendor.DataSource = ven.Danhsach();
                label14.Text = "Số dòng hiện tại " + (dgv_Vendor.Rows.Count - 1);
            }
        }
        #endregion

        //Category
        #region
        private void btn_InsCat_Click(object sender, EventArgs e)
        {
            if (txt_IdCat.Text.Trim() !="")
            {
                Category a = new Category(txt_IdCat.Text.Trim(),txt_NameCat.Text.Trim());
                a.InsertCat(a);
                dgv_Cat.DataSource = a.DanhSach();
                label19.Text = "Số dòng hiện tại " + (dgv_Cat.Rows.Count - 1);
            }
            else
            {
                MessageBox.Show("Thiếu mã loại hàng nên không thể thêm", "Thông báo");
            }
        }

        private void dgv_Cat_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if(dgv_Cat.Rows.Count>0)
            {
                int position = dgv_Cat.CurrentRow.Index;
                txt_IdCat.Text = dgv_Cat.Rows[position].Cells[0].Value.ToString();
                txt_NameCat.Text = dgv_Cat.Rows[position].Cells[1].Value.ToString();
            }
        }

        private void btn_DelCat_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa dữ liệu về " + txt_NameCat.Text, "Thông báo", MessageBoxButtons.YesNo) != System.Windows.Forms.DialogResult.No)
            {
                cat.DelCat(txt_IdCat.Text.Trim());
                txt_IdCat.Text = "";
                txt_NameCat.Text = "";
                dgv_Cat.DataSource = cat.DanhSach();
                label19.Text = "Số dòng hiện tại " + (dgv_Cat.Rows.Count - 1);
            }
        }

        private void btn_UpCat_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn sửa dữ liệu về " + txt_NameCat.Text, "Thông báo", MessageBoxButtons.YesNo) != System.Windows.Forms.DialogResult.No)
            {
                cat.UpCat(txt_IdCat.Text.Trim(),txt_NameCat.Text.Trim());
                dgv_Cat.DataSource = cat.DanhSach();
            }
        }

        private void btn_FindCat_Click(object sender, EventArgs e)
        {
            if (txt_FindCat.Text.Trim() != "")
            {
                if (cb_FindCat.Text == "Mã")
                {
                    dgv_Cat.DataSource = cat.FindCat(txt_FindCat.Text.Trim(),0);
                    label19.Text = "Số dòng hiện tại " + (dgv_Cat.Rows.Count - 1);
                }
                else
                {
                    dgv_Cat.DataSource = cat.FindCat(txt_FindCat.Text.Trim(),1);
                    label19.Text = "Số dòng hiện tại " + (dgv_Cat.Rows.Count - 1);
                }
            }
            else
            {
                dgv_Cat.DataSource = cat.DanhSach();
                label19.Text = "Số dòng hiện tại " + (dgv_Cat.Rows.Count - 1);
            }
        }
        #endregion

        //Customer
        #region
        private void btn_InsCus_Click(object sender, EventArgs e)
        {
            if(txt_IdCus.Text.Trim() !="")
            {
                Customer a = new Customer(txt_IdCus.Text.Trim(), txt_NameCus.Text.Trim(), dt_Cus.Value.ToString().Trim(), txt_AddCus.Text.Trim(), txt_PhoneCus.Text.Trim());
                a.InsCus(a);
                dgv_Customers.DataSource = a.DanhSach();
                label20.Text = "Số dòng hiện tại " + (dgv_Customers.Rows.Count - 1);
            }
            else
            {
                MessageBox.Show("Thiếu mã khách hàng nên không thể thêm", "Thông báo");
            }
        }

        private void dgv_Customers_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgv_Customers.Rows.Count > 0)
            {
                int position = dgv_Customers.CurrentRow.Index;
                txt_IdCus.Text = dgv_Customers.Rows[position].Cells[0].Value.ToString();
                txt_NameCus.Text = dgv_Customers.Rows[position].Cells[1].Value.ToString();
                dt_Cus.Text = dgv_Customers.Rows[position].Cells[2].Value.ToString();
                txt_AddCus.Text = dgv_Customers.Rows[position].Cells[3].Value.ToString();
                txt_PhoneCus.Text = dgv_Customers.Rows[position].Cells[4].Value.ToString();
            }
        }

        private void btn_DelCus_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa dữ liệu về " + txt_NameCus.Text, "Thông báo", MessageBoxButtons.YesNo) != System.Windows.Forms.DialogResult.No)
            {
                cus.DelCus(txt_IdCus.Text.Trim());
                txt_IdCus.Text = "";
                txt_NameCus.Text = "";
                dt_Cus.Value = DateTime.Now;
                txt_AddCus.Text = "";
                txt_PhoneCus.Text = "";
                dgv_Customers.DataSource = cus.DanhSach();
                label20.Text = "Số dòng hiện tại " + (dgv_Customers.Rows.Count - 1);
            }
        }

        private void btn_UpCus_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn sửa dữ liệu về " + txt_NameCus.Text, "Thông báo", MessageBoxButtons.YesNo) != System.Windows.Forms.DialogResult.No)
            {
                cus.UpCus(txt_IdCus.Text.Trim(), txt_NameCus.Text.Trim(), dt_Cus.Value.ToString().Trim(), txt_AddCus.Text.Trim(), txt_PhoneCus.Text.Trim());
                dgv_Customers.DataSource = cus.DanhSach();
            }
        }

        private void btn_FindCus_Click(object sender, EventArgs e)
        {
            if (txt_FindCus.Text.Trim() != "")
            {
                if (cb_FindCus.Text == "Mã")
                {
                    dgv_Customers.DataSource = cus.FindCus(txt_FindCus.Text.Trim(), 0);
                    label20.Text = "Số dòng hiện tại " + (dgv_Customers.Rows.Count - 1);
                }
                else if(cb_FindCus.Text =="Tên")
                {
                    dgv_Customers.DataSource = cus.FindCus(txt_FindCus.Text.Trim(), 1);
                    label20.Text = "Số dòng hiện tại " + (dgv_Customers.Rows.Count - 1);
                }
                else if (cb_FindCus.Text=="Ngày sinh")
                {
                    dgv_Customers.DataSource = cus.FindCus(txt_FindCus.Text.Trim(), 2);
                    label20.Text = "Số dòng hiện tại " + (dgv_Customers.Rows.Count - 1);
                }
                else if (cb_FindCus.Text =="Địa chỉ")
                {
                    dgv_Customers.DataSource = cus.FindCus(txt_FindCus.Text.Trim(), 3);
                    label20.Text = "Số dòng hiện tại " + (dgv_Customers.Rows.Count - 1);
                }
                else
                {
                    dgv_Customers.DataSource = cus.FindCus(txt_FindCus.Text.Trim(), 4);
                    label20.Text = "Số dòng hiện tại " + (dgv_Customers.Rows.Count - 1);
                }
            }
            else
            {
                dgv_Customers.DataSource = cus.DanhSach();
                label20.Text = "Số dòng hiện tại " + (dgv_Customers.Rows.Count - 1);
            }
        }
        #endregion

        //Good
        #region
        private void btn_InsGood_Click(object sender, EventArgs e)
        {
            if (txt_IdGood.Text.Trim() != "")
            {
                Good a = new Good(txt_IdGood.Text.Trim(),txt_NameGood.Text.Trim(),cmb_CatGood.SelectedValue.ToString().Trim(),int.Parse(txt_CostGood.Text.Trim()),int.Parse(txt_NumGood.Text.Trim()),cmb_VenGood.SelectedValue.ToString().Trim());                
                a.InsGood(a);
                dgv_Good.DataSource = a.DanhSach();
                label21.Text = "Số dòng hiện tại " + (dgv_Good.Rows.Count - 1);
            }
            else
            {
                MessageBox.Show("Thiếu mã hàng hóa nên không thể thêm", "Thông báo");
            }
        }

        private void btn_DelGood_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xóa dữ liệu về " + txt_NameGood.Text, "Thông báo", MessageBoxButtons.YesNo) != System.Windows.Forms.DialogResult.No)
            {
                good.DelGood(txt_IdGood.Text.Trim());
                txt_IdGood.Text = "";
                txt_NameGood.Text = "";
                cmb_CatGood.Text = "";
                txt_CostGood.Text = "";
                txt_NumGood.Text = "";
                cmb_VenGood.Text = "";
                dgv_Good.DataSource = good.DanhSach();
                label21.Text = "Số dòng hiện tại " + (dgv_Good.Rows.Count - 1);
            }
        }

        private void btn_UpGood_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn sửa dữ liệu về " + txt_NameGood.Text, "Thông báo", MessageBoxButtons.YesNo) != System.Windows.Forms.DialogResult.No)
            {
                good.UpGood(txt_IdGood.Text.Trim(), txt_NameGood.Text.Trim(), cmb_CatGood.SelectedValue.ToString().Trim(), int.Parse(txt_CostGood.Text.Trim()), int.Parse(txt_NumGood.Text.Trim()), cmb_VenGood.SelectedValue.ToString().Trim());
                dgv_Good.DataSource = good.DanhSach();
            }
        }

        private void btn_FindGood_Click(object sender, EventArgs e)
        {
            if (txt_FindGood.Text.Trim() != "")
            {
                if (cb_FindGood.Text == "Mã")
                {
                    dgv_Good.DataSource = good.FindGood(txt_FindGood.Text.Trim(), 0);
                    label21.Text = "Số dòng hiện tại " + (dgv_Good.Rows.Count - 1);
                }
                else if (cb_FindGood.Text == "Tên")
                {
                    dgv_Good.DataSource = good.FindGood(txt_FindGood.Text.Trim(), 1);
                    label21.Text = "Số dòng hiện tại " + (dgv_Good.Rows.Count - 1);
                }
                else if (cb_FindGood.Text == "Loại")
                {
                    dgv_Good.DataSource = good.FindGood(txt_FindGood.Text.Trim(), 2);
                    label21.Text = "Số dòng hiện tại " + (dgv_Good.Rows.Count - 1);
                }
                else
                {
                    dgv_Good.DataSource = good.FindGood(txt_FindGood.Text.Trim(), 3);
                    label21.Text = "Số dòng hiện tại " + (dgv_Good.Rows.Count - 1);
                }
            }
            else
            {
                dgv_Good.DataSource = good.DanhSach();
                label21.Text = "Số dòng hiện tại " + (dgv_Good.Rows.Count - 1);
            }
        }

        private void dgv_Good_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgv_Good.Rows.Count > 0)
            {
                int position = dgv_Good.CurrentRow.Index;
                txt_IdGood.Text = dgv_Good.Rows[position].Cells[0].Value.ToString();
                txt_NameGood.Text = dgv_Good.Rows[position].Cells[1].Value.ToString();
                cmb_CatGood.Text = dgv_Good.Rows[position].Cells[2].Value.ToString();
                txt_CostGood.Text = dgv_Good.Rows[position].Cells[3].Value.ToString();
                txt_NumGood.Text = dgv_Good.Rows[position].Cells[4].Value.ToString();
                cmb_VenGood.Text = dgv_Good.Rows[position].Cells[5].Value.ToString();
            }
        }
        #endregion

        //Bill
        #region
        private void btn_Value_Click(object sender, EventArgs e)
        {
            if (txt_FindBill.Text.Trim() !="")
            {
                if(cmb_FindBill.Text=="Hóa đơn")
                {
                    dgv_Bill.DataSource = bill.FindBill(txt_FindBill.Text.Trim(), 0);
                    label22.Text = "Số dòng hiện tại " + (dgv_Bill.Rows.Count - 1);
                    SumUp();
                }
                else if(cmb_FindBill.Text=="Khách hàng")
                {
                    dgv_Bill.DataSource = bill.FindBill(txt_FindBill.Text.Trim(), 1);
                    label22.Text = "Số dòng hiện tại " + (dgv_Bill.Rows.Count - 1);
                    SumUp();
                }
                else
                {
                    dgv_Bill.DataSource = bill.FindBill(txt_FindBill.Text.Trim(), 2);
                    label22.Text = "Số dòng hiện tại " + (dgv_Bill.Rows.Count - 1);
                    SumUp();
                }
            }
            else
            {
                dgv_Bill.DataSource = bill.DanhSach();
                label22.Text = "Số dòng hiện tại " + (dgv_Bill.Rows.Count - 1);
                SumUp();
            }
        }

        public string carry="";

        private void dgv_Bill_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgv_Bill.Rows.Count >0)
            {
                int position = dgv_Bill.CurrentRow.Index;
                carry = dgv_Bill.Rows[position].Cells[0].Value.ToString();
            }
        }
        #endregion

        private void btn_Detail_Click(object sender, EventArgs e)
        {
            this.Hide();
            F_Detail f = new F_Detail(carry);
            f.ShowDialog();
            this.Show();
        }

        private void btn_SLBan_Click(object sender, EventArgs e)
        {
            this.Hide();
            F_Detail f = new F_Detail("0");
            f.ShowDialog();
            this.Show();
        }

        private void btn_DemHD_Click(object sender, EventArgs e)
        {
            this.Hide();
            F_Detail f = new F_Detail("1");
            f.ShowDialog();
            this.Show();
        }
    }
}
