USE [master]
GO
/****** Object:  Database [OnlineShop]    Script Date: 16/11/2023 19:49:12 ******/
CREATE DATABASE [OnlineShop]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineShop] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineShop] SET DELAYED_DURABILITY = DISABLED 
GO
USE [OnlineShop]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 16/11/2023 19:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[serial] [varchar](50) NULL,
	[price] [decimal](10, 2) NULL,
	[category] [varchar](50) NULL,
	[manufacturer] [varchar](50) NULL,
	[model] [varchar](100) NULL,
	[color] [varchar](50) NULL,
	[photo] [varchar](255) NULL,
	[stock] [int] NULL,
	[details] [varchar](255) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 16/11/2023 19:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Email] [varchar](50) NULL,
	[User_PW] [varchar](50) NULL,
	[User_FirstName] [varchar](50) NULL,
	[User_LastName] [varchar](50) NULL,
	[User_Address] [varchar](100) NULL,
	[User_PostalCode] [varchar](50) NULL,
	[User_Region] [varchar](50) NULL,
	[User_active] [bit] NULL,
	[User_Type] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [details]) VALUES (1, N'7C56-002R', CAST(135.00 AS Decimal(10, 2)), N'Motherboards', N'MSI', N'ATX B550-A PRO AM4', N'Silver', N'https://static.pcdiga.com/media/catalog/product/cache/4a9972e1440204cef7cf19ceb7c4fc35/s/e/sem-ti_tulo-122_s.jpg', 10, N'https://www.msi.com/Motherboard/B550-A-PRO')
