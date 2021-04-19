using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyBanHang.Libs.Class
{
    class Bill
    {
        //Khai báo đặc điểm
        #region
        private string _mahd;
        public string MaHD
        {
            get
            {
                return _mahd;
            }
            set
            {
                _mahd = value;
            }
        }

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

        private string _ngaylap;
        public string NgayLap
        {
            get
            {
                return _ngaylap;
            }
            set
            {
                _ngaylap = value;
            }
        }

        private int _tong;
        public int TongGiaTri
        {
            get
            {
                return _tong;
            }
            set
            {
                _tong = value;
            }
        }
        #endregion

        //Khởi tạo
        #region
        public Bill()
        { }

        public Bill(string a, string b, string c, int d)
        {
            MaHD = a;
            MaKH = b;
            NgayLap = c;
            TongGiaTri = d;
        }
        #endregion

        //Khai báo chức năng
        #region
        public DataTable DanhSach()
        {
            DataTable table = new DataTable();
            table = Libs.DataProvider.Data.ExcuteToDataTable("HoaDon_Selectall",CommandType.StoredProcedure);
            return table;
        }

        public DataTable FindBill(string a,int b)
        {
            DataTable table = new DataTable();
            if (b==0)
            {
                SqlParameter[] sqls =
                {
                    new SqlParameter("@MaHD",a)
                };
                try
                {
                    table = Libs.DataProvider.Data.ExcuteToDataTable("HoaDon_FindId", CommandType.StoredProcedure, sqls);
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
                    table = Libs.DataProvider.Data.ExcuteToDataTable("HoaDon_FindName", CommandType.StoredProcedure, sqls);
                }
                catch
                { }
            }
            else
            {
                SqlParameter[] sqls =
{
                    new SqlParameter("@NgayLap",a)
                };
                try
                {
                    table = Libs.DataProvider.Data.ExcuteToDataTable("HoaDon_FindDate", CommandType.StoredProcedure, sqls);
                }
                catch
                { }
            }
            return table;
        }

        public string Count()
        {
            DataTable table = new DataTable();
            table = Libs.DataProvider.Data.ExcuteToDataTable("HoaDon_Count", CommandType.StoredProcedure);
            return table.Rows[0]["Dem"].ToString(); 
        }

        public void InsBill(Bill a)
        {
            SqlParameter[] sqls =
            {
                new SqlParameter("@MaHD",MaHD),
                new SqlParameter("@MaKH",MaKH),
                new SqlParameter("@NgayLap",NgayLap),
                new SqlParameter("@TongGiaTri",TongGiaTri),
            };
            try
            {
                Libs.DataProvider.Data.ExecuteNonQuery("HoaDon_Insert",CommandType.StoredProcedure,sqls);
            }
            catch { }
        }
        #endregion
    }
}
