USE [master]
GO
/****** Object:  Database [WWI_DWH]    Script Date: 16.03.2022 20:05:18 ******/
CREATE DATABASE [WWI_DWH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WWI_DWH', FILENAME = N'C:\MSSQL\MSSQL14.SQLSRV2017\MSSQL\DATA\WWI_DWH.mdf' , SIZE = 401408KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WWI_DWH_log', FILENAME = N'C:\MSSQL\MSSQL14.SQLSRV2017\MSSQL\DATA\WWI_DWH_log.ldf' , SIZE = 335872KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [WWI_DWH] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WWI_DWH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WWI_DWH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WWI_DWH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WWI_DWH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WWI_DWH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WWI_DWH] SET ARITHABORT OFF 
GO
ALTER DATABASE [WWI_DWH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WWI_DWH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WWI_DWH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WWI_DWH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WWI_DWH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WWI_DWH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WWI_DWH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WWI_DWH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WWI_DWH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WWI_DWH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WWI_DWH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WWI_DWH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WWI_DWH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WWI_DWH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WWI_DWH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WWI_DWH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WWI_DWH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WWI_DWH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WWI_DWH] SET  MULTI_USER 
GO
ALTER DATABASE [WWI_DWH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WWI_DWH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WWI_DWH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WWI_DWH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WWI_DWH] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WWI_DWH', N'ON'
GO
ALTER DATABASE [WWI_DWH] SET QUERY_STORE = OFF
GO
USE [WWI_DWH]
GO
/****** Object:  Schema [DM]    Script Date: 16.03.2022 20:05:18 ******/
CREATE SCHEMA [DM]
GO
/****** Object:  Schema [DW]    Script Date: 16.03.2022 20:05:18 ******/
CREATE SCHEMA [DW]
GO
/****** Object:  Schema [ETL]    Script Date: 16.03.2022 20:05:18 ******/
CREATE SCHEMA [ETL]
GO
/****** Object:  Schema [ODS]    Script Date: 16.03.2022 20:05:18 ******/
CREATE SCHEMA [ODS]
GO
/****** Object:  Schema [Stage]    Script Date: 16.03.2022 20:05:18 ******/
CREATE SCHEMA [Stage]
GO
/****** Object:  Table [dbo].[DST]    Script Date: 16.03.2022 20:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DST](
	[InvoiceID] [int] NULL,
	[CustomerID] [int] NULL,
	[BillToCustomerID] [int] NULL,
	[OrderID] [int] NULL,
	[DeliveryMethodID] [int] NULL,
	[ContactPersonID] [int] NULL,
	[AccountsPersonID] [int] NULL,
	[SalespersonPersonID] [int] NULL,
	[PackedByPersonID] [int] NULL,
	[InvoiceDate] [date] NULL,
	[CustomerPurchaseOrderNumber] [nvarchar](20) NULL,
	[IsCreditNote] [bit] NULL,
	[CreditNoteReason] [nvarchar](max) NULL,
	[Comments] [nvarchar](max) NULL,
	[DeliveryInstructions] [nvarchar](max) NULL,
	[InternalComments] [nvarchar](max) NULL,
	[TotalDryItems] [int] NULL,
	[TotalChillerItems] [int] NULL,
	[DeliveryRun] [nvarchar](5) NULL,
	[RunPosition] [nvarchar](5) NULL,
	[ReturnedDeliveryData] [nvarchar](max) NULL,
	[ConfirmedDeliveryTime] [datetime2](7) NULL,
	[ConfirmedReceivedBy] [nvarchar](4000) NULL,
	[LastEditedBy] [int] NULL,
	[LastEditedWhen] [datetime2](7) NULL,
	[_LoadDate] [datetime2](7) NULL,
	[_LoadID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SRC]    Script Date: 16.03.2022 20:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SRC](
	[InvoiceID] [int] NULL,
	[CustomerID] [int] NULL,
	[BillToCustomerID] [int] NULL,
	[OrderID] [int] NULL,
	[DeliveryMethodID] [int] NULL,
	[ContactPersonID] [int] NULL,
	[AccountsPersonID] [int] NULL,
	[SalespersonPersonID] [int] NULL,
	[PackedByPersonID] [int] NULL,
	[InvoiceDate] [date] NULL,
	[CustomerPurchaseOrderNumber] [nvarchar](20) NULL,
	[IsCreditNote] [bit] NULL,
	[CreditNoteReason] [nvarchar](max) NULL,
	[Comments] [nvarchar](max) NULL,
	[DeliveryInstructions] [nvarchar](max) NULL,
	[InternalComments] [nvarchar](max) NULL,
	[TotalDryItems] [int] NULL,
	[TotalChillerItems] [int] NULL,
	[DeliveryRun] [nvarchar](5) NULL,
	[RunPosition] [nvarchar](5) NULL,
	[ReturnedDeliveryData] [nvarchar](max) NULL,
	[ConfirmedDeliveryTime] [datetime2](7) NULL,
	[ConfirmedReceivedBy] [nvarchar](4000) NULL,
	[LastEditedBy] [int] NULL,
	[LastEditedWhen] [datetime2](7) NULL,
	[_LoadDate] [datetime2](7) NULL,
	[_LoadID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [DW].[Invoices]    Script Date: 16.03.2022 20:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DW].[Invoices](
	[InvoiceID] [int] NULL,
	[CustomerID] [int] NULL,
	[BillToCustomerID] [int] NULL,
	[OrderID] [int] NULL,
	[DeliveryMethodID] [int] NULL,
	[ContactPersonID] [int] NULL,
	[AccountsPersonID] [int] NULL,
	[SalespersonPersonID] [int] NULL,
	[PackedByPersonID] [int] NULL,
	[InvoiceDate] [date] NULL,
	[CustomerPurchaseOrderNumber] [nvarchar](20) NULL,
	[IsCreditNote] [bit] NULL,
	[CreditNoteReason] [nvarchar](max) NULL,
	[Comments] [nvarchar](max) NULL,
	[DeliveryInstructions] [nvarchar](max) NULL,
	[InternalComments] [nvarchar](max) NULL,
	[TotalDryItems] [int] NULL,
	[TotalChillerItems] [int] NULL,
	[DeliveryRun] [nvarchar](5) NULL,
	[RunPosition] [nvarchar](5) NULL,
	[ReturnedDeliveryData] [nvarchar](max) NULL,
	[ConfirmedDeliveryTime] [datetime2](7) NULL,
	[ConfirmedReceivedBy] [nvarchar](4000) NULL,
	[LastEditedBy] [int] NULL,
	[LastEditedWhen] [datetime2](7) NULL,
	[_LoadDate] [datetime2](7) NULL,
	[_LoadID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [ETL].[Executions]    Script Date: 16.03.2022 20:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ETL].[Executions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Package] [nvarchar](256) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [ODS].[Invoices]    Script Date: 16.03.2022 20:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ODS].[Invoices](
	[InvoiceID] [int] NULL,
	[CustomerID] [int] NULL,
	[BillToCustomerID] [int] NULL,
	[OrderID] [int] NULL,
	[DeliveryMethodID] [int] NULL,
	[ContactPersonID] [int] NULL,
	[AccountsPersonID] [int] NULL,
	[SalespersonPersonID] [int] NULL,
	[PackedByPersonID] [int] NULL,
	[InvoiceDate] [date] NULL,
	[CustomerPurchaseOrderNumber] [nvarchar](20) NULL,
	[IsCreditNote] [bit] NULL,
	[CreditNoteReason] [nvarchar](max) NULL,
	[Comments] [nvarchar](max) NULL,
	[DeliveryInstructions] [nvarchar](max) NULL,
	[InternalComments] [nvarchar](max) NULL,
	[TotalDryItems] [int] NULL,
	[TotalChillerItems] [int] NULL,
	[DeliveryRun] [nvarchar](5) NULL,
	[RunPosition] [nvarchar](5) NULL,
	[ReturnedDeliveryData] [nvarchar](max) NULL,
	[ConfirmedDeliveryTime] [datetime2](7) NULL,
	[ConfirmedReceivedBy] [nvarchar](4000) NULL,
	[LastEditedBy] [int] NULL,
	[LastEditedWhen] [datetime2](7) NULL,
	[_LoadDate] [datetime2](7) NULL,
	[_LoadID] [int] NULL,
	[_Hash] [nvarchar](32) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [ODS].[Invoices_Delta]    Script Date: 16.03.2022 20:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ODS].[Invoices_Delta](
	[InvoiceID] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[BillToCustomerID] [int] NULL,
	[OrderID] [int] NULL,
	[DeliveryMethodID] [int] NULL,
	[ContactPersonID] [int] NULL,
	[AccountsPersonID] [int] NULL,
	[SalespersonPersonID] [int] NULL,
	[PackedByPersonID] [int] NULL,
	[InvoiceDate] [date] NULL,
	[CustomerPurchaseOrderNumber] [nvarchar](20) NULL,
	[IsCreditNote] [bit] NULL,
	[CreditNoteReason] [nvarchar](max) NULL,
	[Comments] [nvarchar](max) NULL,
	[DeliveryInstructions] [nvarchar](max) NULL,
	[InternalComments] [nvarchar](max) NULL,
	[TotalDryItems] [int] NULL,
	[TotalChillerItems] [int] NULL,
	[DeliveryRun] [nvarchar](5) NULL,
	[RunPosition] [nvarchar](5) NULL,
	[ReturnedDeliveryData] [nvarchar](max) NULL,
	[ConfirmedDeliveryTime] [datetime2](7) NULL,
	[ConfirmedReceivedBy] [nvarchar](4000) NULL,
	[LastEditedBy] [int] NULL,
	[LastEditedWhen] [datetime2](7) NULL,
	[_LoadDate] [datetime2](7) NULL,
	[_LoadID] [int] NOT NULL,
	[_Hash] [nvarchar](32) NULL,
	[_Operation] [nvarchar](1) NULL,
 CONSTRAINT [PK_Invoices_Delta] PRIMARY KEY CLUSTERED 
(
	[_LoadID] ASC,
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Stage].[Invoices]    Script Date: 16.03.2022 20:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Stage].[Invoices](
	[InvoiceID] [int] NULL,
	[CustomerID] [int] NULL,
	[BillToCustomerID] [int] NULL,
	[OrderID] [int] NULL,
	[DeliveryMethodID] [int] NULL,
	[ContactPersonID] [int] NULL,
	[AccountsPersonID] [int] NULL,
	[SalespersonPersonID] [int] NULL,
	[PackedByPersonID] [int] NULL,
	[InvoiceDate] [date] NULL,
	[CustomerPurchaseOrderNumber] [nvarchar](20) NULL,
	[IsCreditNote] [bit] NULL,
	[CreditNoteReason] [nvarchar](max) NULL,
	[Comments] [nvarchar](max) NULL,
	[DeliveryInstructions] [nvarchar](max) NULL,
	[InternalComments] [nvarchar](max) NULL,
	[TotalDryItems] [int] NULL,
	[TotalChillerItems] [int] NULL,
	[DeliveryRun] [nvarchar](5) NULL,
	[RunPosition] [nvarchar](5) NULL,
	[ReturnedDeliveryData] [nvarchar](max) NULL,
	[ConfirmedDeliveryTime] [datetime2](7) NULL,
	[ConfirmedReceivedBy] [nvarchar](4000) NULL,
	[LastEditedBy] [int] NULL,
	[LastEditedWhen] [datetime2](7) NULL,
	[_LoadDate] [datetime2](7) NULL,
	[_LoadID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [ETL].[GetExecutionID]    Script Date: 16.03.2022 20:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ETL].[GetExecutionID]

	@Package nvarchar(256)
AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT INTO [ETL].[Executions]
	(
	Package,
	StartDate
	)
	OUTPUT Inserted.ID
	VALUES
	(
	@Package,
	GETDATE()
	)

END
GO
/****** Object:  StoredProcedure [ETL].[SetExecutionStatus]    Script Date: 16.03.2022 20:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ETL].[SetExecutionStatus]
	@ID int,@Status nvarchar(10)
AS
BEGIN
	
	SET NOCOUNT ON;

	UPDATE [ETL].[Executions]
	SET 
	Status = @Status,
	EndDate=GETDATE()
	WHERE
	ID=@ID
END
GO
USE [master]
GO
ALTER DATABASE [WWI_DWH] SET  READ_WRITE 
GO
