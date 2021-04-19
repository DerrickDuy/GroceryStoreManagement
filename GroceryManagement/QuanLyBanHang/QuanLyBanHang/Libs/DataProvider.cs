using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyBanHang.Libs
{
    class DataProvider
    {
        //Tạo connection
        #region
        private DataProvider() { }
        private static DataProvider data;
        public static DataProvider Data
        {
            get
            {
                if (data == null)
                {
                    data = new DataProvider();
                }
                return DataProvider.data;
            }

            private set
            {
                DataProvider.data = value;
            }
        }

        public SqlConnection con = new SqlConnection(@"Data Source =.; Initial Catalog = QLBH; Integrated Security = True");
        #endregion

        //Chạy query
        #region
        SqlCommand command = new SqlCommand();

        public DataTable ExcuteToDataTable(string cmdText, CommandType type = CommandType.Text, SqlParameter[] prms = null)
        {
            command.CommandText = cmdText;
            command.CommandType = type;
            command.Parameters.Clear();
            if (prms != null)
            {
                foreach (SqlParameter p in prms)
                {
                    if (p != null)
                    {
                        command.Parameters.Add(p);
                    }
                }
            }
            command.Connection = con;
            DataTable dttb = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            try
            {
                adapter.Fill(dttb);
                adapter.Dispose();
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Không thể thực thi SQL!", ex);
            }
            return dttb;
        }

        public void ExecuteNonQuery(string cmdText, CommandType type = CommandType.Text, SqlParameter[] prms = null)
        {
            command.CommandText = cmdText;
            command.CommandType = type;
            command.Parameters.Clear();
            if (prms != null)
            {
                foreach (SqlParameter p in prms)
                {
                    if (p != null)
                    {
                        command.Parameters.Add(p);
                    }
                }
            }
            command.Connection = con;
            con.Open();
            try
            {
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new ApplicationException("Không thể thực thi SQL!", ex);
            }
            con.Close();
        }
        #endregion

        //Mã hóa
        #region
        public string HashBytesSHA1(string s)
        {
            byte[] bytes = Encoding.UTF8.GetBytes(s);

            var sha1 = SHA1.Create();
            byte[] hashBytes = sha1.ComputeHash(bytes);

            return HexStringFromBytes(hashBytes);
        }

        public string HexStringFromBytes(byte[] bytes)
        {
            var sb = new StringBuilder();
            foreach (byte b in bytes)
            {
                var hex = b.ToString("x2");
                sb.Append(hex);
            }
            return sb.ToString();
        }
        #endregion
    }
}
