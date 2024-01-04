USE [master]
GO
/****** Object:  Database [FPBI_ErrorDB]    Script Date: 1/1/2024 5:51:35 PM ******/
CREATE DATABASE [FPBI_ErrorDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FPBI_ErrorDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FPBI_ErrorDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FPBI_ErrorDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FPBI_ErrorDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FPBI_ErrorDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FPBI_ErrorDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FPBI_ErrorDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FPBI_ErrorDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FPBI_ErrorDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FPBI_ErrorDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FPBI_ErrorDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FPBI_ErrorDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FPBI_ErrorDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FPBI_ErrorDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FPBI_ErrorDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FPBI_ErrorDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FPBI_ErrorDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FPBI_ErrorDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FPBI_ErrorDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FPBI_ErrorDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FPBI_ErrorDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FPBI_ErrorDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FPBI_ErrorDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FPBI_ErrorDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FPBI_ErrorDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FPBI_ErrorDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FPBI_ErrorDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FPBI_ErrorDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FPBI_ErrorDB] SET RECOVERY FULL 
GO
ALTER DATABASE [FPBI_ErrorDB] SET  MULTI_USER 
GO
ALTER DATABASE [FPBI_ErrorDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FPBI_ErrorDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FPBI_ErrorDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FPBI_ErrorDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FPBI_ErrorDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FPBI_ErrorDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FPBI_ErrorDB', N'ON'
GO
ALTER DATABASE [FPBI_ErrorDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [FPBI_ErrorDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FPBI_ErrorDB]
GO
/****** Object:  Table [dbo].[CITY_STAGE]    Script Date: 1/1/2024 5:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CITY_STAGE](
	[Branch] [nvarchar](10) NULL,
	[City] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT_STAGE]    Script Date: 1/1/2024 5:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT_STAGE](
	[ProductID] [nvarchar](10) NULL,
	[Unit price] [float] NULL,
	[ProductLineID] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTLINE_STAGE]    Script Date: 1/1/2024 5:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTLINE_STAGE](
	[Product line] [nvarchar](255) NULL,
	[ProductLineID] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUPERMARKET_SALE_STAGE]    Script Date: 1/1/2024 5:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUPERMARKET_SALE_STAGE](
	[ProductID] [nvarchar](10) NULL,
	[Invoice ID] [nvarchar](50) NULL,
	[Branch] [nvarchar](10) NULL,
	[Customer_type] [nvarchar](255) NULL,
	[Gender] [nvarchar](100) NULL,
	[Quantity] [float] NULL,
	[Tax 5%] [float] NULL,
	[Total] [float] NULL,
	[Day] [int] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[Time] [time](7) NULL,
	[Payment] [nvarchar](100) NULL,
	[cogs] [float] NULL,
	[gross margin percentage] [float] NULL,
	[gross income] [float] NULL,
	[Rating] [float] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [FPBI_ErrorDB] SET  READ_WRITE 
GO


Truncate table 