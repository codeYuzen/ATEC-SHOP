USE [master]
GO
/****** Object:  Database [OnlineShop]    Script Date: 15/11/2023 23:24:47 ******/
CREATE DATABASE [OnlineShop]
GO
ALTER DATABASE [OnlineShop] SET COMPATIBILITY_LEVEL = 140
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
ALTER DATABASE [OnlineShop] SET QUERY_STORE = OFF
GO
USE [OnlineShop]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 15/11/2023 23:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[prod_ID] [int] IDENTITY(1,1) NOT NULL,
	[prod_Name] [varchar](50) NULL,
	[prod_Price] [varchar](50) NULL,
	[prod_Type] [varchar](50) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[prod_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 15/11/2023 23:24:47 ******/
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
	[User_Type] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[accountActivation]    Script Date: 15/11/2023 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[changePW]    Script Date: 15/11/2023 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[emailToChangePW]    Script Date: 15/11/2023 23:24:47 ******/
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
/****** Object:  StoredProcedure [dbo].[login]    Script Date: 15/11/2023 23:24:47 ******/
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
	@return int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if exists (select * from Users where User_Email = @email and User_PW = @password and User_active = 'true')
		begin
			set @return = 1
		end
	else if exists (select * from Users where User_Email = @email and User_PW = @password and User_active = 'false')
		begin
			set @return = 2
		end
	else
		begin
			set @return = 0
		end
END
GO
/****** Object:  StoredProcedure [dbo].[newUser]    Script Date: 15/11/2023 23:24:47 ******/
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
			insert into Users values (@email, @password, @firstName, @lastName, @address, @postalCode, @region, 'false', 'Customer')
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
