USE [master]
GO
/****** Object:  Database [FPBI_DDS]    Script Date: 12/23/2023 1:49:42 PM ******/
CREATE DATABASE [FPBI_DDS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FPBI_DDS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FPBI_DDS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FPBI_DDS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FPBI_DDS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FPBI_DDS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FPBI_DDS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FPBI_DDS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FPBI_DDS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FPBI_DDS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FPBI_DDS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FPBI_DDS] SET ARITHABORT OFF 
GO
ALTER DATABASE [FPBI_DDS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FPBI_DDS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FPBI_DDS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FPBI_DDS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FPBI_DDS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FPBI_DDS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FPBI_DDS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FPBI_DDS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FPBI_DDS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FPBI_DDS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FPBI_DDS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FPBI_DDS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FPBI_DDS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FPBI_DDS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FPBI_DDS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FPBI_DDS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FPBI_DDS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FPBI_DDS] SET RECOVERY FULL 
GO
ALTER DATABASE [FPBI_DDS] SET  MULTI_USER 
GO
ALTER DATABASE [FPBI_DDS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FPBI_DDS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FPBI_DDS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FPBI_DDS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FPBI_DDS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FPBI_DDS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FPBI_DDS', N'ON'
GO
ALTER DATABASE [FPBI_DDS] SET QUERY_STORE = ON
GO
ALTER DATABASE [FPBI_DDS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FPBI_DDS]
GO
/****** Object:  Table [dbo].[DIM_City]    Script Date: 12/23/2023 1:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_City](
	[BranchSK] [int] NOT NULL,
	[City] [nvarchar](100) NULL,
 CONSTRAINT [PK_DIM_City] PRIMARY KEY CLUSTERED 
(
	[BranchSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_CustomerType]    Script Date: 12/23/2023 1:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_CustomerType](
	[CustomerTypeSK] [int] NOT NULL,
	[Type] [nvarchar](100) NULL,
 CONSTRAINT [PK_DIM_CustomerType] PRIMARY KEY CLUSTERED 
(
	[CustomerTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_Day]    Script Date: 12/23/2023 1:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Day](
	[DayID] [int] NOT NULL,
	[Day] [int] NULL,
	[MonthID] [int] NULL,
 CONSTRAINT [PK_DIM_Day] PRIMARY KEY CLUSTERED 
(
	[DayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_Gender]    Script Date: 12/23/2023 1:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Gender](
	[GenderSK] [int] NOT NULL,
	[Gender] [nvarchar](100) NULL,
 CONSTRAINT [PK_DIM_Gender] PRIMARY KEY CLUSTERED 
(
	[GenderSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_Month]    Script Date: 12/23/2023 1:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Month](
	[MonthID] [int] NOT NULL,
	[Month] [int] NULL,
	[YearID] [int] NULL,
 CONSTRAINT [PK_DIM_Month] PRIMARY KEY CLUSTERED 
(
	[MonthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_Payment]    Script Date: 12/23/2023 1:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Payment](
	[MethodSK] [int] NOT NULL,
	[Method] [nvarchar](100) NULL,
 CONSTRAINT [PK_DIM_Payment] PRIMARY KEY CLUSTERED 
(
	[MethodSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_Product]    Script Date: 12/23/2023 1:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Product](
	[ProductSK] [int] NOT NULL,
	[UnitPrice] [float] NULL,
	[ProductLineSK] [int] NULL,
 CONSTRAINT [PK_DIM_Product] PRIMARY KEY CLUSTERED 
(
	[ProductSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_ProductLine]    Script Date: 12/23/2023 1:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_ProductLine](
	[ProductLineSK] [int] NOT NULL,
	[ProductLine] [int] NULL,
 CONSTRAINT [PK_DIM_ProductLine] PRIMARY KEY CLUSTERED 
(
	[ProductLineSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_Time]    Script Date: 12/23/2023 1:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Time](
	[TimeID] [int] NOT NULL,
	[Time] [time](7) NULL,
	[DayID] [int] NULL,
 CONSTRAINT [PK_DIM_Time] PRIMARY KEY CLUSTERED 
(
	[TimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_Year]    Script Date: 12/23/2023 1:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_Year](
	[YearID] [int] NOT NULL,
	[Year] [int] NULL,
 CONSTRAINT [PK_DIM_Year] PRIMARY KEY CLUSTERED 
(
	[YearID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact]    Script Date: 12/23/2023 1:49:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact](
	[ProductSK] [int] NOT NULL,
	[MethodSK] [int] NOT NULL,
	[GenderSK] [int] NOT NULL,
	[BranchSK] [int] NOT NULL,
	[TimeID] [int] NOT NULL,
	[CustomerTypeSK] [int] NOT NULL,
	[NumberOfCustomer] [int] NULL,
	[NumberOfRating] [int] NULL,
	[Revenue] [float] NULL,
	[UnitsSold] [int] NULL,
 CONSTRAINT [PK_Fact] PRIMARY KEY CLUSTERED 
(
	[ProductSK] ASC,
	[MethodSK] ASC,
	[GenderSK] ASC,
	[BranchSK] ASC,
	[TimeID] ASC,
	[CustomerTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DIM_Day]  WITH CHECK ADD  CONSTRAINT [FK_DIM_DAY_DIM_MONTH] FOREIGN KEY([MonthID])
REFERENCES [dbo].[DIM_Month] ([MonthID])
GO
ALTER TABLE [dbo].[DIM_Day] CHECK CONSTRAINT [FK_DIM_DAY_DIM_MONTH]
GO
ALTER TABLE [dbo].[DIM_Month]  WITH CHECK ADD  CONSTRAINT [FK_DIM_MONTH_DIM_YEAR] FOREIGN KEY([YearID])
REFERENCES [dbo].[DIM_Year] ([YearID])
GO
ALTER TABLE [dbo].[DIM_Month] CHECK CONSTRAINT [FK_DIM_MONTH_DIM_YEAR]
GO
ALTER TABLE [dbo].[DIM_Product]  WITH CHECK ADD  CONSTRAINT [FK_DIM_PRODUCT_DIM_PRODUCTLINE] FOREIGN KEY([ProductLineSK])
REFERENCES [dbo].[DIM_ProductLine] ([ProductLineSK])
GO
ALTER TABLE [dbo].[DIM_Product] CHECK CONSTRAINT [FK_DIM_PRODUCT_DIM_PRODUCTLINE]
GO
ALTER TABLE [dbo].[DIM_Time]  WITH CHECK ADD  CONSTRAINT [FK_DIM_TIME_DIM_DAY] FOREIGN KEY([DayID])
REFERENCES [dbo].[DIM_Day] ([DayID])
GO
ALTER TABLE [dbo].[DIM_Time] CHECK CONSTRAINT [FK_DIM_TIME_DIM_DAY]
GO
ALTER TABLE [dbo].[Fact]  WITH CHECK ADD  CONSTRAINT [FK_FACT_DIM_CITY] FOREIGN KEY([BranchSK])
REFERENCES [dbo].[DIM_City] ([BranchSK])
GO
ALTER TABLE [dbo].[Fact] CHECK CONSTRAINT [FK_FACT_DIM_CITY]
GO
ALTER TABLE [dbo].[Fact]  WITH CHECK ADD  CONSTRAINT [FK_FACT_DIM_CUSTOMERTYPE] FOREIGN KEY([CustomerTypeSK])
REFERENCES [dbo].[DIM_CustomerType] ([CustomerTypeSK])
GO
ALTER TABLE [dbo].[Fact] CHECK CONSTRAINT [FK_FACT_DIM_CUSTOMERTYPE]
GO
ALTER TABLE [dbo].[Fact]  WITH CHECK ADD  CONSTRAINT [FK_FACT_DIM_GENDER] FOREIGN KEY([GenderSK])
REFERENCES [dbo].[DIM_Gender] ([GenderSK])
GO
ALTER TABLE [dbo].[Fact] CHECK CONSTRAINT [FK_FACT_DIM_GENDER]
GO
ALTER TABLE [dbo].[Fact]  WITH CHECK ADD  CONSTRAINT [FK_FACT_DIM_PAYMENT] FOREIGN KEY([MethodSK])
REFERENCES [dbo].[DIM_Payment] ([MethodSK])
GO
ALTER TABLE [dbo].[Fact] CHECK CONSTRAINT [FK_FACT_DIM_PAYMENT]
GO
ALTER TABLE [dbo].[Fact]  WITH CHECK ADD  CONSTRAINT [FK_FACT_DIM_PRODUCT] FOREIGN KEY([ProductSK])
REFERENCES [dbo].[DIM_Product] ([ProductSK])
GO
ALTER TABLE [dbo].[Fact] CHECK CONSTRAINT [FK_FACT_DIM_PRODUCT]
GO
ALTER TABLE [dbo].[Fact]  WITH CHECK ADD  CONSTRAINT [FK_FACT_DIM_TIME] FOREIGN KEY([TimeID])
REFERENCES [dbo].[DIM_Time] ([TimeID])
GO
ALTER TABLE [dbo].[Fact] CHECK CONSTRAINT [FK_FACT_DIM_TIME]
GO
USE [master]
GO
ALTER DATABASE [FPBI_DDS] SET  READ_WRITE 
GO
