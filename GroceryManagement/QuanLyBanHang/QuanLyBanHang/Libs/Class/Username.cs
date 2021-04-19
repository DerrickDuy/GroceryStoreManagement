using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyBanHang.Libs
{
    class Username
    {
        private static string _username ="";
        public static string username
        {
            get
            {
                return _username;
            } 
            set
            {
                _username = value;
            }
        }

        private static string _password="";
        public static string password
        {
            get
            {
                return _password;
            }
            set
            {
                _password = value;
            }
        }
        public Username()
        { }

        public Username(string a,string b)
        {
            username = a;
            password = b;
        }

        public bool Checklogin()
        {
            bool kq = false;
            SqlParameter[] sqls =
               {
                    new SqlParameter("@username",username),
                    new SqlParameter("@password",Libs.DataProvider.Data.HashBytesSHA1(password))
                };
            DataTable table = new DataTable();
            try
            {
                table = Libs.DataProvider.Data.ExcuteToDataTable("USERNAME_Selectchecklogin", CommandType.StoredProcedure, sqls);
                if (table.Rows.Count > 0)
                {
                    kq = true;
                }
            }
            catch
            {
            }
            return kq;
        }

        public void Updatepass(string a)
        {
            SqlParameter[] sqls =
               {
                    new SqlParameter("@username",username),
                    new SqlParameter("@password",Libs.DataProvider.Data.HashBytesSHA1(a))
                };
            try
            {
                Libs.DataProvider.Data.ExecuteNonQuery("USERNAME_Updatepassword", CommandType.StoredProcedure,sqls);
            }
            catch
            {
            }
        }
    }
}
