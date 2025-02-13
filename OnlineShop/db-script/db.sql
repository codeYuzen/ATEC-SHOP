USE [master]
GO
/****** Object:  Database [OnlineShop]    Script Date: 17/11/2023 14:09:24 ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 17/11/2023 14:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [bigint] NOT NULL,
	[clientName] [varchar](100) NULL,
	[productName] [varchar](100) NULL,
	[amount] [int] NULL,
	[date] [date] NULL,
	[Order_Status] [nchar](10) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 17/11/2023 14:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productID] [bigint] IDENTITY(1,1) NOT NULL,
	[serial] [varchar](50) NULL,
	[price] [decimal](10, 2) NULL,
	[category] [varchar](50) NULL,
	[manufacturer] [varchar](50) NULL,
	[model] [varchar](100) NULL,
	[color] [varchar](50) NULL,
	[photo] [varchar](max) NULL,
	[stock] [int] NULL,
	[description] [varchar](280) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/11/2023 14:09:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[password] [varchar](max) NULL,
	[address] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[zipcode] [varchar](10) NULL,
	[nif] [varchar](25) NULL,
	[User_active] [bit] NULL,
	[User_Type] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([productID], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [description]) VALUES (1, N'7C56-002R', CAST(135.00 AS Decimal(10, 2)), N'Motherboards', N'MSI', N'ATX B550-A PRO AM4', N'Silver', N'https://static.pcdiga.com/media/catalog/product/cache/4a9972e1440204cef7cf19ceb7c4fc35/s/e/sem-ti_tulo-122_s.jpg', 10, N'Desc')
INSERT [dbo].[Products] ([productID], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [description]) VALUES (2, N'ACFRE00101A', CAST(125.00 AS Decimal(10, 2)), N'Coolers', N'ARCTIC', N'Liquid Freezer II 360 A-RGB', N'Black', N'https://cdna.pcpartpicker.com/static/forever/images/product/7fb1d50312d580bf83856c7aab42bef1.256p.jpg', 8, N'Desc')
INSERT [dbo].[Products] ([productID], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [description]) VALUES (3, N'100-100000065BOX', CAST(170.00 AS Decimal(10, 2)), N'Processors', N'AMD', N'Ryzen 5 5600X 3.7 GHz AM4', N'None', N'https://cdna.pcpartpicker.com/static/forever/images/product/3ef757133d38ac40afe75da691ba7d60.1600.jpg', 13, N'Desc')
INSERT [dbo].[Products] ([productID], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [description]) VALUES (4, N'90YV0GC0-M0NA10', CAST(360.00 AS Decimal(10, 2)), N'Graphics Cards', N'Asus', N'TUF GAMING OC V2 GeForce RTX 3060 12GB GDDR6', N'Black', N'https://cdna.pcpartpicker.com/static/forever/images/product/74bea45929b7165fa320250fa6cb2f53.1600.jpg', 11, N'Desc')
INSERT [dbo].[Products] ([productID], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [description]) VALUES (5, N'PC-O11DX', CAST(120.00 AS Decimal(10, 2)), N'Cases', N'Lian Li', N'PC-O11 ATX', N'Black', N'https://cdna.pcpartpicker.com/static/forever/images/product/1e42c74f4d4dd535364465ca3f3a4d83.256p.jpg', 42, N'Desc')
INSERT [dbo].[Products] ([productID], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [description]) VALUES (6, N'MZ-V8P1T0BW', CAST(95.00 AS Decimal(10, 2)), N'Storage', N'Samsung', N'980 Pro 1 TB Solid State Drive', N'Black', N'https://cdna.pcpartpicker.com/static/forever/images/product/4e02c24a00f7b79a56489db2acbe3a9b.256p.jpg', 69, N'Desc')
INSERT [dbo].[Products] ([productID], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [description]) VALUES (7, N'F4-3600C18D-16GTZRX', CAST(65.00 AS Decimal(10, 2)), N'Memory', N'G.Skill', N'Trident Z RGB DDR4-3600 16GB (2x8GB)', N'Black', N'https://cdna.pcpartpicker.com/static/forever/images/product/d19422479fca6e5117bb55db3d25eac2.256p.jpg', 50, N'Desc')
INSERT [dbo].[Products] ([productID], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [description]) VALUES (8, N'SSR-850FX', CAST(170.00 AS Decimal(10, 2)), N'Power Supplies', N'SeaSonic', N'FOCUS Plus 850W 80+ Gold', N'Black', N'https://www.inforpereira.com/image/cache/catalog/Produtos/Componentes/FONTE%20ALIMENTA%C3%87AO/SSR-850FX-700x700.jpg', 88, N'Desc')
INSERT [dbo].[Products] ([productID], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [description]) VALUES (9, N'RR-212S-20PK-R1', CAST(35.00 AS Decimal(10, 2)), N'Coolers', N'Cooler Master', N'Hyper 212 Black Edition', N'Black', N'https://images-na.ssl-images-amazon.com/images/I/41q91XCgtaL.jpg', 90, N'Desc')
INSERT [dbo].[Products] ([productID], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [description]) VALUES (10, N'90MB14I0-M0EAY0', CAST(100.00 AS Decimal(10, 2)), N'Motherboards', N'Asus', N'Micro ATX B550M-A AM4', N'Silver', N'https://cdna.pcpartpicker.com/static/forever/images/product/a608e30c64ccadf8dc8c1d2fcd3be2d7.256p.jpg', 47, N'Desc')
INSERT [dbo].[Products] ([productID], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [description]) VALUES (11, N'F4-3200C16D-16GIS', CAST(40.00 AS Decimal(10, 2)), N'Memory', N'G.Skill', N'Aegis DDR4-3200 16GB (2x8GB)', N'Black', N'https://cdna.pcpartpicker.com/static/forever/images/product/9e003e10740c0e04136649de59fa2ab5.256p.jpg', 5, N'Desc')
INSERT [dbo].[Products] ([productID], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [description]) VALUES (12, N'ST2000DM008', CAST(30.00 AS Decimal(10, 2)), N'Storage', N'Seagate', N'BarraCuda 2 TB 3.5 7200 RPM Internal Hard Drive', N'None', N'https://m.media-amazon.com/images/I/51EI9OmbbjL.jpg', 28, N'Desc')
INSERT [dbo].[Products] ([productID], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [description]) VALUES (13, N'LRC10Z500GG8', CAST(26.00 AS Decimal(10, 2)), N'Storage', N'KIOXIA', N'EXCERIA 500 GB M.2-2280 NVME Solid State Drive', N'None', N'https://cdna.pcpartpicker.com/static/forever/images/product/3d7e87b3dee58a7896f02108d5be325e.256p.jpg', 35, N'Desc')
INSERT [dbo].[Products] ([productID], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [description]) VALUES (14, N'11306-01-20G', CAST(580.00 AS Decimal(10, 2)), N'Graphics Cards', N'Sapphire', N'NITRO+ Radeon RX 6700 XT 12 GB GDDR6', N'Silver', N'https://cdna.pcpartpicker.com/static/forever/images/product/7b7864adfe256ef2827c88e5fb2191d4.1600.jpg', 0, N'Desc')
INSERT [dbo].[Products] ([productID], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [description]) VALUES (15, N'MCB-B500D-KGNN-S00', CAST(50.00 AS Decimal(10, 2)), N'Cases', N'Cooler Master', N'MasterBox MB500 ATX Mid Tower', N'Black', N'https://m.media-amazon.com/images/I/517QhAaAN5L.jpg', 0, N'Desc')
INSERT [dbo].[Products] ([productID], [serial], [price], [category], [manufacturer], [model], [color], [photo], [stock], [description]) VALUES (16, N'NXHUMMERX650WGD', CAST(80.00 AS Decimal(10, 2)), N'Power Supplies', N'NOX', N'Hummer X 650 W 80+ Gold', N'Black', N'https://m.media-amazon.com/images/I/31yFVpu8s3L.jpg', 14, N'Desc')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userID], [name], [email], [password], [address], [city], [zipcode], [nif], [User_active], [User_Type]) VALUES (2, N'Antonio Pacheca', N'admin@admin.com', N'admin123', N'202 Maple St', N'Cityburg', N'24680', N'321654987', 1, 1)
INSERT [dbo].[Users] ([userID], [name], [email], [password], [address], [city], [zipcode], [nif], [User_active], [User_Type]) VALUES (3, N'Bruno Rafael', N'bruno@bruno.com', N'user123', N'456 Oak St', N'Towndale', N'67890', N'987654321', 1, 0)
INSERT [dbo].[Users] ([userID], [name], [email], [password], [address], [city], [zipcode], [nif], [User_active], [User_Type]) VALUES (4, N'João Martins', N'joao@joao.com', N'securepass', N'789 Pine St', N'Villagetown', N'54321', N'456789012', 1, 0)
INSERT [dbo].[Users] ([userID], [name], [email], [password], [address], [city], [zipcode], [nif], [User_active], [User_Type]) VALUES (5, N'Onur Ergun', N'onur@onur.com', N'123abc', N'101 Elm St', N'Hamletville', N'13579', N'789012345', 1, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Orders1] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Orders1]
GO
/****** Object:  StoredProcedure [dbo].[accountActivation]    Script Date: 17/11/2023 14:09:25 ******/
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
	@email as varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Users set User_active = 'true' where email = @email
