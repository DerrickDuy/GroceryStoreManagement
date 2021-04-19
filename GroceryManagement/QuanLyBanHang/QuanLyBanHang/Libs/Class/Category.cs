using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyBanHang.Libs
{
    class Category
    {
        //Khai báo đặc điểm
        #region
        private string _maLHH;
        public string MaLoaiHH
        {
            get
            {
                return _maLHH;
            }
            set
            {
                _maLHH = value;
            }
        }
        private string _tenloai;
        public string TenLoai
        {
            get
            {
                return _tenloai;
            }
            set
            {
                _tenloai = value;
            }
        }
        #endregion

        //Khởi tạo
        #region
        public Category()
        { }
        public Category(string a,string b)
        {
            MaLoaiHH = a;
            TenLoai = b;
        }
        #endregion

        //Khai báo chức năng
        #region
        public DataTable DanhSach()
        {
            DataTable table = new DataTable();
            table = Libs.DataProvider.Data.ExcuteToDataTable("LoaiHang_Selectall", CommandType.StoredProcedure);
            return table;
        }

        public void InsertCat(Category a)
        {
            SqlParameter[] sqls =
            {
                new SqlParameter("@MaLoaiHH",MaLoaiHH),
                new SqlParameter("@TenLoai",TenLoai),
            };
            try
            {
                Libs.DataProvider.Data.ExecuteNonQuery("LoaiHang_Insert", CommandType.StoredProcedure, sqls);
            }
            catch
            {
            }
        }

        public void DelCat(string a)
        {
            SqlParameter[] sqls =
{
                new SqlParameter("@MaLoaiHH",a)
            };
            try
            {
                Libs.DataProvider.Data.ExecuteNonQuery("LoaiHang_Delete", CommandType.StoredProcedure, sqls);
            }
            catch
            { }
        }

        public void UpCat(string a, string b)
        {
            SqlParameter[] sqls =
{
                new SqlParameter("@MaLoaiHH",a),
                new SqlParameter("@TenLoai",b),
            };
            try
            {
                Libs.DataProvider.Data.ExecuteNonQuery("LoaiHang_Update", CommandType.StoredProcedure, sqls);
            }
            catch
            {
            }
        }

        public DataTable FindCat(string a,int b)
        {
            DataTable table = new DataTable();
            if (b==0)
            {
                SqlParameter[] sqls =
                {
                    new SqlParameter("@MaLoaiHH",a)
                };
                try
                {
                    table = Libs.DataProvider.Data.ExcuteToDataTable("LoaiHang_FindId", CommandType.StoredProcedure, sqls);
                }
                catch
                { }
            }
            else
            {
                SqlParameter[] sqls =
                {
                    new SqlParameter("@TenLoai",a)
                };
                try
                {
                    table = Libs.DataProvider.Data.ExcuteToDataTable("LoaiHang_Find", CommandType.StoredProcedure, sqls);
                }
                catch
                { }
            }
            return table;
        }
        #endregion
    }
}
