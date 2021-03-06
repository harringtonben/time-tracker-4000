USE [master]
GO
/****** Object:  Database [TimeTracker]    Script Date: 4/8/2018 1:43:57 PM ******/
CREATE DATABASE [TimeTracker]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TimeTracker', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TimeTracker.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TimeTracker_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TimeTracker_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TimeTracker] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TimeTracker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TimeTracker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TimeTracker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TimeTracker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TimeTracker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TimeTracker] SET ARITHABORT OFF 
GO
ALTER DATABASE [TimeTracker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TimeTracker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TimeTracker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TimeTracker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TimeTracker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TimeTracker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TimeTracker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TimeTracker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TimeTracker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TimeTracker] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TimeTracker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TimeTracker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TimeTracker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TimeTracker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TimeTracker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TimeTracker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TimeTracker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TimeTracker] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TimeTracker] SET  MULTI_USER 
GO
ALTER DATABASE [TimeTracker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TimeTracker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TimeTracker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TimeTracker] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TimeTracker] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TimeTracker] SET QUERY_STORE = OFF
GO
USE [TimeTracker]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TimeTracker]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 4/8/2018 1:43:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](75) NOT NULL,
	[Title] [nvarchar](75) NOT NULL,
	[MangerId] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 4/8/2018 1:43:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managers](
	[ManagerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](75) NOT NULL,
	[Title] [nvarchar](75) NOT NULL,
 CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED 
(
	[ManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShiftLength]    Script Date: 4/8/2018 1:43:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiftLength](
	[ShiftLengthId] [int] IDENTITY(1,1) NOT NULL,
	[ShiftLengthName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ShiftLength] PRIMARY KEY CLUSTERED 
(
	[ShiftLengthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shifts]    Script Date: 4/8/2018 1:43:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shifts](
	[ShiftId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[MangerId] [int] NOT NULL,
	[WorkFromHome] [bit] NULL,
	[Callout] [bit] NULL,
	[Planned] [bit] NULL,
	[ShiftLengthId] [int] NULL,
	[Email] [bit] NULL,
	[Phone] [bit] NULL,
	[Integrations] [bit] NULL,
	[NonCoverage] [bit] NULL,
 CONSTRAINT [PK_Shifts] PRIMARY KEY CLUSTERED 
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (1, N'Ben Harrington', N'Dev Support Specialist', 1)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (2, N'Heather Sturm', N'Integrations Support Specialist', 1)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (3, N'Ross Cochran', N'Integrations Support Specialist', 1)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (4, N'Andrew Heuback', N'Integreations Support Specialist', 1)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (5, N'Zach Sharpe', N'Customer Support Specialist', 2)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (9, N'Laura Delcambre', N'Customer Support Specialist', 2)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (10, N'Anna Dolan', N'Customer Support Specialist', 2)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (11, N'John Newman', N'Customer Support Specialist', 2)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (12, N'Joshua Jackson', N'Customer Support Specialist', 2)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (13, N'Brad Roth', N'Customer Support Specialist', 2)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (14, N'Sammy Al-Hagal', N'Customer Support Specialist', 2)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (15, N'Phillip May', N'Customer Support Specialist', 1)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (16, N'Anthony Miranda', N'Customer Support Specialist', 2)
INSERT [dbo].[Employees] ([EmployeeId], [Name], [Title], [MangerId]) VALUES (18, N'Nate Gallagher', N'Customer Support Specialist', 2)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Managers] ON 

INSERT [dbo].[Managers] ([ManagerId], [Name], [Title]) VALUES (1, N'Katie Watts', N'Senior Support Team Manager')
INSERT [dbo].[Managers] ([ManagerId], [Name], [Title]) VALUES (2, N'Grey Stepp', N'Support Team Manager')
SET IDENTITY_INSERT [dbo].[Managers] OFF
SET IDENTITY_INSERT [dbo].[ShiftLength] ON 

INSERT [dbo].[ShiftLength] ([ShiftLengthId], [ShiftLengthName]) VALUES (1, N'Full Day')
INSERT [dbo].[ShiftLength] ([ShiftLengthId], [ShiftLengthName]) VALUES (2, N'Half Day')
SET IDENTITY_INSERT [dbo].[ShiftLength] OFF
SET IDENTITY_INSERT [dbo].[Shifts] ON 

INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4633, CAST(N'2018-01-03' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4634, CAST(N'2018-01-04' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4635, CAST(N'2018-01-05' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4636, CAST(N'2018-01-08' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4637, CAST(N'2018-01-09' AS Date), 2, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4638, CAST(N'2018-01-10' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4639, CAST(N'2018-01-11' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4640, CAST(N'2018-01-12' AS Date), 2, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4641, CAST(N'2018-01-15' AS Date), 2, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4642, CAST(N'2018-01-16' AS Date), 2, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4643, CAST(N'2018-01-17' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4644, CAST(N'2018-01-18' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4645, CAST(N'2018-01-19' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4646, CAST(N'2018-01-22' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4647, CAST(N'2018-01-23' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4648, CAST(N'2018-01-24' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4649, CAST(N'2018-01-25' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4650, CAST(N'2018-01-26' AS Date), 2, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4651, CAST(N'2018-01-29' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4652, CAST(N'2018-01-30' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4653, CAST(N'2018-01-31' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4654, CAST(N'2018-02-01' AS Date), 2, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4655, CAST(N'2018-02-02' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4656, CAST(N'2018-02-05' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4657, CAST(N'2018-02-06' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4658, CAST(N'2018-02-07' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4659, CAST(N'2018-02-08' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4660, CAST(N'2018-02-09' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4661, CAST(N'2018-02-12' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4662, CAST(N'2018-02-13' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4663, CAST(N'2018-02-14' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4664, CAST(N'2018-02-15' AS Date), 2, 1, 0, 1, 1, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4665, CAST(N'2018-02-16' AS Date), 2, 1, 0, 1, 1, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4666, CAST(N'2018-02-19' AS Date), 2, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4667, CAST(N'2018-02-20' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4668, CAST(N'2018-02-21' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4669, CAST(N'2018-02-22' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4670, CAST(N'2018-02-23' AS Date), 2, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4671, CAST(N'2018-02-26' AS Date), 2, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4672, CAST(N'2018-02-27' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4673, CAST(N'2018-02-28' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4674, CAST(N'2018-03-01' AS Date), 2, 1, 0, 1, 1, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4675, CAST(N'2018-03-02' AS Date), 2, 1, 0, 1, 1, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4676, CAST(N'2018-03-05' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4677, CAST(N'2018-03-06' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4678, CAST(N'2018-03-07' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4679, CAST(N'2018-03-08' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4680, CAST(N'2018-03-09' AS Date), 2, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4681, CAST(N'2018-03-12' AS Date), 2, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4682, CAST(N'2018-03-13' AS Date), 2, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4683, CAST(N'2018-03-14' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4684, CAST(N'2018-03-15' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4685, CAST(N'2018-03-16' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4686, CAST(N'2018-03-19' AS Date), 2, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4687, CAST(N'2018-03-20' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4688, CAST(N'2018-03-21' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4689, CAST(N'2018-03-22' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4690, CAST(N'2018-03-23' AS Date), 2, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4691, CAST(N'2018-03-26' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4692, CAST(N'2018-03-27' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4693, CAST(N'2018-03-28' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4694, CAST(N'2018-03-29' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4695, CAST(N'2018-03-30' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4696, CAST(N'2018-04-02' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4697, CAST(N'2018-04-03' AS Date), 2, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4698, CAST(N'2018-04-04' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4699, CAST(N'2018-04-05' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4700, CAST(N'2018-04-06' AS Date), 2, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4701, CAST(N'2018-01-03' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4702, CAST(N'2018-01-04' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4703, CAST(N'2018-01-05' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4704, CAST(N'2018-01-08' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4705, CAST(N'2018-01-09' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4706, CAST(N'2018-01-10' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4707, CAST(N'2018-01-11' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4708, CAST(N'2018-01-12' AS Date), 3, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4709, CAST(N'2018-01-15' AS Date), 3, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4710, CAST(N'2018-01-16' AS Date), 3, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4711, CAST(N'2018-01-17' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4712, CAST(N'2018-01-18' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4713, CAST(N'2018-01-19' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4714, CAST(N'2018-01-22' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4715, CAST(N'2018-01-23' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4716, CAST(N'2018-01-24' AS Date), 3, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4717, CAST(N'2018-01-25' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4718, CAST(N'2018-01-26' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4719, CAST(N'2018-01-29' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4720, CAST(N'2018-01-30' AS Date), 3, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4721, CAST(N'2018-01-31' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4722, CAST(N'2018-02-01' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4723, CAST(N'2018-02-02' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4724, CAST(N'2018-02-05' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4725, CAST(N'2018-02-06' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4726, CAST(N'2018-02-07' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4727, CAST(N'2018-02-08' AS Date), 3, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4728, CAST(N'2018-02-09' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4729, CAST(N'2018-02-12' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4730, CAST(N'2018-02-13' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4731, CAST(N'2018-02-14' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
GO
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4732, CAST(N'2018-02-15' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4733, CAST(N'2018-02-16' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4734, CAST(N'2018-02-19' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4735, CAST(N'2018-02-20' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4736, CAST(N'2018-02-21' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4737, CAST(N'2018-02-22' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4738, CAST(N'2018-02-23' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4739, CAST(N'2018-02-26' AS Date), 3, 1, 0, 1, 1, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4740, CAST(N'2018-02-27' AS Date), 3, 1, 0, 1, 1, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4741, CAST(N'2018-02-28' AS Date), 3, 1, 0, 1, 1, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4742, CAST(N'2018-03-01' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4743, CAST(N'2018-03-02' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4744, CAST(N'2018-03-05' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4745, CAST(N'2018-03-06' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4746, CAST(N'2018-03-07' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4747, CAST(N'2018-03-08' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4748, CAST(N'2018-03-09' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4749, CAST(N'2018-03-12' AS Date), 3, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4750, CAST(N'2018-03-13' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4751, CAST(N'2018-03-14' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4752, CAST(N'2018-03-15' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4753, CAST(N'2018-03-16' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4754, CAST(N'2018-03-19' AS Date), 3, 1, 1, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4755, CAST(N'2018-03-20' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4756, CAST(N'2018-03-21' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4757, CAST(N'2018-03-22' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4758, CAST(N'2018-03-23' AS Date), 3, 1, 0, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4759, CAST(N'2018-03-26' AS Date), 3, 1, 0, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4760, CAST(N'2018-03-27' AS Date), 3, 1, 0, 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4761, CAST(N'2018-03-28' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4762, CAST(N'2018-03-29' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4763, CAST(N'2018-03-30' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4764, CAST(N'2018-04-02' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4765, CAST(N'2018-04-03' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4766, CAST(N'2018-04-04' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4767, CAST(N'2018-04-05' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4768, CAST(N'2018-04-06' AS Date), 3, 1, 0, 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4769, CAST(N'2018-01-03' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4770, CAST(N'2018-01-04' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4771, CAST(N'2018-01-05' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4772, CAST(N'2018-01-08' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4773, CAST(N'2018-01-09' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4774, CAST(N'2018-01-10' AS Date), 4, 1, 0, 1, 1, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4775, CAST(N'2018-01-11' AS Date), 4, 1, 0, 1, 1, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4776, CAST(N'2018-01-12' AS Date), 4, 1, 0, 1, 1, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4777, CAST(N'2018-01-15' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4778, CAST(N'2018-01-16' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4779, CAST(N'2018-01-17' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4780, CAST(N'2018-01-18' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4781, CAST(N'2018-01-19' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4782, CAST(N'2018-01-22' AS Date), 4, 1, 0, 1, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4783, CAST(N'2018-01-23' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4784, CAST(N'2018-01-24' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4785, CAST(N'2018-01-25' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4786, CAST(N'2018-01-26' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4787, CAST(N'2018-01-29' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4788, CAST(N'2018-01-30' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4789, CAST(N'2018-01-31' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4790, CAST(N'2018-02-01' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4791, CAST(N'2018-02-02' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4792, CAST(N'2018-02-05' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4793, CAST(N'2018-02-06' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4794, CAST(N'2018-02-07' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4795, CAST(N'2018-02-08' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4796, CAST(N'2018-02-09' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4797, CAST(N'2018-02-12' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4798, CAST(N'2018-02-13' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4799, CAST(N'2018-02-14' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4800, CAST(N'2018-02-15' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4801, CAST(N'2018-02-16' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4802, CAST(N'2018-02-19' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4803, CAST(N'2018-02-20' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4804, CAST(N'2018-02-21' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4805, CAST(N'2018-02-22' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4806, CAST(N'2018-02-23' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4807, CAST(N'2018-02-26' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4808, CAST(N'2018-02-27' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4809, CAST(N'2018-02-28' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4810, CAST(N'2018-03-01' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4811, CAST(N'2018-03-02' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4812, CAST(N'2018-03-05' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4813, CAST(N'2018-03-06' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4814, CAST(N'2018-03-07' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4815, CAST(N'2018-03-08' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4816, CAST(N'2018-03-09' AS Date), 4, 1, 0, 1, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4817, CAST(N'2018-03-12' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4818, CAST(N'2018-03-13' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4819, CAST(N'2018-03-14' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4820, CAST(N'2018-03-15' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4821, CAST(N'2018-03-16' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4822, CAST(N'2018-03-19' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4823, CAST(N'2018-03-20' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4824, CAST(N'2018-03-21' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4825, CAST(N'2018-03-22' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4826, CAST(N'2018-03-23' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4827, CAST(N'2018-03-26' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4828, CAST(N'2018-03-27' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4829, CAST(N'2018-03-28' AS Date), 4, 1, 0, 1, 1, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4830, CAST(N'2018-03-29' AS Date), 4, 1, 0, 1, 1, 2, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4831, CAST(N'2018-03-30' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
GO
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4832, CAST(N'2018-04-02' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4833, CAST(N'2018-04-03' AS Date), 4, 1, 1, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4834, CAST(N'2018-04-04' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4835, CAST(N'2018-04-05' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4836, CAST(N'2018-04-06' AS Date), 4, 1, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4837, CAST(N'2018-01-03' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4838, CAST(N'2018-01-04' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4839, CAST(N'2018-01-05' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4840, CAST(N'2018-01-08' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4841, CAST(N'2018-01-09' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4842, CAST(N'2018-01-10' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4843, CAST(N'2018-01-11' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4844, CAST(N'2018-01-12' AS Date), 15, 1, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4845, CAST(N'2018-01-15' AS Date), 15, 1, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4846, CAST(N'2018-01-16' AS Date), 15, 1, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4847, CAST(N'2018-01-17' AS Date), 15, 1, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4848, CAST(N'2018-01-18' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4849, CAST(N'2018-01-19' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4850, CAST(N'2018-01-22' AS Date), 15, 1, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4851, CAST(N'2018-01-23' AS Date), 15, 1, 0, 0, 0, 1, 0, 0, 0, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4852, CAST(N'2018-01-24' AS Date), 15, 1, 0, 0, 0, 1, 0, 0, 0, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4853, CAST(N'2018-01-25' AS Date), 15, 1, 0, 0, 0, 1, 0, 0, 0, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4854, CAST(N'2018-01-26' AS Date), 15, 1, 0, 1, 1, 1, 0, 0, 0, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4855, CAST(N'2018-01-29' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4856, CAST(N'2018-01-30' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4857, CAST(N'2018-01-31' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4858, CAST(N'2018-02-01' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4859, CAST(N'2018-02-02' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4860, CAST(N'2018-02-05' AS Date), 15, 1, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4861, CAST(N'2018-02-06' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4862, CAST(N'2018-02-07' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4863, CAST(N'2018-02-08' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4864, CAST(N'2018-02-09' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4865, CAST(N'2018-02-12' AS Date), 15, 1, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4866, CAST(N'2018-02-13' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4867, CAST(N'2018-02-14' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4868, CAST(N'2018-02-15' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4869, CAST(N'2018-02-16' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4870, CAST(N'2018-02-19' AS Date), 15, 1, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4871, CAST(N'2018-02-20' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4872, CAST(N'2018-02-21' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4873, CAST(N'2018-02-22' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4874, CAST(N'2018-02-23' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4875, CAST(N'2018-02-26' AS Date), 15, 1, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4876, CAST(N'2018-02-27' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4877, CAST(N'2018-02-28' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4878, CAST(N'2018-03-01' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4879, CAST(N'2018-03-02' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4880, CAST(N'2018-03-05' AS Date), 15, 1, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4881, CAST(N'2018-03-06' AS Date), 15, 1, 0, 0, 0, 1, 0, 0, 0, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4882, CAST(N'2018-03-07' AS Date), 15, 1, 0, 0, 0, 1, 0, 0, 0, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4883, CAST(N'2018-03-08' AS Date), 15, 1, 0, 0, 0, 1, 0, 0, 0, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4884, CAST(N'2018-03-09' AS Date), 15, 1, 0, 0, 0, 1, 0, 0, 0, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4885, CAST(N'2018-03-12' AS Date), 15, 1, 1, 0, 0, 1, 0, 0, 0, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4886, CAST(N'2018-03-13' AS Date), 15, 1, 0, 0, 0, 1, 0, 0, 0, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4887, CAST(N'2018-03-14' AS Date), 15, 1, 0, 1, 1, 1, 0, 0, 0, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4888, CAST(N'2018-03-15' AS Date), 15, 1, 0, 0, 0, 1, 0, 0, 0, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4889, CAST(N'2018-03-16' AS Date), 15, 1, 0, 1, 0, 2, 0, 0, 0, 1)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4890, CAST(N'2018-03-19' AS Date), 15, 1, 0, 1, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4891, CAST(N'2018-03-20' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4892, CAST(N'2018-03-21' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4893, CAST(N'2018-03-22' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4894, CAST(N'2018-03-23' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4895, CAST(N'2018-03-26' AS Date), 15, 1, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4896, CAST(N'2018-03-27' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4897, CAST(N'2018-03-28' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4898, CAST(N'2018-03-29' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4899, CAST(N'2018-03-30' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4900, CAST(N'2018-04-02' AS Date), 15, 1, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4901, CAST(N'2018-04-03' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4902, CAST(N'2018-04-04' AS Date), 15, 1, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4903, CAST(N'2018-04-05' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4904, CAST(N'2018-04-06' AS Date), 15, 1, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4905, CAST(N'2018-01-03' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4906, CAST(N'2018-01-04' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4907, CAST(N'2018-01-05' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4908, CAST(N'2018-01-08' AS Date), 5, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4909, CAST(N'2018-01-09' AS Date), 5, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4910, CAST(N'2018-01-10' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4911, CAST(N'2018-01-11' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4912, CAST(N'2018-01-12' AS Date), 5, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4913, CAST(N'2018-01-15' AS Date), 5, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4914, CAST(N'2018-01-16' AS Date), 5, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4915, CAST(N'2018-01-17' AS Date), 5, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4916, CAST(N'2018-01-18' AS Date), 5, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4917, CAST(N'2018-01-19' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4918, CAST(N'2018-01-22' AS Date), 5, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4919, CAST(N'2018-01-23' AS Date), 5, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4920, CAST(N'2018-01-24' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4921, CAST(N'2018-01-25' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4922, CAST(N'2018-01-26' AS Date), 5, 2, 0, 1, 1, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4923, CAST(N'2018-01-29' AS Date), 5, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4924, CAST(N'2018-01-30' AS Date), 5, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4925, CAST(N'2018-01-31' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4926, CAST(N'2018-02-01' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4927, CAST(N'2018-02-02' AS Date), 5, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4928, CAST(N'2018-02-05' AS Date), 5, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4929, CAST(N'2018-02-06' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4930, CAST(N'2018-02-07' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4931, CAST(N'2018-02-08' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
GO
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4932, CAST(N'2018-02-09' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4933, CAST(N'2018-02-12' AS Date), 5, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4934, CAST(N'2018-02-13' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4935, CAST(N'2018-02-14' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4936, CAST(N'2018-02-15' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4937, CAST(N'2018-02-16' AS Date), 5, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4938, CAST(N'2018-02-19' AS Date), 5, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4939, CAST(N'2018-02-20' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4940, CAST(N'2018-02-21' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4941, CAST(N'2018-02-22' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4942, CAST(N'2018-02-23' AS Date), 5, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4943, CAST(N'2018-02-26' AS Date), 5, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4944, CAST(N'2018-02-27' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4945, CAST(N'2018-02-28' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4946, CAST(N'2018-03-01' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4947, CAST(N'2018-03-02' AS Date), 5, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4948, CAST(N'2018-03-05' AS Date), 5, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4949, CAST(N'2018-03-06' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4950, CAST(N'2018-03-07' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4951, CAST(N'2018-03-08' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4952, CAST(N'2018-03-09' AS Date), 5, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4953, CAST(N'2018-03-12' AS Date), 5, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4954, CAST(N'2018-03-13' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4955, CAST(N'2018-03-14' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4956, CAST(N'2018-03-15' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4957, CAST(N'2018-03-16' AS Date), 5, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4958, CAST(N'2018-03-19' AS Date), 5, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4959, CAST(N'2018-03-20' AS Date), 5, 2, 0, 1, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4960, CAST(N'2018-03-21' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4961, CAST(N'2018-03-22' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4962, CAST(N'2018-03-23' AS Date), 5, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4963, CAST(N'2018-03-26' AS Date), 5, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4964, CAST(N'2018-03-27' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4965, CAST(N'2018-03-28' AS Date), 5, 2, 0, 1, 1, 2, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4966, CAST(N'2018-03-29' AS Date), 5, 2, 0, 1, 1, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4967, CAST(N'2018-03-30' AS Date), 5, 2, 0, 1, 1, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4968, CAST(N'2018-04-02' AS Date), 5, 2, 0, 1, 1, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4969, CAST(N'2018-04-03' AS Date), 5, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4970, CAST(N'2018-04-04' AS Date), 5, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4971, CAST(N'2018-04-05' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4972, CAST(N'2018-04-06' AS Date), 5, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4973, CAST(N'2018-01-03' AS Date), 9, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4974, CAST(N'2018-01-04' AS Date), 9, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4975, CAST(N'2018-01-05' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4976, CAST(N'2018-01-08' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4977, CAST(N'2018-01-09' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4978, CAST(N'2018-01-10' AS Date), 9, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4979, CAST(N'2018-01-11' AS Date), 9, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4980, CAST(N'2018-01-12' AS Date), 9, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4981, CAST(N'2018-01-15' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4982, CAST(N'2018-01-16' AS Date), 9, 2, 0, 1, 0, 2, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4983, CAST(N'2018-01-17' AS Date), 9, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4984, CAST(N'2018-01-18' AS Date), 9, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4985, CAST(N'2018-01-19' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4986, CAST(N'2018-01-22' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4987, CAST(N'2018-01-23' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4988, CAST(N'2018-01-24' AS Date), 9, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4989, CAST(N'2018-01-25' AS Date), 9, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4990, CAST(N'2018-01-26' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4991, CAST(N'2018-01-29' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4992, CAST(N'2018-01-30' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4993, CAST(N'2018-01-31' AS Date), 9, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4994, CAST(N'2018-02-01' AS Date), 9, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4995, CAST(N'2018-02-02' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4996, CAST(N'2018-02-05' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4997, CAST(N'2018-02-06' AS Date), 9, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4998, CAST(N'2018-02-07' AS Date), 9, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (4999, CAST(N'2018-02-08' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5000, CAST(N'2018-02-09' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5001, CAST(N'2018-02-12' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5002, CAST(N'2018-02-13' AS Date), 9, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5003, CAST(N'2018-02-14' AS Date), 9, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5004, CAST(N'2018-02-15' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5005, CAST(N'2018-02-16' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5006, CAST(N'2018-02-19' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5007, CAST(N'2018-02-20' AS Date), 9, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5008, CAST(N'2018-02-21' AS Date), 9, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5009, CAST(N'2018-02-22' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5010, CAST(N'2018-02-23' AS Date), 9, 2, 0, 1, 1, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5011, CAST(N'2018-02-26' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5012, CAST(N'2018-02-27' AS Date), 9, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5013, CAST(N'2018-02-28' AS Date), 9, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5014, CAST(N'2018-03-01' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5015, CAST(N'2018-03-02' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5016, CAST(N'2018-03-05' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5017, CAST(N'2018-03-06' AS Date), 9, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5018, CAST(N'2018-03-07' AS Date), 9, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5019, CAST(N'2018-03-08' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5020, CAST(N'2018-03-09' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5021, CAST(N'2018-03-12' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5022, CAST(N'2018-03-13' AS Date), 9, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5023, CAST(N'2018-03-14' AS Date), 9, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5024, CAST(N'2018-03-15' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5025, CAST(N'2018-03-16' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5026, CAST(N'2018-03-19' AS Date), 9, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5027, CAST(N'2018-03-20' AS Date), 9, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5028, CAST(N'2018-03-21' AS Date), 9, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5029, CAST(N'2018-03-22' AS Date), 9, 2, 0, 1, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5030, CAST(N'2018-03-23' AS Date), 9, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5031, CAST(N'2018-03-26' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
GO
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5032, CAST(N'2018-03-27' AS Date), 9, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5033, CAST(N'2018-03-28' AS Date), 9, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5034, CAST(N'2018-03-29' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5035, CAST(N'2018-03-30' AS Date), 9, 2, 0, 1, 1, 2, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5036, CAST(N'2018-04-02' AS Date), 9, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5037, CAST(N'2018-04-03' AS Date), 9, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5038, CAST(N'2018-04-04' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5039, CAST(N'2018-04-05' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5040, CAST(N'2018-04-06' AS Date), 9, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5041, CAST(N'2018-02-12' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5042, CAST(N'2018-02-13' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5043, CAST(N'2018-02-14' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5044, CAST(N'2018-02-15' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5045, CAST(N'2018-02-16' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5046, CAST(N'2018-02-19' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5047, CAST(N'2018-02-20' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5048, CAST(N'2018-02-21' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5049, CAST(N'2018-02-22' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5050, CAST(N'2018-02-23' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5051, CAST(N'2018-02-26' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5052, CAST(N'2018-02-27' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5053, CAST(N'2018-02-28' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5054, CAST(N'2018-03-01' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5055, CAST(N'2018-03-02' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5056, CAST(N'2018-03-05' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5057, CAST(N'2018-03-06' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5058, CAST(N'2018-03-07' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5059, CAST(N'2018-03-08' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5060, CAST(N'2018-03-09' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5061, CAST(N'2018-03-12' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5062, CAST(N'2018-03-13' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5063, CAST(N'2018-03-14' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5064, CAST(N'2018-03-15' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5065, CAST(N'2018-03-16' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5066, CAST(N'2018-03-19' AS Date), 10, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5067, CAST(N'2018-03-20' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5068, CAST(N'2018-03-21' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5069, CAST(N'2018-03-22' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5070, CAST(N'2018-03-23' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5071, CAST(N'2018-03-26' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5072, CAST(N'2018-03-27' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5073, CAST(N'2018-03-28' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5074, CAST(N'2018-03-29' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5075, CAST(N'2018-03-30' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5076, CAST(N'2018-04-02' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5077, CAST(N'2018-04-03' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5078, CAST(N'2018-04-04' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5079, CAST(N'2018-04-05' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5080, CAST(N'2018-04-06' AS Date), 10, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5081, CAST(N'2018-02-12' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5082, CAST(N'2018-02-13' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5083, CAST(N'2018-02-14' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5084, CAST(N'2018-02-15' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5085, CAST(N'2018-02-16' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5086, CAST(N'2018-02-19' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5087, CAST(N'2018-02-20' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5088, CAST(N'2018-02-21' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5089, CAST(N'2018-02-22' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5090, CAST(N'2018-02-23' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5091, CAST(N'2018-02-26' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5092, CAST(N'2018-02-27' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5093, CAST(N'2018-02-28' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5094, CAST(N'2018-03-01' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5095, CAST(N'2018-03-02' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5096, CAST(N'2018-03-05' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5097, CAST(N'2018-03-06' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5098, CAST(N'2018-03-07' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5099, CAST(N'2018-03-08' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5100, CAST(N'2018-03-09' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5101, CAST(N'2018-03-12' AS Date), 13, 2, 0, 1, 1, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5102, CAST(N'2018-03-13' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5103, CAST(N'2018-03-14' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5104, CAST(N'2018-03-15' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5105, CAST(N'2018-03-16' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5106, CAST(N'2018-03-19' AS Date), 13, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5107, CAST(N'2018-03-20' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5108, CAST(N'2018-03-21' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5109, CAST(N'2018-03-22' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5110, CAST(N'2018-03-23' AS Date), 13, 2, 0, 1, 1, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5111, CAST(N'2018-03-26' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5112, CAST(N'2018-03-27' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5113, CAST(N'2018-03-28' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5114, CAST(N'2018-03-29' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5115, CAST(N'2018-03-30' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5116, CAST(N'2018-04-02' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5117, CAST(N'2018-04-03' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5118, CAST(N'2018-04-04' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5119, CAST(N'2018-04-05' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5120, CAST(N'2018-04-06' AS Date), 13, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5121, CAST(N'2018-03-26' AS Date), 11, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5122, CAST(N'2018-03-27' AS Date), 11, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5123, CAST(N'2018-03-28' AS Date), 11, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5124, CAST(N'2018-03-29' AS Date), 11, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5125, CAST(N'2018-03-30' AS Date), 11, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5126, CAST(N'2018-04-02' AS Date), 11, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5127, CAST(N'2018-04-03' AS Date), 11, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5128, CAST(N'2018-04-04' AS Date), 11, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5129, CAST(N'2018-04-05' AS Date), 11, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5130, CAST(N'2018-04-06' AS Date), 11, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5131, CAST(N'2018-01-03' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
GO
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5132, CAST(N'2018-01-04' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5133, CAST(N'2018-01-05' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5134, CAST(N'2018-01-08' AS Date), 14, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5135, CAST(N'2018-01-09' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5136, CAST(N'2018-01-10' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5137, CAST(N'2018-01-11' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5138, CAST(N'2018-01-12' AS Date), 14, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5139, CAST(N'2018-01-15' AS Date), 14, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5140, CAST(N'2018-01-16' AS Date), 14, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5141, CAST(N'2018-01-17' AS Date), 14, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5142, CAST(N'2018-01-18' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5143, CAST(N'2018-01-19' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5144, CAST(N'2018-01-22' AS Date), 14, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5145, CAST(N'2018-01-23' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5146, CAST(N'2018-01-24' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5147, CAST(N'2018-01-25' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5148, CAST(N'2018-01-26' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5149, CAST(N'2018-01-29' AS Date), 14, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5150, CAST(N'2018-01-30' AS Date), 14, 2, 0, 1, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5151, CAST(N'2018-01-31' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5152, CAST(N'2018-02-01' AS Date), 14, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5153, CAST(N'2018-02-02' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5154, CAST(N'2018-02-05' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5155, CAST(N'2018-02-06' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5156, CAST(N'2018-02-07' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5157, CAST(N'2018-02-08' AS Date), 14, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5158, CAST(N'2018-02-09' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5159, CAST(N'2018-02-12' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5160, CAST(N'2018-02-13' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5161, CAST(N'2018-02-14' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5162, CAST(N'2018-02-15' AS Date), 14, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5163, CAST(N'2018-02-16' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5164, CAST(N'2018-02-19' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5165, CAST(N'2018-02-20' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5166, CAST(N'2018-02-21' AS Date), 14, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5167, CAST(N'2018-02-22' AS Date), 14, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5168, CAST(N'2018-02-23' AS Date), 14, 2, 0, 1, 1, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5169, CAST(N'2018-02-26' AS Date), 14, 2, 0, 1, 1, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5170, CAST(N'2018-02-27' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5171, CAST(N'2018-02-28' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5172, CAST(N'2018-03-01' AS Date), 14, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5173, CAST(N'2018-03-02' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5174, CAST(N'2018-03-05' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5175, CAST(N'2018-03-06' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5176, CAST(N'2018-03-07' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5177, CAST(N'2018-03-08' AS Date), 14, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5178, CAST(N'2018-03-09' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5179, CAST(N'2018-03-12' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5180, CAST(N'2018-03-13' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5181, CAST(N'2018-03-14' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5182, CAST(N'2018-03-15' AS Date), 14, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5183, CAST(N'2018-03-16' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5184, CAST(N'2018-03-19' AS Date), 14, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5185, CAST(N'2018-03-20' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5186, CAST(N'2018-03-21' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5187, CAST(N'2018-03-22' AS Date), 14, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5188, CAST(N'2018-03-23' AS Date), 14, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5189, CAST(N'2018-03-26' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5190, CAST(N'2018-03-27' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5191, CAST(N'2018-03-28' AS Date), 14, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5192, CAST(N'2018-03-29' AS Date), 14, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5193, CAST(N'2018-03-30' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5194, CAST(N'2018-04-02' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5195, CAST(N'2018-04-03' AS Date), 14, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5196, CAST(N'2018-04-04' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5197, CAST(N'2018-04-05' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5198, CAST(N'2018-04-06' AS Date), 14, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5199, CAST(N'2018-01-03' AS Date), 18, 2, 0, 1, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5200, CAST(N'2018-01-04' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5201, CAST(N'2018-01-05' AS Date), 18, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5202, CAST(N'2018-01-08' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5203, CAST(N'2018-01-09' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5204, CAST(N'2018-01-10' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5205, CAST(N'2018-01-11' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5206, CAST(N'2018-01-12' AS Date), 18, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5207, CAST(N'2018-01-15' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5208, CAST(N'2018-01-16' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5209, CAST(N'2018-01-17' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5210, CAST(N'2018-01-18' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5211, CAST(N'2018-01-19' AS Date), 18, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5212, CAST(N'2018-01-22' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5213, CAST(N'2018-01-23' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5214, CAST(N'2018-01-24' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5215, CAST(N'2018-01-25' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5216, CAST(N'2018-01-26' AS Date), 18, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5217, CAST(N'2018-01-29' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5218, CAST(N'2018-01-30' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5219, CAST(N'2018-01-31' AS Date), 18, 2, 0, 1, 1, 2, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5220, CAST(N'2018-02-01' AS Date), 18, 2, 0, 1, 1, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5221, CAST(N'2018-02-02' AS Date), 18, 2, 0, 1, 1, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5222, CAST(N'2018-02-05' AS Date), 18, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5223, CAST(N'2018-02-06' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5224, CAST(N'2018-02-07' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5225, CAST(N'2018-02-08' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5226, CAST(N'2018-02-09' AS Date), 18, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5227, CAST(N'2018-02-12' AS Date), 18, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5228, CAST(N'2018-02-13' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5229, CAST(N'2018-02-14' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5230, CAST(N'2018-02-15' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5231, CAST(N'2018-02-16' AS Date), 18, 2, 0, 0, 0, 1, 1, 0, 0, 0)
GO
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5232, CAST(N'2018-02-19' AS Date), 18, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5233, CAST(N'2018-02-20' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5234, CAST(N'2018-02-21' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5235, CAST(N'2018-02-22' AS Date), 18, 2, 0, 1, 1, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5236, CAST(N'2018-02-23' AS Date), 18, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5237, CAST(N'2018-02-26' AS Date), 18, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5238, CAST(N'2018-02-27' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5239, CAST(N'2018-02-28' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5240, CAST(N'2018-03-01' AS Date), 18, 2, 0, 1, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5241, CAST(N'2018-03-02' AS Date), 18, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5242, CAST(N'2018-03-05' AS Date), 18, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5243, CAST(N'2018-03-06' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5244, CAST(N'2018-03-07' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5245, CAST(N'2018-03-08' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5246, CAST(N'2018-03-09' AS Date), 18, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5247, CAST(N'2018-03-12' AS Date), 18, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5248, CAST(N'2018-03-13' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5249, CAST(N'2018-03-14' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5250, CAST(N'2018-03-15' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5251, CAST(N'2018-03-16' AS Date), 18, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5252, CAST(N'2018-03-19' AS Date), 18, 2, 0, 1, 1, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5253, CAST(N'2018-03-20' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5254, CAST(N'2018-03-21' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5255, CAST(N'2018-03-22' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5256, CAST(N'2018-03-23' AS Date), 18, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5257, CAST(N'2018-03-26' AS Date), 18, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5258, CAST(N'2018-03-27' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5259, CAST(N'2018-03-28' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5260, CAST(N'2018-03-29' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5261, CAST(N'2018-03-30' AS Date), 18, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5262, CAST(N'2018-04-02' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5263, CAST(N'2018-04-03' AS Date), 18, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5264, CAST(N'2018-04-04' AS Date), 18, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5265, CAST(N'2018-04-05' AS Date), 18, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5266, CAST(N'2018-04-06' AS Date), 18, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5267, CAST(N'2018-01-03' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5268, CAST(N'2018-01-04' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5269, CAST(N'2018-01-05' AS Date), 16, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5270, CAST(N'2018-01-08' AS Date), 16, 2, 0, 1, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5271, CAST(N'2018-01-09' AS Date), 16, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5272, CAST(N'2018-01-10' AS Date), 16, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5273, CAST(N'2018-01-11' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5274, CAST(N'2018-01-12' AS Date), 16, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5275, CAST(N'2018-01-15' AS Date), 16, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5276, CAST(N'2018-01-16' AS Date), 16, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5277, CAST(N'2018-01-17' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5278, CAST(N'2018-01-18' AS Date), 16, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5279, CAST(N'2018-01-19' AS Date), 16, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5280, CAST(N'2018-01-22' AS Date), 16, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5281, CAST(N'2018-01-23' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5282, CAST(N'2018-01-24' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5283, CAST(N'2018-01-25' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5284, CAST(N'2018-01-26' AS Date), 16, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5285, CAST(N'2018-01-29' AS Date), 16, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5286, CAST(N'2018-01-30' AS Date), 16, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5287, CAST(N'2018-01-31' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5288, CAST(N'2018-02-01' AS Date), 16, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5289, CAST(N'2018-02-02' AS Date), 16, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5290, CAST(N'2018-02-05' AS Date), 16, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5291, CAST(N'2018-02-06' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5292, CAST(N'2018-02-07' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5293, CAST(N'2018-02-08' AS Date), 16, 2, 0, 1, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5294, CAST(N'2018-02-09' AS Date), 16, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5295, CAST(N'2018-02-12' AS Date), 16, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5296, CAST(N'2018-02-13' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5297, CAST(N'2018-02-14' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5298, CAST(N'2018-02-15' AS Date), 16, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5299, CAST(N'2018-02-16' AS Date), 16, 2, 0, 1, 1, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5300, CAST(N'2018-02-19' AS Date), 16, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5301, CAST(N'2018-02-20' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5302, CAST(N'2018-02-21' AS Date), 16, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5303, CAST(N'2018-02-22' AS Date), 16, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5304, CAST(N'2018-02-23' AS Date), 16, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5305, CAST(N'2018-02-26' AS Date), 16, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5306, CAST(N'2018-02-27' AS Date), 16, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5307, CAST(N'2018-02-28' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5308, CAST(N'2018-03-01' AS Date), 16, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5309, CAST(N'2018-03-02' AS Date), 16, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5310, CAST(N'2018-03-05' AS Date), 16, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5311, CAST(N'2018-03-06' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5312, CAST(N'2018-03-07' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5313, CAST(N'2018-03-08' AS Date), 16, 2, 0, 1, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5314, CAST(N'2018-03-09' AS Date), 16, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5315, CAST(N'2018-03-12' AS Date), 16, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5316, CAST(N'2018-03-13' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5317, CAST(N'2018-03-14' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5318, CAST(N'2018-03-15' AS Date), 16, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5319, CAST(N'2018-03-16' AS Date), 16, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5320, CAST(N'2018-03-19' AS Date), 16, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5321, CAST(N'2018-03-20' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5322, CAST(N'2018-03-21' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5323, CAST(N'2018-03-22' AS Date), 16, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5324, CAST(N'2018-03-23' AS Date), 16, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5325, CAST(N'2018-03-26' AS Date), 16, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5326, CAST(N'2018-03-27' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5327, CAST(N'2018-03-28' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5328, CAST(N'2018-03-29' AS Date), 16, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5329, CAST(N'2018-03-30' AS Date), 16, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5330, CAST(N'2018-04-02' AS Date), 16, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5331, CAST(N'2018-04-03' AS Date), 16, 2, 0, 0, 0, 1, 0, 1, 0, 0)
GO
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5332, CAST(N'2018-04-04' AS Date), 16, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5333, CAST(N'2018-04-05' AS Date), 16, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5334, CAST(N'2018-04-06' AS Date), 16, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5335, CAST(N'2018-01-03' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5336, CAST(N'2018-01-04' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5337, CAST(N'2018-01-05' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5338, CAST(N'2018-01-08' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5339, CAST(N'2018-01-09' AS Date), 12, 2, 0, 1, 0, 2, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5340, CAST(N'2018-01-10' AS Date), 12, 2, 0, 1, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5341, CAST(N'2018-01-11' AS Date), 12, 2, 0, 1, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5342, CAST(N'2018-01-12' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5343, CAST(N'2018-01-15' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5344, CAST(N'2018-01-16' AS Date), 12, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5345, CAST(N'2018-01-17' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5346, CAST(N'2018-01-18' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5347, CAST(N'2018-01-19' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5348, CAST(N'2018-01-22' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5349, CAST(N'2018-01-23' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5350, CAST(N'2018-01-24' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5351, CAST(N'2018-01-25' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5352, CAST(N'2018-01-26' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5353, CAST(N'2018-01-29' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5354, CAST(N'2018-01-30' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5355, CAST(N'2018-01-31' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5356, CAST(N'2018-02-01' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5357, CAST(N'2018-02-02' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5358, CAST(N'2018-02-05' AS Date), 12, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5359, CAST(N'2018-02-06' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5360, CAST(N'2018-02-07' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5361, CAST(N'2018-02-08' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5362, CAST(N'2018-02-09' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5363, CAST(N'2018-02-12' AS Date), 12, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5364, CAST(N'2018-02-13' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5365, CAST(N'2018-02-14' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5366, CAST(N'2018-02-15' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5367, CAST(N'2018-02-16' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5368, CAST(N'2018-02-19' AS Date), 12, 2, 0, 1, 1, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5369, CAST(N'2018-02-20' AS Date), 12, 2, 0, 1, 1, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5370, CAST(N'2018-02-21' AS Date), 12, 2, 0, 1, 1, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5371, CAST(N'2018-02-22' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5372, CAST(N'2018-02-23' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5373, CAST(N'2018-02-26' AS Date), 12, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5374, CAST(N'2018-02-27' AS Date), 12, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5375, CAST(N'2018-02-28' AS Date), 12, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5376, CAST(N'2018-03-01' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5377, CAST(N'2018-03-02' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5378, CAST(N'2018-03-05' AS Date), 12, 2, 0, 1, 0, 2, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5379, CAST(N'2018-03-06' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5380, CAST(N'2018-03-07' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5381, CAST(N'2018-03-08' AS Date), 12, 2, 0, 1, 0, 2, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5382, CAST(N'2018-03-09' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5383, CAST(N'2018-03-12' AS Date), 12, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5384, CAST(N'2018-03-13' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5385, CAST(N'2018-03-14' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5386, CAST(N'2018-03-15' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5387, CAST(N'2018-03-16' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5388, CAST(N'2018-03-19' AS Date), 12, 2, 1, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5389, CAST(N'2018-03-20' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5390, CAST(N'2018-03-21' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5391, CAST(N'2018-03-22' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5392, CAST(N'2018-03-23' AS Date), 12, 2, 1, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5393, CAST(N'2018-03-26' AS Date), 12, 2, 0, 0, 0, 1, 1, 0, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5394, CAST(N'2018-03-27' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5395, CAST(N'2018-03-28' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5396, CAST(N'2018-03-29' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5397, CAST(N'2018-03-30' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5398, CAST(N'2018-04-02' AS Date), 12, 2, 0, 1, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5399, CAST(N'2018-04-03' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5400, CAST(N'2018-04-04' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5401, CAST(N'2018-04-05' AS Date), 12, 2, 0, 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Shifts] ([ShiftId], [Date], [EmployeeId], [MangerId], [WorkFromHome], [Callout], [Planned], [ShiftLengthId], [Email], [Phone], [Integrations], [NonCoverage]) VALUES (5402, CAST(N'2018-04-06' AS Date), 12, 2, 0, 0, 0, 1, 1, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Shifts] OFF
ALTER TABLE [dbo].[Shifts] ADD  CONSTRAINT [DF_Shifts_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([MangerId])
REFERENCES [dbo].[Managers] ([ManagerId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [dbo].[Shifts]  WITH CHECK ADD  CONSTRAINT [FK_Shifts_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Shifts] CHECK CONSTRAINT [FK_Shifts_Employees]
GO
ALTER TABLE [dbo].[Shifts]  WITH CHECK ADD  CONSTRAINT [FK_Shifts_Managers] FOREIGN KEY([MangerId])
REFERENCES [dbo].[Managers] ([ManagerId])
GO
ALTER TABLE [dbo].[Shifts] CHECK CONSTRAINT [FK_Shifts_Managers]
GO
ALTER TABLE [dbo].[Shifts]  WITH CHECK ADD  CONSTRAINT [FK_Shifts_ShiftLength] FOREIGN KEY([ShiftLengthId])
REFERENCES [dbo].[ShiftLength] ([ShiftLengthId])
GO
ALTER TABLE [dbo].[Shifts] CHECK CONSTRAINT [FK_Shifts_ShiftLength]
GO
USE [master]
GO
ALTER DATABASE [TimeTracker] SET  READ_WRITE 
GO
