USE [master]
GO
/****** Object:  Database [QLBH]    Script Date: 05/30/2020 9:10:36 PM ******/
CREATE DATABASE [QLBH]
 CONTAINMENT = NONE
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBH] SET RECOVERY FULL 
GO
ALTER DATABASE [QLBH] SET  MULTI_USER 
GO
ALTER DATABASE [QLBH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLBH] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLBH', N'ON'
GO
USE [QLBH]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 05/30/2020 9:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHD] [nvarchar](100) NOT NULL,
	[MaHH] [nvarchar](15) NOT NULL,
	[SoLuong] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 05/30/2020 9:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[MaHH] [nvarchar](15) NOT NULL,
	[TenHH] [nvarchar](150) NULL,
	[MaLoaiHH] [nvarchar](15) NOT NULL,
	[DonGia] [int] NULL,
	[SoLuong] [int] NULL,
	[MaCC] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED 
(
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 05/30/2020 9:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [nvarchar](100) NOT NULL,
	[MaKH] [nvarchar](15) NOT NULL,
	[NgayLap] [nvarchar](max) NULL,
	[TongGiaTri] [int] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 05/30/2020 9:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [nvarchar](15) NOT NULL,
	[HoTen] [nvarchar](150) NULL,
	[NgaySinh] [nvarchar](max) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[DienThoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiHang]    Script Date: 05/30/2020 9:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiHang](
	[MaLoaiHH] [nvarchar](15) NOT NULL,
	[TenLoai] [nvarchar](100) NULL,
 CONSTRAINT [PK_LoaiHang] PRIMARY KEY CLUSTERED 
(
	[MaLoaiHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 05/30/2020 9:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaCC] [nvarchar](15) NOT NULL,
	[TenCungCap] [nvarchar](150) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[DienThoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERNAME]    Script Date: 05/30/2020 9:10:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERNAME](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[lastlogin] [datetime] NULL,
 CONSTRAINT [PK_USERNAME] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'0', N'LARUE', 20)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'0', N'POCA', 5)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'2', N'AQUAFINA', 15)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'2', N'HEINEKEN', 1)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'3', N'HEINEKEN', 50)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'3', N'LARUE', 20)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'4', N'TIGER', 10)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'4', N'VIETTEL', 36)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'11', N'HEINEKEN', 2)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'11', N'MOBI', 3)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'14', N'AQUAFINA', 2)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'14', N'HEINEKEN', 3)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'15', N'LARUE', 3)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'16', N'MOBI', 1)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'16', N'AQUAFINA', 2)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'16', N'POCA', 1)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'17', N'HEINEKEN', 2)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'1', N'HEINEKEN', 5)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'1', N'MOBI', 3)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'1', N'POCA', 20)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'1', N'AQUAFINA', 3)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'5', N'POCA', 2)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'5', N'AQUAFINA', 1)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'6', N'VIETTEL', 1)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'7', N'HEINEKEN', 1)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'7', N'POCA', 5)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'8', N'VINA', 5)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'9', N'MOBI', 20)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'10', N'LARUE', 2)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'12', N'VINA', 3)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHH], [SoLuong]) VALUES (N'13', N'LARUE', 1)
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoaiHH], [DonGia], [SoLuong], [MaCC]) VALUES (N'AQUAFINA', N'Chai nước aquafina 1,5 lít', N'WATER', 10000, 500, N'LIV')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoaiHH], [DonGia], [SoLuong], [MaCC]) VALUES (N'HEINEKEN', N'Bia Heineken', N'BEER', 389500, 493, N'CHE')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoaiHH], [DonGia], [SoLuong], [MaCC]) VALUES (N'LARUE', N'Bia larue', N'BEER', 250500, 494, N'LIV')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoaiHH], [DonGia], [SoLuong], [MaCC]) VALUES (N'MOBI', N'Thẻ mobifone 100k', N'CARD', 100000, 75, N'ASR')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoaiHH], [DonGia], [SoLuong], [MaCC]) VALUES (N'POCA', N'Bánh poca', N'SNACK', 5000, 165, N'CHE')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoaiHH], [DonGia], [SoLuong], [MaCC]) VALUES (N'TIGER', N'Bia tiger', N'BEER', 334000, 100, N'ASR')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoaiHH], [DonGia], [SoLuong], [MaCC]) VALUES (N'VIETTEL', N'Thẻ VIETTEL 100k', N'CARD', 100000, 53, N'CHE')
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [MaLoaiHH], [DonGia], [SoLuong], [MaCC]) VALUES (N'VINA', N'Thẻ vina 100k', N'CARD', 100000, 42, N'LIV')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongGiaTri]) VALUES (N'0', N'BNK', N'05/22/2020 8:16:33 PM', 5035000)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongGiaTri]) VALUES (N'1', N'TKD', N'05/22/2020 8:23:48 PM', 2377500)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongGiaTri]) VALUES (N'10', N'NHPT', N'05/22/2020 8:55:03 PM', 501000)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongGiaTri]) VALUES (N'11', N'BNK', N'05/22/2020 8:57:43 PM', 1079000)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongGiaTri]) VALUES (N'12', N'BNK', N'05/22/2020 8:58:23 PM', 300000)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongGiaTri]) VALUES (N'13', N'TKD', N'05/22/2020 8:59:40 PM', 250500)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongGiaTri]) VALUES (N'14', N'NHPT', N'05/22/2020 9:01:46 PM', 1188500)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongGiaTri]) VALUES (N'15', N'BNK', N'05/22/2020 9:02:26 PM', 751500)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongGiaTri]) VALUES (N'16', N'TKD', N'05/22/2020 9:02:48 PM', 125000)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongGiaTri]) VALUES (N'17', N'TKD', N'05/22/2020 9:02:57 PM', 779000)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongGiaTri]) VALUES (N'2', N'HTT', N'05/22/2020 8:47:31 PM', 539500)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongGiaTri]) VALUES (N'3', N'NHPT', N'05/22/2020 8:47:44 PM', 24485000)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongGiaTri]) VALUES (N'4', N'TKD', N'05/22/2020 8:48:02 PM', 6940000)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongGiaTri]) VALUES (N'5', N'TKD', N'05/22/2020 8:52:07 PM', 20000)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongGiaTri]) VALUES (N'6', N'TKD', N'05/22/2020 8:52:11 PM', 100000)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongGiaTri]) VALUES (N'7', N'NHPT', N'05/22/2020 8:52:28 PM', 414500)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongGiaTri]) VALUES (N'8', N'HTT', N'05/22/2020 8:52:34 PM', 500000)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayLap], [TongGiaTri]) VALUES (N'9', N'HTT', N'05/22/2020 8:54:39 PM', 2000000)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'BNK', N'Bùi Nhật Khanh', N'07/20/1995 7:34:55 PM', N'Thủ Đức. HCM', N'0557868')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'HTT', N'Hồ Thủy Tiên', N'06/27/1985 7:38:30 PM', N'Dĩ An. BD', N'0995687')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NHPT', N'Nguyễn Hà Phương Trúc', N'07/12/2000 7:39:31 PM', N'Bình Thạnh. HCM', N'0765897')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'TKD', N'Trần Khánh Duy', N'02/10/2000 7:38:02 PM', N'Gò Vấp. HCM', N'07835789')
INSERT [dbo].[LoaiHang] ([MaLoaiHH], [TenLoai]) VALUES (N'BEER', N'Bia')
INSERT [dbo].[LoaiHang] ([MaLoaiHH], [TenLoai]) VALUES (N'CARD', N'Thẻ điện thoại')
INSERT [dbo].[LoaiHang] ([MaLoaiHH], [TenLoai]) VALUES (N'SNACK', N'Bánh')
INSERT [dbo].[LoaiHang] ([MaLoaiHH], [TenLoai]) VALUES (N'VLXD', N'Vật liệu xây dựng')
INSERT [dbo].[LoaiHang] ([MaLoaiHH], [TenLoai]) VALUES (N'WATER', N'Nước')
INSERT [dbo].[NhaCungCap] ([MaCC], [TenCungCap], [DiaChi], [DienThoai]) VALUES (N'ASR', N'Asernal', N'Gò Vấp. HCM', N'0589123')
INSERT [dbo].[NhaCungCap] ([MaCC], [TenCungCap], [DiaChi], [DienThoai]) VALUES (N'CHE', N'Chelsea', N'Quận 1. HCM', N'09876411')
INSERT [dbo].[NhaCungCap] ([MaCC], [TenCungCap], [DiaChi], [DienThoai]) VALUES (N'LIV', N'Liverpool', N'Dĩ An. BD', N'08952111')
INSERT [dbo].[USERNAME] ([username], [password], [lastlogin]) VALUES (N'admin', N'd033e22ae348aeb5660fc2140aec35850c4da997', CAST(N'2020-05-23T14:10:02.280' AS DateTime))
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HangHoa]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH NOCHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDon] NOCHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_LoaiHang] FOREIGN KEY([MaLoaiHH])
REFERENCES [dbo].[LoaiHang] ([MaLoaiHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_LoaiHang]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_NhaCungCap] FOREIGN KEY([MaCC])
REFERENCES [dbo].[NhaCungCap] ([MaCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_NhaCungCap]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KHACHHANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KHACHHANG]
GO
/****** Object:  StoredProcedure [dbo].[ChiTietHoaDon_Delete]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ChiTietHoaDon_Delete]
@MaHD nvarchar(100)=null,
@MaHH nvarchar(15)=null
as
delete ChiTietHoaDon
where MaHD=@MaHD and MaHH=@MaHH
GO
/****** Object:  StoredProcedure [dbo].[ChiTietHoaDon_Insert]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ChiTietHoaDon_Insert]
@MaHD nvarchar(100)=null,
@MaHH nvarchar(15)=null,
@SoLuong int=null
as
insert into ChiTietHoaDon
(MaHD,MaHH,SoLuong)
values
(@MaHD,@MaHH,@SoLuong)
GO
/****** Object:  StoredProcedure [dbo].[ChiTietHoaDon_SelectAll]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ChiTietHoaDon_SelectAll]
@MaHD nvarchar(100)=null
as
select ChiTietHoaDon.MaHD, HangHoa.TenHH, ChiTietHoaDon.SoLuong, HangHoa.DonGia, (ChiTietHoaDon.SoLuong*HangHoa.DonGia) as Tong
from ChiTietHoaDon inner join HangHoa on ChiTietHoaDon.MaHH=HangHoa.MaHH
where ChiTietHoaDon.MaHD=@MaHD
GO
/****** Object:  StoredProcedure [dbo].[HangHoa_Delete]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HangHoa_Delete]
@MaHH nvarchar(15)=null
as
delete HangHoa
where MaHH=@MaHH
GO
/****** Object:  StoredProcedure [dbo].[HangHoa_FindId]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HangHoa_FindId]
@MaHH nvarchar(15) = null
as
select q1.MaHH, q1.TenHH, LoaiHang.TenLoai, q1.DonGia, q1.SoLuong, q1.TenCungCap
from
(select HangHoa.MaCC,NhaCungCap.TenCungCap, HangHoa.MaLoaiHH,HangHoa.TenHH, HangHoa.MaHH, HangHoa.DonGia, HangHoa.SoLuong
from HangHoa inner join NhaCungCap on HangHoa.MaCC=NhaCungCap.MaCC) 
as q1 inner join LoaiHang on q1.MaLoaiHH= LoaiHang.MaLoaiHH
where q1.MaHH like '%'+@MaHH+'%'
GO
/****** Object:  StoredProcedure [dbo].[HangHoa_FindIdCat]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HangHoa_FindIdCat]
@TenLoai nvarchar(100) = null
as
select q1.MaHH, q1.TenHH, LoaiHang.TenLoai, q1.DonGia, q1.SoLuong, q1.TenCungCap
from
(select HangHoa.MaCC,NhaCungCap.TenCungCap, HangHoa.MaLoaiHH,HangHoa.TenHH, HangHoa.MaHH, HangHoa.DonGia, HangHoa.SoLuong
from HangHoa inner join NhaCungCap on HangHoa.MaCC=NhaCungCap.MaCC) 
as q1 inner join LoaiHang on q1.MaLoaiHH= LoaiHang.MaLoaiHH
where LoaiHang.TenLoai like '%'+@TenLoai+'%'
GO
/****** Object:  StoredProcedure [dbo].[HangHoa_FindIdVen]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HangHoa_FindIdVen]
@TenCungCap nvarchar(150) = null
as
select q1.MaHH, q1.TenHH, LoaiHang.TenLoai, q1.DonGia, q1.SoLuong, q1.TenCungCap
from
(select HangHoa.MaCC,NhaCungCap.TenCungCap, HangHoa.MaLoaiHH,HangHoa.TenHH, HangHoa.MaHH, HangHoa.DonGia, HangHoa.SoLuong
from HangHoa inner join NhaCungCap on HangHoa.MaCC=NhaCungCap.MaCC) 
as q1 inner join LoaiHang on q1.MaLoaiHH= LoaiHang.MaLoaiHH
where q1.TenCungCap like '%'+@TenCungCap+'%'
GO
/****** Object:  StoredProcedure [dbo].[HangHoa_FindName]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HangHoa_FindName]
@TenHH nvarchar(150) = null
as
select q1.MaHH, q1.TenHH, LoaiHang.TenLoai, q1.DonGia, q1.SoLuong, q1.TenCungCap
from
(select HangHoa.MaCC,NhaCungCap.TenCungCap, HangHoa.MaLoaiHH,HangHoa.TenHH, HangHoa.MaHH, HangHoa.DonGia, HangHoa.SoLuong
from HangHoa inner join NhaCungCap on HangHoa.MaCC=NhaCungCap.MaCC) 
as q1 inner join LoaiHang on q1.MaLoaiHH= LoaiHang.MaLoaiHH
where q1.TenHH like '%'+@TenHH+'%'
GO
/****** Object:  StoredProcedure [dbo].[HangHoa_Insert]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HangHoa_Insert]
@MaHH nvarchar(15)=null,
@TenHH nvarchar(150)=null,
@MaLoaiHH nvarchar(15)=null,
@DonGia int=null,
@SoLuong int=null,
@MaCC nvarchar(15)=null
as
insert into  HangHoa
(MaHH,TenHH,MaLoaiHH,DonGia,SoLuong,MaCC)
values
(@MaHH,@TenHH,@MaLoaiHH,@DonGia,@SoLuong,@MaCC)
GO
/****** Object:  StoredProcedure [dbo].[HangHoa_MinusSL]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HangHoa_MinusSL]
@MaHH nvarchar(15)=null
as
select HangHoa.SoLuong-ChiTietHoaDon.SoLuong as SoLuong
from HangHoa inner join ChiTietHoaDon on HangHoa.MaHH=ChiTietHoaDon.MaHH
where HangHoa.MaHH=@MaHH
GO
/****** Object:  StoredProcedure [dbo].[HangHoa_Salevalue]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HangHoa_Salevalue]
as
select HangHoa.TenHH, sum(ChiTietHoaDon.SoLuong) as SLBan
from ChiTietHoaDon inner join HangHoa on ChiTietHoaDon.MaHH=HangHoa.MaHH
group by HangHoa.TenHH
GO
/****** Object:  StoredProcedure [dbo].[HangHoa_Selectall]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HangHoa_Selectall]
as
select q1.MaHH, q1.TenHH, LoaiHang.TenLoai, q1.DonGia, q1.SoLuong, q1.TenCungCap
from
(select HangHoa.MaCC,NhaCungCap.TenCungCap, HangHoa.MaLoaiHH,HangHoa.TenHH, HangHoa.MaHH, HangHoa.DonGia, HangHoa.SoLuong
from HangHoa inner join NhaCungCap on HangHoa.MaCC=NhaCungCap.MaCC) 
as q1 inner join LoaiHang on q1.MaLoaiHH= LoaiHang.MaLoaiHH
GO
/****** Object:  StoredProcedure [dbo].[HangHoa_SelectbyMaCC]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HangHoa_SelectbyMaCC]
@MaCC nvarchar(15)=null
as
if (@MaCC=0)
	select HangHoa.MaHH,HangHoa.TenHH,HangHoa.MaLoaiHH,HangHoa.DonGia,HangHoa.SoLuong
	from HangHoa
	order by HangHoa.MaHH
else
	select HangHoa.MaHH,HangHoa.TenHH,HangHoa.MaLoaiHH,HangHoa.DonGia,HangHoa.SoLuong
	from HangHoa
	where MaCC=@MaCC
	order by HangHoa.MaHH
GO
/****** Object:  StoredProcedure [dbo].[HangHoa_SelectbyMaLoaiHH]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HangHoa_SelectbyMaLoaiHH]
@MaLoaiHH nvarchar(15)=null
as
if (@MaLoaiHH=0)
	select HangHoa.MaHH,HangHoa.TenHH,HangHoa.DonGia,HangHoa.SoLuong, HangHoa.MaCC
	from HangHoa
	order by HangHoa.MaHH
else
	select HangHoa.MaHH,HangHoa.TenHH,HangHoa.DonGia,HangHoa.SoLuong, HangHoa.MaCC
	from HangHoa
	where MaLoaiHH=@MaLoaiHH
	order by HangHoa.MaHH
GO
/****** Object:  StoredProcedure [dbo].[HangHoa_SelectSL]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HangHoa_SelectSL]
@MaHH nvarchar(15)=null
as
select HangHoa.SoLuong
from HangHoa
where HangHoa.MaHH=@MaHH
GO
/****** Object:  StoredProcedure [dbo].[HangHoa_Update]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HangHoa_Update]
@MaHH nvarchar(15)=null,
@TenHH nvarchar(150)=null,
@MaLoaiHH nvarchar(15)=null,
@DonGia int=null,
@SoLuong int=null,
@MaCC nvarchar(15)=null
as
update HangHoa set
TenHH=@TenHH, MaLoaiHH=@MaLoaiHH, DonGia=@DonGia,SoLuong=@SoLuong,MaCC=@MaCC
where MaHH=@MaHH
GO
/****** Object:  StoredProcedure [dbo].[HangHoa_UpSL]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HangHoa_UpSL]
@MaHH nvarchar(15)=null,
@SoLuong int=null
as
update HangHoa set
SoLuong = @SoLuong
where MaHH = @MaHH
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_Count]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HoaDon_Count]
as
select count(HoaDon.MaHD) as Dem
from HoaDon
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_Delete]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HoaDon_Delete]
@MaHD nvarchar(100)=null
as
Delete HoaDon
where MaHD=@MaHD
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_Dem]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HoaDon_Dem]
as
select KHACHHANG.HoTen, count(HoaDon.MaHD) as SOHD
from KHACHHANG inner join HoaDon on KHACHHANG.MaKH=HoaDon.MaKH
group by KHACHHANG.HoTen
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_FindDate]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HoaDon_FindDate]
@NgayLap nvarchar(max)=null
as
select HoaDon.MaHD,KHACHHANG.HoTen,HoaDon.NgayLap,HoaDon.TongGiaTri
from HoaDon inner join KHACHHANG on HoaDon.MaKH=KHACHHANG.MaKH
where HoaDon.NgayLap like '%'+@NgayLap+'%'
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_FindId]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HoaDon_FindId]
@MaHD nvarchar(100)=null
as
select HoaDon.MaHD,KHACHHANG.HoTen,HoaDon.NgayLap,HoaDon.TongGiaTri
from HoaDon inner join KHACHHANG on HoaDon.MaKH=KHACHHANG.MaKH
where HoaDon.MaHD = @MaHD
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_FindName]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HoaDon_FindName]
@HoTen nvarchar(150)=null
as
select HoaDon.MaHD,KHACHHANG.HoTen,HoaDon.NgayLap,HoaDon.TongGiaTri
from HoaDon inner join KHACHHANG on HoaDon.MaKH=KHACHHANG.MaKH
where KHACHHANG.HoTen like '%'+@HoTen+'%'
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_Insert]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HoaDon_Insert]
@MaHD nvarchar(100)=null,
@MaKH nvarchar(15)=null,
@NgayLap nvarchar(max)=null,
@TongGiaTri int=null
as
insert into HoaDon
(MaHD,MaKH,NgayLap,TongGiaTri)
values
(@MaHD,@MaKH,@NgayLap,@TongGiaTri)
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_Selectall]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HoaDon_Selectall]
as
select HoaDon.MaHD,KHACHHANG.HoTen,HoaDon.NgayLap,HoaDon.TongGiaTri
from HoaDon inner join KHACHHANG on HoaDon.MaKH=KHACHHANG.MaKH
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_SelectbyMaKH]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HoaDon_SelectbyMaKH]
@MaKH nvarchar(15)=null
as
select HoaDon.MaHD,HoaDon.NgayLap,HoaDon.TongGiaTri
from HoaDon
where HoaDon.MaKH=@MaKH
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_TongGiaTri]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HoaDon_TongGiaTri]
@MaHD nvarchar(100)=null
as
select sum(ChiTietHoaDon.SoLuong*HangHoa.DonGia) as TongGiaTri
from ChiTietHoaDon inner join HangHoa on ChiTietHoaDon.MaHH=HangHoa.MaHH
where @MaHD = ChiTietHoaDon.MaHD
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_Update]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HoaDon_Update]
@MaHD nvarchar(100)=null,
@MaKH nvarchar(15)=null,
@NgayLap nvarchar(max)=null,
@TongGiaTri int=null
as
update HoaDon set
MaKH=@MaKH,NgayLap=@NgayLap,TongGiaTri=@TongGiaTri
where MaHD=@MaHD
GO
/****** Object:  StoredProcedure [dbo].[KHACHHANG_Delete]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[KHACHHANG_Delete]
@MaKH nvarchar(15)=null
as
delete KHACHHANG
where MaKH=@MaKH
GO
/****** Object:  StoredProcedure [dbo].[KhachHang_FindAdd]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[KhachHang_FindAdd]
@DiaChi nvarchar(max) = null
as
select * from KHACHHANG where KHACHHANG.DiaChi like '%'+@DiaChi+'%'
GO
/****** Object:  StoredProcedure [dbo].[KhachHang_FindDate]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[KhachHang_FindDate]
@NgaySinh nvarchar(max) = null
as
select * from KHACHHANG where KHACHHANG.NgaySinh like '%'+@NgaySinh+'%'
GO
/****** Object:  StoredProcedure [dbo].[KhachHang_FindId]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[KhachHang_FindId]
@MaKH nvarchar(15) = null
as
select * from KHACHHANG where KHACHHANG.MaKH like '%'+@MaKH+'%'
GO
/****** Object:  StoredProcedure [dbo].[KhachHang_FindName]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[KhachHang_FindName]
@HoTen nvarchar(150) = null
as
select * from KHACHHANG where KHACHHANG.HoTen like '%'+@HoTen+'%'
GO
/****** Object:  StoredProcedure [dbo].[KhachHang_FindPho]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[KhachHang_FindPho]
@DienThoai nvarchar(50) = null
as
select * from KHACHHANG where KHACHHANG.DienThoai like '%'+@DienThoai+'%'
GO
/****** Object:  StoredProcedure [dbo].[KHACHHANG_Insert]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[KHACHHANG_Insert]
@MaKH nvarchar(15)=null,
@HoTen nvarchar(150)=null,
@NgaySinh nvarchar(max)=null,
@DiaChi nvarchar(max)=null,
@DienThoai nvarchar(50)=null
as
insert into KHACHHANG
(MaKH,HoTen,NgaySinh,DiaChi,DienThoai)
values
(@MaKH,@HoTen,@NgaySinh,@DiaChi,@DienThoai)
GO
/****** Object:  StoredProcedure [dbo].[KHACHHANG_Selectall]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[KHACHHANG_Selectall]
as
select KHACHHANG.MaKH,KHACHHANG.HoTen,KHACHHANG.NgaySinh,KHACHHANG.DiaChi,KHACHHANG.DienThoai
from KHACHHANG
GO
/****** Object:  StoredProcedure [dbo].[KHACHHANG_Update]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[KHACHHANG_Update]
@MaKH nvarchar(15)=null,
@HoTen nvarchar(150)=null,
@NgaySinh nvarchar(max) =null,
@DiaChi nvarchar(max)=null,
@DienThoai nvarchar(50)=null
as
update KHACHHANG
set HoTen=@HoTen,NgaySinh=@NgaySinh, DiaChi=@DiaChi, DienThoai=@DienThoai
where MaKH=@MaKH
GO
/****** Object:  StoredProcedure [dbo].[LoaiHang_Delete]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[LoaiHang_Delete]
@MaLoaiHH nvarchar(15)=null
as
delete LoaiHang
where MaLoaiHH=@MaLoaiHH
GO
/****** Object:  StoredProcedure [dbo].[LoaiHang_Find]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[LoaiHang_Find]
@TenLoai nvarchar(100)=null
as
select LoaiHang.MaLoaiHH, LoaiHang.TenLoai
from LoaiHang
where LoaiHang.TenLoai like '%'+@TenLoai+'%'
GO
/****** Object:  StoredProcedure [dbo].[LoaiHang_FindId]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[LoaiHang_FindId]
@MaLoaiHH nvarchar(15) = null
as
select * from LoaiHang where LoaiHang.MaLoaiHH like '%'+@MaLoaiHH+'%'
GO
/****** Object:  StoredProcedure [dbo].[LoaiHang_Insert]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[LoaiHang_Insert]
@MaLoaiHH nvarchar(15)=null,
@TenLoai nvarchar(100)=null
as 
insert into LoaiHang (MaLoaiHH,TenLoai) values (@MaLoaiHH,@TenLoai)
GO
/****** Object:  StoredProcedure [dbo].[LoaiHang_Selectall]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[LoaiHang_Selectall]
as
select LoaiHang.MaLoaiHH,LoaiHang.TenLoai
from LoaiHang
GO
/****** Object:  StoredProcedure [dbo].[LoaiHang_Update]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[LoaiHang_Update]
@MaLoaiHH nvarchar(15)=null,
@TenLoai nvarchar(100)=null
as
update LoaiHang set TenLoai=@TenLoai where MaLoaiHH=@MaLoaiHH
GO
/****** Object:  StoredProcedure [dbo].[NhaCungCap_Delete]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[NhaCungCap_Delete]
@MaCC nvarchar(15)=null
as
delete NhaCungCap
where MaCC=@MaCC
GO
/****** Object:  StoredProcedure [dbo].[NhaCungCap_Find]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[NhaCungCap_Find]
@TenCungCap nvarchar(150)=null
as
select NhaCungCap.MaCC, NhaCungCap.TenCungCap, NhaCungCap.DiaChi, NhaCungCap.DienThoai
from NhaCungCap
where NhaCungCap.TenCungCap like '%'+@TenCungCap+'%'
GO
/****** Object:  StoredProcedure [dbo].[NhaCungCap_FindAdd]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[NhaCungCap_FindAdd]
@DiaChi nvarchar(max)=null
as
select * from NhaCungCap where NhaCungCap.DiaChi like '%'+@DiaChi+'%'
GO
/****** Object:  StoredProcedure [dbo].[NhaCungCap_FindId]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[NhaCungCap_FindId]
@MaCC nvarchar(15) = null
as
select * from NhaCungCap where NhaCungCap.MaCC like '%'+@MaCC+'%'
GO
/****** Object:  StoredProcedure [dbo].[NhaCungCap_FindPhone]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[NhaCungCap_FindPhone]
@DienThoai nvarchar(50) = null
as
select * from NhaCungCap where NhaCungCap.DienThoai like '%'+@DienThoai+'%'
GO
/****** Object:  StoredProcedure [dbo].[NhaCungCap_Insert]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[NhaCungCap_Insert]
@MaCC nvarchar(15)=null,
@TenCungCap nvarchar(150)=null,
@DiaChi nvarchar(max)=null,
@DienThoai nvarchar(50)=null
as
insert into NhaCungCap
(MaCC,TenCungCap,DiaChi,DienThoai)
values
(@MaCC,@TenCungCap,@DiaChi,@DienThoai)
GO
/****** Object:  StoredProcedure [dbo].[NhaCungCap_Selectall]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[NhaCungCap_Selectall]
as
select NhaCungCap.MaCC,NhaCungCap.TenCungCap,NhaCungCap.DiaChi,NhaCungCap.DienThoai
from NhaCungCap
order by NhaCungCap.MaCC
GO
/****** Object:  StoredProcedure [dbo].[NhaCungCap_Update]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[NhaCungCap_Update]
@MaCC nvarchar(15)=null,
@TenCungCap nvarchar(150)=null,
@DiaChi nvarchar(max)=null,
@DienThoai nvarchar(50)=null
as
update NhaCungCap set
TenCungCap=@TenCungCap, DiaChi=@DiaChi,DienThoai=@DienThoai
where MaCC=@MaCC
GO
/****** Object:  StoredProcedure [dbo].[USERNAME_Delete]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USERNAME_Delete]
@username nvarchar(50)=null
as 
delete USERNAME
where username=@username
GO
/****** Object:  StoredProcedure [dbo].[USERNAME_Insert]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[USERNAME_Insert]
@username nvarchar(50)=null,
@password nvarchar(max)=null
as
insert into USERNAME
(username,password)
values
(@username,@password)
GO
/****** Object:  StoredProcedure [dbo].[USERNAME_Selectall]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[USERNAME_Selectall]
as
select USERNAME.username,USERNAME.password,USERNAME.lastlogin
from USERNAME
GO
/****** Object:  StoredProcedure [dbo].[USERNAME_Selectchecklogin]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USERNAME_Selectchecklogin]
@username nvarchar(50)=null,
@password nvarchar(max)=null
as
begin
	select USERNAME.username
	from USERNAME
	where USERNAME.username=@username and USERNAME.password=@password;
	if @@ROWCOUNT>0
	update USERNAME set lastlogin=GETDATE()
	where username=@username and password=@password;
end
GO
/****** Object:  StoredProcedure [dbo].[USERNAME_Updatepassword]    Script Date: 05/30/2020 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USERNAME_Updatepassword]
@username nvarchar(50)=null,
@password nvarchar(max)= null
as
update USERNAME
set password=@password
where username=@username
GO
USE [master]
GO
ALTER DATABASE [QLBH] SET  READ_WRITE 
GO