INSERT [dbo].[Products] ([id], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [details]) VALUES (2, N'ACFRE00101A', CAST(125.00 AS Decimal(10, 2)), N'Coolers', N'ARCTIC', N'Liquid Freezer II 360 A-RGB', N'Black', N'https://cdna.pcpartpicker.com/static/forever/images/product/7fb1d50312d580bf83856c7aab42bef1.256p.jpg', 8, N'https://www.arctic.de/en/Liquid-Freezer-II-360-A-RGB/ACFRE00101A')
INSERT [dbo].[Products] ([id], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [details]) VALUES (3, N'100-100000065BOX', CAST(170.00 AS Decimal(10, 2)), N'Processors', N'AMD', N'Ryzen 5 5600X 3.7 GHz AM4', N'None', N'https://cdna.pcpartpicker.com/static/forever/images/product/3ef757133d38ac40afe75da691ba7d60.1600.jpg', 13, N'https://www.amd.com/pt/products/cpu/amd-ryzen-5-5600x')
INSERT [dbo].[Products] ([id], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [details]) VALUES (4, N'90YV0GC0-M0NA10', CAST(360.00 AS Decimal(10, 2)), N'Graphics Cards', N'Asus', N'TUF GAMING OC V2 GeForce RTX 3060 12GB GDDR6', N'Black', N'https://cdna.pcpartpicker.com/static/forever/images/product/74bea45929b7165fa320250fa6cb2f53.1600.jpg', 11, N'https://www.asus.com/pt/motherboards-components/graphics-cards/tuf-gaming/tuf-rtx3060-o12g-v2-gaming/')
INSERT [dbo].[Products] ([id], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [details]) VALUES (5, N'PC-O11DX', CAST(120.00 AS Decimal(10, 2)), N'Cases', N'Lian Li', N'PC-O11 ATX', N'Black', N'https://cdna.pcpartpicker.com/static/forever/images/product/1e42c74f4d4dd535364465ca3f3a4d83.256p.jpg', 42, N'https://lian-li.com/pt/product/pc-o11-dynamic/')
INSERT [dbo].[Products] ([id], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [details]) VALUES (6, N'MZ-V8P1T0BW', CAST(95.00 AS Decimal(10, 2)), N'Storage', N'Samsung', N'980 Pro 1 TB Solid State Drive', N'Black', N'https://cdna.pcpartpicker.com/static/forever/images/product/4e02c24a00f7b79a56489db2acbe3a9b.256p.jpg', 69, N'https://www.samsung.com/pt/memory-storage/nvme-ssd/980-1tb-nvme-pcie-gen-3-mz-v8v1t0bw/')
INSERT [dbo].[Products] ([id], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [details]) VALUES (7, N'F4-3600C18D-16GTZRX', CAST(65.00 AS Decimal(10, 2)), N'Memory', N'G.Skill', N'Trident Z RGB DDR4-3600 16GB (2x8GB)', N'Black', N'https://cdna.pcpartpicker.com/static/forever/images/product/d19422479fca6e5117bb55db3d25eac2.256p.jpg', 50, N'https://www.gskill.com/product/165/166/1536653463/F4-3200C14D-16GTZR')
INSERT [dbo].[Products] ([id], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [details]) VALUES (8, N'SSR-850FX', CAST(170.00 AS Decimal(10, 2)), N'Power Supplies', N'SeaSonic', N'FOCUS Plus 850W 80+ Gold', N'Black', N'https://www.inforpereira.com/image/cache/catalog/Produtos/Componentes/FONTE%20ALIMENTA%C3%87AO/SSR-850FX-700x700.jpg', 88, N'https://seasonic.com/focus-plus-gold')
INSERT [dbo].[Products] ([id], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [details]) VALUES (9, N'RR-212S-20PK-R1', CAST(35.00 AS Decimal(10, 2)), N'Coolers', N'Cooler Master', N'Hyper 212 Black Edition', N'Black', N'https://images-na.ssl-images-amazon.com/images/I/41q91XCgtaL.jpg', 90, N'https://www.coolermaster.com/catalog/coolers/cpu-air-coolers/hyper-212-black-edition/')
INSERT [dbo].[Products] ([id], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [details]) VALUES (10, N'90MB14I0-M0EAY0', CAST(100.00 AS Decimal(10, 2)), N'Motherboards', N'Asus', N'Micro ATX B550M-A AM4', N'Silver', N'https://cdna.pcpartpicker.com/static/forever/images/product/a608e30c64ccadf8dc8c1d2fcd3be2d7.256p.jpg', 47, N'https://www.asus.com/motherboards-components/motherboards/prime/prime-b550m-a/')
INSERT [dbo].[Products] ([id], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [details]) VALUES (11, N'F4-3200C16D-16GIS', CAST(40.00 AS Decimal(10, 2)), N'Memory', N'G.Skill', N'Aegis DDR4-3200 16GB (2x8GB)', N'Black', N'https://cdna.pcpartpicker.com/static/forever/images/product/9e003e10740c0e04136649de59fa2ab5.256p.jpg', 5, N'https://www.gskill.com/product/165/185/1567584549/F4-3200C16D-16GIS')
INSERT [dbo].[Products] ([id], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [details]) VALUES (12, N'ST2000DM008', CAST(30.00 AS Decimal(10, 2)), N'Storage', N'Seagate', N'BarraCuda 2 TB 3.5" 7200 RPM Internal Hard Drive', N'None', N'https://m.media-amazon.com/images/I/51EI9OmbbjL.jpg', 28, N'https://www.seagate.com/content/dam/seagate/migrated-assets/www-content/product-content/barracuda-fam/barracuda-new/en-us/docs/100817550n.pdf')
INSERT [dbo].[Products] ([id], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [details]) VALUES (13, N'LRC10Z500GG8', CAST(26.00 AS Decimal(10, 2)), N'Storage', N'KIOXIA', N'EXCERIA 500 GB M.2-2280 NVME Solid State Drive', N'None', N'https://cdna.pcpartpicker.com/static/forever/images/product/3d7e87b3dee58a7896f02108d5be325e.256p.jpg', 35, N'https://europe.kioxia.com/en-europe/personal/ssd/exceria-nvme-ssd.html')
INSERT [dbo].[Products] ([id], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [details]) VALUES (14, N'11306-01-20G', CAST(580.00 AS Decimal(10, 2)), N'Graphics Cards', N'Sapphire', N'NITRO+ Radeon RX 6700 XT 12 GB GDDR6', N'Silver', N'https://cdna.pcpartpicker.com/static/forever/images/product/7b7864adfe256ef2827c88e5fb2191d4.1600.jpg', 0, N'https://www.sapphiretech.com/en/consumer/nitro-radeon-rx-6700-xt')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([User_ID], [User_Email], [User_PW], [User_FirstName], [User_LastName], [User_Address], [User_PostalCode], [User_Region], [User_active], [User_Type]) VALUES (4, N'admin@email.com', N'mG9S7zDsPbw=', N'Admin', N'Administrator', N'Rua xpto', N'1234-123', N'Setúbal', 1, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  StoredProcedure [dbo].[accountActivation]    Script Date: 16/11/2023 19:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[accountActivation]
	-- Add the parameters for the stored procedure here
	@email as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Users set User_active = 'true' where User_Email = @email
END
GO
/****** Object:  StoredProcedure [dbo].[changePW]    Script Date: 16/11/2023 19:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[changePW]
	-- Add the parameters for the stored procedure here
	@newPW as varchar(50),
	@email as varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Users set User_PW = @newPW where User_Email = @email
END
GO
/****** Object:  StoredProcedure [dbo].[emailToChangePW]    Script Date: 16/11/2023 19:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[emailToChangePW] 
	-- Add the parameters for the stored procedure here
	@email as varchar(50),
	@return int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if exists(select * from Users where User_Email = @email)
		begin
			set @return = 1
		end
	else
		begin
			set @return = 0
		end
END
GO
/****** Object:  StoredProcedure [dbo].[login]    Script Date: 16/11/2023 19:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[login] 
	-- Add the parameters for the stored procedure here
	@email as varchar(50),
	@password as varchar(50),
	@return int output,
	@accType int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if exists (select * from Users where User_Email = @email and User_PW = @password and User_active = 'true')
		begin
			set @return = 1
			set @accType = (select User_type from Users where User_Email = @email)
		end
	else if exists (select * from Users where User_Email = @email and User_PW = @password and User_active = 'false')
		begin
			set @return = 2
			set @accType = 2
		end
	else
		begin
			set @return = 0
			set @accType = 2
		end
END
GO
/****** Object:  StoredProcedure [dbo].[newUser]    Script Date: 16/11/2023 19:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[newUser]
	-- Add the parameters for the stored procedure here
	@email as varchar(50),
	@password as varchar(50),
	@firstName as varchar(50),
	@lastName as varchar(50),
	@address as varchar(100),
	@postalCode as varchar(50),
	@region as varchar(50),
	@return int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if not exists (select * from Users where @email = User_Email)
		begin
			insert into Users values (@email, @password, @firstName, @lastName, @address, @postalCode, @region, 'false', 0)
			set @return = 1
		end
	else
		begin
			set @return = 0
		end
END
GO
USE [master]
GO
ALTER DATABASE [OnlineShop] SET  READ_WRITE 
GO
