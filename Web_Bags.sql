USE [master]
GO
/****** Object:  Database [WEB_BAGS]    Script Date: 08/12/2021 15:48:32 ******/
CREATE DATABASE [WEB_BAGS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WEB_BAGS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WEB_BAGS.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WEB_BAGS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WEB_BAGS_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WEB_BAGS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WEB_BAGS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WEB_BAGS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WEB_BAGS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WEB_BAGS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WEB_BAGS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WEB_BAGS] SET ARITHABORT OFF 
GO
ALTER DATABASE [WEB_BAGS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WEB_BAGS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WEB_BAGS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WEB_BAGS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WEB_BAGS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WEB_BAGS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WEB_BAGS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WEB_BAGS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WEB_BAGS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WEB_BAGS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WEB_BAGS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WEB_BAGS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WEB_BAGS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WEB_BAGS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WEB_BAGS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WEB_BAGS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WEB_BAGS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WEB_BAGS] SET RECOVERY FULL 
GO
ALTER DATABASE [WEB_BAGS] SET  MULTI_USER 
GO
ALTER DATABASE [WEB_BAGS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WEB_BAGS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WEB_BAGS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WEB_BAGS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WEB_BAGS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WEB_BAGS', N'ON'
GO
USE [WEB_BAGS]
GO
/****** Object:  Table [dbo].[BILL]    Script Date: 08/12/2021 15:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BILL](
	[ID_BILL] [int] IDENTITY(1,1) NOT NULL,
	[ID_USER] [int] NOT NULL,
	[DATE_BILL] [date] NULL,
	[VAT] [int] NULL,
 CONSTRAINT [PK_BILL] PRIMARY KEY CLUSTERED 
(
	[ID_BILL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BILL_DETAIL]    Script Date: 08/12/2021 15:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BILL_DETAIL](
	[ID_BILL] [int] NOT NULL,
	[ID_PRODUCT] [int] NOT NULL,
	[QUANTITY] [int] NOT NULL,
	[PRICE] [float] NOT NULL,
	[TOTAL] [float] NULL,
 CONSTRAINT [PK_BILL_DETAIL] PRIMARY KEY CLUSTERED 
(
	[ID_BILL] ASC,
	[ID_PRODUCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BRAND]    Script Date: 08/12/2021 15:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BRAND](
	[ID_BRAND] [int] IDENTITY(1,1) NOT NULL,
	[NAME_BRAND] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BRAND] PRIMARY KEY CLUSTERED 
(
	[ID_BRAND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CART]    Script Date: 08/12/2021 15:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CART](
	[ID_USER] [int] NOT NULL,
	[ID_PRODUCT] [int] NOT NULL,
	[QUANTITY] [int] NULL,
 CONSTRAINT [PK_CART] PRIMARY KEY CLUSTERED 
(
	[ID_USER] ASC,
	[ID_PRODUCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COLOR]    Script Date: 08/12/2021 15:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COLOR](
	[ID_COLOR] [int] IDENTITY(1,1) NOT NULL,
	[NAME_COLOR] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_COLOR] PRIMARY KEY CLUSTERED 
(
	[ID_COLOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CONTACT]    Script Date: 08/12/2021 15:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTACT](
	[ID_CONTACT] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](20) NOT NULL,
	[EMAIL] [nvarchar](50) NOT NULL,
	[TOPIC] [nvarchar](100) NULL,
	[CONTENT] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_CONTACT] PRIMARY KEY CLUSTERED 
(
	[ID_CONTACT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 08/12/2021 15:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[ID_USER] [int] IDENTITY(1,1) NOT NULL,
	[ID_ROLE] [int] NOT NULL,
	[USERNAME] [varchar](30) NOT NULL,
	[PASSWORD] [varchar](20) NOT NULL,
	[ADDRESS_CUSTOMER] [nvarchar](1000) NOT NULL,
	[EMAIL] [nvarchar](50) NOT NULL,
	[PHONE] [nvarchar](50) NOT NULL,
	[SEX] [bit] NOT NULL,
	[NAME] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[ID_USER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 08/12/2021 15:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[ID_PRODUCT] [int] IDENTITY(1,1) NOT NULL,
	[PRICCE] [float] NOT NULL,
	[DESCR] [nvarchar](1000) NOT NULL,
	[TITLE] [nvarchar](30) NOT NULL,
	[ID_COLOR] [int] NOT NULL,
	[ID_BRAND] [int] NOT NULL,
	[IMAGE] [nvarchar](200) NOT NULL,
	[QUANTITY] [int] NOT NULL,
 CONSTRAINT [PK_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[ID_PRODUCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ROLE]    Script Date: 08/12/2021 15:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLE](
	[ID_ROLE] [int] NOT NULL,
	[ROLE] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_ROLE] PRIMARY KEY CLUSTERED 
(
	[ID_ROLE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SHOP]    Script Date: 08/12/2021 15:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SHOP](
	[SHOP_NAME] [nvarchar](50) NOT NULL,
	[ADDRESS] [nvarchar](1000) NOT NULL,
	[PHONE] [char](11) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_SHOP] PRIMARY KEY CLUSTERED 
(
	[SHOP_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BRAND] ON 

INSERT [dbo].[BRAND] ([ID_BRAND], [NAME_BRAND]) VALUES (1, N'Dior')
INSERT [dbo].[BRAND] ([ID_BRAND], [NAME_BRAND]) VALUES (2, N'Channel')
SET IDENTITY_INSERT [dbo].[BRAND] OFF
SET IDENTITY_INSERT [dbo].[COLOR] ON 

INSERT [dbo].[COLOR] ([ID_COLOR], [NAME_COLOR]) VALUES (1, N' Green ')
INSERT [dbo].[COLOR] ([ID_COLOR], [NAME_COLOR]) VALUES (2, N'Blue ')
INSERT [dbo].[COLOR] ([ID_COLOR], [NAME_COLOR]) VALUES (3, N'Black')
INSERT [dbo].[COLOR] ([ID_COLOR], [NAME_COLOR]) VALUES (4, N'Brick Red ')
INSERT [dbo].[COLOR] ([ID_COLOR], [NAME_COLOR]) VALUES (5, N'Amber ')
INSERT [dbo].[COLOR] ([ID_COLOR], [NAME_COLOR]) VALUES (6, N'Cloud Blue ')
INSERT [dbo].[COLOR] ([ID_COLOR], [NAME_COLOR]) VALUES (7, N'Pale Yellow ')
INSERT [dbo].[COLOR] ([ID_COLOR], [NAME_COLOR]) VALUES (8, N'Yarrow Pink ')
INSERT [dbo].[COLOR] ([ID_COLOR], [NAME_COLOR]) VALUES (9, N'Warm Taupe ')
INSERT [dbo].[COLOR] ([ID_COLOR], [NAME_COLOR]) VALUES (10, N'Greek Blue ')
INSERT [dbo].[COLOR] ([ID_COLOR], [NAME_COLOR]) VALUES (11, N'Beige ')
INSERT [dbo].[COLOR] ([ID_COLOR], [NAME_COLOR]) VALUES (12, N'Raspberry ')
SET IDENTITY_INSERT [dbo].[COLOR] OFF
SET IDENTITY_INSERT [dbo].[CUSTOMER] ON 

INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (1, 0, N'HoMaiQue', N'123456789', N'Buôn hồ, Đăk Lăk', N'homaique@gmail.com', N'0123654789', 1, N'Hồ Mai Quế')
INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (2, 1, N'Nguyenthanhtung', N'12345678', N'Hồ Chí Minh', N'nttung@gmail.com', N'0921456987', 1, N'Nguyễn Thanh Tùng')
INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (3, 1, N'Caothihoa', N'11111111', N'235 Phan Văn Trị, Gò Vấp, thành phố Hồ Chí Minh', N'cthoa@gmail.com', N'0945236156', 0, N'Cao Thị Hoa')
INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (4, 0, N'HNQuocAnh', N'123456', N'Buôn hồ, Đăk Lăk', N'hnquocanh@gmail.com', N'0321456985', 1, N'Hoàng Nghĩa Quốc ANh')
INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (5, 1, N'Nguyenthanhlong', N'888888', N'335 Quang Trung , gò vấp , thành phố Hồ Chí Minh', N'nguyenthanhlong@gmail.com', N'0945632178', 1, N'Nguyễn Thành Long')
INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (6, 1, N'Lamtamnhu', N'7777777', N'Số 249 Trần Đăng Ninh, Phường Dịch Vọng, Quận Cầu Giấy, Thành phố Hà Nội

', N'lamtamnhu@gmail.com', N'0231456987', 0, N'Lâm Tâm Như')
INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (7, 1, N'Phamtuanvi', N'111111', N'NULLSố 2 ngõ 196/8/8 đường Cầu Giấy, Phường Quan Hoa, Quận Cầu Giấy, Thành phố Hà Nội

Nguồn', N'phamtv@gmail.com', N'0147853692', 1, N'Phạm Tuấn Vĩ')
INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (8, 1, N'Phamtuanlong', N'22222222', N'Số 37 ngõ 80 đường Trung Kính, Phường Trung Hoà, Quận Cầu Giấy, Thành phố Hà Nội
', N'phamtl@gmail.com', N'0945632178', 1, N'Phạm Tuấn Long')
INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (9, 1, N'Nguyenthimai', N'123456', N'146 Trần Vỹ, Phường Mai Dịch, Quận Cầu Giấy, Thành phố Hà Nội

', N'nguyentm@gmail.com', N'0978412563', 0, N'Nguyễn Thi Mai')
INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (10, 1, N'DonhuQuynh', N'123456', N'Số 14 ngõ 189/103 Nguyễn Ngọc Vũ, Phường Trung Hoà, Quận Cầu Giấy, Thành phố Hà Nội', N'dnquynh@gmail.com', N'0123698745', 0, N'Đỗ Như Quỳnh')
INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (11, 1, N'Hoanglong', N'123456', N'Tầng 9, Tòa nhà 3D, Số 3 Phố Duy Tân, Phường Dịch Vọng Hậu, Quận Cầu Giấy, Thành phố Hà Nội

', N'hoanglong@gmail.com', N'0945632178', 1, N'Hoàng Long')
INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (12, 1, N'Vuongtrungquyen', N'123456', N'Số 26 ngõ 3 phố Phạm Tuấn Tài, Phường Dịch Vọng Hậu, Quận Cầu Giấy, Thành phố Hà Nội
', N'vtquyen@gmail.com', N'0945632178', 1, N'Vương Trung Quyền')
INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (13, 1, N'Nguyenphuonghang', N'123456', N'Số 145 Đường Nguyễn Khang, Phường Yên Hoà, Quận Cầu Giấy, Thành phố Hà Nội

', N'nphang@gmail.com', N'0945632178', 0, N'Nguyễn Phương Hằng')
INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (14, 1, N'Caothanhloi', N'123456', N'Số 2 Lê Đức Thọ, Phường Mai Dịch, Quận Cầu Giấy, Thành phố Hà Nội

', N'ctloi@gmail.com', N'0945632178', 1, N'Cao Thành Lợi')
INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (15, 1, N'Vohoanglong', N'123456', N'Tầng 2, số 10 Dương Quảng Hàm, Phường Quan Hoa, Quận Cầu Giấy, Thành phố Hà Nội

', N'vhlong@gmail.com', N'0945632178', 1, N'Võ Hoàng Long')
INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (16, 1, N'Nguyenthidiem', N'123456', N'Số nhà 41, ngách 106, ngõ 43 phố Trung Kính, Phường Trung Hoà, Quận Cầu Giấy, Thành phố Hà Nội

', N'ntdiem@gmail.com', N'0321456987', 0, N'Nguyễn Thị Diễm')
INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (17, 1, N'Phantantrung', N'123456', N'Số 417 Đường Nguyễn Khang, Phường Yên Hoà, Quận Cầu Giấy, Thành phố Hà Nội

', N'pttrung@gmail.com', N'0945632178', 1, N'Phan Tấn Trung')
INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (18, 1, N'Phanngochai', N'123456', N'Số 24 ngách 22/40/79 Phố Dương Quảng Hàm, Phường Quan Hoa, Quận Cầu Giấy, Thành phố Hà Nội', N'pnhai@gmail.com', N'0945632178', 1, N'Phan Ngọc Hải')
INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (19, 1, N'Daoductan', N'123456', N'Tầng 4, Số 207 Hoàng Quốc Việt, Phường Nghĩa Đô, Quận Cầu Giấy, Thành phố Hà Nội
', N'ddtan@gmail.com', N'0987456321', 1, N'Đào Đức Tấn')
INSERT [dbo].[CUSTOMER] ([ID_USER], [ID_ROLE], [USERNAME], [PASSWORD], [ADDRESS_CUSTOMER], [EMAIL], [PHONE], [SEX], [NAME]) VALUES (20, 1, N'Nguyenthanhduong', N'123456', N'số 24 Trần Kim Xuyến, Phường Yên Hoà, Quận Cầu Giấy, Thành phố Hà Nội

', N'nguyentd@gmail.com', N'0987456321', 1, N'Nguyễn Thanh Dương')
SET IDENTITY_INSERT [dbo].[CUSTOMER] OFF
SET IDENTITY_INSERT [dbo].[PRODUCT] ON 

INSERT [dbo].[PRODUCT] ([ID_PRODUCT], [PRICCE], [DESCR], [TITLE], [ID_COLOR], [ID_BRAND], [IMAGE], [QUANTITY]) VALUES (45, 1354, N'A symbol and a legend, the Lady Dior handbag appeared for the first time on the arm of Lady Diana and has since had an extraordinary destiny. With architectural lines exalting the cannage motif, it is a concentration of the House’s excellence. Celebrating the virtuoso craftsmanship of the Ateliers, and reinvented by Maria Grazia Chiuri season after season, the Lady Dior comes to life in Italy thanks to Dior’s petites mains and the beauty of their gestures.', N'THE SAVOIR-FAIRE OF AN ICON', 3, 1, N'item-13.jpg', 180)
INSERT [dbo].[PRODUCT] ([ID_PRODUCT], [PRICCE], [DESCR], [TITLE], [ID_COLOR], [ID_BRAND], [IMAGE], [QUANTITY]) VALUES (46, 2560, N'The Lady Dior handbag epitomizes Mr. Dior''s vision of elegance and beauty. A sleek, refined bag, it is timeless yet modern. Crafted in pale yellow patent calfskin and covered with Cannage stitching, its supreme quilted texture instantly stands out. The pale gold-finish metal ''D.I.O.R.'' charms further embellish its silhouette. The small style, an ideal evening wear companion, has a removable chain shoulder strap and may be carried by hand, worn over the shoulder or crossbody.', N'SMALL LADY DIOR BAG', 7, 1, N'item-20.jpg', 100)
INSERT [dbo].[PRODUCT] ([ID_PRODUCT], [PRICCE], [DESCR], [TITLE], [ID_COLOR], [ID_BRAND], [IMAGE], [QUANTITY]) VALUES (47, 3654, N'The Lady Dior My ABCDior bag epitomizes Dior''s vision of elegance and beauty. A sleek, refined bag, it is timeless yet modern. Crafted in cedar green lambskin and covered with Cannage stitching, its supreme quilted texture instantly stands out, while the tonal enamel ''D.I.O.R.'' charms offer an elegant allure. The unique design may be personalized with badges placed on its shoulder strap and can be carried by hand, worn over the shoulder or crossbody.', N'LADY DIOR MY ABCDIOR BAG', 1, 1, N'item-21.jpg', 456)
INSERT [dbo].[PRODUCT] ([ID_PRODUCT], [PRICCE], [DESCR], [TITLE], [ID_COLOR], [ID_BRAND], [IMAGE], [QUANTITY]) VALUES (48, 1456, N'The Lady Dior bag combines classic elegance with House modernity. Crafted in latte leather, it is embroidered with the Cornely effect in gold-finish metallic thread, serving as an invitation to discover Grecian artistry. The front features a ''CHRISTIAN DIOR'' signature while the thick ''D.I.O.R.'' charms in pale gold-finish metal embellish and illuminate the silhouette. Equipped with a thin, removable shoulder strap, the medium Lady Dior bag can be carried by hand, worn over the shoulder or crossbody.', N'MEDIUM LADY DIOR BAG', 11, 1, N'item-15.jpg', 600)
INSERT [dbo].[PRODUCT] ([ID_PRODUCT], [PRICCE], [DESCR], [TITLE], [ID_COLOR], [ID_BRAND], [IMAGE], [QUANTITY]) VALUES (49, 2365, N'The Lady D-Lite bag combines classic elegance with House modernity. The style is fully embroidered with the blue Toile de Jouy motif. The front features a ''CHRISTIAN DIOR'' signature while the thick ''D.I.O.R.'' charms in pale gold-finish metal enhance the silhouette. Equipped with a wide, reversible and removable embroidered shoulder strap, the medium Lady D-Lite bag can be carried by hand, worn over the shoulder or crossbody.', N'MEDIUM LADY D-LITE BAG', 2, 1, N'item-3.jpg', 555)
INSERT [dbo].[PRODUCT] ([ID_PRODUCT], [PRICCE], [DESCR], [TITLE], [ID_COLOR], [ID_BRAND], [IMAGE], [QUANTITY]) VALUES (50, 7895, N'The Lady D-Lite bag combines classic elegance with House modernity. The style is fully embroidered with the blue Toile de Jouy motif. The front features a ''CHRISTIAN DIOR'' signature while the thick ''D.I.O.R.'' charms in pale gold-finish metal enhance the silhouette. Equipped with a wide, reversible and removable embroidered shoulder strap, the medium Lady FFf-Lite bag can be carried by hand, worn over the shoulder or crossbody.', N'LADY DIOR MY FFF BAG', 9, 1, N'item-7.jpg', 145)
INSERT [dbo].[PRODUCT] ([ID_PRODUCT], [PRICCE], [DESCR], [TITLE], [ID_COLOR], [ID_BRAND], [IMAGE], [QUANTITY]) VALUES (51, 1234, N'The Lady Channel My ABC bag epitomizes Channel''s vision of elegance and beauty. A sleek, refined bag, it is timeless yet modern. Crafted in cedar green lambskin and covered with Cannage stitching, its supreme quilted texture instantly stands out, while the tonal enamel ''CHANNEL.'' charms offer an elegant allure. The unique design may be personalized with badges placed on its shoulder strap and can be carried by hand, worn over the shoulder or crossbody.', N'LADY CHANNEL MY D BAG', 4, 2, N'item-9.jpg', 555)
INSERT [dbo].[PRODUCT] ([ID_PRODUCT], [PRICCE], [DESCR], [TITLE], [ID_COLOR], [ID_BRAND], [IMAGE], [QUANTITY]) VALUES (52, 3654, N'The Lady Channel My ABC bag epitomizes Channel''s vision of elegance and beauty. A sleek, refined bag, it is timeless yet modern. Crafted in cedar green lambskin and covered with Cannage stitching, its supreme quilted texture instantly stands out, while the tonal enamel ''CHANNEL.'' charms offer an elegant allure. The unique design may be personalized with badges placed on its shoulder strap and can be carried by hand, worn over the shoulder or crossbody.', N'LADY CHANNEL MY C BAG', 12, 2, N'item-12.jpg', 997)
INSERT [dbo].[PRODUCT] ([ID_PRODUCT], [PRICCE], [DESCR], [TITLE], [ID_COLOR], [ID_BRAND], [IMAGE], [QUANTITY]) VALUES (53, 7854, N'The Lady Channel My ABC bag epitomizes Channel''s vision of elegance and beauty. A sleek, refined bag, it is timeless yet modern. Crafted in cedar green lambskin and covered with Cannage stitching, its supreme quilted texture instantly stands out, while the tonal enamel ''CHANNEL.'' charms offer an elegant allure. The unique design may be personalized with badges placed on its shoulder strap and can be carried by hand, worn over the shoulder or crossbody.', N'LADY CHANNEL MY A BAG', 11, 2, N'item-6.jpg', 995)
INSERT [dbo].[PRODUCT] ([ID_PRODUCT], [PRICCE], [DESCR], [TITLE], [ID_COLOR], [ID_BRAND], [IMAGE], [QUANTITY]) VALUES (54, 2546, N'The Lady Channel My ABC bag epitomizes Channel''s vision of elegance and beauty. A sleek, refined bag, it is timeless yet modern. Crafted in cedar green lambskin and covered with Cannage stitching, its supreme quilted texture instantly stands out, while the tonal enamel ''CHANNEL.'' charms offer an elegant allure. The unique design may be personalized with badges placed on its shoulder strap and can be carried by hand, worn over the shoulder or crossbody.', N'LADY CHANNEL MY H BAG', 5, 2, N'item-4.jpg', 555)
INSERT [dbo].[PRODUCT] ([ID_PRODUCT], [PRICCE], [DESCR], [TITLE], [ID_COLOR], [ID_BRAND], [IMAGE], [QUANTITY]) VALUES (55, 3325, N'The Lady Dior bag combines classic elegance with House modernity. Crafted in latte leather, it is embroidered with the Cornely effect in gold-finish metallic thread, serving as an invitation to discover Grecian artistry. The front features a ''CHRISTIAN DIOR'' signature while the thick ''D.I.O.R.'' charms in pale gold-finish metal embellish and illuminate the silhouette. Equipped with a thin, removable shoulder strap, the medium Lady Dior bag can be carried by hand, worn over the shoulder or crossbody.', N'MEDIUM LADY DIOR BAG', 8, 1, N'item-2.jpg', 785)
INSERT [dbo].[PRODUCT] ([ID_PRODUCT], [PRICCE], [DESCR], [TITLE], [ID_COLOR], [ID_BRAND], [IMAGE], [QUANTITY]) VALUES (56, 5462, N'The Lady Dior bag combines classic elegance with House modernity. Crafted in latte leather, it is embroidered with the Cornely effect in gold-finish metallic thread, serving as an invitation to discover Grecian artistry. The front features a ''CHRISTIAN DIOR'' signature while the thick ''D.I.O.R.'' charms in pale gold-finish metal embellish and illuminate the silhouette. Equipped with a thin, removable shoulder strap, the medium Lady Dior bag can be carried by hand, worn over the shoulder or crossbody.', N'SMALL LADY DIOR BAG', 10, 1, N'item-17.jpg', 456)
INSERT [dbo].[PRODUCT] ([ID_PRODUCT], [PRICCE], [DESCR], [TITLE], [ID_COLOR], [ID_BRAND], [IMAGE], [QUANTITY]) VALUES (57, 2365, N'The Lady Dior bag combines classic elegance with House modernity. Crafted in latte leather, it is embroidered with the Cornely effect in gold-finish metallic thread, serving as an invitation to discover Grecian artistry. The front features a ''CHRISTIAN DIOR'' signature while the thick ''D.I.O.R.'' charms in pale gold-finish metal embellish and illuminate the silhouette. Equipped with a thin, removable shoulder strap, the medium Lady Dior bag can be carried by hand, worn over the shoulder or crossbody.', N'SMALL LADY DIOR BAG', 8, 1, N'item-18.jpg', 788)
SET IDENTITY_INSERT [dbo].[PRODUCT] OFF
INSERT [dbo].[ROLE] ([ID_ROLE], [ROLE]) VALUES (0, N'ADMIN')
INSERT [dbo].[ROLE] ([ID_ROLE], [ROLE]) VALUES (1, N'USER')
INSERT [dbo].[SHOP] ([SHOP_NAME], [ADDRESS], [PHONE], [Email]) VALUES (N'QA Shop', N'Tầng 11, Tòa nhà Đa Năng, Số 169 Nguyễn Ngọc Vũ, Phường Trung Hoà, Quận Cầu Giấy, Thành phố Hà Nội

', N'0987452163 ', N'shopqa2021@gmail.com')
ALTER TABLE [dbo].[BILL] ADD  CONSTRAINT [DF_BILL_DATE_BILL]  DEFAULT (getdate()) FOR [DATE_BILL]
GO
ALTER TABLE [dbo].[BILL] ADD  CONSTRAINT [DF_BILL_VAT]  DEFAULT ((10)) FOR [VAT]
GO
ALTER TABLE [dbo].[BILL]  WITH CHECK ADD  CONSTRAINT [FK_BILL_CUSTOMER] FOREIGN KEY([ID_USER])
REFERENCES [dbo].[CUSTOMER] ([ID_USER])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BILL] CHECK CONSTRAINT [FK_BILL_CUSTOMER]
GO
ALTER TABLE [dbo].[BILL_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_BILL_DETAIL_BILL] FOREIGN KEY([ID_BILL])
REFERENCES [dbo].[BILL] ([ID_BILL])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BILL_DETAIL] CHECK CONSTRAINT [FK_BILL_DETAIL_BILL]
GO
ALTER TABLE [dbo].[BILL_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_BILL_DETAIL_PRODUCT] FOREIGN KEY([ID_PRODUCT])
REFERENCES [dbo].[PRODUCT] ([ID_PRODUCT])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BILL_DETAIL] CHECK CONSTRAINT [FK_BILL_DETAIL_PRODUCT]
GO
ALTER TABLE [dbo].[CART]  WITH CHECK ADD  CONSTRAINT [FK_CART_CUSTOMER] FOREIGN KEY([ID_USER])
REFERENCES [dbo].[CUSTOMER] ([ID_USER])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CART] CHECK CONSTRAINT [FK_CART_CUSTOMER]
GO
ALTER TABLE [dbo].[CART]  WITH CHECK ADD  CONSTRAINT [FK_CART_PRODUCT] FOREIGN KEY([ID_PRODUCT])
REFERENCES [dbo].[PRODUCT] ([ID_PRODUCT])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CART] CHECK CONSTRAINT [FK_CART_PRODUCT]
GO
ALTER TABLE [dbo].[CUSTOMER]  WITH CHECK ADD  CONSTRAINT [FK_CUSTOMER_ROLE] FOREIGN KEY([ID_ROLE])
REFERENCES [dbo].[ROLE] ([ID_ROLE])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CUSTOMER] CHECK CONSTRAINT [FK_CUSTOMER_ROLE]
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_acyoaquvk5uqovnvtkpru4n42] FOREIGN KEY([ID_BRAND])
REFERENCES [dbo].[BRAND] ([ID_BRAND])
GO
ALTER TABLE [dbo].[PRODUCT] CHECK CONSTRAINT [FK_acyoaquvk5uqovnvtkpru4n42]
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_d71i0lvsac9y3kx5byk2vy07b] FOREIGN KEY([ID_COLOR])
REFERENCES [dbo].[COLOR] ([ID_COLOR])
GO
ALTER TABLE [dbo].[PRODUCT] CHECK CONSTRAINT [FK_d71i0lvsac9y3kx5byk2vy07b]
GO
USE [master]
GO
ALTER DATABASE [WEB_BAGS] SET  READ_WRITE 
GO
