using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyBanHang.Libs.Class
{
    class Good
    {
        //Khai báo đặc điểm
        #region
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

        private string _tenhh;
        public string TenHH
        {
            get
            {
                return _tenhh;
            }
            set
            {
                _tenhh = value;
            }
        }

        private string _maloaihh;
        public string MaLoaiHH
        {
            get
            {
                return _maloaihh;
            }
            set
            {
                _maloaihh = value;
            }
        }

        private int _dongia;
        public int DonGia
        {
            get
            {
                return _dongia;
            }
            set
            {
                _dongia = value;
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

        private string _macc;
        public string MaCC
        {
            get
            {
                return _macc;
            }
            set
            {
                _macc = value;
            }
        }
        #endregion

        //Khởi tạo
        #region
        public Good()
        {
        }
        public Good(string a, string b, string c, int d, int e, string f)
        {
            MaHH = a;
            TenHH = b;
            MaLoaiHH = c;
            DonGia = d;
            SoLuong = e;
            MaCC = f;
        }
        #endregion

        //Khai báo chức năng
        #region
        public DataTable DanhSach()
        {
            DataTable table = new DataTable();
            table = Libs.DataProvider.Data.ExcuteToDataTable("HangHoa_Selectall", CommandType.StoredProcedure);
            return table;
        }

        public void InsGood(Good a)
        {
            SqlParameter[] sqls =
            {
                new SqlParameter("@MaHH",MaHH),
                new SqlParameter("@TenHH",TenHH),
                new SqlParameter("@MaLoaiHH",MaLoaiHH),
                new SqlParameter("@DonGia",DonGia),
                new SqlParameter("@SoLuong",SoLuong),
                new SqlParameter("@MaCC",MaCC)
            };
            try
            {
                Libs.DataProvider.Data.ExecuteNonQuery("HangHoa_Insert", CommandType.StoredProcedure, sqls);
            }
            catch
            {
            }
        }

        public void DelGood(string a)
        {
            SqlParameter[] sqls =
            {
                new SqlParameter("@MaHH",a),
            };
            try
            {
                Libs.DataProvider.Data.ExecuteNonQuery("HangHoa_Delete", CommandType.StoredProcedure, sqls);
            }
            catch
            {
            }
        }

        public void UpGood(string a, string b, string c, int d, int e, string f)
        {
            SqlParameter[] sqls =
            {
                new SqlParameter("@MaHH",a),
                new SqlParameter("@TenHH",b),
                new SqlParameter("@MaLoaiHH",c),
                new SqlParameter("@DonGia",d),
                new SqlParameter("@SoLuong",e),
                new SqlParameter("@MaCC",f)
            };
            try
            {
                Libs.DataProvider.Data.ExecuteNonQuery("HangHoa_Update", CommandType.StoredProcedure, sqls);
            }
            catch
            {
            }
        }

        public DataTable FindGood(string a, int b)
        {
            DataTable table = new DataTable();
            if (b == 0)
            {
                SqlParameter[] sqls =
                {
                    new SqlParameter("@MaHH",a)
                };
                try
                {
                    table = Libs.DataProvider.Data.ExcuteToDataTable("HangHoa_FindId", CommandType.StoredProcedure, sqls);
                }
                catch
                { }
            }
            else if (b == 1)
            {
                SqlParameter[] sqls =
                {
                    new SqlParameter("@TenHH",a)
                };
                try
                {
                    table = Libs.DataProvider.Data.ExcuteToDataTable("HangHoa_FindName", CommandType.StoredProcedure, sqls);
                }
                catch
                { }
            }
            else if (b == 2)
            {
                SqlParameter[] sqls =
                {
                    new SqlParameter("@TenLoai",a)
                };
                try
                {
                    table = Libs.DataProvider.Data.ExcuteToDataTable("HangHoa_FindIdCat", CommandType.StoredProcedure, sqls);
                }
                catch
                { }
            }
            else if (b == 3)
            {
                SqlParameter[] sqls =
                {
                    new SqlParameter("@TenCungCap",a)
                };
                try
                {
                    table = Libs.DataProvider.Data.ExcuteToDataTable("HangHoa_FindIdVen", CommandType.StoredProcedure, sqls);
                }
                catch
                { }
            }
            return table;
        }

        public void UpSL(string a, int b)
        {
            SqlParameter[] slqs =
            {
                new SqlParameter ("@MaHH",a),
                new SqlParameter ("@SoLuong",b)
            };
            try
            {
                Libs.DataProvider.Data.ExecuteNonQuery("HangHoa_UpSL",CommandType.StoredProcedure,slqs);
            }
            catch { }
        }

        public int SL(string a)
        {
            SqlParameter[] sqls =
            {
                new SqlParameter ("MaHH",a)
            };
            DataTable table = new DataTable();
            table = Libs.DataProvider.Data.ExcuteToDataTable("HangHoa_SelectSL",CommandType.StoredProcedure,sqls);
            return int.Parse(table.Rows[0]["SoLuong"].ToString()); 
        }
    #endregion
    }
}
