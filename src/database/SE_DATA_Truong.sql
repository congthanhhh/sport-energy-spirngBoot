USE [master]
GO
/****** Object:  Database [energysport]    Script Date: 12/18/2023 8:48:57 PM ******/
CREATE DATABASE [energysport]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'energysport', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\energysport.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'energysport_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\energysport_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [energysport] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [energysport].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [energysport] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [energysport] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [energysport] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [energysport] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [energysport] SET ARITHABORT OFF 
GO
ALTER DATABASE [energysport] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [energysport] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [energysport] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [energysport] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [energysport] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [energysport] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [energysport] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [energysport] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [energysport] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [energysport] SET  ENABLE_BROKER 
GO
ALTER DATABASE [energysport] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [energysport] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [energysport] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [energysport] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [energysport] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [energysport] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [energysport] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [energysport] SET RECOVERY FULL 
GO
ALTER DATABASE [energysport] SET  MULTI_USER 
GO
ALTER DATABASE [energysport] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [energysport] SET DB_CHAINING OFF 
GO
ALTER DATABASE [energysport] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [energysport] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [energysport] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'energysport', N'ON'
GO
ALTER DATABASE [energysport] SET QUERY_STORE = OFF
GO
USE [energysport]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 12/18/2023 8:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[username] [varchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[photo] [varchar](255) NOT NULL,
	[createDate] [date] NOT NULL,
	[available] [bit] NULL,
	[address] [nvarchar](255) NULL,
	[phone] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authorities]    Script Date: 12/18/2023 8:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authorities](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[username] [varchar](255) NULL,
	[roleId] [varchar](255) NULL,
	[available] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 12/18/2023 8:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [varchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[image] [varchar](255) NOT NULL,
	[available] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[color]    Script Date: 12/18/2023 8:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[color](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[available] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favorites]    Script Date: 12/18/2023 8:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favorites](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[username] [varchar](255) NULL,
	[productId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetails]    Script Date: 12/18/2023 8:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetails](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[orderId] [bigint] NULL,
	[productId] [bigint] NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[productAttributeId] [bigint] NULL,
	[available] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 12/18/2023 8:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NULL,
	[createDate] [datetime] NOT NULL,
	[phone] [nvarchar](255) NULL,
	[address] [nvarchar](255) NOT NULL,
	[available] [bit] NULL,
	[paymentStatus] [bit] NULL,
	[orderStatus] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productAttribute]    Script Date: 12/18/2023 8:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productAttribute](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[productId] [bigint] NULL,
	[colorId] [bigint] NULL,
	[sizeId] [bigint] NULL,
	[stock] [bigint] NULL,
	[available] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productImage]    Script Date: 12/18/2023 8:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productImage](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[image] [varchar](255) NOT NULL,
	[productId] [bigint] NULL,
	[available] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 12/18/2023 8:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[thumbnail] [varchar](255) NOT NULL,
	[price] [float] NOT NULL,
	[createDate] [date] NOT NULL,
	[available] [bit] NULL,
	[description] [nvarchar](max) NULL,
	[bigDescription] [nvarchar](max) NULL,
	[quantity] [bigint] NULL,
	[categoryId] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rating]    Script Date: 12/18/2023 8:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rating](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[content] [nvarchar](max) NULL,
	[rating] [int] NULL,
	[username] [varchar](255) NULL,
	[createDate] [datetime] NOT NULL,
	[productId] [bigint] NULL,
	[orderId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 12/18/2023 8:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [varchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[available] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[size]    Script Date: 12/18/2023 8:48:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[available] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo], [createDate], [available], [address], [phone]) VALUES (N'cuong', N'$2a$10$xtIqd5fsfAdToYxbeAe19.FMkH7bfk/TXfXo/Hbxeag3GHI1olqxG', N'Phan Đặng Hùng Cường', N'phandanghungcuong.tp2003@gmail.com', N'fairytail mèo.jpg', CAST(N'2023-11-14' AS Date), 1, N'12 Quang trung Gò Vấp', 922251834)
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo], [createDate], [available], [address], [phone]) VALUES (N'truong', N'$2a$10$gF9MNYw3nX0xA/mRDl2D5uwMT5eePvHPJLsUCaGPUbro0hpw40O8a', N'Huỳnh Văn Trường', N'huynhvantruong0810@gmail.com', N'eren.png', CAST(N'2023-11-21' AS Date), 1, N'12 Quang trung Gò Vấp', 922251834)
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo], [createDate], [available], [address], [phone]) VALUES (N'user1', N'$2a$10$za3FgSePYs3pmm19TUrfdepsBASzzOCI1qCIPp0V7oiRHm99DOZbm', N'huynhtu', N'thu@gmail.com', N'fairytail mèo.jpg', CAST(N'2023-12-02' AS Date), 1, N'12 Quang trung Gò Vấp Phường 12', 922251834)
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo], [createDate], [available], [address], [phone]) VALUES (N'user2', N'$2a$10$iHhx3VJX6DyKpXnONg9W/uCgx2iuNyMuULci8e2afgYkg2DKZrpa6', N'huynhtu', N'tu@gmail.com', N'eren.png', CAST(N'2023-12-18' AS Date), 1, N'12 Quang trung Gò Vấp Phường 12', 922251834)
GO
SET IDENTITY_INSERT [dbo].[authorities] ON 

INSERT [dbo].[authorities] ([id], [username], [roleId], [available]) VALUES (0, N'cuong', N'STAF', 1)
INSERT [dbo].[authorities] ([id], [username], [roleId], [available]) VALUES (4, N'truong', N'DIRE', 1)
INSERT [dbo].[authorities] ([id], [username], [roleId], [available]) VALUES (10, N'user1', N'DIRE', NULL)
INSERT [dbo].[authorities] ([id], [username], [roleId], [available]) VALUES (11, N'user2', N'DIRE', 1)
SET IDENTITY_INSERT [dbo].[authorities] OFF
GO
INSERT [dbo].[categories] ([id], [name], [image], [available]) VALUES (N'1', N'Áo thể thao nam', N'aothethaonam.png', 1)
INSERT [dbo].[categories] ([id], [name], [image], [available]) VALUES (N'10', N'Vợt các loại', N'tennis.png', 1)
INSERT [dbo].[categories] ([id], [name], [image], [available]) VALUES (N'11', N'Dụng cụ gym', N'dungcugym.png', 1)
INSERT [dbo].[categories] ([id], [name], [image], [available]) VALUES (N'12', N'Bóng các loại', N'bong.png', 1)
INSERT [dbo].[categories] ([id], [name], [image], [available]) VALUES (N'2', N'Áo thể thao nữ', N'aothethaonu.png', 1)
INSERT [dbo].[categories] ([id], [name], [image], [available]) VALUES (N'3', N'Quần thể thao nam', N'quanthethaonam.jfif', 1)
INSERT [dbo].[categories] ([id], [name], [image], [available]) VALUES (N'4', N'Quần thể thao nữ', N'quanthethaonu.jfif', 1)
INSERT [dbo].[categories] ([id], [name], [image], [available]) VALUES (N'5', N'Đồ bộ thể thao', N'dobothethao.jpeg', 1)
INSERT [dbo].[categories] ([id], [name], [image], [available]) VALUES (N'6', N'Yoga', N'yoga.png', 1)
INSERT [dbo].[categories] ([id], [name], [image], [available]) VALUES (N'7', N'Giày thể thao', N'giaythethao.jfif', 1)
INSERT [dbo].[categories] ([id], [name], [image], [available]) VALUES (N'8', N'Đồ bơi', N'swimming.png', 1)
INSERT [dbo].[categories] ([id], [name], [image], [available]) VALUES (N'9', N'Balo', N'balo.png', 1)
GO
SET IDENTITY_INSERT [dbo].[color] ON 