END
GO
/****** Object:  StoredProcedure [dbo].[changePW]    Script Date: 17/11/2023 14:09:25 ******/
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
	@newPassword as varchar(MAX),
	@email as varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Users set password = @newPassword where email = @email
END
GO
/****** Object:  StoredProcedure [dbo].[emailToChangePW]    Script Date: 17/11/2023 14:09:25 ******/
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
	@email as varchar(100),
	@return int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if exists(select * from Users where email = @email)
		begin
			set @return = 1
		end
	else
		begin
			set @return = 0
		end
END
GO
/****** Object:  StoredProcedure [dbo].[login]    Script Date: 17/11/2023 14:09:25 ******/
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
	@email as varchar(100),
	@password as varchar(MAX),
	@return int output,
	@accType int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if exists (select * from Users where email = @email and password = @password and User_active = 'true')
		begin
			set @return = 1
			set @accType = (select User_type from Users where email = @email)
		end
	else if exists (select * from Users where email = @email and password = @password and User_active = 'false')
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
/****** Object:  StoredProcedure [dbo].[newUser]    Script Date: 17/11/2023 14:09:25 ******/
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
	@name as varchar(100),
	@email as varchar(100),
	@password as varchar(MAX),
	@address as varchar(100),
	@city as varchar(50),
	@zipcode as varchar(10),
	@nif as varchar(25),
	@return int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		if not exists (select * from Users where @email = email)
			begin
				insert into Users values (@name, @email, @password, @address, @city, @zipcode, @nif, 'false', 0)
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
