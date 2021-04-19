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
    class Vendor
    {
        //Khai báo đặc điểm
        #region
        private string _maCC;
        public string MaCC
        {
            get
            {
                return _maCC;
            }
            set
            {
                _maCC = value;
            }
        }
        private string _tenCC;
        public string TenCC
        {
            get
            {
                return _tenCC;
            }
            set
            {
                _tenCC = value;
            }
        }
        private string _diachi;
        public string Diachi
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
        private string _sdt;
        public string Sdt
        {
            get
            {
                return _sdt;
            }
            set
            {
                _sdt = value;
            }
        }
        #endregion

        //Khởi tạo
        #region
        public Vendor()
        {
        }
        public Vendor(string a, string b, string c, string d)
        {
            MaCC = a;
            TenCC = b;
            Diachi = c;
            Sdt = d;
        }
        #endregion

        //Khai báo chức năng
        #region
        public DataTable Danhsach()
        {
            DataTable table = new DataTable();
            table = Libs.DataProvider.Data.ExcuteToDataTable("NhaCungCap_Selectall", CommandType.StoredProcedure);
            return table;
        }

        public void InsertVen(Vendor a)
        {
            SqlParameter[] sqls =
            {
                new SqlParameter("@MaCC",MaCC),
                new SqlParameter("@TenCungCap",TenCC),
                new SqlParameter("@DiaChi",Diachi),
                new SqlParameter("@DienThoai",Sdt)
            };
            try
            {
                Libs.DataProvider.Data.ExecuteNonQuery("NhaCungCap_Insert", CommandType.StoredProcedure, sqls);
            }
            catch
            {
            }
        }

        public void DelVen(string a)
        {
            SqlParameter[] sqls =
            {
                new SqlParameter("@MaCC",a)
            };
            try
            {
                Libs.DataProvider.Data.ExecuteNonQuery("NhaCungCap_Delete", CommandType.StoredProcedure, sqls);
            }
            catch
            { }
        }

        public void UpVen(string a, string b, string c, string d)
        {
            SqlParameter[] sqls =
            {
                new SqlParameter("@MaCC",a),
                new SqlParameter("@TenCungCap",b),
                new SqlParameter("@DiaChi",c),
                new SqlParameter("@DienThoai",d)
            };
            try
            {
                Libs.DataProvider.Data.ExecuteNonQuery("NhaCungCap_Update", CommandType.StoredProcedure, sqls);
            }
            catch
            { }
        }

        public DataTable FindVen(string a, int b)
        {
            DataTable table = new DataTable();
            if (b==1)
            {
                SqlParameter[] sqls =
                {
                new SqlParameter("@TenCungCap",a)
                };
                try
                {
                    table = Libs.DataProvider.Data.ExcuteToDataTable("NhaCungCap_Find", CommandType.StoredProcedure, sqls);
                }
                catch
                { }
            }
            else if (b==2)
            {
                SqlParameter[] sqls =
{
                new SqlParameter("@DiaChi",a)
                };
                try
                {
                    table = Libs.DataProvider.Data.ExcuteToDataTable("NhaCungCap_FindAdd", CommandType.StoredProcedure, sqls);
                }
                catch
                { }
            }
            else if (b==0)
            {
                SqlParameter[] sqls =
                {
                new SqlParameter("@MaCC",a)
                };
                try
                {
                    table = Libs.DataProvider.Data.ExcuteToDataTable("NhaCungCap_FindId", CommandType.StoredProcedure, sqls);
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
                    table = Libs.DataProvider.Data.ExcuteToDataTable("NhaCungCap_FindPhone", CommandType.StoredProcedure, sqls);
                }
                catch
                { }
            }
            return table;
        }
        #endregion
    }
}
