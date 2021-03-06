USE [master]
GO
/****** Object:  Database [Role_DB]    Script Date: 1/29/2021 2:34:47 PM ******/
CREATE DATABASE [Role_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Role_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Role_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Role_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Role_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Role_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Role_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Role_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Role_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Role_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Role_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Role_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Role_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Role_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Role_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Role_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Role_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Role_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Role_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Role_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Role_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Role_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Role_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Role_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Role_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Role_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Role_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Role_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Role_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Role_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [Role_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Role_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Role_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Role_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Role_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Role_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Role_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Role_DB', N'ON'
GO
ALTER DATABASE [Role_DB] SET QUERY_STORE = OFF
GO
USE [Role_DB]
GO
/****** Object:  Table [dbo].[CarTbl]    Script Date: 1/29/2021 2:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarTbl](
	[RegNum] [varchar](50) NOT NULL,
	[Brand] [varbinary](50) NOT NULL,
	[Model] [varbinary](50) NOT NULL,
	[Available] [varchar](50) NOT NULL,
	[Price] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RegNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerTbl]    Script Date: 1/29/2021 2:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerTbl](
	[CustId] [int] NOT NULL,
	[CustName] [varchar](50) NOT NULL,
	[CustAdd] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalTbl]    Script Date: 1/29/2021 2:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalTbl](
	[Rentid] [int] NOT NULL,
	[carReg] [varchar](50) NOT NULL,
	[CustName] [varchar](50) NOT NULL,
	[RentDate] [date] NOT NULL,
	[ReturnDate] [date] NOT NULL,
	[RentFee] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Rentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReturnTbl]    Script Date: 1/29/2021 2:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnTbl](
	[ReturnId] [int] NOT NULL,
	[CarReg] [varchar](50) NOT NULL,
	[CustName] [varchar](50) NOT NULL,
	[ReturnDate] [date] NOT NULL,
	[Delay] [varchar](50) NOT NULL,
	[Fine] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReturnId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTbl]    Script Date: 1/29/2021 2:34:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTbl](
	[Id] [int] NOT NULL,
	[Uname] [varchar](50) NOT NULL,
	[Upass] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[UserTbl] ([Id], [Uname], [Upass]) VALUES (1, N'admin', N'admin')
INSERT [dbo].[UserTbl] ([Id], [Uname], [Upass]) VALUES (2, N'user', N'user')
GO
USE [master]
GO
ALTER DATABASE [Role_DB] SET  READ_WRITE 
GO