INSERT [dbo].[color] ([id], [name], [available]) VALUES (1, N'Trắng', 1)
INSERT [dbo].[color] ([id], [name], [available]) VALUES (2, N'Đen', 1)
INSERT [dbo].[color] ([id], [name], [available]) VALUES (3, N'Xanh', 1)
INSERT [dbo].[color] ([id], [name], [available]) VALUES (4, N'Hồng', 1)
INSERT [dbo].[color] ([id], [name], [available]) VALUES (5, N'Vàng', 1)
INSERT [dbo].[color] ([id], [name], [available]) VALUES (6, N'Đỏ', 1)
INSERT [dbo].[color] ([id], [name], [available]) VALUES (7, N'Xám', 1)
INSERT [dbo].[color] ([id], [name], [available]) VALUES (8, N'Đỏ nâu', 1)
INSERT [dbo].[color] ([id], [name], [available]) VALUES (9, N'Kem', 1)
INSERT [dbo].[color] ([id], [name], [available]) VALUES (10, N'Cam', 1)
INSERT [dbo].[color] ([id], [name], [available]) VALUES (11, N'Nâu', 1)
SET IDENTITY_INSERT [dbo].[color] OFF
GO
SET IDENTITY_INSERT [dbo].[favorites] ON 

INSERT [dbo].[favorites] ([id], [username], [productId]) VALUES (44, N'truong', 42)
INSERT [dbo].[favorites] ([id], [username], [productId]) VALUES (51, N'truong', 40)
INSERT [dbo].[favorites] ([id], [username], [productId]) VALUES (53, N'truong', 2)
INSERT [dbo].[favorites] ([id], [username], [productId]) VALUES (54, N'truong', 34)
SET IDENTITY_INSERT [dbo].[favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[orderDetails] ON 

INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (12, 14, 1, 99000, 1, 5, 1)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (13, 15, 42, 125000, 1, 301, 1)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (14, 16, 37, 1490000, 1, 263, 1)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (15, 18, 18, 449000, 1, 119, 1)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (16, 19, 3, 99000, 1, 19, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (17, 20, 29, 314000, 1, 206, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (18, 21, 26, 307000, 1, 185, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (19, 22, 12, 249000, 1, 79, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (20, 23, 3, 99000, 1, 19, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (21, 24, 23, 296000, 1, 161, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (22, 25, 28, 179000, 2, 197, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (23, 26, 4, 245000, 1, 25, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (24, 27, 24, 359000, 1, 170, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (25, 28, 27, 233000, 1, 191, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (26, 29, 1, 99000, 1, 7, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (27, 29, 1, 99000, 1, 12, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (28, 29, 2, 545000, 1, 13, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (29, 29, 3, 99000, 1, 19, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (30, 31, 1, 99000, 1, 4, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (31, 31, 1, 99000, 1, 3, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (32, 32, 1, 99000, 1, 4, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (33, 32, 1, 99000, 1, 2, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (34, 33, 1, 99000, 1, 4, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (35, 33, 1, 99000, 1, 5, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (36, 34, 1, 99000, 1, 4, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (37, 34, 1, 99000, 1, 9, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (38, 35, 3, 99000, 1, 19, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (39, 35, 3, 99000, 1, 23, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (40, 36, 2, 545000, 1, 16, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (41, 36, 2, 545000, 1, 15, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (42, 37, 1, 99000, 1, 5, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (43, 37, 1, 99000, 1, 6, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (44, 38, 1, 99000, 2, 8, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (45, 39, 3, 99000, 1, 22, NULL)
INSERT [dbo].[orderDetails] ([id], [orderId], [productId], [price], [quantity], [productAttributeId], [available]) VALUES (46, 39, 2, 545000, 1, 14, NULL)
SET IDENTITY_INSERT [dbo].[orderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (14, N'truong', CAST(N'2023-11-24T12:35:45.317' AS DateTime), N'922251834', N'22222222222', 1, 1, 3)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (15, N'truong', CAST(N'2023-11-25T09:51:11.250' AS DateTime), N'922251834', N'222222222', 0, 0, 3)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (16, N'truong', CAST(N'2023-11-25T09:52:01.783' AS DateTime), N'922251834', N'222222222222', 1, 0, 3)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (17, N'truong', CAST(N'2023-11-25T09:55:15.177' AS DateTime), N'922251834', N'222222222222', 1, 0, 3)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (18, N'truong', CAST(N'2023-11-25T09:57:44.027' AS DateTime), N'922251834', N'22222222222', 1, 0, 3)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (19, N'truong', CAST(N'2023-11-25T10:03:51.170' AS DateTime), N'922251834', N'22222222222', 1, 0, 3)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (20, N'truong', CAST(N'2023-11-25T10:06:01.950' AS DateTime), N'922251834', N'22222222222', 1, 0, 3)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (21, N'truong', CAST(N'2023-11-25T10:07:59.597' AS DateTime), N'922251834', N'22222222222', 1, 0, 3)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (22, N'truong', CAST(N'2023-11-25T10:14:47.823' AS DateTime), N'922251834', N'22222222222', 1, 0, 1)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (23, N'truong', CAST(N'2023-11-25T10:21:01.190' AS DateTime), N'922251834', N'22222222222', 1, 0, 1)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (24, N'truong', CAST(N'2023-11-25T10:23:29.940' AS DateTime), N'922251834', N'22222222222', 1, 0, 1)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (25, N'truong', CAST(N'2023-11-25T10:25:38.003' AS DateTime), N'922251834', N'22222222222', 1, 0, 1)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (26, N'truong', CAST(N'2023-11-25T10:31:06.697' AS DateTime), N'922251834', N'22222222222', 1, 0, 1)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (27, N'truong', CAST(N'2023-11-25T10:35:33.523' AS DateTime), N'922251834', N'22222222222', 0, 0, 4)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (28, N'truong', CAST(N'2023-11-25T10:42:04.300' AS DateTime), N'922251834', N'123 Nguyễn Huệ Phường 23 Quận 1 TPHCM', 1, 0, 1)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (29, N'truong', CAST(N'2023-11-28T14:06:18.243' AS DateTime), N'922251834', N'23 Quang Trung Phường 12', 1, 0, 1)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (30, N'truong', CAST(N'2023-11-28T14:07:48.580' AS DateTime), N'922251834', N'123 Nguyễn Huệ Phường 23 Quận 1 TPHCM', 1, 1, 2)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (31, N'truong', CAST(N'2023-11-29T13:22:46.277' AS DateTime), N'944441752', N'12 Quang trung phường 9 quận 12', 1, 0, 1)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (32, N'truong', CAST(N'2023-11-29T13:32:36.780' AS DateTime), N'944441752', N'12 Quang trung phường 9 quận 12', 1, 0, 1)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (33, N'truong', CAST(N'2023-11-29T13:35:46.417' AS DateTime), N'944441752', N'12 Quang trung phường 9 quận 12', 1, 0, 1)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (34, N'truong', CAST(N'2023-11-29T13:37:26.330' AS DateTime), N'944441752', N'12 Quang trung phường 9 quận 12', 1, 0, 1)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (35, N'truong', CAST(N'2023-11-29T13:44:03.417' AS DateTime), N'944441752', N'12 Quang trung phường 9 quận 12', 1, 0, 1)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (36, N'CUONG', CAST(N'2023-11-29T13:55:02.790' AS DateTime), N'944441752', N'12 Quang trung phường 9 quận 12', 1, 0, 1)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (37, N'truong', CAST(N'2023-11-30T19:40:28.867' AS DateTime), N'922251833', N'NGUYEN VAN A', 1, 0, 1)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (38, N'truong', CAST(N'2023-11-30T19:41:25.400' AS DateTime), N'922251834', N'', 1, 1, 1)
INSERT [dbo].[orders] ([id], [username], [createDate], [phone], [address], [available], [paymentStatus], [orderStatus]) VALUES (39, N'truong', CAST(N'2023-12-01T20:09:48.173' AS DateTime), N'922234521', N'12 Quang trung Gò Vấp', 1, 0, 1)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[productAttribute] ON 

INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (1, 1, 6, 1, 180, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (2, 1, 6, 2, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (3, 1, 6, 3, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (4, 1, 2, 1, 16, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (5, 1, 2, 2, 17, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (6, 1, 2, 3, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (7, 1, 3, 1, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (8, 1, 3, 2, 18, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (9, 1, 3, 3, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (10, 1, 7, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (11, 1, 7, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (12, 1, 7, 3, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (13, 2, 3, 1, 15, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (14, 2, 3, 2, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (15, 2, 3, 3, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (16, 2, 7, 1, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (17, 2, 7, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (18, 2, 7, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (19, 3, 1, 1, 16, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (20, 3, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (21, 3, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (22, 3, 2, 1, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (23, 3, 2, 2, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (24, 3, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (25, 4, 7, 1, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (26, 4, 7, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (27, 4, 7, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (28, 4, 2, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (29, 4, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (30, 4, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (31, 5, 1, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (32, 5, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (33, 5, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (34, 5, 2, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (35, 5, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (36, 5, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (37, 6, 1, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (38, 6, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (39, 6, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (40, 6, 2, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (41, 6, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (42, 6, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (43, 7, 1, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (44, 7, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (45, 7, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (46, 7, 2, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (47, 7, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (48, 7, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (49, 8, 1, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (50, 8, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (51, 8, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (52, 8, 2, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (53, 8, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (54, 8, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (55, 9, 1, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (56, 9, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (57, 9, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (58, 9, 5, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (59, 9, 5, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (60, 9, 5, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (61, 9, 4, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (62, 9, 4, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (63, 9, 4, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (64, 10, 1, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (65, 10, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (66, 10, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (67, 10, 4, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (68, 10, 4, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (69, 10, 4, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (70, 11, 1, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (71, 11, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (72, 11, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (73, 11, 2, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (74, 11, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (75, 11, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (76, 11, 3, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (77, 11, 3, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (78, 11, 3, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (79, 12, 1, 1, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (80, 12, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (81, 12, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (82, 12, 2, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (83, 12, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (84, 12, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (85, 12, 5, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (86, 12, 5, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (87, 12, 5, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (88, 13, 2, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (89, 13, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (90, 13, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (91, 13, 3, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (92, 13, 3, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (93, 13, 3, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (94, 14, 2, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (95, 14, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (96, 14, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (97, 14, 4, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (98, 14, 4, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (99, 14, 4, 3, 20, 1)
GO
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (100, 15, 1, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (101, 15, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (102, 15, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (103, 15, 2, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (104, 15, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (105, 15, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (106, 16, 2, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (107, 16, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (108, 16, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (109, 16, 7, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (110, 16, 7, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (112, 16, 7, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (113, 17, 1, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (114, 17, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (115, 17, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (116, 17, 7, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (117, 17, 7, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (118, 17, 7, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (119, 18, 2, 1, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (120, 18, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (121, 18, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (122, 18, 3, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (123, 18, 3, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (124, 18, 3, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (125, 18, 7, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (126, 18, 7, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (127, 18, 7, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (128, 19, 2, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (129, 19, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (130, 19, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (131, 19, 1, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (132, 19, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (133, 19, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (134, 19, 3, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (135, 19, 3, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (136, 19, 3, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (137, 20, 2, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (138, 20, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (139, 20, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (140, 20, 3, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (141, 20, 3, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (142, 20, 3, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (143, 21, 2, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (144, 21, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (145, 21, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (146, 21, 3, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (147, 21, 3, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (148, 21, 3, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (149, 21, 7, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (150, 21, 7, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (151, 21, 7, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (152, 22, 1, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (153, 22, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (154, 22, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (155, 22, 2, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (156, 22, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (157, 22, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (158, 22, 3, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (159, 22, 3, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (160, 22, 3, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (161, 23, 7, 1, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (162, 23, 7, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (163, 23, 7, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (164, 23, 3, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (165, 23, 3, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (166, 23, 3, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (167, 23, 1, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (168, 23, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (169, 23, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (170, 24, 2, 1, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (171, 24, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (172, 24, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (173, 24, 7, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (174, 24, 7, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (175, 24, 7, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (176, 25, 1, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (177, 25, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (178, 25, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (179, 25, 2, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (180, 25, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (181, 25, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (182, 25, 3, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (183, 25, 3, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (184, 25, 3, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (185, 26, 3, 1, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (186, 26, 3, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (187, 26, 3, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (188, 26, 1, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (189, 26, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (190, 26, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (191, 27, 9, 1, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (192, 27, 9, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (193, 27, 9, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (194, 27, 1, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (195, 27, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (196, 27, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (197, 28, 3, 1, 18, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (198, 28, 3, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (199, 28, 3, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (200, 28, 4, 1, 20, 1)
GO
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (201, 28, 4, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (202, 28, 4, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (203, 28, 10, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (204, 28, 10, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (205, 28, 10, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (206, 29, 2, 1, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (207, 29, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (208, 29, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (209, 29, 1, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (210, 29, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (211, 29, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (212, 30, 2, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (213, 30, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (214, 30, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (215, 30, 7, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (216, 30, 7, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (217, 30, 7, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (218, 31, 1, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (219, 31, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (220, 31, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (221, 31, 3, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (222, 31, 3, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (223, 31, 3, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (224, 31, 5, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (225, 31, 5, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (226, 31, 5, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (227, 32, 1, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (228, 32, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (229, 32, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (230, 32, 3, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (231, 32, 3, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (232, 32, 3, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (233, 32, 5, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (234, 32, 5, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (235, 32, 5, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (236, 33, 5, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (237, 33, 5, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (238, 33, 5, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (239, 33, 2, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (240, 33, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (241, 33, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (242, 34, 1, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (243, 34, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (244, 34, 1, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (245, 34, 3, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (246, 34, 3, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (247, 34, 3, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (248, 34, 2, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (249, 34, 2, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (250, 34, 2, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (251, 35, 3, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (252, 35, 3, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (253, 35, 3, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (254, 35, 4, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (255, 35, 4, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (256, 35, 4, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (257, 36, 3, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (258, 36, 3, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (259, 36, 3, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (260, 36, 4, 1, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (261, 36, 4, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (262, 36, 4, 3, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (263, 37, 3, 4, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (264, 37, 3, 5, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (265, 37, 3, 6, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (266, 37, 3, 7, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (267, 37, 1, 4, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (268, 37, 1, 5, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (269, 37, 1, 6, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (270, 37, 1, 7, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (271, 37, 2, 4, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (272, 37, 2, 5, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (273, 37, 2, 6, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (274, 37, 2, 7, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (275, 38, 4, 4, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (276, 38, 4, 5, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (277, 38, 4, 6, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (278, 38, 4, 7, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (279, 38, 3, 4, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (280, 38, 3, 5, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (281, 38, 3, 6, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (282, 38, 3, 7, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (283, 39, 2, 4, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (284, 39, 2, 5, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (285, 39, 2, 6, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (286, 39, 2, 7, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (287, 39, 3, 4, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (288, 39, 3, 5, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (289, 39, 3, 6, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (290, 39, 3, 7, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (291, 40, 2, 4, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (292, 40, 2, 5, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (293, 40, 2, 6, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (294, 40, 2, 7, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (295, 40, 1, 4, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (296, 40, 1, 5, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (297, 40, 1, 6, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (298, 40, 1, 7, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (299, 41, 3, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (300, 41, 4, 2, 20, 1)
GO
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (301, 42, 3, 2, 19, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (302, 42, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (303, 43, 3, 2, 30, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (304, 44, 2, 2, 30, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (305, 45, 2, 2, 12, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (306, 45, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (307, 46, 5, 2, 30, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (309, 47, 3, 2, 30, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (310, 48, 11, 2, 30, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (311, 49, 3, 2, 31, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (312, 49, 1, 2, 20, 1)
INSERT [dbo].[productAttribute] ([id], [productId], [colorId], [sizeId], [stock], [available]) VALUES (313, 50, 8, 2, 30, 1)
SET IDENTITY_INSERT [dbo].[productAttribute] OFF
GO
SET IDENTITY_INSERT [dbo].[productImage] ON 

INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (1, N'aothunchaybotrang.png', 1, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (2, N'aothunchaybodo.png', 1, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (3, N'aothunchayboxanh.png', 1, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (7, N'aokhoacxanh.png', 2, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (8, N'aokhoactrang.png', 2, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (10, N'aothunkotaytrang.png', 3, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (11, N'aothunkotayden.png', 3, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (13, N'aothunbaloden.png', 4, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (14, N'aothunbalotrang.png', 4, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (16, N'aothungymden.png', 5, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (17, N'aothungymtrang.png', 5, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (19, N'aothunchongnangtrang.png', 6, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (20, N'aothunchongnangden.png', 6, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (25, N'aotanktoptrang.png', 7, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (26, N'aotanktopden.png', 7, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (28, N'aothunnuthethaotden.png', 8, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (29, N'aothunnuthethaotrang.png', 8, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (31, N'aotanktopnuvang.png', 9, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (32, N'aotanktopnuhong.png', 9, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (34, N'aokhoacantinuhong.png', 10, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (35, N'aokhoacantinutrang.png', 10, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (37, N'aopolonuden.png', 11, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (38, N'aopolonuxanh.png', 11, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (40, N'aobraden.png', 12, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (41, N'aobravang.png', 12, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (43, N'aokhoacantinuhoatiettrang.png', 13, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (44, N'aokhoacantinuhoatietden.png', 13, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (46, N'aokhoacdaitaynuden.png', 14, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (47, N'aokhoacdaitaynuhong.png', 14, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (49, N'aopolodrihoatietden.png', 15, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (50, N'aopolodrihoatiettrang.png', 15, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (54, N'quanshortthethaonam2chuxam.png', 16, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (55, N'quanshortthethaonam2chuden.png', 16, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (57, N'quanshortthethaonamfrexam.png', 17, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (58, N'quanshortthethaonamfrefull.png', 17, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (59, N'quanshortthethaonamfretrang.png', 17, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (60, N'quanshortthethaonaminchuxam.png', 18, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (61, N'quanshortthethaonaminchuxanh.png', 18, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (62, N'quanshortthethaonaminchuden.png', 18, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (63, N'quanshortthethaonamxehongxam.png', 19, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (64, N'quanshortthethaonamxehongden.png', 19, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (65, N'quanshortthethaonamxehongxanh.png', 19, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (66, N'quanshortthethaonamdriden.png', 20, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (67, N'quanshortthethaonamdrixanh.png', 20, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (68, N'quanshortthethaonamdrifull.png', 20, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (69, N'quanshortnamfreden.png', 21, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (70, N'quanshortnamfrexanh.png', 21, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (71, N'quanshortnamfrexam.png', 21, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (72, N'quandainamtrang.png', 22, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (73, N'quandainamxanh.png', 22, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (74, N'quandainamden.png', 22, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (75, N'quanshortnuxanh.png', 23, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (76, N'quanshortnuxam.png', 23, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (77, N'quanshortnu.png', 23, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (78, N'quanthethaonutuicapsauxam.png', 24, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (79, N'quanthethaonutuicapsauden.png', 24, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (80, N'quanthethaonutuicapsauxamfull.png', 24, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (81, N'quandaithethaonufredel.png', 25, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (82, N'quandaithethaonufredelden.png', 25, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (83, N'quandaithethaonufredelxanh.png', 25, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (84, N'quandaithethaonuantiuv.png', 26, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (85, N'quandaithethaonuantiuvxanh.png', 26, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (86, N'quandaithethaonuantiuvtrang.png', 26, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (87, N'quanshortnufreterkem.png', 27, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (88, N'quanshortnufretertrang.png', 27, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (89, N'quanshortnufreterfull.png', 27, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (90, N'vay-nuhong.png', 28, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (91, N'vay-nuxanh.png', 28, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (92, N'vay-nufull.png', 28, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (93, N'chanvaynuden.png', 29, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (94, N'chanvaynutrang.png', 29, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (95, N'chanvaynufull.png', 29, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (96, N'quanleggingthethaonudriden.png', 30, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (97, N'quanleggingthethaonudrixam.png', 30, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (98, N'quanleggingthethaonudrifull.png', 30, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (99, N'boquanaobongchuyennuxanh.png', 31, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (100, N'boquanaobongchuyennuvang.png', 31, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (102, N'boquanaobongchuyennamtrang.png', 32, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (103, N'boquanaobongchuyennamxanh.png', 32, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (105, N'boquanaobongroden.png', 33, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (106, N'boquanaobongrovang.png', 33, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (107, N'boquanaobongrofull.png', 33, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (111, N'boquanaokhoacnamden.png', 34, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (112, N'boquanaokhoacnamxanh.png', 34, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (114, N'thamyogafull.png', 35, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (115, N'thamyogaxanh.png', 35, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (116, N'thamyogahong.png', 35, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (117, N'bongyogafull.png', 36, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (118, N'bongyogaxanh.png', 36, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (119, N'bongyogahong.png', 36, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (120, N'giaybongrotrang.png', 37, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (121, N'giaybongroxanh.png', 37, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (123, N'giaychaybonutrang.png', 38, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (124, N'giaychaybonuden.png', 38, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (126, N'giaychaybonamden.png', 39, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (127, N'giaychaybonamde.png', 39, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (129, N'giayadidasnamden.png', 40, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (130, N'giayadidasnamtrang.png', 40, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (131, N'giayadidasnamde.png', 40, 1)
GO
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (132, N'muboisiliconhong.png', 41, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (133, N'muboisiliconxanh.png', 41, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (134, N'muboisilicon.png', 41, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (135, N'kinhboi.png', 42, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (136, N'kinhboifull.png', 42, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (137, N'baloleonuidangoaiMxanhsau.png', 43, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (138, N'baloleonuidangoaiMxanhsau2.png', 43, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (139, N'baloleonuidangoaiMxanhfull.png', 43, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (140, N'tuithethaotrong.png', 44, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (141, N'tuithethaocanh.png', 44, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (142, N'tuithethaofull.png', 44, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (146, N'votcaulongden.png', 45, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (147, N'votcaulongchina.png', 45, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (152, N'tenniscanh.png', 46, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (153, N'tennissau.png', 46, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (154, N'tennistaycam.png', 46, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (155, N'thanhtapchongdayxanh.png', 47, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (156, N'thanhtapchongdayfull.png', 47, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (158, N'daynhaynau.png', 48, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (159, N'daynhayfull.png', 48, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (161, N'bongdatrang.png', 49, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (162, N'bongdavang.png', 49, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (163, N'bongdafull.png', 49, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (164, N'bongrocanh.png', 50, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (165, N'bongrofull.png', 50, 1)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (166, N'eren.png', 51, NULL)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (167, N'eren.png', 51, NULL)
INSERT [dbo].[productImage] ([id], [image], [productId], [available]) VALUES (168, N'eren.png', 51, NULL)
SET IDENTITY_INSERT [dbo].[productImage] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (1, N'Áo thun chạy bộ thoáng khí Run Dry cho nam', N'aothunchaybo.png', 99000, CAST(N'2023-11-14' AS Date), 1, N'Áo thun chạy bộ thoáng mát Run Dry cho nam được thiết kế để giúp bạn khô ráo trong thời tiết ấm áp khi chạy bộ. Áo thun nam chạy bộ này được làm từ polyester tái chế, thấm hút và tản mồ hôi để giảm cảm giác ẩm ướt. Loại áo này khô nhanh hơn áo thun cotton.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'1')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (2, N'Áo khoác leo núi chống nắng Helium 500 cho nam', N'aokhoac.png', 545000, CAST(N'2023-11-14' AS Date), 1, N'Áo khoác leo núi chống nắng Helium 500 sẽ bảo vệ bạn khỏi tia UVA/UVB. Áo khoác siêu nhẹ và thoáng mát. Có thể được gấp gọn vào mũ trùm.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'1')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (3, N'Áo thun không tay chạy bộ Run Dry cho nam', N'aothunkotay.png', 99000, CAST(N'2023-11-14' AS Date), 1, N'Áo thun không tay chạy bộ đơn giản, phù hợp cho người mới bắt đầu chạy bộ (1-2 lần/tuần, cự ly tối đa 10km) Áo thun không tay thoải mái và thoáng mát này không thể thiếu cho chạy bộ trong thời tiết nóng.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'1')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (4, N'Áo thun ba lỗ tập thể hình', N'aothunbalo.png', 245000, CAST(N'2023-11-14' AS Date), 1, N'Áo thun không tay giúp bạn dễ dàng thực hiện các bài tập của mình. Chiếc áo thun không tay này sẽ làm tôn lên cơ bắp của bạn trong khi vẫn bảo đảm sự dễ dàng trong chuyển động xuyên suốt các bài tập cử tạ.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'1')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (5, N'Áo thun tập gym 100 cho nam', N'aothungym.png', 145000, CAST(N'2023-11-14' AS Date), 1, N'Áo thun thể thao ngắn tay tập gym cho nam, được thiết kế cho các hoạt động thể thao hằng ngày như Pilates, hoặc các bài tập gym đơn giản. Kiểu dáng đơn giản dễ mặc. Chất liệu hoàn toàn 100% từ cotton tự nhiên mang lại độ mềm mại và thoải mái cao nhất.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'1')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (6, N'Áo thun chạy bộ chống nắng cho nam', N'aothunchongnang.png', 245000, CAST(N'2023-11-14' AS Date), 1, N'Áo thun dành cho nam, bảo vệ chống nắng trong thời tiết ấm hoặc nóng. Áo thun dài tay này có chất liệu mềm và chống tia cực tím, giúp bảo vệ bạn khỏi ánh nắng trong khi chạy bộ.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'1')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (7, N'Áo Tank top thể thao Recycle Nam phối mũ', N'aotanktop.png', 369000, CAST(N'2023-11-14' AS Date), 1, N'Áo thun không tay cổ chui có mũ, dáng vừa người, phối sọc mảnh 2 bên sườn. Chất vải tái chế, co giãn và thấm hút mồ hôi tốt, thân thiện với môi trường', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'1')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (8, N'Áo thun thể thao Nữ dài tay', N'aothunnuthethao.png', 249000, CAST(N'2023-11-14' AS Date), 1, N'Áo thun tay dài, cổ tròn, form ôm vừa vặn, tôn dáng. Chất liệu 83% polyester, 17% spandex', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'2')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (9, N'Áo Tank top thể thao Recycle Nữ phối sọc', N'aotanktopnu.png', 279000, CAST(N'2023-11-14' AS Date), 1, N'Áo thun không tay cổ tròn, dáng vừa người, vai và nách khoét sâu, phối sọc mảnh 2 bên sườn. Chất liệu vải 91% recycled polyester, 9% spandex', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'2')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (10, N'Áo khoác ANTI-UV Nữ tay nhún ', N'aokhoacantinu.png', 679000, CAST(N'2023-11-14' AS Date), 1, N'Áo khoác vải gió, 2 lớp, có mũ, chi tiết rút nhún hai bên tay áo. Chất vải có tính năng Anti-UV, chống nắng hiệu quả', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'2')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (11, N'Áo Polo thể thao Recycle Nữ', N'aopolonu.png', 429000, CAST(N'2023-11-14' AS Date), 1, N'Dáng áo vừa người, cổ bẻ 3 cúc, thân trước in họa tiết chữ. Chất liệu vải 90% recycled polyester, 10% recycled spandex', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'2')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (12, N'Áo Bra thể thao dây mảnh phối lưới', N'aobra.png', 249000, CAST(N'2023-11-14' AS Date), 1, N'Áo bra thể thao dây mảnh, dây lưng chữ X, phối lưới hai bên sườn. Chất liệu vải 95% rayon 5% spandex', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'2')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (13, N'Áo khoác Nữ Anti-UV in họa tiết', N'aokhoacantinuhoatiet.png', 344000, CAST(N'2023-11-14' AS Date), 1, N'Áo khoác 2 lớp, dây kéo, cổ bóng chày. Chất liệu vải 100% polyester', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'2')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (14, N'Áo dài tay nữ French Terry họa tiết', N'aokhoacdaitaynu.png', 209000, CAST(N'2023-11-14' AS Date), 1, N'Áo hoodie cổ chui, tay raglan, thân phối túi đắp, in hình họa tiết retro. Chất liệu vải: 60% cotton, 40% polyester', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'2')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (15, N'Áo Polo DRI-AIR Nữ phối sọc họa tiết', N'aopolodrihoatiet.png', 321000, CAST(N'2023-11-14' AS Date), 1, N'Dáng áo vừa người, cổ bẻ 3 cúc, vai áo phối sọc in họa tiết chìm. Chất liệu vải 88% polyester, 12% spandex, thoáng khí và co giãn tốt', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'2')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (16, N'Quần short thể thao Nam 2 lớp in chữ dập nổi', N'quanshortthethaonam2chudapnoi.png', 328000, CAST(N'2023-11-15' AS Date), 1, N'Quần short 2 lớp, xẻ tà bên sườn, thân quần in chữ dập nổi. Chất vải 100% polyester', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'3')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (17, N'Quần Short Nam French Terry phối màu bên sườn', N'quanshortthethaonamfre.png', 184000, CAST(N'2023-11-15' AS Date), 1, N'Quần short lưng thun, túi xẻ, bên sườn phối khác màu. Chất liệu vải: 60% cotton, 40% polyester', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'3')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (18, N'Quần Short thể thao Nam in chữ bên sườn', N'quanshortthethaonaminchu.png', 449000, CAST(N'2023-11-15' AS Date), 1, N'Quần short 2 lớp, lai bầu, dáng vừa người. Chất liệu vải 100% polyester', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'3')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (19, N'Quần Short thể thao Nam xẻ hông', N'quanshortthethaonamxehong.png', 332000, CAST(N'2023-11-15' AS Date), 1, N'Quần short 2 lớp, xẻ hông, dáng ngắn giữa đùi. Chất vải 100% polyester', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'3')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (20, N'Quần Short thể thao Nam DRI-AIR', N'quanshortthethaonamdri.png', 219000, CAST(N'2023-11-15' AS Date), 1, N'Quần short thể thao 2 lớp, dáng ngắn, túi xẻ, một bên ống quần in hình logo nhỏ. Chất liệu vải 100% polyester tích hợp DRI-AIR, mát, nhẹ và thấm thoát mồ hôi tốt.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'3')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (21, N'Quần Short Nam French Terry trơn cơ bản', N'quanshortnamfre.png', 124000, CAST(N'2023-11-15' AS Date), 1, N'Quần short dáng cơ bản. Chất liệu vải: 60% cotton, 40% polyester. Chất vải mềm mại, xốp nhẹ, thoáng mát', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'3')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (22, N'Quần dài thể thao Nam Anti-UV', N'quandainam.png', 249000, CAST(N'2023-11-15' AS Date), 1, N'Quần dài lưng thun, túi xẻ, một bên ống quần in logo chữ Delta, lai ống có dây rút và nút điều chỉnh. Chất vải 100% polyester, nhẹ, mát, trượt nước', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'3')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (23, N'Quần short thể thao Nữ 2 lớp rút nhún', N'quanshortnufull.png', 296000, CAST(N'2023-11-15' AS Date), 1, N'Quần short 2 lớp, xẻ hông, lớp trong may rút nhún bên sườn
Chất vải 100% polyester', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'4')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (24, N'Quần Thể Thao Nữ Túi Cạp Sau', N'quanthethaonutuicapsau.png', 359000, CAST(N'2023-11-15' AS Date), 1, N'Vải chính: 90% Nylon, 10% Spandex. Quần có thành phần chính là sợi Nylon mang lại cảm giác mềm mại, bền chắc cho sản phẩm.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'4')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (25, N'Quần dài French Terry Nữ thêu chữ delta cách điệu', N'quandaithethaonufredelfull.png', 342000, CAST(N'2023-11-15' AS Date), 1, N'Quần dài lưng thun, dáng vừa, thêu chữ bên sườn. Chất liệu vải: 60% cotton, 40% polyester', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'4')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (26, N'Quần dài Anti-UV Nữ ống đứng phối họa tiết', N'quandaithethaonuantiuvxanhfull.png', 307000, CAST(N'2023-11-15' AS Date), 1, N'Quần dài vải gió, phối họa tiết chữ in bên sườn. Chất vải 100% polyester, bền, đẹp, mỏng, nhẹ, nhanh khô', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'4')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (27, N'Quần Short Nữ French Terry ống rộng', N'quanshortnufreter.png', 233000, CAST(N'2023-11-15' AS Date), 1, N'Quần dáng ngắn, túi xẻ, ống rộng. 
Chất liệu vải: 65% polyester, 35% cotton', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'4')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (28, N'Váy thể thao Nữ SuperCool dáng xòe in họa tiết vẩy màu', N'vay-nu.png', 179000, CAST(N'2023-11-15' AS Date), 1, N'Chân váy thể thao dáng xòe in họa tiết vẩy màu. 
Chất liệu 92% coolmax, 8% spandex.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'4')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (29, N'Chân váy thể thao chữ A phối sọc ', N'chanvaynu.png', 314000, CAST(N'2023-11-15' AS Date), 1, N'Phom váy chữ A, hai bên sườn phối sọc in họa tiết chữ. 
Chất liệu vải 88% polyester, 12% spandex, thoáng khí và co giãn tốt', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'4')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (30, N'Quần Legging thể thao Nữ DRI-AIR dáng lửng', N'quanleggingthethaonudri.png', 179000, CAST(N'2023-11-15' AS Date), 1, N'Quần legging dáng lửng, lưng cao, một bên ống quần in họa tiết chữ START NOW. 
Chất liệu vải: 92% polyester, 8% spandex', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'4')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (31, N'Bộ Quần Áo Bóng Chuyền Nữ Beyono Ruya', N'boquanaobongchuyennu.png', 180000, CAST(N'2023-11-15' AS Date), 1, N'Bóng chuyền không chỉ đơn thuần là một môn thể thao, mà còn là một tập hợp của niềm đam mê, tầm nhìn, và ước mơ. Trên sân bóng, chúng ta tạo nên những pha bóng mãn nhãn và trong tâm hồn, chúng ta nuôi dưỡng những ước mơ cao cả để trở thành người chơi bóng chuyền hay nhất.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'5')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (32, N'Bộ Quần Áo Bóng Chuyền Nam Beyono Ruya', N'boquanaobongchuyennam.png', 180000, CAST(N'2023-11-15' AS Date), 1, N'Bóng chuyền không chỉ đơn thuần là một môn thể thao, mà còn là một tập hợp của niềm đam mê, tầm nhìn, và ước mơ. Trên sân bóng, chúng ta tạo nên những pha bóng mãn nhãn và trong tâm hồn, chúng ta nuôi dưỡng những ước mơ cao cả để trở thành người chơi bóng chuyền hay nhất.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'5')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (33, N'Quần áo Bóng rổ Actee', N'boquanaobongro.png', 199000, CAST(N'2023-11-15' AS Date), 1, N'Chất liệu: vải thun Mè 100% cao cấp, co giãn tốt, thấm hút mồ hôi, chống nhăn, bền màu. Có khả năng kháng khuẩn, chống tia UV. Kiểu dáng: Thông số may phù hợp dáng người Châu Á lên form gọn gàng năng động.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'5')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (34, N'Bộ quần áo gió thể thao nam thu đông
', N'boquanaokhoacnam.png', 369000, CAST(N'2023-11-15' AS Date), 1, N'Chất liệu: 100% Polyester cao cấp, không chứa thành phần Nilong.
 Mềm, nhẹ, chống bám nước, chống bụi.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'5')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (35, N'Thảm yoga 5 mm siêu nhẹ', N'thamyoga.png', 675000, CAST(N'2023-11-15' AS Date), 1, N'Thảm yoga dành cho những người tập yoga đang tìm kiếm một chiếc thảm dùng được hai mặt có thể đạt tới sự cân bằng giữa độ bám và sự thoải mái. Bạn đang tìm kiếm một chiếc thảm bền? Thảm dày 5 mm mềm và có độ bám tốt để bạn có thể làm tốt nhất trong các buổi tập. Nhẹ và dễ dàng mang theo.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'6')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (36, N'Bóng thể dục cỡ M ', N'bongyoga.png', 475000, CAST(N'2023-11-15' AS Date), 1, N'Bóng thể dục này giúp bạn làm săn chắc cơ thể, tăng sức mạnh cho cơ lưng và giãn cơ.Bóng có 3 cỡ (cỡ 1, cỡ 2 và cỡ 3). Bạn sẽ yêu thích:, , - Độ bền, - Sự linh hoạt, - Độ bám , , Bạn sẽ thích thú bởi: , - Sự thoải mái , - Thiết kế và màu sắc mới lạ , - Các bài tập mà bạn có thể tập', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'6')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (37, N'Giày bóng rổ Nam PEAK', N'giaybongro.png', 1490000, CAST(N'2023-11-15' AS Date), 1, N'Công nghệ P-Motive giúp tăng khả năng bật nhảy cũng như phản hồi nhanh chóng các chuyển động chân. Hệ thống đế cao su RB OUTDOOR cao cấp, chống mài mòn được cải thiện, tăng độ bền đế kể cả khi chơi ở những mặt sân khắc nghiệt nhất như sân bê tông.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'7')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (38, N'Giày Chạy Bộ Nữ PEAK', N'giaychaybonu.png', 1592000, CAST(N'2023-11-15' AS Date), 1, N' Dây giày dạng rút có khả năng co dãn đặc biệt, giúp người dùng đi giày gọn gàng và nhanh chóng. 
Công nghệ PEAK Taichi 4.0 cải tiến mới, tạo nên một tấm đệm thông minh giúp hỗ trợ phản hồi nhiều năng lượng mạnh hơn.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'7')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (39, N'Giày Chạy Bộ Nam PEAK', N'giaychaybonam.png', 1490000, CAST(N'2023-11-15' AS Date), 1, N'Dây giày dạng rút có khả năng co dãn đặc biệt, giúp người dùng đi giày gọn gàng và nhanh chóng. 
Công nghệ PEAK Taichi 4.0 cải tiến mới, tạo nên một tấm đệm thông minh giúp hỗ trợ phản hồi nhiều năng lượng mạnh hơn.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'7')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (40, N'Giày Adidas Supernova 3 nam', N'giayadidasnam.png', 2690000, CAST(N'2023-11-15' AS Date), 1, N'Giày Adidas Supernova 3 là mẫu giày thể thao có thiết kế siêu đẹp của nhà adidas trong năm nay. Mẫu giày ngập tràn những công nghệ đỉnh cao nhất của adidas từ upper cho đến đế ngoài. Adidas Supernova 3 xứng đáng là mẫu giày bạn nên lựa chọn.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'7')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (41, N'Mũ bơi Silicon định hình sẵn', N'muboisiliconfull.png', 520000, CAST(N'2023-11-15' AS Date), 1, N'Mũ bơi silicon hình con thú, ôm khít vòng đầu và có độ trượt nước cao, giúp chống nước tốt hơn.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'8')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (42, N'Kính bơi tròng kính trong suốt', N'kinhboixanh.png', 125000, CAST(N'2023-11-15' AS Date), 1, N'Kính bơi dành cho những người mới bắt đầu học bơi hoặc muốn tập bơi trở lại. Mẫu kính bơi phù hợp với tất cả các khuôn mặt với phần sống mũi có thể điều chỉnh được đã được cấp bằng sáng chế và điều chỉnh dây đeo đơn giản để đảm bảo độ kín nước.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'8')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (43, N'Balo leo núi dã ngoại NH Arpenaz 500', N'baloleonuidangoaiM.png', 685000, CAST(N'2023-11-19' AS Date), 1, N'Balo leo núi NH Arpenaz 500 cho chuyến đi mọi thời tiết. Khoang đáy giữ nhiệt cho thực phẩm tươi mát lên đến 5h. Đi kèm tấm trải tiện lợi để ngồi hay nằm nghỉ.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'9')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (44, N'Túi Thể Thao Tập Gym Du Lịch, Có Ngăn Giày Riêng HIER GRAPHIC', N'tuithethao.png', 420000, CAST(N'2023-11-19' AS Date), 1, N'Túi thể thao HIER GRAPHIC cho chuyến đi mọi thời tiết. Có ngăn giày riêng. Đi kèm tấm trải tiện lợi để ngồi hay nằm nghỉ.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 80, N'9')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (45, N'Bộ 2 Vợt Cầu Lông Kèm 2 Vợt 1', N'votcaulongtrang.png', 156000, CAST(N'2023-11-19' AS Date), 1, N' Vợt cầu lông thích hợp để chơi giải trí và cạnh tranh. Thiết kế nhẹ 90 g cho phép nó lắc lư mà không bị mỏi. Và để đáp ứng nhu cầu chơi cầu lông với gia đình, bạn bè hoặc trẻ em.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 50, N'10')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (46, N'Vợt Tennis TR130', N'tennis.png', 475000, CAST(N'2023-11-19' AS Date), 1, N'Chúng tôi thiết kế vợt này cho trẻ em mới bắt đầu tập chơi tennis có chiều cao từ 126 cm đến 140 cm. Vợt TR130 JR được thiết kế lại với sáu khái niệm, được phát triển với sự hợp tác của huấn luyện viên và trẻ em, để giúp con bạn trải nghiệm tốt hơn ngay trong lần vung vợt đầu tiên', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 30, N'10')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (47, N'Thanh tập chống đẩy có tay cầm', N'thanhtapchongday.png', 145000, CAST(N'2023-11-19' AS Date), 1, N'Thanh chống đẩy được thiết kế đơn giản, tiện lợi với tay cầm bọc cao su êm ái. Thực hiện bài tập chống đẩy dễ dàng hơn bao giờ hết. Sản phẩm bám tốt trên sàn gạch, sàn gỗ và thảm. Sản phẩm bán theo cặp.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 30, N'11')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (48, N'Dây nhảy JR100', N'daynhay.png', 49000, CAST(N'2023-11-19' AS Date), 1, N'Dây nhảy JR100 là sản phẩm phù hợp cho những ai muốn bắt đầu nhảy dây để rèn luyện sức khỏe. Bạn muốn bắt đầu luyện tập nhảy dây một cách dễ dàng? Tay cầm tiện dụng, dễ dàng điều chỉnh chiều dài giúp dây nhảy JR100 của chúng tôi mang đến cho người dùng cảm giác cực kỳ thoải mái khi sử dụng.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 30, N'11')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (49, N'Quả bóng đá F500 Light', N'bongda.png', 325000, CAST(N'2023-11-19' AS Date), 1, N'Chúng tôi thiết kế quả bóng F500 Light này cho trẻ em sử dụng. Sản phẩm nhẹ hơn và giúp trẻ chơi dễ dàng hơn, dù giải trí hay tại câu lạc bộ. Quả bóng này có trọng lượng nhẹ hơn 15% so với quả bóng truyền thống.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 50, N'12')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (50, N'Quả bóng rổ BT100', N'bongro.png', 345000, CAST(N'2023-11-19' AS Date), 1, N'Với lớp vỏ ngoài được làm bằng nhựa xốp, quả bóng bền hơn và cho cảm giác bóng tốt.', N'Sport Energy là điểm đến hàng đầu cho những người yêu thể thao và tập luyện, mang đến cho họ một trải nghiệm mua sắm tuyệt vời với đa dạng các dụng cụ thể thao chất lượng cao. Trang web cung cấp một bộ sưu tập đa dạng từ các thương hiệu hàng đầu, bao gồm từ dụng cụ tập gym, đồng hồ thông minh theo dõi hoạt động đến trang phục thể thao và giày sneakers.

Với sứ mệnh đem đến sức khỏe và niềm vui thông qua hoạt động thể chất, Sport Energy cam kết cung cấp sản phẩm chất lượng, giúp người dùng tối ưu hóa hiệu suất tập luyện và thoải mái trong mọi hoạt động thể thao. Khách hàng có thể dễ dàng tìm thấy các sản phẩm phù hợp với nhu cầu và mục tiêu cá nhân, từ người mới tập luyện cho đến các vận động viên chuyên nghiệp.

Ngoài việc cung cấp sản phẩm chất lượng, Sport Energy còn chú trọng đến trải nghiệm mua sắm trực tuyến của khách hàng. Giao diện thân thiện, dễ sử dụng cùng với thông tin sản phẩm rõ ràng và chính xác giúp người dùng dễ dàng tìm kiếm và lựa chọn sản phẩm. Đội ngũ hỗ trợ khách hàng nhiệt tình và chuyên nghiệp sẵn sàng hỗ trợ trong quá trình mua sắm và giải đáp mọi thắc mắc của khách hàng.

Với Sport Energy, không chỉ là việc mua sắm, mà là trải nghiệm tập luyện thú vị và đầy đủ cảm xúc, mang đến sức khỏe và niềm vui cho mọi người, từ người mới bắt đầu đến những người đã chinh phục được nhiều thành tựu trong thể thao.', 30, N'12')
INSERT [dbo].[products] ([Id], [name], [thumbnail], [price], [createDate], [available], [description], [bigDescription], [quantity], [categoryId]) VALUES (51, N'áo nam', N'eren.png', 33000, CAST(N'2023-12-16' AS Date), 1, N'', NULL, NULL, N'1')
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[rating] ON 

INSERT [dbo].[rating] ([id], [content], [rating], [username], [createDate], [productId], [orderId]) VALUES (0, N'`12', 5, N'hvtruong', CAST(N'2023-12-15T23:32:52.257' AS DateTime), 1, 14)
INSERT [dbo].[rating] ([id], [content], [rating], [username], [createDate], [productId], [orderId]) VALUES (1, N'`12', 5, N'hvtruong 212`', CAST(N'2023-12-15T23:33:00.907' AS DateTime), 1, 14)
INSERT [dbo].[rating] ([id], [content], [rating], [username], [createDate], [productId], [orderId]) VALUES (2, N'`12', 5, N'hvtruong 212`1212`', CAST(N'2023-12-15T23:33:03.837' AS DateTime), 1, 14)
INSERT [dbo].[rating] ([id], [content], [rating], [username], [createDate], [productId], [orderId]) VALUES (3, N'`121212', 5, N'hvtruong 212`1212`', CAST(N'2023-12-15T23:33:06.837' AS DateTime), 1, 14)
INSERT [dbo].[rating] ([id], [content], [rating], [username], [createDate], [productId], [orderId]) VALUES (4, N'`121212', 2, N'hvtruong 212`1212`', CAST(N'2023-12-15T23:33:09.823' AS DateTime), 1, 14)
INSERT [dbo].[rating] ([id], [content], [rating], [username], [createDate], [productId], [orderId]) VALUES (5, N'`121212', 2, N'hvtruong 212`1212`', CAST(N'2023-12-15T23:33:23.727' AS DateTime), 1, 14)
INSERT [dbo].[rating] ([id], [content], [rating], [username], [createDate], [productId], [orderId]) VALUES (6, N'`121212', 2, N'hvtruong 212`1212`', CAST(N'2023-12-15T23:33:25.407' AS DateTime), 1, 14)
INSERT [dbo].[rating] ([id], [content], [rating], [username], [createDate], [productId], [orderId]) VALUES (7, N'`121212', 2, N'hvtruong 212`1212`', CAST(N'2023-12-15T23:33:27.400' AS DateTime), 1, 14)
INSERT [dbo].[rating] ([id], [content], [rating], [username], [createDate], [productId], [orderId]) VALUES (8, N'`121212', 2, N'hvtruong 212`1212`', CAST(N'2023-12-15T23:33:43.420' AS DateTime), 1, 14)
INSERT [dbo].[rating] ([id], [content], [rating], [username], [createDate], [productId], [orderId]) VALUES (9, N'1', 1, N'admin', CAST(N'2023-12-16T11:24:20.217' AS DateTime), 1, 14)
INSERT [dbo].[rating] ([id], [content], [rating], [username], [createDate], [productId], [orderId]) VALUES (10, N'1', 5, NULL, CAST(N'2023-12-16T11:38:15.987' AS DateTime), 2, 29)
INSERT [dbo].[rating] ([id], [content], [rating], [username], [createDate], [productId], [orderId]) VALUES (11, N'1', 5, NULL, CAST(N'2023-12-16T11:43:56.263' AS DateTime), 2, 29)
INSERT [dbo].[rating] ([id], [content], [rating], [username], [createDate], [productId], [orderId]) VALUES (12, N'test', 5, N'user', CAST(N'2023-12-18T19:45:20.660' AS DateTime), 28, 25)
SET IDENTITY_INSERT [dbo].[rating] OFF
GO
INSERT [dbo].[roles] ([id], [name], [available]) VALUES (N'CUST', N'Customers', 1)
INSERT [dbo].[roles] ([id], [name], [available]) VALUES (N'DIRE', N'Directors', 1)
INSERT [dbo].[roles] ([id], [name], [available]) VALUES (N'STAF', N'Staffs', 1)
GO
SET IDENTITY_INSERT [dbo].[size] ON 

INSERT [dbo].[size] ([id], [name], [available]) VALUES (1, N'S', 1)
INSERT [dbo].[size] ([id], [name], [available]) VALUES (2, N'M', 1)
INSERT [dbo].[size] ([id], [name], [available]) VALUES (3, N'L', 1)
INSERT [dbo].[size] ([id], [name], [available]) VALUES (4, N'39', 1)
INSERT [dbo].[size] ([id], [name], [available]) VALUES (5, N'40', 1)
INSERT [dbo].[size] ([id], [name], [available]) VALUES (6, N'41', 1)
INSERT [dbo].[size] ([id], [name], [available]) VALUES (7, N'42', 1)
SET IDENTITY_INSERT [dbo].[size] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_email]    Script Date: 12/18/2023 8:48:57 PM ******/
ALTER TABLE [dbo].[accounts] ADD  CONSTRAINT [UC_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[accounts] ADD  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[accounts] ADD  DEFAULT ((1)) FOR [available]
GO
ALTER TABLE [dbo].[authorities] ADD  DEFAULT ((1)) FOR [available]
GO
ALTER TABLE [dbo].[categories] ADD  DEFAULT ((1)) FOR [available]
GO
ALTER TABLE [dbo].[color] ADD  DEFAULT ((1)) FOR [available]
GO
ALTER TABLE [dbo].[orderDetails] ADD  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[orderDetails] ADD  DEFAULT ((1)) FOR [quantity]
GO
ALTER TABLE [dbo].[orderDetails] ADD  DEFAULT ((1)) FOR [available]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ((1)) FOR [available]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ((0)) FOR [paymentStatus]
GO
ALTER TABLE [dbo].[productAttribute] ADD  DEFAULT ((1)) FOR [available]
GO
ALTER TABLE [dbo].[productImage] ADD  DEFAULT ((1)) FOR [available]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ((1)) FOR [available]
GO
ALTER TABLE [dbo].[rating] ADD  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT ((1)) FOR [available]
GO
ALTER TABLE [dbo].[size] ADD  DEFAULT ((1)) FOR [available]
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[authorities]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[favorites]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([Id])
GO
ALTER TABLE [dbo].[favorites]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[orderDetails]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[orderDetails]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([Id])
GO
ALTER TABLE [dbo].[orderDetails]  WITH CHECK ADD FOREIGN KEY([productAttributeId])
REFERENCES [dbo].[productAttribute] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[productAttribute]  WITH CHECK ADD FOREIGN KEY([colorId])
REFERENCES [dbo].[color] ([id])
GO
ALTER TABLE [dbo].[productAttribute]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([Id])
GO
ALTER TABLE [dbo].[productAttribute]  WITH CHECK ADD FOREIGN KEY([sizeId])
REFERENCES [dbo].[size] ([id])
GO
ALTER TABLE [dbo].[productImage]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([Id])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[rating]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[rating]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([Id])
GO
USE [master]
GO
ALTER DATABASE [energysport] SET  READ_WRITE 
GO
