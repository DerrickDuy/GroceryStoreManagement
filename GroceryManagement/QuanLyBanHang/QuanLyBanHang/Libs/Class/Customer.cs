using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyBanHang.Libs
{
    class Customer
    {
        //Khai báo đặc điểm
        #region
        private string _makh;
        public string MaKH
        {
            get
            {
                return _makh;
            }
            set
            {
                _makh = value;
            }
        }

        private string _hoten;
        public string HoTen
        {
            get
            {
                return _hoten;
            }
            set
            {
                _hoten = value;
            }
        }

        private string _ngaysinh;
        public string NgaySinh
        {
            get
            {
                return _ngaysinh;
            }
            set
            {
                _ngaysinh = value;
            }
        }

        private string _diachi;
        public string DiaChi
        {
            get
            {
                return _diachi;
            }
            set
            {
                _diachi = value;
            }
        }

        private string _dienthoai;
        public string DienThoai
        {
            get
            {
                return _dienthoai;
            }
            set
            {
                _dienthoai = value;
            }
        }
        #endregion

        //Khởi tạo
        #region
        public Customer()
        { }

        public Customer(string a, string b, string c, string d, string e)
        {
            MaKH = a;
            HoTen = b;
            NgaySinh = c;
            DiaChi = d;
            DienThoai = e;
        }
        #endregion

        //Khai báo chức năng
        #region
        public DataTable DanhSach()
        {
            DataTable table = new DataTable();
            table = Libs.DataProvider.Data.ExcuteToDataTable("KHACHHANG_Selectall", CommandType.StoredProcedure);
            return table;
        }

        public void InsCus(Customer a)
        {
            SqlParameter[] sqls =
            { 
                new SqlParameter("@MaKH",MaKH),
                new SqlParameter("@HoTen",HoTen),
                new SqlParameter("@NgaySinh",NgaySinh),
                new SqlParameter("@DiaChi",DiaChi),
                new SqlParameter("@DienThoai",DienThoai)
            };
            try
            {
                Libs.DataProvider.Data.ExecuteNonQuery("KHACHHANG_Insert", CommandType.StoredProcedure, sqls);
            }
            catch
            {
            }
        }

        public void DelCus(string a)
        {
            SqlParameter[] sqls =
            {
                new SqlParameter("@MaKH",a),
            };
            try
            {
                Libs.DataProvider.Data.ExecuteNonQuery("KHACHHANG_Delete", CommandType.StoredProcedure, sqls);
            }
            catch
            {
            }
        }

        public void UpCus(string a, string b, string c, string d, string e)
        {
            SqlParameter[] sqls =
            {
                new SqlParameter("@MaKH",a),
                new SqlParameter("@HoTen",b),
                new SqlParameter("@NgaySinh",c),
                new SqlParameter("@DiaChi",d),
                new SqlParameter("@DienThoai",e)
            };
            try
            {
                Libs.DataProvider.Data.ExecuteNonQuery("KHACHHANG_Update", CommandType.StoredProcedure, sqls);
            }
            catch
            {
            }
        }

        public DataTable FindCus(string a, int b)
        {
            DataTable table = new DataTable();
            if (b == 0)
            {
                SqlParameter[] sqls =
                {
                    new SqlParameter("@MaKH",a)
                };
                try
                {
                    table = Libs.DataProvider.Data.ExcuteToDataTable("KhachHang_FindId", CommandType.StoredProcedure, sqls);
                }
                catch
                { }
            }
            else if(b==1)
            {
                SqlParameter[] sqls =
                {
                    new SqlParameter("@HoTen",a)
                };
                try
                {
                    table = Libs.DataProvider.Data.ExcuteToDataTable("KhachHang_FindName", CommandType.StoredProcedure, sqls);
                }
                catch
                { }
            }
            else if(b==2)
            {
                SqlParameter[] sqls =
                {
                    new SqlParameter("@NgaySinh",a)
                };
                try
                {
                    table = Libs.DataProvider.Data.ExcuteToDataTable("KhachHang_FindDate", CommandType.StoredProcedure, sqls);
                }
                catch
                { }
            }
            else if (b==3)
            {
                SqlParameter[] sqls =
                {
                    new SqlParameter("@DiaChi",a)
                };
                try
                {
                    table = Libs.DataProvider.Data.ExcuteToDataTable("KhachHang_FindAdd", CommandType.StoredProcedure, sqls);
                }
                catch
                { }
            }
            else
            {
                SqlParameter[] sqls =
{
                    new SqlParameter("@DienThoai",a)
                };
                try
                {
                    table = Libs.DataProvider.Data.ExcuteToDataTable("KhachHang_FindPho", CommandType.StoredProcedure, sqls);
                }
                catch
                { }
            }
            return table;
        }
        #endregion
    }
}
