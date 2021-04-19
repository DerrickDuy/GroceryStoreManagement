using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyBanHang.Libs.Class
{
    class BillInfo
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

        private string _mahh;
        public string MaHH
        {
            get
            {
                return _mahh;
            }
            set
            {
                _mahh = value;  
            }
        }

        private int _soluong;
        public int SoLuong
        {
            get
            {
                return _soluong;
            }
            set
            {
                _soluong = value;
            }
        }
        #endregion

        //khởi tạo
        #region
        public BillInfo()
        { }
        public BillInfo(string a, string b, int c)
        {
            MaHD = a;
            MaHH = b;
            SoLuong = c;
        }
        #endregion

        //Khai báo chức năng
        #region
        public DataTable DanhSach(string a)
        {
            SqlParameter[] sqls =
            {
                    new SqlParameter("@MaHD",a)
            };
            DataTable table = new DataTable();
            table = Libs.DataProvider.Data.ExcuteToDataTable("ChiTietHoaDon_SelectAll", CommandType.StoredProcedure, sqls);
            return table;
        }

        public void InsBillInfo(BillInfo a)
        {
            SqlParameter[] sqls =
            {
                    new SqlParameter("@MaHD",MaHD),
                    new SqlParameter("@MaHH",MaHH),
                    new SqlParameter("@SoLuong",SoLuong)
            };
            try
            {
                Libs.DataProvider.Data.ExecuteNonQuery("ChiTietHoaDon_Insert", CommandType.StoredProcedure, sqls);
            }
            catch { }
        }

        public void DelBillInfo(string a, string b)
        {
            SqlParameter[] sqls =
            {
                    new SqlParameter("@MaHD",a),
                    new SqlParameter("@MaHH",b)
            };
            try
            {
                Libs.DataProvider.Data.ExecuteNonQuery("ChiTietHoaDon_Delete", CommandType.StoredProcedure, sqls);
            }
            catch { }
        }

        public string Sum(string a)
        {
            SqlParameter[] sqls =
            {
                    new SqlParameter("@MaHD",a)
            };
            DataTable table = new DataTable();
            table = Libs.DataProvider.Data.ExcuteToDataTable("HoaDon_TongGiaTri", CommandType.StoredProcedure, sqls);
            return table.Rows[0]["TongGiaTri"].ToString();
        }

        public DataTable SLB()
        {
            DataTable table = new DataTable();
            table = Libs.DataProvider.Data.ExcuteToDataTable("HangHoa_Salevalue", CommandType.StoredProcedure);
            return table;
        }

        public DataTable DEMHD ()
        {
            DataTable table = new DataTable();
            table = Libs.DataProvider.Data.ExcuteToDataTable("HoaDon_Dem",CommandType.StoredProcedure);
            return table;
        }
        #endregion
    }
}
